package kr.co.coco.board.model.service;

import java.util.List;

import kr.co.coco.board.model.dto.DeclarationDTO;
import kr.co.coco.board.model.dto.InfoCommentDTO;
import kr.co.coco.board.model.dto.InfoDTO;

public interface InfoService {

	// 게시글 등록
	int enrollBoard(InfoDTO info);

	// 카테고리 게시글 조회
	List<InfoDTO> getPostsByCategory(String categoryName);

	// 게시글 디테일 페이지 진입
	InfoDTO getPostById(int infoNo);

	// 댓글 목록 불러오기
	List<InfoCommentDTO> getCommentsByPostId(int infoNo);

	// 게시글 수정하기
	int updatePost(int infoNo, InfoDTO post);

	// 게시글 삭제하기
	int deletePost(int infoNo);

	// 조회수 증가
	int increaseViewCount(int infoNo);

	// 카테고리별 게시글 조회 (페이징 처리)
	List<InfoDTO> getPostsByCategory(String categoryName, int startIndex, int pageSize);

	// 카테고리별 게시글 수 조회
	int countPostsByCategory(String categoryName);

	// 전체 게시글 조회
	List<InfoDTO> getAllPosts(int startIndex, int pageSize);

	// 검색 로직
	List<InfoDTO> searchInfoPosts(String query, int infoPage, int pageSize);

	// 신고하기
	boolean report(DeclarationDTO declarationDto);

	//전체 게시글 수 
	int countPosts();

}
