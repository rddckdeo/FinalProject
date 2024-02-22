package kr.co.coco.board.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.coco.board.model.dto.FreeDTO;
import kr.co.coco.board.model.dto.InfoDTO;
import kr.co.coco.board.model.service.FreeServiceImpl;
import kr.co.coco.board.model.service.InfoServiceImpl;

@Controller
@RequestMapping("/board")
public class BoardController {

	@Autowired
	private InfoServiceImpl infoService;

	@Autowired
	private FreeServiceImpl freeService;

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	//게시판 메인페이지 
	@GetMapping("/")
	public String infoBoard(Model model, HttpSession session) {
	    Integer no = (Integer) session.getAttribute("no");
	    String noString = String.valueOf(no);
	    System.out.println("no: " + noString);

	    // 정보 게시판 게시글 조회
	    List<InfoDTO> infoPosts = infoService.getAllPosts(0, 5);

	    // 자유 게시판 게시글 조회
	    List<FreeDTO> freePosts = freeService.getAllPosts(0, 5);

	    model.addAttribute("infoPosts", infoPosts);
	    model.addAttribute("freePosts", freePosts);

	    logger.info("infoPosts: {}", infoPosts);
	    logger.info("freePosts: {}", freePosts);

	    return "board/main/boardMain";
	}


	// 검색
	@GetMapping("/search")
	public String searchBoard(@RequestParam(required = false) String query, 
	                          @RequestParam(defaultValue = "1") int infoPage, 
	                          @RequestParam(defaultValue = "1") int freePage, 
	                          @RequestParam(defaultValue = "5") int pageSize, 
	                          Model model, RedirectAttributes redirectAttributes) {

	    // 게시글 검색 로직 수행
	    List<InfoDTO> infoPosts = infoService.searchInfoPosts(query, infoPage, pageSize);
	    List<FreeDTO> freePosts = freeService.searchFreePosts(query, freePage, pageSize);

	    // 총 게시글 수 조회
	    int totalInfoPosts = infoService.searchCountInfoPosts(query);
	    int totalFreePosts = freeService.searchCountFreePosts(query);

	    // 총 페이지 수 계산
	    int totalInfoPages = (int) Math.ceil((double) totalInfoPosts / pageSize);
	    int totalFreePages = (int) Math.ceil((double) totalFreePosts / pageSize);
	    
	    model.addAttribute("query", query);
	    model.addAttribute("infoPage", infoPage);
	    model.addAttribute("freePage", freePage);
	    model.addAttribute("pageSize", pageSize);
	    model.addAttribute("totalInfoPages", totalInfoPages);
	    model.addAttribute("totalFreePages", totalFreePages);
	    model.addAttribute("infoPosts", infoPosts);
	    model.addAttribute("freePosts", freePosts);
	    model.addAttribute("totalInfoPosts", totalInfoPosts);
	    model.addAttribute("totalFreePosts", totalFreePosts);
	    
	    logger.info("검색 infoPosts: {}", infoPosts);
	    logger.info("검색 freePosts: {}", freePosts);

//	    System.out.println("Current Info Page: " + infoPage);
//	    System.out.println("Current Free Page: " + freePage);
//	    System.out.println("Total Info Pages: " + totalInfoPages);
//	    System.out.println("Total Free Pages: " + totalFreePages);
//	    System.out.println("totalInfoPosts: " + totalInfoPosts);
//	    System.out.println("totalFreePosts: " + totalFreePosts);
	    
	    return "board/main/boardSearch";
	}
	@ExceptionHandler
	public String handleException(Exception e, RedirectAttributes redirectAttributes) {

	  redirectAttributes.addFlashAttribute("error", e.getMessage());
	  return "redirect:/board/search";
	}
	
	@GetMapping("/boardPush.do")
	public String BoardPushForm(){
		return "redirect:/mypage/boardPush.do";
	}


}