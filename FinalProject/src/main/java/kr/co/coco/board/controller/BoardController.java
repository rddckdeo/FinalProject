package kr.co.coco.board.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import org.slf4j.Logger;

import kr.co.coco.board.model.dto.FreeCommentDTO;
import kr.co.coco.board.model.dto.FreeDTO;
import kr.co.coco.board.model.dto.InfoCommentDTO;
import kr.co.coco.board.model.dto.InfoDTO;
import kr.co.coco.board.model.service.FreeServiceImpl;
import kr.co.coco.board.model.service.InfoServiceImpl;
import oracle.jdbc.proxy.annotation.Post;

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
	                          Model model) {

	    // 게시글 검색 로직 수행
	    List<InfoDTO> infoPosts = infoService.searchInfoPosts(query, infoPage, pageSize);
	    List<FreeDTO> freePosts = freeService.searchFreePosts(query, freePage, pageSize);

	    // 총 게시글 수 조회
	    int totalInfoPosts = infoService.searchCountInfoPosts(query);
	    int totalFreePosts = freeService.searchCountFreePosts(query);

	    // 총 페이지 수 계산
	    int totalInfoPages = (int) Math.ceil((double) totalInfoPosts / pageSize);
	    int totalFreePages = (int) Math.ceil((double) totalFreePosts / pageSize);
	    

	    // 모델에 추가
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


	 // 페이지 값 로깅
	    System.out.println("Current Info Page: " + infoPage);
	    System.out.println("Current Free Page: " + freePage);
	    System.out.println("Total Info Pages: " + totalInfoPages);
	    System.out.println("Total Free Pages: " + totalFreePages);
	    System.out.println("totalInfoPosts: " + totalInfoPosts);
	    System.out.println("totalFreePosts: " + totalFreePosts);
	    
	    // 검색 결과와 함께 뷰 이름을 반환
	    return "board/main/boardSearch";
	}

	



}