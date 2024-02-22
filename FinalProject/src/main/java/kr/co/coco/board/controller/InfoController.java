package kr.co.coco.board.controller;

import java.io.IOException;
import java.lang.reflect.Member;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.coco.board.model.dto.DeclarationDTO;
import kr.co.coco.board.model.dto.InfoCommentDTO;
import kr.co.coco.board.model.dto.InfoDTO;
import kr.co.coco.board.model.service.InfoCommentServiceImpl;
import kr.co.coco.board.model.service.InfoServiceImpl;
import kr.co.coco.member.model.Service.MemberServiceImpl;

@Controller
@RequestMapping("/info")
public class InfoController {

	@Autowired
	private InfoServiceImpl infoService;

	@Autowired
	private InfoCommentServiceImpl infoCommentService;

	// 정보게시판 메인 진입

	// 카테고리 목록 조회
	@GetMapping("/category")
	public String infoCategoryBoard(@RequestParam(value = "name", required = false) String categoryName,
			@RequestParam(value = "sortType", required = false, defaultValue = "date") String sortType,
			@RequestParam(value = "page", defaultValue = "1") int currentPage,
			@RequestParam(value = "size", defaultValue = "5") int pageSize, Model model, HttpSession session) {

		// 세션에서 넘버 가져오기
		Integer mNo = (Integer) session.getAttribute("no");

		// 게시글 총 개수
		int totalPosts = infoService.countPostsByCategory(categoryName);

		// 전체 페이지 수
		int totalPages = (int) Math.ceil((double) totalPosts / pageSize);

		// 시작 게시글 인덱스
		int startIndex = (currentPage - 1) * pageSize;

		// 페이지에 표시할 게시글 조회
		List<InfoDTO> posts = infoService.getPostsByCategory(categoryName, sortType, startIndex, pageSize);

		model.addAttribute("posts", posts);
		model.addAttribute("totalPosts", totalPosts);
		model.addAttribute("totalPages", totalPages);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("categoryName", categoryName);
		model.addAttribute("sortType", sortType);

		return "board/info/infoBoard";
	}

	// 게시글 디테일 페이지 진입
	@GetMapping("/infoDtail/{infoNo}")
	public String infoDtailBoard(@PathVariable("infoNo") int infoNo, Model model, HttpServletRequest request) {
		// 조회수 증가
		infoService.increaseViewCount(infoNo);

		// 게시글 정보 가져오기
		InfoDTO post = infoService.getPostById(infoNo);
		model.addAttribute("post", post);

		// 댓글 가져오기
		List<InfoCommentDTO> comments = infoService.getCommentsByPostId(infoNo);
		model.addAttribute("comments", comments);

		// 세션 가져오기
		HttpSession session = request.getSession();

		// 세션에서 사용자 번호 가져오기
		Integer no = (Integer) session.getAttribute("no");
       	    
		return "board/info/infoBoardDtail";
	}

	// 게시글 정보 가져오기
	@GetMapping("/getPostById/{infoNo}")
	public ResponseEntity<InfoDTO> getPostById(@PathVariable("infoNo") String infoNo) {
		int infoNoInt = Integer.parseInt(infoNo);
		InfoDTO post = infoService.getPostById(infoNoInt);
		return new ResponseEntity<>(post, HttpStatus.OK);
	}

	// 작성 페이지 진입
	@GetMapping("/registr")
	public String infoRegistrBoard() {
		return "board/info/infoRegistr";
	}

	// 게시글 등록
	@PostMapping("/SubmitRegistr")
	public String infoEnroll(InfoDTO info, HttpSession session) throws IllegalStateException, IOException {
		Integer mNo = (Integer) session.getAttribute("no");
		info.setMemberNo(mNo);

		infoService.enrollBoard(info);
		return "redirect:/info/category?name=" + info.getInfoCategory() + "&page=1";
	}

	// 수정페이지 진입
	@GetMapping("/edit/{infoNo}")
	public String infoEditBoard(@PathVariable("infoNo") int infoNo, Model model) {
		InfoDTO post = infoService.getPostById(infoNo);

		String category = post.getInfoCategory();
		List<String> tags = Arrays.asList(post.getInfoTag1(), post.getInfoTag2(), post.getInfoTag3());

		model.addAttribute("post", post);
		model.addAttribute("category", category);
		model.addAttribute("tags", tags);

		return "board/info/infoBoardEdit";
	}
	
	// 게시글 수정
	@PostMapping("/updatePost")
	public String updatePost(InfoDTO post, HttpSession session, RedirectAttributes redirectAttributes)
			throws IllegalStateException, IOException {
		Integer mNo = (Integer) session.getAttribute("no");
		post.setMemberNo(mNo);

		int result = infoService.updatePost(post.getInfoNo(), post);
		if (result == 1) {
			redirectAttributes.addFlashAttribute("message", "수정 완료 되었습니다.");
			return "redirect:/info/infoDtail/" + post.getInfoNo();
		} else {
			redirectAttributes.addFlashAttribute("message", "수정 실패 되었습니다.");
			return "redirect:/info/edit/" + post.getInfoNo();
		}
	}

	// 게시글 삭제
	@PostMapping("/deletePost")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> deletePost(@RequestParam("infoNo") int infoNo) {
		Map<String, Object> response = new HashMap<>();

		// 해당 게시글에 연결된 모든 댓글 삭제
		infoCommentService.deleteCommentsByPostId(infoNo);		
	
		// 게시글 삭제
		int result = infoService.deletePost(infoNo);

		if (result == 1) {
			response.put("message", "게시글이 성공적으로 삭제되었습니다.");
			response.put("success", true);
			response.put("redirectUrl", "/info/category");
		} else {
			response.put("message", "게시글 삭제에 실패하였습니다.");
			response.put("success", false);
			response.put("redirectUrl", "/info/infoDtail/" + infoNo);
		}

		return ResponseEntity.ok(response);
	}

	// 게시글 신고하기
	@PostMapping("/report")
	public ResponseEntity<?> reportInfo(@RequestBody DeclarationDTO declarationDto, HttpSession session) {
		try {

			Integer mNo = (Integer) session.getAttribute("no");

			// 사용자 번호 세팅
			declarationDto.setMNo(mNo);

			// 신고 처리 로직 수행
			boolean isSuccessful = infoService.report(declarationDto);
			
			System.out.println("댓글 넘버: " + declarationDto.getInfoCommentNo());

			// 신고 처리 결과에 따른 응답
			if (isSuccessful) {
				// 신고 처리 성공 시 응답
				return ResponseEntity.ok().build();
			} else {
				// 신고 처리 실패 시 응답
				return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Declaration processing failed.");
			}
		} catch (Exception e) {
			// 에러 발생 시 응답
			return new ResponseEntity<>(e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}


}
