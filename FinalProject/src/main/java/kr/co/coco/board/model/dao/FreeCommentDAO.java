package kr.co.coco.board.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.coco.board.model.dto.DeclarationDTO;
import kr.co.coco.board.model.dto.FreeCommentDTO;

@Repository
public class FreeCommentDAO {

    private final SqlSession sqlSession;

    @Autowired
    public FreeCommentDAO(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }

    // 댓글 저장
    public FreeCommentDTO save(FreeCommentDTO commentDTO) {
        sqlSession.insert("FreeCommentMapper.insertComment", commentDTO);
        return getCommentById(commentDTO.getFreeCommentNo());
    }

    // 댓글 번호로 댓글 정보 가져오기
    public FreeCommentDTO getCommentById(int commentId) {
        return sqlSession.selectOne("FreeCommentMapper.getCommentById", commentId);
    }

    // 댓글 목록 불러오기
    public List<FreeCommentDTO> selectCommentsByPostId(int freeNo) {
        return sqlSession.selectList("FreeCommentMapper.selectCommentsByPostId", freeNo);
    }

    // 사용자 닉네임 불러오기
    public String getNickname(int mNo) {
        return sqlSession.selectOne("FreeCommentMapper.getNickname", mNo);
    }

    // 새로고침 없이 댓글 수 업데이트
    public int countComments(int freeNo) {
        return sqlSession.selectOne("FreeCommentMapper.countComments", freeNo);
    }

    // 댓글 삭제
    public int delete(Integer id) {
        return sqlSession.delete("FreeCommentMapper.deleteComment", id);
    }

    // 댓글 번호로 게시글 번호 가져오기
    public int getFreeNoFromComment(int freeCommentNo) {
        return sqlSession.selectOne("FreeCommentMapper.getFreeNoFromComment", freeCommentNo);
    }

    // 댓글 등록 시, free_comment_count 업데이트
    public void increaseCommentCount(int freeNo) {
        sqlSession.update("FreeCommentMapper.increaseCommentCount", freeNo);
    }

    // 해당 게시글에 연결된 모든 댓글 삭제
    public void deleteByFreeNo(int freeNo) {
        sqlSession.delete("FreeCommentMapper.deleteByFreeNo", freeNo);
    }

    // 해당 게시글에 연결된 모든 댓글 삭제
    public void deleteCommentsByPostId(int freeNo) {
        sqlSession.delete("freeMapper.deleteByFreeNo", freeNo);
    }

  //댓글 수정 
	public void updateComment(int freeCommentNo, String commentContent) {
        Map<String, Object> params = new HashMap<>();
        params.put("freeCommentNo", freeCommentNo);
        params.put("commentContent", commentContent);
        sqlSession.update("freeCommentMapper.updateComment", params);
    }
		
    //댓글 신고하기 
	public boolean reportComment(DeclarationDTO declarationDto) {

		return false;
	}
	


}
