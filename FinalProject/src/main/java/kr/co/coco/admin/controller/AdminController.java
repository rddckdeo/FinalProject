package kr.co.coco.admin.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.coco.admin.common.paging.AdminPageInfo;
import kr.co.coco.admin.common.paging.AdminPagination;
import kr.co.coco.admin.model.service.AdminServiceImpl;
import kr.co.coco.member.model.dto.MemberDTO;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	private AdminServiceImpl adminService;
//	page 호출 모음
	//main Page
	@GetMapping("/adminForm.do")
	public String adminForm(HttpSession session, Model model, MemberDTO member, 
			@RequestParam(value = "vcpage", defaultValue = "1") int vcpage) {
		// Count list 가져오기
		int visitCount = adminService.visitCount();
		int freeCount = adminService.freeCount();
		int infoCount = adminService.infoCount();
		int projectCount = adminService.projectCount();
		int boardCount = adminService.boardCount();
		int deCount = adminService.deCount();
		
		int totalBoard = freeCount + infoCount;
		
		model.addAttribute("visitCount",visitCount);
		model.addAttribute("totalBoard",totalBoard);
		model.addAttribute("projectCount",projectCount);
		model.addAttribute("boardCount",boardCount);
		model.addAttribute("deCount",deCount);
		
//		list 가져오기
		// visit List
		int visitListCount = adminService.selectVistList(member);
		int pageLimit = 5;
		int boardLimit = 5;
		int row = visitListCount - (vcpage - 1) * boardLimit;
		
		AdminPageInfo piVisit = AdminPagination.getPageInfo(visitListCount, vcpage, pageLimit, boardLimit);
		List<MemberDTO> visitList = adminService.selectListAll(member, piVisit);
		// 시간으로 가져오기
		for (MemberDTO item : visitList) {
			// 2023-12-26 15:57:48.0
			String indate = item.getLoginDate().substring(11, 19);
			item.setLoginDate(indate);
		}
		model.addAttribute("visitList",visitList);
		model.addAttribute("piVisit",piVisit);
		model.addAttribute("row",row);
		
		//info list 가져오기
		
		
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
	// mainPage 이동
	@GetMapping("/mainForm.do")
	public String mainForm() {
		return "redirect:/member/mainForm.do";
	}
	
	
}
