package kr.co.coco.mypage.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.coco.board.controller.BoardController;
import kr.co.coco.board.model.dto.FreeDTO;
import kr.co.coco.board.model.dto.InfoDTO;
import kr.co.coco.board.model.service.FreeServiceImpl;
import kr.co.coco.board.model.service.InfoServiceImpl;
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

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

//	Page 이동
	// profile
	@GetMapping("/mypage.do")
	public String profileForm(Model model, HttpSession session) {
		Integer mNo = (Integer) session.getAttribute("no");

		System.out.println("mNo : " + mNo);

		MyPageDTO member = mypageService.findMemberByNo(mNo);

		if (member == null) {
			System.out.println("member : null");
			model.addAttribute("error", true);
			return "myPage/myProfile";
		} else {
			System.out.println("no: " + member.getNo());
			System.out.println("name: " + member.getName());
			System.out.println("hope: " + member.getHope());
			System.out.println("stack: " + member.getStack());

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

		System.out.println("mNo : " + mNo);

		MyPageDTO member = mypageService.findMemberByNo(mNo);

		model.addAttribute("name", member.getName());
		model.addAttribute("id", member.getId());
		model.addAttribute("email", member.getEmail());
		model.addAttribute("nickname", member.getNickname());
		model.addAttribute("hope", member.getHope());
		model.addAttribute("stack", member.getStack());
		model.addAttribute("intro", member.getIntro());
		model.addAttribute("number", member.getNumber());

		return "myPage/myInfo";
	}

	// project
	@GetMapping("/myproject.do")
	public String projectForm() {
		return "myPage/myProject";
	}

	// board
	@GetMapping("/myboard.do")
	public String boardForm(@RequestParam(defaultValue = "0") int infoPage,
	                        @RequestParam(defaultValue = "0") int freePage,
	                        @RequestParam(defaultValue = "5") int pageSize,
	                        Model model, HttpSession session) {

	    Integer mNo = (Integer) session.getAttribute("no");

	    // 정보 게시판 게시글 조회
	    List<InfoDTO> infoPosts = mypageService.fetchInfoBoardPosts(mNo, infoPage, pageSize);

	    // 자유 게시판 게시글 조회
	    List<FreeDTO> freePosts = mypageService.fetchFreeBoardPosts(mNo, freePage, pageSize);

	    // 총 게시글 수 조회
	    int totalInfoPosts = mypageService.getTotalInfoBoardPosts(mNo);
	    int totalFreePosts = mypageService.getTotalFreeBoardPosts(mNo);

	    // 총 페이지 수 계산
	    int totalInfoPages = (int) Math.ceil((double) totalInfoPosts / pageSize);
	    int totalFreePages = (int) Math.ceil((double) totalFreePosts / pageSize);

	    model.addAttribute("infoPage", infoPage);
	    model.addAttribute("freePage", freePage);
	    model.addAttribute("pageSize", pageSize);
	    model.addAttribute("totalInfoPages", totalInfoPages);
	    model.addAttribute("totalFreePages", totalFreePages);
	    model.addAttribute("infoPosts", infoPosts);
	    model.addAttribute("freePosts", freePosts);
	    model.addAttribute("totalInfoPosts", totalInfoPosts);
	    model.addAttribute("totalFreePosts", totalFreePosts);

	    System.out.println("Current Info Page: " + infoPage);
	    System.out.println("Current Free Page: " + freePage);
	    System.out.println("Total Info Pages: " + totalInfoPages);
	    System.out.println("Total Free Pages: " + totalFreePages);
	    System.out.println("totalInfoPosts: " + totalInfoPosts);
	    System.out.println("totalFreePosts: " + totalFreePosts);

	    logger.info("infoPosts: {}", infoPosts);
	    logger.info("freePosts: {}", freePosts);

	    return "myPage/myBoard";
	}





	// comment
	@GetMapping("/mycomment.do")
	public String commentForm() {
		return "myPage/myComment";
	}

	// mainForm
	@GetMapping("/mainForm.do")
	public String mainForm() {
		return "redirect:/member/mainForm.do";
	}
}
