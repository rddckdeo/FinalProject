package kr.co.coco.board.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.coco.board.model.dto.InfoCommentDTO;

@Repository
public class InfoCommentDAO {

	private final SqlSession sqlSession;

	@Autowired
    public InfoCommentDAO(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }

	
    public InfoCommentDTO save(InfoCommentDTO commentDTO) {
        sqlSession.insert("infoMapper.insertComment", commentDTO);
        return commentDTO;
    }
    
 // 댓글 목록 불러오기
    public List<InfoCommentDTO> selectCommentsByPostId(String infoNo) {
        return sqlSession.selectList("infoMapper.selectCommentsByPostId", infoNo);
    }

    //사용자 닉네임 불러오기 
    public String getNickname(int mNo) {
        return sqlSession.selectOne("kr.co.coco.board.InfoCommentMapper.getNickname", mNo);
    }
}
