package kr.co.coco.board.controller;

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
	                          @RequestParam(defaultValue = "10") int pageSize, 
	                          Model model) {

	    // info 게시글 검색 로직 수행
	    List<InfoDTO> infoPosts = infoService.searchInfoPosts(query, infoPage, pageSize);

	    // free 게시글 검색 로직 수행
	    List<FreeDTO> freePosts = freeService.searchFreePosts(query, freePage, pageSize);

	    // 검색 결과를 모델에 추가
	    model.addAttribute("infoPosts", infoPosts);
	    model.addAttribute("freePosts", freePosts);
	    model.addAttribute("pageSize", pageSize);


	    // infoPosts와 freePosts의 내용 확인
	    for (InfoDTO post : infoPosts) {
	        logger.info(post.toString());
	    }
	    for (FreeDTO post : freePosts) {
	        logger.info(post.toString());
	    }

	    logger.info("infoPosts: {}", infoPosts);
	    logger.info("freePosts: {}", freePosts);

	    // 검색 텍스트를 모델에 추가
	    model.addAttribute("query", query);

	    // 현재 페이지 번호와 페이지 크기를 모델에 추가
	    model.addAttribute("infoPage", infoPage);
	    model.addAttribute("freePage", freePage);
	    model.addAttribute("pageSize", pageSize);

	    // 검색 결과와 함께 뷰 이름을 반환
	    return "board/main/boardSearch";
	}
	



}