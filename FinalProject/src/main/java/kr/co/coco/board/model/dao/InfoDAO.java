package kr.co.coco.board.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.coco.board.model.dto.InfoDTO;

@Repository
public class InfoDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	// 게시글 등록
	public int enrollBoard(InfoDTO info) {
		return sqlSession.insert("infoMapper.enrollBoard", info);
	}

	// 카테고리 목록 조회
	public List<InfoDTO> selectPostsByCategory(String categoryName) {
		return sqlSession.selectList("infoMapper.selectPostsByCategory", categoryName);
	}

	// 게시글 상세 조회
	public InfoDTO getPostById(int infoNo) {
		return sqlSession.selectOne("infoMapper.getPostById", infoNo);
	}

	// 게시글 수정하기
	public int updatePost(InfoDTO post) {
		return sqlSession.update("infoMapper.updatePost", post);
	}

	// 게시글 삭제하기
	public int deletePost(int infoNo) {
		return sqlSession.delete("infoMapper.deletePost", infoNo);
	}

	// 조회수 증가
	public int increaseViews(int infoNo) {
		return sqlSession.update("infoMapper.increaseViews", infoNo);
	}

	// 카테고리별 게시글 조회 (페이징 처리)
	public List<InfoDTO> getPostsByCategory(String categoryName, int startIndex, int pageSize) {
		Map<String, Object> params = new HashMap<>();
		params.put("categoryName", categoryName);
		params.put("startIndex", startIndex);
		params.put("pageSize", pageSize);
		return sqlSession.selectList("infoMapper.getPostsByCategory", params);
	}

	// 카테고리별 게시글 수 조회
	public int countPostsByCategory(String categoryName) {
		return sqlSession.selectOne("infoMapper.countPostsByCategory", categoryName);
	}

	// 검색결과 게시물 조회
	public List<InfoDTO> searchPosts(String query, int startIndex, int endIndex) {
	    Map<String, Object> params = new HashMap<>();
	    params.put("query", query);
	    params.put("startIndex", startIndex);
	    params.put("endIndex", endIndex);
	    return sqlSession.selectList("infoMapper.searchPosts", params);
	}

	//전체 게시글 조회(검색)
	public int searchCountPosts(String query) {
		System.out.println("sqlSession: " + sqlSession);
		 System.out.println("Query: " + query); 
		 return sqlSession.selectOne("infoMapper.searchCountPosts", query);
	}

	// 전체 게시글 조회
	public List<InfoDTO> getAllPosts(int startIndex, int pageSize) {
		Map<String, Object> params = new HashMap<>();
		params.put("startIndex", startIndex);
		params.put("pageSize", pageSize);
		return sqlSession.selectList("infoMapper.getAllPosts", params);
	}

	
	//카테고리 조회 
	public List<InfoDTO> selectPostsOrderByDate(String categoryName, int startIndex, int pageSize) {
	    Map<String, Object> params = new HashMap<>();
	    params.put("categoryName", categoryName);
	    params.put("startIndex", startIndex);
	    params.put("pageSize", pageSize);

	    return sqlSession.selectList("infoMapper.selectPostsOrderByDate", params);
	}

	public List<InfoDTO> selectPostsOrderByComments(String categoryName, int startIndex, int pageSize) {
	    Map<String, Object> params = new HashMap<>();
	    params.put("categoryName", categoryName);
	    params.put("startIndex", startIndex);
	    params.put("pageSize", pageSize);

	    return sqlSession.selectList("infoMapper.selectPostsOrderByComments", params);
	}

	public List<InfoDTO> selectPostsOrderByViews(String categoryName, int startIndex, int pageSize) {
	    Map<String, Object> params = new HashMap<>();
	    params.put("categoryName", categoryName);
	    params.put("startIndex", startIndex);
	    params.put("pageSize", pageSize);

	    return sqlSession.selectList("infoMapper.selectPostsOrderByViews", params);
	}





}
