package kr.co.coco.board.model.service;

import kr.co.coco.board.model.dto.InfoCommentDTO;

public interface InfoCommentService {

	//정보 게시판 댓글 쓰기 
	InfoCommentDTO save(InfoCommentDTO commentDTO);



}
