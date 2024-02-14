package kr.co.coco.mypage.model.service;

import java.util.List;

import kr.co.coco.board.model.dto.FreeDTO;
import kr.co.coco.board.model.dto.InfoDTO;
import kr.co.coco.mypage.model.dto.MyPageDTO;

public interface MyPageService {

	// 회원 정보 조회
	MyPageDTO findMemberByNo(Integer mNo);
	
	// 정보 게시판 게시글 조회
	List<InfoDTO> fetchInfoBoardPosts(Integer mNo, int page, int size);

	// 자유 게시판 게시글 조회
	List<FreeDTO> fetchFreeBoardPosts(Integer mNo, int page, int size);

//	정보 게시판 총 게시글 조회 
	int getTotalInfoBoardPosts(Integer mNo);

//	자유 게시판 총 게시글 조회 
	int getTotalFreeBoardPosts(Integer mNo);
	
	
	
}


