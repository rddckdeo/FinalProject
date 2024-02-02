package kr.co.coco.mypage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.coco.mypage.model.service.MyPageServiceImpl;

@Controller
@RequestMapping("/mypage")
public class MyPageController {
	@Autowired
	private MyPageServiceImpl mypageService;
//	Page 이동
	// profile
	@GetMapping("/mypage.do")
	public String profileForm() {
		return "myPage/myProfile";
	}
	//info
	@GetMapping("/myinfo.do")
	public String infoForm() {
		return "myPage/myInfo";
	}
	//project
	@GetMapping("/myproject.do")
	public String projectForm() {
		return "myPage/myProject";
	}
	//board
	@GetMapping("/myboard.do")
	public String boardForm() {
		return "myPage/myBoard";
	}
	//comment
	@GetMapping("/mycomment.do")
	public String commentForm() {
		return "myPage/myComment";
	}
	//mainForm
	@GetMapping("/mainForm.do")
	public String mainForm() {
		return "redirect:/member/mainForm.do";
	}
}
