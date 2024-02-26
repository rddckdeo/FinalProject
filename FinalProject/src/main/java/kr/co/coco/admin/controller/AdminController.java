package kr.co.coco.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import kr.co.coco.admin.model.dto.AdminBoardDTO;
import kr.co.coco.admin.model.service.AdminServiceImpl;
import kr.co.coco.board.model.dto.DeclarationDTO;
import kr.co.coco.board.model.dto.InfoDTO;
import kr.co.coco.boardPush.model.dto.BoardPushDTO;
import kr.co.coco.boardPush.model.service.BoardPushServiceImpl;
import kr.co.coco.colabo.model.dto.ColaboDTO;
import kr.co.coco.member.model.dto.MemberDTO;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	private AdminServiceImpl adminService;
	@Autowired
	private BoardPushServiceImpl pushService;
//	page 호출 모음
	//main Page
	@GetMapping("/adminForm.do")
	public String adminForm(HttpSession session, Model model, MemberDTO member, InfoDTO info,
			@RequestParam(value = "cpage", defaultValue = "1") int cpage,
			@RequestParam(value = "status", defaultValue = "visit") String status) {
		String type = (String)session.getAttribute("type");
		int check = adminCheck(type);
		if(check == 1) {
		
// --------------------------Summay Count------------------------------ //
			// Count list 가져오기
			int visitCount = adminService.visitCount(); // 전체 방문
			int freeCount = adminService.freeCount(); // 전체 자유게시판
			int infoCount = adminService.infoCount(); // 전체 정보게시판
			int projectCount = adminService.projectCount(); // 전체 프로젝트
			int boardCount = adminService.boardCount(); // 전체 문의사항
			int deCount = adminService.deCount(); // 전체 신고수
			
			int totalBoard = freeCount + infoCount; // 자유게시판 + 정보게시판
			// 통계 그래프
			int day = adminService.dayVisit();
			int week = adminService.weekVisit();
			int month = adminService.monthVisit();
			
			model.addAttribute("visitCount",visitCount);
			model.addAttribute("totalBoard",totalBoard);
			model.addAttribute("projectCount",projectCount);
			model.addAttribute("boardCount",boardCount);
			model.addAttribute("deCount",deCount);
			
			model.addAttribute("day",day);
			model.addAttribute("week",week);
			model.addAttribute("month",month);
			
// --------------------------PAGE------------------------------ //
			int pageLimit = 5;
			int boardLimit = 5;
			
			int visitListCount = adminService.selectVisitList(member);
			int freeListCount = adminService.freeListCountToday(); // newMember paging
			int infoListCount = adminService.infoListCountToday(); // deleteMember paging
			// 객체 생성(pi1, pi2, pi3)
			AdminPageInfo pi1 = new AdminPageInfo(); // visit
			AdminPageInfo pi2 = new AdminPageInfo(); // info
			AdminPageInfo pi3 = new AdminPageInfo(); // free
			if(status.equals("visit")) {
				pi1 = AdminPagination.getPageInfo(visitListCount, cpage, pageLimit, boardLimit);
				pi2 = AdminPagination.getPageInfo(infoListCount,1, pageLimit, boardLimit);
				pi3 = AdminPagination.getPageInfo(freeListCount,1, pageLimit, boardLimit);
			}else if(status.equals("info")) {
				pi1 = AdminPagination.getPageInfo(visitListCount,1, pageLimit, boardLimit);
				pi2 = AdminPagination.getPageInfo(infoListCount,cpage, pageLimit, boardLimit);
				pi3 = AdminPagination.getPageInfo(freeListCount,1, pageLimit, boardLimit);
			}else if(status.equals("free")) {
				pi1 = AdminPagination.getPageInfo(visitListCount,1, pageLimit, boardLimit);
				pi2 = AdminPagination.getPageInfo(infoListCount,1, pageLimit, boardLimit);
				pi3 = AdminPagination.getPageInfo(freeListCount,cpage, pageLimit, boardLimit);
			}
// --------------------------LIST------------------------------ //
			// visit List 가져오기
			List<MemberDTO> visitList = adminService.selectListToday(member, pi1);
			// 시간으로 가져오기
			for (MemberDTO item : visitList) {
				// 2023-12-26 15:57:48.0
				String indate = item.getLoginDate().substring(11, 19);
				item.setLoginDate(indate);
			}
			// info list 가져오기
			List<InfoDTO> infoList = adminService.infoListToday(info, pi2);
			// free list 가져오기
			List<InfoDTO> freeList = adminService.freeListToday(info, pi3);
			
// --------------------------model------------------------------ //
			model.addAttribute("visitList",visitList);
			model.addAttribute("freeList",freeList);
			model.addAttribute("infotList",infoList);
			model.addAttribute("pi1",pi1);
			model.addAttribute("pi2",pi2);
			model.addAttribute("pi3",pi3);
			
			return "admin/adminMain";
		}
		return "redirect:/member/mainForm.do";
	}
	//방문자 현황
	@GetMapping("/adminVisit.do")
	public String adminVisit(Model model, MemberDTO member, HttpSession session,
			@RequestParam(value = "cpage", defaultValue = "1") int cpage) {
		String type = (String)session.getAttribute("type");
		int check = adminCheck(type);
		if(check == 1) {
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
		return "redirect:/member/mainForm.do";
	}
	//사용자 관리
	@GetMapping("/adminMember.do")
	public String adminMember(MemberDTO member, Model model, HttpSession session,
			@RequestParam(value="cpage",defaultValue="1") int cpage,
			@RequestParam(value="status",defaultValue="total") String status,
			@RequestParam (defaultValue = "")String searchInput
			) {
		String adminType = (String)session.getAttribute("type");
		int check = adminCheck(adminType);
		if(check == 1) {
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
		
		int memberListCount = 0;
		if(searchInput.isEmpty()) {
			memberListCount = adminService.memberListCount(); // total paging
		}else{
			memberListCount = adminService.memberSearchListCount(searchInput); // total paging (검색)	
		}
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
		List<MemberDTO> totalList = null;
		if(searchInput.isEmpty()) {
			// 일반 회원 또는 관리자 구분
			totalList = adminService.totalList(member, pi1);
			for (MemberDTO item : totalList) {
				String type = item.getType();
				if("1".equals(type)) {
					item.setType("일반");
				}else {
					item.setType("관리자");
				}
			}
		}else{
			// 일반 회원 또는 관리자 구분
			totalList = adminService.searchList(member, pi1, searchInput); // search
			for (MemberDTO item : totalList) {
				String type = item.getType();
				if("1".equals(type)) {
					item.setType("일반");
				}else {
					item.setType("관리자");
				}
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
		return "redirect:/member/mainForm.do";
	}
	// 프로젝트 관리
	@GetMapping("/adminProject.do")
	public String adminProject(Model model, ColaboDTO colabo, HttpSession session,
						@RequestParam(value="cpage",defaultValue="1")int cpage,
						@RequestParam(value="status",defaultValue="n")String status){
		String adminType = (String)session.getAttribute("type");
		int check = adminCheck(adminType);
		if(check == 1) {
		// ----------------------summary----------------------
		int np = adminService.newProject();
		int sp = adminService.startProject();
		int ep = adminService.endProject();
		// ----------------------paging----------------------
		int boardLimit = 6;
		int pageLimit = 5;
		
		int newProjectListCount = adminService.newProjectListCount(); // total paging
		int startProjectListCount = adminService.startProjectListCount(); // newMember paging
		int endProjectListCount = adminService.endProjectListCount(); // deleteMember paging
		// 객체 생성(pi1, pi2, pi3)
		AdminPageInfo pi1 = new AdminPageInfo();
		AdminPageInfo pi2 = new AdminPageInfo();
		AdminPageInfo pi3 = new AdminPageInfo();
		if(status.equals("n")) {
			pi1 = AdminPagination.getPageInfo(newProjectListCount, cpage, pageLimit, boardLimit);
			pi2 = AdminPagination.getPageInfo(startProjectListCount,1, pageLimit, boardLimit);
			pi3 = AdminPagination.getPageInfo(endProjectListCount,1, pageLimit, boardLimit);
		}else if(status.equals("s")) {
			pi1 = AdminPagination.getPageInfo(newProjectListCount,1, pageLimit, boardLimit);
			pi2 = AdminPagination.getPageInfo(startProjectListCount,cpage, pageLimit, boardLimit);
			pi3 = AdminPagination.getPageInfo(endProjectListCount,1, pageLimit, boardLimit);
		}else if(status.equals("e")) {
			pi1 = AdminPagination.getPageInfo(newProjectListCount,1, pageLimit, boardLimit);
			pi2 = AdminPagination.getPageInfo(startProjectListCount,1, pageLimit, boardLimit);
			pi3 = AdminPagination.getPageInfo(endProjectListCount,cpage, pageLimit, boardLimit);
		}
		// ----------------------List----------------------
		List<ColaboDTO> newProjectList = adminService.newProjectList(colabo, pi1);
		List<ColaboDTO> startProjectList = adminService.startProjectList(colabo, pi2);
		List<ColaboDTO> endProjectList = adminService.endProjectList(colabo, pi3);
		// ----------------------model----------------------
		model.addAttribute("np",np);
		model.addAttribute("sp",sp);
		model.addAttribute("ep",ep);
		model.addAttribute("pi1",pi1);
		model.addAttribute("pi2",pi2);
		model.addAttribute("pi3",pi3);
		model.addAttribute("newProjectList",newProjectList);
		model.addAttribute("startProjectList",startProjectList);
		model.addAttribute("endProjectList",endProjectList);
		
		return "admin/adminProject";
		}
		return "redirect:/member/mainForm.do";
	}
	// 문의 사항
	@GetMapping("/adminInquiry.do")
	public String adminInquiry(AdminBoardDTO admin, Model model, HttpSession session,
			@RequestParam(value="cpage", defaultValue="1")int cpage,
			@RequestParam(value="status",defaultValue="incom")String status){
		String adminType = (String)session.getAttribute("type");
		int check = adminCheck(adminType);
		if(check == 1) {
		// ----------------------summary----------------------
		int incomCount = adminService.incomCount();
		int comCount = adminService.comCount();
		int totalCount = adminService.totalCount();
		
		model.addAttribute("incomCount",incomCount);
		model.addAttribute("comCount",comCount);
		model.addAttribute("totalCount",totalCount);
		// ----------------------paging----------------------
		int boardLimit = 6;
		int pageLimit = 5;
		AdminPageInfo pi = new AdminPageInfo();
		if(status.equals("incom")) {
			pi = AdminPagination.getPageInfo(incomCount, cpage, pageLimit, boardLimit);
			List<AdminBoardDTO> list = adminService.incomList(admin, pi);
			for (AdminBoardDTO item : list) {
				// 2023-12-26 15:57:48.0
				String indate = item.getInDate().substring(11, 19);
				item.setInDate(indate);
			}
			model.addAttribute("list",list); // List
			model.addAttribute("pi",pi); // 페이징
			model.addAttribute("title","미완료 문의"); // title 제목
			model.addAttribute("status","incom"); // status
			return "admin/adminInquiry";
		}else if(status.equals("com")) {
			pi = AdminPagination.getPageInfo(comCount, cpage, pageLimit, boardLimit);
			List<AdminBoardDTO> list = adminService.comList(admin, pi);
			for (AdminBoardDTO item : list) {
				// 2023-12-26 15:57:48.0
				String indate = item.getInDate().substring(11, 19);
				item.setInDate(indate);
			}
			model.addAttribute("list",list); // List
			model.addAttribute("pi",pi); // 페이징
			model.addAttribute("title","완료 문의"); // title 제목
			model.addAttribute("status","com"); // status
			return "admin/adminInquiry";
		}else if(status.equals("total")) {
			pi = AdminPagination.getPageInfo(totalCount, cpage, pageLimit, boardLimit);
			List<AdminBoardDTO> list = adminService.AdminBoardTotalList(admin, pi);
			for (AdminBoardDTO item : list) {
				// 2023-12-26 15:57:48.0
				String indate = item.getInDate().substring(11, 19);
				item.setInDate(indate);
			}
			model.addAttribute("list",list); // List
			model.addAttribute("pi",pi); // 페이징
			model.addAttribute("title","전체 문의"); // title 제목
			model.addAttribute("status","total"); // status
			return "admin/adminInquiry";
		}
		return "admin/adminInquiry";
		}
		return "redirect:/member/mainForm.do";
	}
	// 게시판 현황
	@GetMapping("/adminBoard.do")
	public String adminBoard(InfoDTO info, Model model, HttpSession session,
			@RequestParam(value="cpage",defaultValue="1") int cpage,
			@RequestParam(value="status",defaultValue="info") String status) {
		String adminType = (String)session.getAttribute("type");
		int check = adminCheck(adminType);
		if(check == 1) {
		int infoTodayCount = adminService.infoTodayCount();
		int infoCommentTodayCount = adminService.infoCommentTodayCount();
		int freeTodayCount = adminService.freeTodayCount();
		int freeCommentTodayCount = adminService.freeCommentTodayCount();
		model.addAttribute("info",infoTodayCount);
		model.addAttribute("infoComment",infoCommentTodayCount);
		model.addAttribute("free",freeTodayCount);
		model.addAttribute("freeComment",freeCommentTodayCount);
		// board
		int boardLimit = 7;
		int pageLimit = 5;
		AdminPageInfo pi = new AdminPageInfo();
		
		if(status.equals("info")) {
			int boardListCount = adminService.infoListCount();
			pi = AdminPagination.getPageInfo(boardListCount, cpage, pageLimit, boardLimit);
			List<InfoDTO> list = adminService.infoList(info, pi);
			model.addAttribute("list",list); // List
			model.addAttribute("pi",pi); // 페이징
			model.addAttribute("title","정보게시판"); // title 제목
			model.addAttribute("status","info"); // status
			return "admin/adminBoard";
		}else if(status.equals("infoComment")) {
			int boardListCount = adminService.infoCommentListCount();
			pi = AdminPagination.getPageInfo(boardListCount, cpage, pageLimit, boardLimit);
			List<InfoDTO> list = adminService.infoCommentList(info, pi);
			model.addAttribute("list",list); // List
			model.addAttribute("pi",pi); // 페이징
			model.addAttribute("title","정보게시판 댓글"); // title 제목
			model.addAttribute("status","infoComment"); // status
			return "admin/adminBoard";
		}else if(status.equals("free")) {
			int boardListCount = adminService.freeListCount();
			pi = AdminPagination.getPageInfo(boardListCount, cpage, pageLimit, boardLimit);
			List<InfoDTO> list = adminService.freeList(info, pi);
			model.addAttribute("list",list); // List
			model.addAttribute("pi",pi); // 페이징
			model.addAttribute("title","자유게시판"); // title 제목
			model.addAttribute("status","free"); // status
			return "admin/adminBoard";
		}else if(status.equals("freeComment")) {
			int boardListCount = adminService.freeCommentListCount();
			pi = AdminPagination.getPageInfo(boardListCount, cpage, pageLimit, boardLimit);
			List<InfoDTO> list = adminService.freeCommentList(info, pi);
			model.addAttribute("list",list); // List
			model.addAttribute("pi",pi); // 페이징
			model.addAttribute("title","자유게시판 댓글"); // title 제목
			model.addAttribute("status","freeComment"); // status
			return "admin/adminBoard";
		}
		return "admin/adminBoard";
		}
		return "redirect:/member/mainForm.do";
	}
	// 신고 현황
	@GetMapping("/adminDeclaration.do")
	public String adminDeclaration(Model model, DeclarationDTO dec,HttpSession session,
						@RequestParam(value="cpage", defaultValue= "1") int cpage,
						@RequestParam(value="status", defaultValue="total") String status) {
		String adminType = (String)session.getAttribute("type");
		int check = adminCheck(adminType);
		if(check == 1) {
		int deTodayCount = adminService.deTodayCount();
		int noneBlindCount = adminService.noneBlindCount();
		int blindCount = adminService.blindCount();
		int deTotalCount = adminService.deTotalCount();
		model.addAttribute("deTodayCount",deTodayCount);
		model.addAttribute("noneBlindCount",noneBlindCount);
		model.addAttribute("blindCount",blindCount);
		model.addAttribute("deTotalCount",deTotalCount);
		// paging
		int boardLimit = 6;
		int pageLimit = 5;
		AdminPageInfo pi = new AdminPageInfo();
		if(status.equals("today")) {
			pi = AdminPagination.getPageInfo(deTodayCount, cpage, pageLimit, boardLimit);
			List<DeclarationDTO> list = adminService.deTodayList(dec, pi);
			for (DeclarationDTO item : list) {
				// 2023-12-26 15:57:48.0
				String indate = item.getDeclarationDate().substring(11, 19);
				item.setDeclarationDate(indate);
			}
			for(DeclarationDTO item : list) {
				if(item.getDeclarationWithdrawal() == null) {
					item.setDeclarationWithdrawal("미처리");
				}
			}
			model.addAttribute("list",list); // List
			model.addAttribute("pi",pi); // 페이징
			model.addAttribute("title","금일 신고"); // title 제목
			return "admin/adminDeclaration";
		}else if(status.equals("noneBlind")) {
			pi = AdminPagination.getPageInfo(noneBlindCount, cpage, pageLimit, boardLimit);
			List<DeclarationDTO> list = adminService.noneBlindList(dec, pi);
			for (DeclarationDTO item : list) {
				// 2023-12-26 15:57:48.0
				String indate = item.getDeclarationDate().substring(11, 19);
				item.setDeclarationDate(indate);
			}
			for(DeclarationDTO item : list) {
				if(item.getDeclarationWithdrawal() == null) {
					item.setDeclarationWithdrawal("미처리");
				}
			}
			model.addAttribute("list",list); // List
			model.addAttribute("pi",pi); // 페이징
			model.addAttribute("title","금일 신고"); // title 제목
			return "admin/adminDeclaration";
		}else if(status.equals("blind")) {
			pi = AdminPagination.getPageInfo(blindCount, cpage, pageLimit, boardLimit);
			List<DeclarationDTO> list = adminService.blindList(dec, pi);
			for (DeclarationDTO item : list) {
				// 2023-12-26 15:57:48.0
				String indate = item.getDeclarationDate().substring(11, 19);
				item.setDeclarationDate(indate);
			}
			for(DeclarationDTO item : list) {
				if(item.getDeclarationWithdrawal() == null) {
					item.setDeclarationWithdrawal("미처리");
				}
			}
			model.addAttribute("list",list); // List
			model.addAttribute("pi",pi); // 페이징
			model.addAttribute("title","금일 신고"); // title 제목
			return "admin/adminDeclaration";
		}else if(status.equals("total")) {
			pi = AdminPagination.getPageInfo(deTotalCount, cpage, pageLimit, boardLimit);
			List<DeclarationDTO> list = adminService.deTotalList(dec, pi);
			for (DeclarationDTO item : list) {
				// 2023-12-26 15:57:48.0
				String indate = item.getDeclarationDate().substring(11, 19);
				item.setDeclarationDate(indate);
			}
			for(DeclarationDTO item : list) {
				if(item.getDeclarationWithdrawal() == null) {
					item.setDeclarationWithdrawal("미처리");
				}
			}
			model.addAttribute("list",list); // List
			model.addAttribute("pi",pi); // 페이징
			model.addAttribute("title","금일 신고"); // title 제목
			return "admin/adminDeclaration";
		}
		return "admin/adminDeclaration";
		}
		return "redirect:/member/mainForm.do";
	}
	// mainPage 이동
	@GetMapping("/mainForm.do")
	public String mainForm() {
		return "redirect:/member/mainForm.do";
	}
//	-------------------------admin 기능 모음--------------------------
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
	// delete Board
	@ResponseBody
	@PostMapping("/deleteBoard.do")
	public int deleteBoard(@RequestParam("boardNo") int no,
			@RequestParam("status") String status){
		if(status.equals("infoComment")) {
			status = "INFO_COMMENT";
		}else if(status.equals("info")) {
			status = "INFO";
		}else if(status.equals("freeComment")) {
			status = "FREE_COMMENT";
		}else if(status.equals("free")) {
			status = "FREE";
		}
		Map<String, Object>param = new HashMap<>();
		param.put("no", no);
		param.put("status", status);
		int result = adminService.deleteBoard(param);
		
	    return result;
	}
	// delete Board
	@ResponseBody
	@PostMapping("/deleteProject.do")
	public int deleteProject(@RequestParam("projectNo") int no,
			@RequestParam("status") String status){
		if(status.equals("n")) {
			status = "n";
		}else if(status.equals("c")) {
			status = "c";
		}else if(status.equals("y")) {
			status = "y";
		}
		Map<String, Object>param = new HashMap<>();
		param.put("no", no);
		param.put("status", status);
		int result = adminService.deleteProject(param);
		
	    return result;
	}
	
	// adminBoard submit
	@ResponseBody
	@PostMapping("/adminBoardEnroll.do")
	public int adminBoardEnroll(
					HttpSession session,
					@RequestParam(value="no") int no,
					@RequestParam(value="content") String content){
		// adminBoard Enroll
		int result = adminService.adminBoardEnroll(no, content);
		// board_push Enroll ( admin board )
			// 게시글 작성자의 no를 가져와야함
		int adminBoardWriter = adminService.adminBoardWriter(no);
		Map<String, Object>param = new HashMap<>();
		param.put("boardNo", no);
		param.put("mNo",adminBoardWriter);
		param.put("content",content);
		
		int boardPush = pushService.adminBoardPushEnroll(param);
		
		if(result == 1) {
			return result;
		}else {
			return 0;
		}
	}
	
	// adminBoard delete
	@ResponseBody
	@PostMapping("/adminBoardDelete.do")
	public int adminBoardDelete(
					@RequestParam(value="no") int no){
		int result = adminService.adminBoardDelete(no);
		if(result == 1) {
			return result;
		}else {
			return 0;
		}
	}
	
	// declaration blind
	@ResponseBody
	@PostMapping("/declarationBlind.do")
	public int declarationBlind(@RequestParam(value="no")int no) { // declaration No
		int result = adminService.declarationBlind(no);
		// mNo ( 알림을 받아야하는 사람의 mNo ), boardNo, boardType 가져오는 메서드
		List<BoardPushDTO> declarationList = pushService.declarationList(no);
		// boardTitle 가져와야함
		int mNo = 0;
		int boardNo = 0;
		String boardType = null;
		for(BoardPushDTO dto : declarationList) {
			mNo = dto.getMNo();
			boardNo = dto.getBoardNo();
			boardType = dto.getBoardType();
		}
		Map<String, Object> param = new HashMap<>();
		param.put("mNo",mNo);
		param.put("boardNo",boardNo);
		System.out.println(mNo);
		System.out.println(boardNo);
		
		// board_Tile값 가져오기 ( info와 free 테이블이 나눠져 있기에 구분
		String getBoardTitle = null;
		if(boardType.equals("info")) {
			getBoardTitle = pushService.getBoardTitleInfo(param);

		}else if(boardType.equals("free")) {
			getBoardTitle = pushService.getBoardTitleFree(param);
		}else {
			System.out.println("getBoardTitle Error");
		}
		System.out.println("getBoardTitle : "+getBoardTitle);
		param.put("boardType", boardType);
		param.put("title", getBoardTitle);
		int boardPushBlind = pushService.boardPushBlind(param);
		if(result == 1) {
			return result;
		}else {
			return 0;
		}
	}
	// declaration None blind
	@ResponseBody
	@PostMapping("/declarationNoneBlind.do")
	public int declarationNoneBlind(@RequestParam(value="no")int no) {
		int result = adminService.declarationNoneBlind(no);
		if(result == 1) {
			return result;
		}else {
			return 0;
		}
	}
	
	public int adminCheck(String type) {
		try {
			int adminCheck = Integer.parseInt(type);
			if(adminCheck == 1) {
				return 0;
			}
			return 1;
		}catch(NumberFormatException | NullPointerException e) {
			return 0;
		}
	}
}

