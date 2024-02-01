package kr.co.coco.board.model.service;

import java.util.List;

import kr.co.coco.board.model.dto.InfoCommentDTO;
import kr.co.coco.board.model.dto.InfoDTO;

public interface InfoService {
	
		// 게시글 등록
		int enrollBoard(InfoDTO info);

		//카테고리 게시글 조회 
		List<InfoDTO> getPostsByCategory(String categoryName);
	
		//게시글 디테일 페이지 진입
		InfoDTO getPostById(String infoNo);
		
		//댓글 목록 불러오기 
		List<InfoCommentDTO> getCommentsByPostId(String infoNo);
		
		//게시글 수정하기
		int updatePost(int infoNo, InfoDTO post);

		//게시글 삭제하기
		int deletePost(int infoNo);

		//카운트 증가
		int increaseViewCount(int infoNo);
}
