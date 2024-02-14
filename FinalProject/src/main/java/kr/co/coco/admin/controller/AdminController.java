package kr.co.coco.admin.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.coco.admin.common.paging.AdminPageInfo;
import kr.co.coco.admin.common.paging.AdminPagination;
import kr.co.coco.admin.model.dto.AdminDTO;
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
			@RequestParam(value = "cpage", defaultValue = "1") int cpage) {
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
		int visitListCount = adminService.selectVisitList(member);
		int pageLimit = 5;
		int boardLimit = 5;
		int row = visitListCount - (cpage - 1) * boardLimit;
		
		AdminPageInfo piVisit = AdminPagination.getPageInfo(visitListCount, cpage, pageLimit, boardLimit);
		List<MemberDTO> visitList = adminService.selectListToday(member, piVisit);
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
	public String adminVisit(Model model, MemberDTO member, 
			@RequestParam(value = "cpage", defaultValue = "1") int cpage) {
		// Summary
		int day = adminService.dayVisit();
		int week = adminService.weekVisit();
		int month = adminService.monthVisit();
		int total = adminService.visitCount();
		model.addAttribute("day",day);
		model.addAttribute("week",week);
		model.addAttribute("month",month);
		model.addAttribute("total",total);
		
		// 전체 페이지 수
		int visitListCount = adminService.selectVisitListAll(member);
		int boardLimit = 6;
		int pageLimit = 5;
		
		AdminPageInfo piVisit = AdminPagination.getPageInfo(visitListCount, cpage, pageLimit, boardLimit);
		List<MemberDTO> visitList = adminService.selectListAll(member, piVisit);
		
		for (MemberDTO item : visitList) {
			// 2023-12-26 15:57:48.0
			String indate = item.getLoginDate().substring(2, 10);
			item.setLoginDay(indate);
		}
		// 시간으로 가져오기
		for (MemberDTO item : visitList) {
			// 2023-12-26 15:57:48.0
			String indate = item.getLoginDate().substring(11, 19);
			item.setLoginDate(indate);
		}
		
		model.addAttribute("visitList",visitList);
		model.addAttribute("piVisit",piVisit);
		
		return "admin/adminVisit";
	}
	//사용자 관리
	@GetMapping("/adminMember.do")
	public String adminMember(MemberDTO member, Model model, 
			@RequestParam(value="cpage",defaultValue="1") int cpage,
			@RequestParam(value="status",defaultValue="total") String status
			) {
		//Summary
		int newUserDay = adminService.newUserDay();
		int newUserMonth = adminService.newUserMonth();
		int newUserYear = adminService.newUserYear();
		int newUserTotal = adminService.newUserTotal();
		model.addAttribute("newUserDay",newUserDay);
		model.addAttribute("newUserMonth",newUserMonth);
		model.addAttribute("newUserYear",newUserYear);
		model.addAttribute("newUserTotal",newUserTotal);
		//paging
		int boardLimit = 6;
		int pageLimit = 5;
		int newBoardLimit = 5;
		
		int memberListCount = adminService.memberListCount(); // total paging
		int newMemberCount = adminService.newMemberCount(); // newMember paging
		int deleteMemberCount = adminService.deleteCount(); // deleteMember paging
		// 객체 생성(pi1, pi2, pi3)
		AdminPageInfo pi1 = new AdminPageInfo();
		AdminPageInfo pi2 = new AdminPageInfo();
		AdminPageInfo pi3 = new AdminPageInfo();
		if(status.equals("total")) {
			pi1 = AdminPagination.getPageInfo(memberListCount, cpage, pageLimit, boardLimit);
			pi2 = AdminPagination.getPageInfo(newMemberCount,1, pageLimit, newBoardLimit);
			pi3 = AdminPagination.getPageInfo(deleteMemberCount,1, pageLimit, newBoardLimit);
		}else if(status.equals("newUser")) {
			pi1 = AdminPagination.getPageInfo(memberListCount,1, pageLimit, boardLimit);
			pi2 = AdminPagination.getPageInfo(newMemberCount,cpage, pageLimit, newBoardLimit);
			pi3 = AdminPagination.getPageInfo(deleteMemberCount,1, pageLimit, newBoardLimit);
		}else if(status.equals("delete")) {
			pi1 = AdminPagination.getPageInfo(memberListCount,1, pageLimit, boardLimit);
			pi2 = AdminPagination.getPageInfo(newMemberCount,1, pageLimit, newBoardLimit);
			pi3 = AdminPagination.getPageInfo(deleteMemberCount,cpage, pageLimit, newBoardLimit);
		}
		
		// Total Member
		List<MemberDTO> totalList = adminService.totalList(member, pi1);
		// 일반 회원 또는 관리자 구분
		for (MemberDTO item : totalList) {
			String type = item.getType();
			if("1".equals(type)) {
				item.setType("일반");
			}else {
				item.setType("관리자");
			}
		}
		List<MemberDTO> newUserList = adminService.newUserList(member, pi2);
		List<MemberDTO> deleteList = adminService.deleteList(member,pi3);
		
		model.addAttribute("pi1",pi1);
		model.addAttribute("pi2",pi2);
		model.addAttribute("pi3",pi3);
		model.addAttribute("totalList",totalList);
		model.addAttribute("newUserList",newUserList);
		model.addAttribute("deleteList",deleteList);
		
		return "admin/adminMember";
	}
	// 프로젝트 관리
	@GetMapping("/adminProject.do")
	public String adminProject(){
		return "admin/adminProject";
	}
	// 문의 사항
	@GetMapping("/adminInquiry.do")
	public String adminInquiry() {
		return "admin/adminInquiry";
	}
	// 게시판 현황
	@GetMapping("/adminBoard.do")
	public String adminBoard(AdminDTO admin, Model model,
			@RequestParam(value="cpage",defaultValue="1") int cpage,
			@RequestParam(value="status",defaultValue="null") String status) {
		System.out.println(status);
		int boardLimit = 6;
		int pageLimit = 5;
		AdminPageInfo pi = new AdminPageInfo();
		
		// adminDTO는 일단 임시로 사용하는 내용 BoardDTO가 없기 때문
		if(status.equals("info")) {
//			int boardListCount = adminService.infoListCount();
//			pi = AdminPagination.getPageInfo(boardListCount, cpage, pageLimit, boardLimit);
//			List<AdminDTO> list = adminService.infoList(admin);
		}else if(status.equals("infoComment")) {
			
		}else if(status.equals("infoComment")) {
			
		}else if(status.equals("infoComment")) {
			
		}
		
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
	// admin delete
	@ResponseBody
	@PostMapping("/deleteMember.do")
	public String deleteMember(@RequestParam("no") int no){
		int result = adminService.deleteMember(no);
			if(result == 1) {
				return "success";
			}else {
				return "error";
			}
	}
	// 삭제 취소
	@ResponseBody
	@PostMapping("/deleteCancel.do")
	public String deleteCancel(@RequestParam("no") int no) {
		int result = adminService.deleteCancel(no);
		if(result == 1) {
			return "success";
		}else {
			return "error";
		}
	}
	// search
	@GetMapping("/searchMember.do")
	public int searchMember(@RequestParam("searchMember") String searchMember,
			Model model) {
		
//		int result = adminService.searchMember(searchMember);
		
		return 1;
	}
	
}
