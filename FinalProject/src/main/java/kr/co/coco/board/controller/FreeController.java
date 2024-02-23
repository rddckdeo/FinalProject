package kr.co.coco.board.controller;

import java.io.IOException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.coco.board.model.dto.FreeCommentDTO;  
import kr.co.coco.board.model.dto.FreeDTO;  
import kr.co.coco.board.model.service.FreeCommentServiceImpl; 
import kr.co.coco.board.model.service.FreeServiceImpl;  

@Controller
@RequestMapping("/free")  
public class FreeController {

    @Autowired
    private FreeServiceImpl freeService;

    @Autowired
    private FreeCommentServiceImpl freeCommentService;

    // 자유게시판 메인 진입

    // 카테고리 목록 조회
    @GetMapping("/category")
    public String freeCategoryBoard(@RequestParam(value = "name", required = false) String categoryName,
            @RequestParam(value = "sortType", required = false, defaultValue = "date") String sortType,
            @RequestParam(value = "page", defaultValue = "1") int currentPage,
            @RequestParam(value = "size", defaultValue = "5") int pageSize, Model model) {

        // 게시글 총 개수
        int totalPosts = freeService.countPostsByCategory(categoryName);

        // 전체 페이지 수
        int totalPages = (int) Math.ceil((double) totalPosts / pageSize);

        // 시작 게시글 인덱스
        int startIndex = (currentPage - 1) * pageSize;

        // 페이지에 표시할 게시글 조회
        List<FreeDTO> posts = freeService.getPostsByCategory(categoryName, sortType, startIndex, pageSize);

        model.addAttribute("posts", posts);
        model.addAttribute("totalPosts", totalPosts);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("currentPage", currentPage);
        model.addAttribute("categoryName", categoryName);
        model.addAttribute("sortType", sortType);

//        System.out.println("Model attributes:");
//        Map<String, Object> modelMap = model.asMap();
//        System.out.println("posts: " + modelMap.get("posts"));
//        System.out.println("totalPosts: " + modelMap.get("totalPosts"));
//        System.out.println("totalPages: " + modelMap.get("totalPages"));
//        System.out.println("currentPage: " + modelMap.get("currentPage"));
//        System.out.println("categoryName: " + modelMap.get("categoryName"));
//        System.out.println("sortType: " + modelMap.get("sortType"));

        return "board/free/freeBoard";  
    }

    // 게시글 디테일 페이지 진입
    @GetMapping("/freeDtail/{freeNo}")  
    public String freeDtailBoard(@PathVariable("freeNo") int freeNo, Model model, HttpServletRequest request) {
        // 조회수 증가
        freeService.increaseViewCount(freeNo);

        // 게시글 정보 가져오기
        FreeDTO post = freeService.getPostById(freeNo);
        model.addAttribute("post", post);

        // 댓글 가져오기
        List<FreeCommentDTO> comments = freeService.getCommentsByPostId(freeNo);
        model.addAttribute("comments", comments);

        // 세션 가져오기
        HttpSession session = request.getSession();

        // 세션에서 사용자 번호 가져오기
        Integer no = (Integer) session.getAttribute("no");

        return "board/free/freeBoardDtail";  
    }

    // 게시글 정보 가져오기
    @GetMapping("/getPostById/{freeNo}") 
    public ResponseEntity<FreeDTO> getPostById(@PathVariable("freeNo") String freeNo) {
        int freeNoInt = Integer.parseInt(freeNo);
        FreeDTO post = freeService.getPostById(freeNoInt);
        return new ResponseEntity<>(post, HttpStatus.OK);
    }

    // 작성 페이지 진입
    @GetMapping("/registr")
    public String freeRegistrBoard() {
        return "board/free/freeRegistr"; 
    }

    // 게시글 등록
    @PostMapping("/SubmitRegistr")
    public String freeEnroll(FreeDTO free, HttpSession session) throws IllegalStateException, IOException {
        Integer mNo = (Integer) session.getAttribute("no");
        free.setMNo(mNo);
        
        freeService.enrollBoard(free);
        return "redirect:/free/category?name=" + free.getFreeCategory() + "&page=1";  
    }

    // 수정페이지 진입
    @GetMapping("/edit/{freeNo}")  
    public String freeEditBoard(@PathVariable("freeNo") int freeNo, Model model) {
        FreeDTO post = freeService.getPostById(freeNo);

        String category = post.getFreeCategory();
        List<String> tags = Arrays.asList(post.getFreeTag1(), post.getFreeTag2(), post.getFreeTag3());

        model.addAttribute("post", post);
        model.addAttribute("category", category);
        model.addAttribute("tags", tags);

        return "board/free/freeBoardEdit"; 
    }

    // 게시글 수정
    @PostMapping("/updatePost")
    public String updatePost(FreeDTO post, HttpSession session, RedirectAttributes redirectAttributes)
            throws IllegalStateException, IOException {
        Integer mNo = (Integer) session.getAttribute("no");
        post.setMNo(mNo);

        int result = freeService.updatePost(post.getFreeNo(), post);
        if (result == 1) {
            redirectAttributes.addFlashAttribute("message", "수정 완료 되었습니다.");
            return "redirect:/free/freeDtail/" + post.getFreeNo();  
        } else {
            redirectAttributes.addFlashAttribute("message", "수정 실패 되었습니다.");
            return "redirect:/free/edit/" + post.getFreeNo(); 
        }
    }

    // 게시글 삭제
    @PostMapping("/deletePost")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> deletePost(@RequestParam("freeNo") int freeNo) {
        Map<String, Object> response = new HashMap<>();

        // 해당 게시글에 연결된 모든 댓글 삭제
        freeCommentService.deleteCommentsByPostId(freeNo);

        // 게시글 삭제
        int result = freeService.deletePost(freeNo);

        if (result == 1) {
            response.put("message", "게시글이 성공적으로 삭제되었습니다.");
            response.put("success", true);
            response.put("redirectUrl", "/free/category"); 
        } else {
            response.put("message", "게시글 삭제에 실패하였습니다.");
            response.put("success", false);
            response.put("redirectUrl", "/free/freeDtail/" + freeNo);  
        }

        return ResponseEntity.ok(response);
    }



}
