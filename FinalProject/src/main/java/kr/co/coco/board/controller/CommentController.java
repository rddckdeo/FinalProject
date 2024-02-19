package kr.co.coco.board.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.coco.board.model.dto.InfoCommentDTO;
import kr.co.coco.board.model.service.InfoCommentService;

@Controller
@RequestMapping("/comment")
public class CommentController {

	@Autowired
	private InfoCommentService infoCommentService;

	// 댓글 등록
	@PostMapping("/SubmitRegistr")
	@ResponseBody
	public ResponseEntity<?> registerComment(@RequestBody InfoCommentDTO commentDTO, HttpSession session) {
	   
	        Integer mNo = (Integer) session.getAttribute("no");
	        String mNick = (String) session.getAttribute("nickname");

	        System.out.println("mNo: " + mNo);
	        System.out.println("mNick: " + mNick);

	        if (mNo == null || mNick == null) {
	            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("로그인이 필요합니다.");
	        }

	        Logger logger = LoggerFactory.getLogger(CommentController.class);

	        // 생성자를 이용하여 세션에서 가져온 닉네임을 설정
	        commentDTO.setInfoCommentWriter(mNick);
	        commentDTO.setInfoCommentDate(new java.sql.Date(System.currentTimeMillis()));
	        commentDTO.setMNo(mNo);

	        try {
	            InfoCommentDTO savedComment = infoCommentService.save(commentDTO);

	            if (savedComment == null) {
	                // 저장 실패 처리
	                logger.error("댓글 저장에 실패하였습니다.");
	                return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("댓글 저장에 실패하였습니다.");
	            }

	            // 댓글 등록 후에 해당 게시글의 댓글 수 증가
	            infoCommentService.increaseCommentCount(savedComment.getInfoNo());

	            return ResponseEntity.ok(savedComment);

	        } catch (Exception e) {
	            logger.error("댓글 저장 중 오류가 발생하였습니다: ", e);
	            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("댓글 저장 중 오류가 발생하였습니다. 원인: " + e.getMessage());
	        }
	   
	}


	
	
	
	// 댓글 수 조회및 UI 업데이트
	private void updateCommentCountUI(int infoNo) {
		int commentCount = infoCommentService.countComments(infoNo);
	}

	// 특정 게시글 댓글 수 반환(새로고침 없이)
	@GetMapping("/count/{infoNo}")
	@ResponseBody
	public int countComments(@PathVariable int infoNo) {
		return infoCommentService.countComments(infoNo);
	}

	// 특정 게시글 댓글 수 업데이트
	@PostMapping("/updateCommentCount/{infoNo}")
	@ResponseBody
	public int updateCommentCount(@PathVariable int infoNo) {  
	    int commentCount = countComments(infoNo);

	    // 업데이트된 댓글 수를 반환
	    return commentCount;
	}

	// 댓글 삭제
	@DeleteMapping("/deleteComment/{infoCommentNo}")
	public ResponseEntity<String> deleteComment(@PathVariable int infoCommentNo) {

	    // 댓글 삭제 전에 해당 게시글의 번호 가져오기
	    int infoNo = getInfoNoFromComment(infoCommentNo);

	    infoCommentService.deleteById(infoCommentNo);

	    // 댓글 삭제 후에 해당 게시글의 댓글 수 업데이트
	    updateCommentCountUI(infoNo);

	    return ResponseEntity.ok("댓글이 삭제되었습니다.");
	}

	
	//댓글 신고하기
	
	//댓글 수정하기 
	@PostMapping("/updateComment")
	public String updateComment(
	    @RequestParam("commentId") int commentId, 
	    @RequestParam("commentContent") String commentContent, 
	    @RequestParam("infoNo") int infoNo) {
	    infoCommentService.updateComment(commentId, commentContent);
	    return "redirect:/info/infoDtail/" + infoNo;
	}


	// 댓글 번호로 게시글 번호 가져오기
	private int getInfoNoFromComment(int infoCommentNo) {
		return infoCommentService.getInfoNoFromComment(infoCommentNo);
	}
}









