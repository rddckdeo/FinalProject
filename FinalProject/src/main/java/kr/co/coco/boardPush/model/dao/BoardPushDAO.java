package kr.co.coco.boardPush.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.co.coco.boardPush.model.dto.BoardPushDTO;

@Repository
public class BoardPushDAO {
	public int pushListCount(SqlSessionTemplate sqlSession, int mNo) {
		return sqlSession.selectOne("boardPush.pushListCount", mNo);
	}
	
	public List<BoardPushDTO> pushList(SqlSessionTemplate sqlSession, int mNo){
		return sqlSession.selectList("boardPush.pushList",mNo);
	}
	public int pushCheck(SqlSessionTemplate sqlSession, int mNo) {
		return sqlSession.update("boardPush.pushCheck",mNo);
	}
	public int pushNoneViewCount(SqlSessionTemplate sqlSession, int no) {
		return sqlSession.selectOne("boardPush.pushNoneViewCount", no);
	}
//	 ---------board Push Enroll---------------
	public int adminBoardPushEnroll(SqlSessionTemplate sqlSession, Map<String, Object>param) {
		return sqlSession.update("boardPush.adminBoardPushEnroll",param);
	}
//	 ---------declaration List---------------
	public List<BoardPushDTO> declarationList(SqlSessionTemplate sqlSession ,int no){ // no = declaration No
		return sqlSession.selectList("boardPush.declarationList",no);
	}
//	---------get board title ---------
	// info
	public String getBoardTitleInfo(SqlSessionTemplate sqlSession, Map<String, Object> param) {
		return sqlSession.selectOne("boardPush.getBoardTitleInfo",param);
	}
	// free
	public String getBoardTitleFree(SqlSessionTemplate sqlSession, Map<String, Object> param) {
		return sqlSession.selectOne("boardPush.getBoardTitleFree", param);
	}
	// board Push Blind Enroll
	public int boardPushBlind(SqlSessionTemplate sqlSession, Map<String, Object> param) {
		return sqlSession.insert("boardPush.boardPushBlind", param);
		
	}
//	--------- (Comment)Info Board 정보 가져오기 ---------------
	public List<BoardPushDTO> getInfoList(SqlSessionTemplate sqlSession, int mNo){
		return sqlSession.selectList("boardPush.getInfoList",mNo);
	}
	// info board no를 통해 info board의 작성자 no를 가져오기
	public int getPushInfoNo(SqlSessionTemplate sqlSession, int infoBoardNo) {
		return sqlSession.selectOne("boardPush.getPushInfoNo",infoBoardNo);
	}
	// info push Enroll
	public int infoPushEnroll(SqlSessionTemplate sqlSession, Map<String, Object> param) {
		return sqlSession.insert("boardPush.infoPushEnroll",param);
	}
//	--------- (Comment)Free Board 정보 가져오기 ---------------
	public List<BoardPushDTO> getFreeList(SqlSessionTemplate sqlSession, int mNo){
		return sqlSession.selectList("boardPush.getFreeList",mNo);
	}
	// info board no를 통해 info board의 작성자 no를 가져오기
	public int getPushFreeNo(SqlSessionTemplate sqlSession, int freeBoardNo) {
		return sqlSession.selectOne("boardPush.getPushFreeNo",freeBoardNo);
	}
	// info push Enroll
	public int freePushEnroll(SqlSessionTemplate sqlSession, Map<String, Object> param) {
		return sqlSession.insert("boardPush.freePushEnroll",param);
	}
}
