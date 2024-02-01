package kr.co.coco.board.controller;

import java.io.IOException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
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

import kr.co.coco.board.model.dto.InfoCommentDTO;
import kr.co.coco.board.model.dto.InfoDTO;
import kr.co.coco.board.model.service.InfoServiceImpl;


@Controller
@RequestMapping("/info")
public class InfoController {

	@Autowired
	private InfoServiceImpl infoService;

	
	
	// 정보게시판 메인 진입
	

	// 카테고리 목록 조회
	@GetMapping("/category")
	public String infoCategoryBoard(@RequestParam(value = "name", required = false) String categoryName, Model model) {
		List<InfoDTO> posts = infoService.getPostsByCategory(categoryName);
	    model.addAttribute("posts", posts);
	    model.addAttribute("categoryName", categoryName); 
	    return "board/info/infoBoard";
	}
	
	//게시글 디테일 페이지 진입
	@GetMapping("/infoDtail/{infoNo}")
	public String infoDtailBoard(@PathVariable("infoNo") String infoNo, Model model) {
	    InfoDTO post = infoService.getPostById(infoNo); 
	    List<InfoCommentDTO> comments = infoService.getCommentsByPostId(infoNo); 
	    model.addAttribute("post", post); 
	    model.addAttribute("comments", comments); 
	    return "board/info/infoBoardDtail";
	}

	
	// 작성 페이지 진입
	@GetMapping("/registr")
	public String infoRegistrBoard() {
		return "board/info/infoRegistr";
	}
	
	//게시글 등록 
	@PostMapping("/SubmitRegistr")
	public String freeEnroll(InfoDTO info, HttpSession session) throws IllegalStateException, IOException {
		info.setMNo(1);
	    infoService.enrollBoard(info);  
	    return "redirect:/info/category"; 
	}

	// 수정페이지 진입
	@GetMapping("/edit/{infoNo}")
	public String infoEditBoard(@PathVariable("infoNo") String infoNo, Model model) {
	    InfoDTO post = infoService.getPostById(infoNo); 

	    String category = post.getInfoCategory();
	    List<String> tags = Arrays.asList(post.getInfoTag1(), post.getInfoTag2(), post.getInfoTag3());

	    model.addAttribute("post", post); 
	    model.addAttribute("category", category); 
	    model.addAttribute("tags", tags); 
	    
	    return "board/info/infoBoardEdit";
	}

	//게시글 수정
	@PostMapping("/updatePost")
	public String updatePost(InfoDTO post, RedirectAttributes redirectAttributes) throws IllegalStateException, IOException {
	    post.setMNo(1);  // 임시로 멤버 번호 1로 설정
	    int result = infoService.updatePost(post.getInfoNo(), post);
	   System.out.println("컨텐츠" + post.getInfoContent());
	    if(result == 1) {
	        redirectAttributes.addFlashAttribute("message", "수정 완료 되었습니다.");
	        return "redirect:/info/infoDtail/" + post.getInfoNo();
	    } else {
	        redirectAttributes.addFlashAttribute("message", "수정 실패 되었습니다.");
	        return "redirect:/info/edit/" + post.getInfoNo(); 
	    }
	}

	//게시글 삭제
	@PostMapping("/deletePost")
	@ResponseBody  
	public Map<String, Object> deletePost(@RequestParam("infoNo") int infoNo) {
	    Map<String, Object> response = new HashMap<>();
	    int result = infoService.deletePost(infoNo);

	    if(result == 1) {
	        response.put("message", "게시글이 성공적으로 삭제되었습니다.");
	        response.put("success", true);
	        response.put("redirectUrl", "/info/category");  
	    } else {
	        response.put("message", "게시글 삭제에 실패하였습니다.");
	        response.put("success", false);
	        response.put("redirectUrl", "/info/detail/" + infoNo);  
	    }

	    return response;
	}
	
	//조회수 증가
	@ResponseBody
	@PostMapping("/increaseViewCount")
	public void increaseViewCount(@RequestBody Map<String, Object> map) {
	    int infoNo = (Integer) map.get("infoNo");
	    infoService.increaseViewCount(infoNo);
	}
}
	
	



