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

	// 댓글 저장
	public InfoCommentDTO save(InfoCommentDTO commentDTO) {
		sqlSession.insert("InfoCommentMapper.insertComment", commentDTO);
		return getCommentById(commentDTO.getInfoCommentNo());
	}
	
	//댓글 등록 시, info_comment_count 업데이트 
    public void increaseCommentCount(int infoNo) {
        sqlSession.update("InfoCommentMapper.increaseCommentCount", infoNo);
    }

	// 댓글 번호로 댓글 정보 가져오기
	public InfoCommentDTO getCommentById(int commentId) {
		return sqlSession.selectOne("InfoCommentMapper.getCommentById", commentId);
	}
	

	// 댓글 목록 불러오기
	public List<InfoCommentDTO> selectCommentsByPostId(int infoNo) {
		return sqlSession.selectList("InfoCommentMapper.selectCommentsByPostId", infoNo);
	}

	// 사용자 닉네임 불러오기
	public String getNickname(int mNo) {
		return sqlSession.selectOne("InfoCommentMapper.getNickname", mNo);
	}

	// 새로고침 없이 댓글 수 업데이트
	public int countComments(int infoNo) {
		return sqlSession.selectOne("InfoCommentMapper.countComments", infoNo);
	}

	// 댓글 삭제
	public int delete(Integer id) {
		return sqlSession.delete("InfoCommentMapper.deleteComment", id);
	}

	// 댓글 번호로 게시글 번호 가져오기
	public int getInfoNoFromComment(int infoCommentNo) {
		return sqlSession.selectOne("InfoCommentMapper.getInfoNoFromComment", infoCommentNo);
	}
	

 // 해당 게시글에 연결된 모든 댓글 삭제
    public void deleteByInfoNo(int infoNo) {
        sqlSession.delete("InfoCommentMapper.deleteByInfoNo", infoNo);
    }

 // 해당 게시글에 연결된 모든 댓글 삭제
    public void deleteCommentsByPostId(int infoNo) {
        sqlSession.delete("infoMapper.deleteByInfoNo", infoNo);
    }




}
