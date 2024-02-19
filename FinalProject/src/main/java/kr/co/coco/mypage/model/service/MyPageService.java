package kr.co.coco.mypage.model.service;

import java.util.List;

import kr.co.coco.admin.model.dto.AdminBoardDTO;
import kr.co.coco.board.model.dto.FreeCommentDTO;
import kr.co.coco.board.model.dto.FreeDTO;
import kr.co.coco.board.model.dto.InfoCommentDTO;
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
	int allInfoBoardPostsNo(Integer mNo);

	//	자유 게시판 총 게시글 조회 
	int allFreeBoardPostsNo(Integer mNo);

	//정보게시판 댓글 가져오기 
	List<InfoCommentDTO> fetchInfoCommentNo(Integer mNo);

	//자유게시판 댓글 가져오기 
	List<FreeCommentDTO> fetchFreeCommentNo(Integer mNo);

	// 프로필 수정 
	boolean updateProfile(Integer mNo, String[] hope, String[] stack, String intro, String nickname, String email,
			String number, String saveFileName, String savePath);

	//문의사항 등록 
	void registerInquiry(Integer mNo, String infoTitle, String infoContent);

	//문의사항 진입 
	List<AdminBoardDTO> getInquiries(Integer mNo);
	
	
	
}


