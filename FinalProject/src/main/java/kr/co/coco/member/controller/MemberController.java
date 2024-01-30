package kr.co.coco.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.coco.member.model.Service.MemberServiceImpl;
import kr.co.coco.member.model.dto.MemberDTO;

@Controller
@RequestMapping("/member")
public class MemberController {

	@Autowired
	private MemberServiceImpl memberService;
//	회원가입 Form 이동
	@GetMapping("/registerForm.do")
	public String registerForm() {
		return "member/register";
	}
//	회원가입
	@PostMapping("/register.do")
	public String register(MemberDTO member, HttpSession session, Model model) {
		int result = memberService.registerMember(member);
		
		
		
		if(result == 1) {
			return "member/register";			
		}else {
			return "common/error";
		}
	}
	
//	로그인 Form 이동
	@GetMapping("/loginForm.do")
	public String loginForm() {
		return "member/login";
	}

}
