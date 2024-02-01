package kr.co.coco.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.coco.board.model.dto.InfoCommentDTO;
import kr.co.coco.board.model.service.InfoCommentService;

@Controller
@RequestMapping("/comment")
public class CommentController {

	@Autowired
	private InfoCommentService infoCommentService;

	// 댓글 등록
	@PostMapping("/SubmitRegistr")
	@ResponseBody
	public InfoCommentDTO registerComment(@RequestBody InfoCommentDTO commentDTO) {
		 System.out.println("infoCommentContent: " + commentDTO.getInfoCommentContent());
		    System.out.println("infoNo: " + commentDTO.getInfoNo());
		    System.out.println("mNo: " + commentDTO.getMNo());
		    System.out.println("nickname: " + commentDTO.getNickname());

	    // 데이터를 저장
	    InfoCommentDTO savedComment = infoCommentService.save(commentDTO);

	    return savedComment;
	}
}
