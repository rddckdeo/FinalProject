package kr.co.coco.board.controller;


import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
@RequestMapping("/board")
public class BoardController {

//	로그인 개발전으로 임의로 세션에 멤버id 추가함..나중에 변경할거임 
	@GetMapping("/")
    public String infoBoard() {
        return "board/main/boardMain";
    }
	
	// 검색
    @GetMapping("/search") 
    public String searchBoard() {
//    	public String searchBoard(@RequestParam String query) {
        // 검색 로직 수행
//        System.out.println("검색어: " + query);
        // 검색 결과와 함께 뷰 이름을 반환
        return "board/main/boardSearch";
    }
    
    

    
}