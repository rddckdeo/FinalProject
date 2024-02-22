package kr.co.coco.boardPush.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.coco.boardPush.model.dto.BoardPushDTO;
import kr.co.coco.boardPush.model.service.BoardPushServiceImpl;

@Controller
@RequestMapping("/boardPush")
public class BoardPushController {
	@Autowired
	private BoardPushServiceImpl pushService;
	
	@ResponseBody
	@GetMapping("/pushList.do")
	public List<BoardPushDTO> pushList(HttpSession session){
		int mNo = (Integer)session.getAttribute("no");
		System.out.println("boardPush session no =" + mNo);
		List<BoardPushDTO> pushList = pushService.pushList(mNo);
		int pushListCount = pushService.pushListCount(mNo);
		System.out.println("pushListCount = " + pushListCount);
		
		return pushList;
	}
	@ResponseBody
	@GetMapping("/pushNoneViewCount.do")
	public int noneViewCount(HttpSession session) {
		int no = (Integer)session.getAttribute("no");
		int count = pushService.pushNoneViewCount(no);
		return count;
	}
	
}
