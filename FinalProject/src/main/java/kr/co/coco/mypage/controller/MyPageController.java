package kr.co.coco.mypage.controller;

import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Random;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.coco.admin.model.dto.AdminBoardDTO;
import kr.co.coco.board.controller.BoardController;
import kr.co.coco.board.model.dto.FreeCommentDTO;
import kr.co.coco.board.model.dto.FreeDTO;
import kr.co.coco.board.model.dto.InfoCommentDTO;
import kr.co.coco.board.model.dto.InfoDTO;
import kr.co.coco.board.model.service.FreeServiceImpl;
import kr.co.coco.board.model.service.InfoServiceImpl;

import kr.co.coco.mypage.common.paging.mypagePageInfo;
import kr.co.coco.mypage.common.paging.mypagePagination;

import kr.co.coco.boardPush.model.dto.BoardPushDTO;
import kr.co.coco.boardPush.model.service.BoardPushServiceImpl;
import kr.co.coco.colabo.model.dto.ColaboDTO;
import kr.co.coco.colabo.model.service.ColaboServiceImpl;

import kr.co.coco.mypage.model.dto.MyPageDTO;
import kr.co.coco.mypage.model.service.MyPageServiceImpl;

@Controller
@RequestMapping("/mypage")
public class MyPageController {

	@Autowired
	private MyPageServiceImpl mypageService;

	@Autowired
	private InfoServiceImpl infoService;

	@Autowired
	private FreeServiceImpl freeService;
	
	@Autowired
	private BoardPushServiceImpl pushService;
	@Autowired
	private ColaboServiceImpl colaboService;

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

//	Page 이동
	// profile
	@GetMapping("/mypage.do")
	public String profileForm(Model model, HttpSession session) {
		Integer mNo = (Integer) session.getAttribute("no");

		MyPageDTO member = mypageService.findMemberByNo(mNo);

		if (member == null) {
			model.addAttribute("error", true);
			return "myPage/myProfile";
		} else {
//			System.out.println("no: " + member.getNo());
//			System.out.println("name: " + member.getName());
//			System.out.println("hope: " + member.getHope());
//			System.out.println("stack: " + member.getStack());
			
			// 리스트 세개로 나눠서  해당되는 리스트에 넣을생각
			List<ColaboDTO> NList = new ArrayList<>();
			List<ColaboDTO> CList = new ArrayList<>();
			List<ColaboDTO> YList = new ArrayList<>();
			
			
			// 내가 속한 프로젝트 전체리스트 가져오기
			List<ColaboDTO> allList = colaboService.getProjectProfile(mNo);
			
			// 전체리스트에서 State 를 조회해서 해당되는 리스트에 넣기
			for(int i =0; i< allList.size(); i++) {
//				System.out.println(allList.get(i).getUploadName());
//				System.out.println(allList.get(i).getState());
				if(allList.get(i).getState() == 'N') {
					NList.add(allList.get(i));
				}else if(allList.get(i).getState() == 'C') {
					CList.add(allList.get(i));
				}else if(allList.get(i).getState() == 'Y') {
					YList.add(allList.get(i));
				}
				
			}
			
			model.addAttribute("NList", NList);
			model.addAttribute("CList", CList);
			model.addAttribute("YList", YList);
			

			model.addAttribute("hope", member.getHope());
			model.addAttribute("stack", member.getStack());
			model.addAttribute("intro", member.getIntro());
		}
		return "myPage/myProfile";
	}

	// info
	@GetMapping("/myinfo.do")
	public String infoForm(Model model, HttpSession session) {

		Integer mNo = (Integer) session.getAttribute("no");

		MyPageDTO member = mypageService.findMemberByNo(mNo);
		
		List<String> hopeList = new ArrayList<>();
		if(member.getHope() != null) {
		    hopeList = Arrays.asList(member.getHope().split(","));
		}

		List<String> stackList = new ArrayList<>();
		if(member.getStack() != null) {
		    stackList = Arrays.asList(member.getStack().split(","));
		}

		model.addAttribute("name", member.getName());
		model.addAttribute("id", member.getId());
		model.addAttribute("email", member.getEmail());
		model.addAttribute("nickname", member.getNickname());
		model.addAttribute("hopeList", hopeList);
		model.addAttribute("stackList", stackList);
		model.addAttribute("intro", member.getIntro());
		model.addAttribute("number", member.getNumber());

		return "myPage/myInfo";
	}

