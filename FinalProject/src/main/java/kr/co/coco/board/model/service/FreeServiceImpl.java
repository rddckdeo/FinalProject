package kr.co.coco.board.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.coco.board.model.dao.FreeCommentDAO; // InfoCommentDAO 대신 FreeCommentDAO로 수정
import kr.co.coco.board.model.dao.FreeDAO; // InfoDAO 대신 FreeDAO로 수정
import kr.co.coco.board.model.dto.FreeCommentDTO; // InfoCommentDTO 대신 FreeCommentDTO로 수정
import kr.co.coco.board.model.dto.FreeDTO; // InfoDTO 대신 FreeDTO로 수정

@Service
public class FreeServiceImpl implements FreeService {

    @Autowired
    private FreeDAO freeDao;

    @Autowired
    private FreeCommentDAO freeCommentDAO;

    // 게시글 등록
    @Override
    public int enrollBoard(FreeDTO free) {
        return freeDao.enrollBoard(free);
    }

    // 카테고리 목록 불러오기
    @Override
    public List<FreeDTO> getPostsByCategory(String categoryName) {
        return freeDao.selectPostsByCategory(categoryName);
    }

    // 카테고리별 게시글 조회 (페이징 처리)
    @Override
    public List<FreeDTO> getPostsByCategory(String categoryName, int startIndex, int pageSize) {
        return freeDao.getPostsByCategory(categoryName, startIndex, pageSize);
    }

    // 카테고리별 게시글 수 조회
    @Override
    public int countPostsByCategory(String categoryName) {
        return freeDao.countPostsByCategory(categoryName);
    }

    // 게시글 디테일 페이지 진입
    @Override
    public FreeDTO getPostById(int freeNo) {
        return freeDao.getPostById(freeNo);
    }

    // 댓글 목록 불러오기
    @Override
    public List<FreeCommentDTO> getCommentsByPostId(int freeNo) {
        return freeCommentDAO.selectCommentsByPostId(freeNo);
    }

    // 게시글 수정하기
    @Override
    public int updatePost(int freeNo, FreeDTO post) {
        return freeDao.updatePost(post);
    }

    // 게시글 삭제하기
    @Override
    public int deletePost(int freeNo) {
        return freeDao.deletePost(freeNo);
    }

    // 조회수 증가
    @Override
    public int increaseViewCount(int freeNo) {
        return freeDao.increaseViews(freeNo);
    }

    // 전체 게시글 조회
    @Override
    public List<FreeDTO> getAllPosts(int startIndex, int pageSize) {
        return freeDao.getAllPosts(startIndex, pageSize);
    }

    // 검색 로직
    @Override
    public List<FreeDTO> searchFreePosts(String query, int freePage, int pageSize) {
	    int startIndex = (freePage - 1) * pageSize;
	    int endIndex = startIndex + pageSize;
        return freeDao.searchPosts(query, startIndex, endIndex);
    }
    
  //전체 게시글 조회(검색)
	public int searchCountFreePosts(String query) {
		return freeDao.searchCountPosts(query);
	}

    // 카테고리 게시글 조회(정렬)
    public List<FreeDTO> getPostsByCategory(String categoryName, String sortType, int startIndex, int pageSize) {
        List<FreeDTO> posts;

        System.out.println("Start index: " + startIndex);
        System.out.println("Page size: " + pageSize);

        switch (sortType) {
            case "date":
                posts = freeDao.selectPostsOrderByDate(categoryName, startIndex, pageSize);
                break;
            case "comments":
                posts = freeDao.selectPostsOrderByComments(categoryName, startIndex, pageSize);
                break;
            case "views":
                posts = freeDao.selectPostsOrderByViews(categoryName, startIndex, pageSize);
                break;
            default:
                posts = freeDao.selectPostsOrderByDate(categoryName, startIndex, pageSize);
                break;
        }

        System.out.println("Returned posts: " + posts.size());

        return posts;
    }



}
