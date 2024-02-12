package kr.co.coco.board.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.coco.board.model.dto.FreeCommentDTO;
import kr.co.coco.board.model.service.FreeCommentService;


@Controller
@RequestMapping("/freeComment")

public class FreeCommentController {

	@Autowired
    private FreeCommentService freeCommentService;

	// 댓글 등록
	@PostMapping("/SubmitRegistr")
	@ResponseBody
	public ResponseEntity<?> registerComment(@RequestBody FreeCommentDTO commentDTO, HttpSession session) {
	    Integer mNo = (Integer) session.getAttribute("no");
	    String mNick = (String) session.getAttribute("nickname");

	    if (mNo == null || mNick == null) {
	        return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("로그인이 필요합니다.");
	    }

	    // 생성자를 이용하여 세션에서 가져온 닉네임을 설정
	    commentDTO.setFreeCommentWriter(mNick);

	    commentDTO.setFreeCommentDate(new java.sql.Date(System.currentTimeMillis()));
	    commentDTO.setMNo(mNo);

	    try {
	        FreeCommentDTO savedComment = freeCommentService.save(commentDTO);

	        if (savedComment == null) {
	            // 저장 실패 처리
	            Logger logger = LoggerFactory.getLogger(CommentController.class);
	            logger.error("댓글 저장에 실패하였습니다.");
	            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("댓글 저장에 실패하였습니다.");
	        }

	        // 댓글 등록 후에 해당 게시글의 댓글 수 증가
	        freeCommentService.increaseCommentCount(savedComment.getFreeNo());

	        return ResponseEntity.ok(savedComment);

	    } catch (Exception e) {
	        Logger logger = LoggerFactory.getLogger(CommentController.class);
	        logger.error("댓글 저장 중 오류가 발생하였습니다.", e);
	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("댓글 저장 중 오류가 발생하였습니다.");
	    }

	}



    // 댓글 수 조회및 UI 업데이트
    private void updateCommentCountUI(int freeNo) {
        int commentCount = freeCommentService.countComments(freeNo);
    }

    // 특정 게시글 댓글 수 반환(새로고침 없이)
    @GetMapping("/count/{freeNo}")
    @ResponseBody
    public int countComments(@PathVariable int freeNo) {
        return freeCommentService.countComments(freeNo);
    }

    // 특정 게시글 댓글 수 업데이트
    @PostMapping("/updateCommentCount/{freeNo}")
    @ResponseBody
    public int updateCommentCount(@PathVariable int freeNo) {
        int commentCount = countComments(freeNo);

        // 업데이트된 댓글 수를 반환
        return commentCount;
    }

    // 댓글 삭제
    @DeleteMapping("/deleteComment/{freeCommentNo}")
    public ResponseEntity<String> deleteComment(@PathVariable int freeCommentNo) {

        // 댓글 삭제 전에 해당 게시글의 번호 가져오기
        int freeNo = getFreeNoFromComment(freeCommentNo);

        freeCommentService.deleteById(freeCommentNo);

        // 댓글 삭제 후에 해당 게시글의 댓글 수 업데이트
        updateCommentCountUI(freeNo);

        return ResponseEntity.ok("댓글이 삭제되었습니다.");
    }

    // 댓글 번호로 게시글 번호 가져오기
    private int getFreeNoFromComment(int freeCommentNo) {
        return freeCommentService.getFreeNoFromComment(freeCommentNo);
    }
}