	// 프로필 정보 수정 페이지로 이동
	@GetMapping("/editProfile.do")
	public String editProfileForm(Model model, HttpSession session) {
	    Integer mNo = (Integer) session.getAttribute("no");
	    MyPageDTO member = mypageService.findMemberByNo(mNo);

		List<String> hopeList = new ArrayList<>();
		if(member.getHope() != null) {
		    hopeList = Arrays.asList(member.getHope().split(","));
		}

		List<String> stackList = new ArrayList<>();
		if(member.getStack() != null) {
		    stackList = Arrays.asList(member.getStack().split(","));
		}
	    session.setAttribute("name", member.getName());
	    session.setAttribute("id", member.getId());
	    session.setAttribute("email", member.getEmail());
	    session.setAttribute("nickname", member.getNickname());
	    session.setAttribute("hopeList", hopeList);
	    session.setAttribute("stackList", stackList);
	    session.setAttribute("intro", member.getIntro());
	    session.setAttribute("number", member.getNumber());
	    session.setAttribute("picture", member.getPicture());
	    session.setAttribute("path", member.getPath());

	    return "myPage/myInfoEdit";
	}

	// 프로필 정보 수정 처리
	@PostMapping("/editProfile")
	@ResponseBody
	public ResponseEntity<?> editProfile(MultipartFile upload, MyPageDTO editContent , HttpSession session) {

		Integer mNo = (Integer) session.getAttribute("no");

		 MyPageDTO member = new MyPageDTO();
		 System.out.println(editContent.getEmail());
		 System.out.println(editContent.getNickname());
//		 member.setHope(hope.toString());
//		 
//		 member.setHopeList(hope);
//		 System.out.println(hope.toString());
//		 member
//				 
//		
//		// 수정시 업로드된 파일이 있는지 여부, DB에 이미 저장된 파일이 있는지 여부에 따라 조건문
//        if(!upload.isEmpty()) {
//           // 업로드파일이 있고  DB에 이미 저장된 파일이 있을시
//
//           upload.uploadMethod(upload, colabo);
////                  System.out.println("둘다 비어있지않음 실행 ");
//        }else if(upload.isEmpty()){
//           // 업로드파일이 있고  DB에 저장된 파일이 없을시
//        	upload.uploadMethod(upload, colabo);
////                  System.out.println("업로드파일 있고  DB에 값은 비어있음 실행 ");
//        }
//        // 이제 업로드 파일이 있을땐 다 처리를하였지만 업로드파일이 없는데 DB엔 있을때는 
//        // mapper 에서 쿼리문을 작성할때  uploadPath 로 조건문을 돌린다. 이유는
//        // 파일이있을땐 이미 업로드되어있는 이름이 hidden 으로 서버쪾으로 넘어오기때문에
//        // 항상 들어있게되어서 업로드가 있는것처럼 쿼리문이 실행된다.
//        // 업로드파일이 없을땐  UploadFile클래스가 실행이 안되기때문에 uploadName 을 제외하고는 다 비어있다.
//        
//        int result = colaboService.projectEdit(colabo);
//        
//        if(result == 1 ) {
//           submitPage = "redirect:/colabo/colaboBasicPage";
//        }else {
//           submitPage = "error/errorPage";
//        }

		

//		// 프로필 정보 업데이트
//		boolean isUpdateSuccessful = mypageService.updateProfile(mNo, hope, stack, intro, nickname, email, number,
//				saveFileName, savePath);
//
//		if (isUpdateSuccessful) {
			return ResponseEntity.ok().body("수정이 완료되었습니다.");
//		} else {
//			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("수정에 실패하였습니다. 다시 시도해주세요.");
//		}
//	}
	}

	// project
	@GetMapping("/myproject.do")
	public String projectForm() {
		return "myPage/myProject";
	}

