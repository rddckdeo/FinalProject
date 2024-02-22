package kr.co.coco.board.model.service;

import java.util.List;

import kr.co.coco.board.model.dto.DeclarationDTO;
import kr.co.coco.board.model.dto.FreeCommentDTO;
import kr.co.coco.board.model.dto.FreeDTO;

public interface FreeService {

    // 게시글 등록
    int enrollBoard(FreeDTO free);

    // 카테고리별 게시글 조회
    List<FreeDTO> getPostsByCategory(String categoryName);

    // 게시글 디테일 페이지 진입
    FreeDTO getPostById(int freeNo);

    // 댓글 목록 불러오기
    List<FreeCommentDTO> getCommentsByPostId(int freeNo);

    // 게시글 수정하기
    int updatePost(int freeNo, FreeDTO post);

    // 게시글 삭제하기
    int deletePost(int freeNo);

    // 조회수 증가
    int increaseViewCount(int freeNo);

    // 카테고리별 게시글 조회 (페이징 처리)
    List<FreeDTO> getPostsByCategory(String categoryName, int startIndex, int pageSize);

    // 카테고리별 게시글 수 조회
    int countPostsByCategory(String categoryName);

    // 전체 게시글 조회
    List<FreeDTO> getAllPosts(int startIndex, int pageSize);

    //검색 로직 
	List<FreeDTO> searchFreePosts(String query, int freePage, int pageSize);

	//게시글 신고하기 
	boolean report(DeclarationDTO declarationDto);

	//전체 게시글 수 조회 
	int countPosts();

}
