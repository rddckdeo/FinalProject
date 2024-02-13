package kr.co.coco.board.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.coco.board.model.dto.FreeDTO;
import kr.co.coco.board.model.dto.InfoDTO;

@Repository
public class FreeDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	// 게시글 등록
	public int enrollBoard(FreeDTO free) {
		return sqlSession.insert("freeMapper.enrollBoard", free);
	}

	// 카테고리 목록 조회
	public List<FreeDTO> selectPostsByCategory(String categoryName) {
		return sqlSession.selectList("freeMapper.selectPostsByCategory", categoryName);
	}

	// 검색결과 게시물 조회
	public List<FreeDTO> searchPosts(String query, int startIndex, int endIndex) {
		Map<String, Object> params = new HashMap<>();
		params.put("query", query);
		params.put("startIndex", startIndex);
		params.put("endIndex", endIndex);
		return sqlSession.selectList("freeMapper.searchPosts", params);
	}

	// 전체 게시글 조회(검색)
	public int searchCountPosts(String query) {
		 return sqlSession.selectOne("freeMapper.searchCountPosts", query);
	}

	// 게시글 상세 조회
	public FreeDTO getPostById(int freeNo) {
		return sqlSession.selectOne("freeMapper.getPostById", freeNo);
	}

	// 게시글 수정하기
	public int updatePost(FreeDTO post) {
		return sqlSession.update("freeMapper.updatePost", post);
	}

	// 게시글 삭제하기
	public int deletePost(int freeNo) {
		return sqlSession.delete("freeMapper.deletePost", freeNo);
	}

	// 조회수 증가
	public int increaseViews(int freeNo) {
		return sqlSession.update("freeMapper.increaseViews", freeNo);
	}

	// 카테고리별 게시글 조회 (페이징 처리)
	public List<FreeDTO> getPostsByCategory(String categoryName, int startIndex, int pageSize) {
		Map<String, Object> params = new HashMap<>();
		params.put("categoryName", categoryName);
		params.put("startIndex", startIndex);
		params.put("pageSize", pageSize);
		return sqlSession.selectList("freeMapper.getPostsByCategory", params);
	}

	// 카테고리별 게시글 수 조회
	public int countPostsByCategory(String categoryName) {
		return sqlSession.selectOne("freeMapper.countPostsByCategory", categoryName);
	}

	// 전체 게시글 조회
	public List<FreeDTO> getAllPosts(int startIndex, int pageSize) {
		Map<String, Object> params = new HashMap<>();
		params.put("startIndex", startIndex);
		params.put("pageSize", pageSize);
		return sqlSession.selectList("freeMapper.getAllPosts", params);
	}

	// 카테고리별 조회수 기준 정렬
	public List<FreeDTO> selectPostsOrderByDate(String categoryName, int startIndex, int pageSize) {
		Map<String, Object> params = new HashMap<>();
		params.put("categoryName", categoryName);
		params.put("startIndex", startIndex);
		params.put("pageSize", pageSize);

		return sqlSession.selectList("freeMapper.selectPostsOrderByDate", params);
	}

	public List<FreeDTO> selectPostsOrderByComments(String categoryName, int startIndex, int pageSize) {
		Map<String, Object> params = new HashMap<>();
		params.put("categoryName", categoryName);
		params.put("startIndex", startIndex);
		params.put("pageSize", pageSize);

		return sqlSession.selectList("freeMapper.selectPostsOrderByComments", params);
	}

	public List<FreeDTO> selectPostsOrderByViews(String categoryName, int startIndex, int pageSize) {
		Map<String, Object> params = new HashMap<>();
		params.put("categoryName", categoryName);
		params.put("startIndex", startIndex);
		params.put("pageSize", pageSize);

		return sqlSession.selectList("freeMapper.selectPostsOrderByViews", params);
	}

}