	// board
	@GetMapping("/myboard.do")
	public String boardForm(Model model, HttpSession session,
            @RequestParam(value = "infoPage", defaultValue = "1") int infoPage,
            @RequestParam(value = "freePage", defaultValue = "1") int freePage,
            @RequestParam(value = "pageSize", defaultValue = "5") int pageSize) {

	    session.setAttribute("infoPage", infoPage);
	    session.setAttribute("freePage", freePage);

	    infoPage = (Integer) session.getAttribute("infoPage");
	    freePage = (Integer) session.getAttribute("freePage");
	    
	    Integer mNo = (Integer) session.getAttribute("no");

	    // 총 게시글 수 조회
	    int totalInfoPosts = mypageService.allInfoBoardPostsNo(mNo);
	    int totalFreePosts = mypageService.allFreeBoardPostsNo(mNo);
	    

	 // 페이지 정보 생성
	    mypagePageInfo infoPageInfo = mypagePagination.getPageInfo(totalInfoPosts, infoPage, 5, pageSize);
	    mypagePageInfo freePageInfo = mypagePagination.getPageInfo(totalFreePosts, freePage, 5, pageSize);

	    // 정보 게시판 게시글 조회
	    List<InfoDTO> infoPosts = mypageService.fetchInfoBoardPosts(mNo, infoPage, pageSize);  
	    
	    // 자유 게시판 게시글 조회
	    List<FreeDTO> freePosts = mypageService.fetchFreeBoardPosts(mNo, freePage, pageSize);
	    
	    model.addAttribute("infoPageInfo", infoPageInfo);
	    model.addAttribute("freePageInfo", freePageInfo);
	    model.addAttribute("infoPosts", infoPosts);
	    model.addAttribute("freePosts", freePosts);

	    return "myPage/myBoard";
	}


	// comment
	@GetMapping("/mycomment.do")
	public String commentForm(HttpSession session, Model model) {

		Integer mNo = (Integer) session.getAttribute("no");

		List<InfoCommentDTO> infoComment = mypageService.fetchInfoCommentNo(mNo);
		List<FreeCommentDTO> freeComment = mypageService.fetchFreeCommentNo(mNo);

		model.addAttribute("infoComment", infoComment);
		model.addAttribute("freeComment", freeComment);

		System.out.println(mNo);
		logger.info("infoComment: {}", infoComment);
		logger.info("freeComment: {}", freeComment);

		return "myPage/myComment";
	}
	//BoardPush List
	@GetMapping("/boardPush.do")
	public String boardPush(Model model, HttpSession session) {
		// session에 no값 가져오기
		Integer mNo = (Integer)session.getAttribute("no");
		if(mNo != null) {
			// boardPush에 board_push_check있는 확인 컬럼 N에서 Y로 바꾸기
			int pushCheck = pushService.pushCheck(mNo);
			System.out.println("pushCheck"+pushCheck);
			if(pushCheck > 0) {
				// List 가져오기
				List<BoardPushDTO> pushList = pushService.pushList(mNo);
				for(BoardPushDTO push : pushList) {
					String indate = push.getPushIndate().substring(2,10);
					push.setPushIndate(indate);
				}
				model.addAttribute("pushList",pushList);
			}
		}else {
			return "redirect:/member/loginForm.do";
		}
		return "myPage/myBoardPush";
	}
	
	// mainForm
	@GetMapping("/mainForm.do")
	public String mainForm() {
		return "redirect:/member/mainForm.do";
	}

	// 문의사항
	@GetMapping("/inquiry.do")
	public String inquiry(Model model, HttpSession session) {
	    Integer mNo = (Integer) session.getAttribute("no");
	    List<AdminBoardDTO> inquiries = mypageService.getInquiries(mNo);
	    model.addAttribute("inquiries", inquiries);
	    return "myPage/myInquiry";
	}


	// 문의사항 등록 페이지
	@GetMapping("/inquiryRegistr.do")
	public String inquiryRegistr() {

		return "myPage/myInquiryRegistr";
	}

	// 문의 사항 등록
	@PostMapping("/inquirySubmitRegistr")
	public String inquirySubmitRegistration(@RequestParam("infoTitle") String infoTitle,
			@RequestParam("mainText") String infoContent, HttpSession session, Model model) {


			Integer mNo = (Integer) session.getAttribute("no");

			mypageService.registerInquiry(mNo, infoTitle, infoContent);


		return "redirect:/mypage/inquiry.do";
	}
	
	//문의사항 디테일 페이지 
	@GetMapping("/inquiryDtail/{no}")
	public String inquiryDtail(@PathVariable("no") int no, Model model, HttpServletRequest request) {
		
		// 조회수 증가
		mypageService.increaseViewCount(no);
		
		//정보 가져오기 
	    AdminBoardDTO inquiry = mypageService.inquiryDtail(no);
	    model.addAttribute("inquiry", inquiry);
		
		
		return "myPage/myInquiryDtail";
	}
	
}
