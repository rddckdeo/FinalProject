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
import kr.co.coco.mypage.model.dto.MyPageDTO;
import kr.co.coco.mypage.model.service.MyPageServiceImpl;

@Controller
@RequestMapping("/mypage")
public class MyPageController {

	@Autowired
	private MyPageServiceImpl mypageService;

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

	    return "myPage/myInfoEdit";
	}

	// 프로필 정보 수정 처리
	@PostMapping("/editProfile")
	public ResponseEntity<?> editProfile(MultipartFile imageFile, @RequestParam String[] hope,
			@RequestParam String[] stack, @RequestParam String intro, @RequestParam String nickname,
			@RequestParam String email, @RequestParam String number, HttpSession session) {

		Integer mNo = (Integer) session.getAttribute("no");

		// 기존 이미지 정보 가져오기
		MyPageDTO member = mypageService.findMemberByNo(mNo);
		String saveFileName = member.getImageFileName();
		String savePath = member.getImageFilePath();
		
	    System.out.println("Initial saveFileName: " + saveFileName);  // 초기 saveFileName 출력
	    System.out.println("Initial savePath: " + savePath);  // 초기 savePath 출력

		if (!imageFile.isEmpty()) {
			String originName = imageFile.getOriginalFilename();
			String extension = originName.substring(originName.lastIndexOf("."));

			// 현재 시간과 랜덤 문자열을 사용하여 새로운 파일 이름을 생성
			LocalDateTime nowDate = LocalDateTime.now();
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyMMddHHmmss");
			String output = nowDate.format(formatter);

			int length = 8;
			String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
			Random random = new Random();
			String randomString = random.ints(length, 0, characters.length()).mapToObj(characters::charAt)
					.map(Object::toString).collect(Collectors.joining());

			saveFileName = output + "_" + randomString + extension;
			savePath = "/Users/kangnayoung/git/FinalProject/FinalProject/src/main/webapp/resources/uploads/member/";

	        System.out.println("Final saveFileName: " + saveFileName);  // 최종 saveFileName 출력
	        System.out.println("Final savePath: " + savePath);  // 최종 savePath 출력
	        
			Path path = Paths.get(savePath + saveFileName);

			try {
				// 서버에 파일 저장
				imageFile.transferTo(path.toFile());
			} catch (IOException e) {
				 System.out.println("File save error: " + e.getMessage());  // 파일 저장 오류 메시지 출력
				return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("파일 저장에 실패하였습니다. 다시 시도해주세요.");
			}
		}

		// 프로필 정보 업데이트
		boolean isUpdateSuccessful = mypageService.updateProfile(mNo, hope, stack, intro, nickname, email, number,
				saveFileName, savePath);

		if (isUpdateSuccessful) {
			return ResponseEntity.ok().body("수정이 완료되었습니다.");
		} else {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("수정에 실패하였습니다. 다시 시도해주세요.");
		}
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
