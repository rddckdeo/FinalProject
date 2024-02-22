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

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.coco.board.controller.BoardController;
import kr.co.coco.board.model.dto.FreeCommentDTO;
import kr.co.coco.board.model.dto.FreeDTO;
import kr.co.coco.board.model.dto.InfoCommentDTO;
import kr.co.coco.board.model.dto.InfoDTO;
import kr.co.coco.board.model.service.FreeServiceImpl;
import kr.co.coco.board.model.service.InfoServiceImpl;
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
	private ColaboServiceImpl colaboService;

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

//	Page 이동
	// profile
	@GetMapping("/mypage.do")
	public String profileForm(Model model, HttpSession session) {
		Integer mNo = (Integer) session.getAttribute("no");

//		System.out.println("mNo : " + mNo);

		MyPageDTO member = mypageService.findMemberByNo(mNo);

		if (member == null) {
//			System.out.println("member : null");
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

	    List<String> hopeList = Arrays.asList(member.getHope().split(","));
	    List<String> stackList = Arrays.asList(member.getStack().split(","));

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
	    
	    List<String> hopeList = Arrays.asList(member.getHope().split(","));
	    List<String> stackList = Arrays.asList(member.getStack().split(","));
	    
		model.addAttribute("name", member.getName());
		model.addAttribute("id", member.getId());
		model.addAttribute("email", member.getEmail());
		model.addAttribute("nickname", member.getNickname());
	    model.addAttribute("hopeList", hopeList);
	    model.addAttribute("stackList", stackList);
		model.addAttribute("intro", member.getIntro());
		model.addAttribute("number", member.getNumber());
		
		return "myPage/myInfoEdit";
	}
	
	// 프로필 정보 수정 처리
	@PostMapping("/editProfile")
	public ResponseEntity<?> editProfile(@RequestParam("imageFile") MultipartFile imageFile,
	                                     @RequestParam String[] hope,
	                                     @RequestParam String[] stack,
	                                     @RequestParam String intro,
	                                     @RequestParam String nickname,
	                                     @RequestParam String email,
	                                     @RequestParam String number,
	                                     HttpSession session) {
	    Integer mNo = (Integer) session.getAttribute("no");

	    // 이미지 파일 처리
	    String savePath = null;
	    String saveFileName = null;
	    
	    if(!imageFile.isEmpty()) {
	        String originName = imageFile.getOriginalFilename();
	        String extension = originName.substring(originName.lastIndexOf(".")); 

	        // 현재 시간과 랜덤 문자열을 사용하여 새로운 파일 이름을 생성
	        LocalDateTime nowDate = LocalDateTime.now();
	        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyMMddHHmmss");
	        String output = nowDate.format(formatter);

	        int length = 8;		
	        String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz!@#$%^&";  
	        Random random = new Random();
	        String randomString = random.ints(length, 0, characters.length())
	                                .mapToObj(characters::charAt)
	                                .map(Object::toString)
	                                .collect(Collectors.joining());

	        saveFileName = output + "_" + randomString + extension;
	        savePath = "/Users/kangnayoung/git/FinalProject/FinalProject/src/main/webapp/resources/uploads/member/";  

	        // 서버에 파일 저장
	        Path path = Paths.get(savePath + saveFileName);
	        try {
	            imageFile.transferTo(path.toFile());
	        } catch (IOException e) {
	            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("파일 저장에 실패하였습니다. 다시 시도해주세요.");
	        }
	    }

	    // 프로필 정보 업데이트
	    boolean isUpdateSuccessful = mypageService.updateProfile(mNo, hope, stack, intro, nickname, email, number, saveFileName, savePath);

	    // 수정 후 프로필 페이지로 AJAX 응답
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
	public String boardForm(@RequestParam(defaultValue = "1") int infoPage,
	                        @RequestParam(defaultValue = "1") int freePage,
	                        @RequestParam(defaultValue = "5") int pageSize,
	                        Model model, HttpSession session) {

	    Integer mNo = (Integer) session.getAttribute("no");

	    // 정보 게시판 게시글 조회
	    List<InfoDTO> infoPosts = mypageService.fetchInfoBoardPosts(mNo, infoPage, pageSize);

	    // 자유 게시판 게시글 조회
	    List<FreeDTO> freePosts = mypageService.fetchFreeBoardPosts(mNo, freePage, pageSize);

	    // 총 게시글 수 조회
	    int totalInfoPosts = mypageService.allInfoBoardPostsNo(mNo);
	    int totalFreePosts = mypageService.allFreeBoardPostsNo(mNo);

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
}
