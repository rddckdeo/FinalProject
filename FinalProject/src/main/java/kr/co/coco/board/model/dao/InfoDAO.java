package kr.co.coco.board.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.coco.board.model.dto.InfoDTO;
import oracle.jdbc.proxy.annotation.Post;

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
	public InfoDTO getPostById(String infoNo) {
	    return sqlSession.selectOne("infoMapper.getPostById", infoNo);
	}

	//게시글 수정하기
	public int updatePost(InfoDTO post) {
	    return sqlSession.update("infoMapper.updatePost", post);
	}

	//게시글 삭제하기
	public int deletePost(int infoNo) {
	    return sqlSession.delete("infoMapper.deletePost", infoNo);
	}

	//조회수 증가 
	public int increaseViewCount(int infoNo) {
        return sqlSession.update("infoMapper.increaseViewCount", infoNo);
    }
	


}
