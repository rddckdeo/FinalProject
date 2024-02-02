package kr.co.coco.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.coco.admin.model.service.AdminServiceImpl;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	private AdminServiceImpl adminService;
//	page 호출 모음
	//main Page
	@GetMapping("/adminForm.do")
	public String adminForm() {
		return "admin/adminMain";
	}
	//방문자 현황
	@GetMapping("/adminVisit.do")
	public String adminVisit() {
		return "admin/adminVisit";
	}
	//사용자 관리
	@GetMapping("/adminMember.do")
	public String adminMember() {
		return "admin/adminMember";
	}
	// 프로젝트 관리
	@GetMapping("/adminProject.do")
	public String adminProject() {
		return "admin/adminProject";
	}
	// 문의 사항
	@GetMapping("/adminInquiry.do")
	public String adminInquiry() {
		return "admin/adminInquiry";
	}
	// 게시판 현황
	@GetMapping("/adminBoard.do")
	public String adminBoard() {
		return "admin/adminBoard";
	}
	// 신고 현황
	@GetMapping("/adminDeclaration.do")
	public String adminDeclaration() {
		return "admin/adminDeclaration";
	}
	@GetMapping("/mainForm.do")
	public String mainForm() {
		return "redirect:/member/mainForm.do";
	}
	
	
}
