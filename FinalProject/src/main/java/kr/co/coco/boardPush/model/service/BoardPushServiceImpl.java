package kr.co.coco.boardPush.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.coco.boardPush.model.dao.BoardPushDAO;
import kr.co.coco.boardPush.model.dto.BoardPushDTO;

@Service
public class BoardPushServiceImpl {
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private BoardPushDAO pushDao;
	// push List
	public List<BoardPushDTO> pushList(int mNo){
		return pushDao.pushList(sqlSession, mNo);
	}
	//pushListCount
	public int pushListCount(int mNo) {
		return pushDao.pushListCount(sqlSession, mNo);
	}
	// 알림 확인 시 N값을 Y로 변경
	public int pushCheck(int mNo) {
		return pushDao.pushCheck(sqlSession,mNo);
	}
	// 미확인 한 알림 Count
	public int pushNoneViewCount(int no) {
		return pushDao.pushNoneViewCount(sqlSession, no);
	}
//	 ---------board Push Enroll---------------
	// admin_board Enroll ( 문의사항 답변 시 알람 ) 
	public int adminBoardPushEnroll(Map<String, Object>param) {
		return pushDao.adminBoardPushEnroll(sqlSession, param);
	}
//	 ---------declaration List---------------
	public List<BoardPushDTO> declarationList(int no){ // no = declaration No
		return pushDao.declarationList(sqlSession,no);
	}
	// ---------get board title ---------
	// info
	public String getBoardTitleInfo(Map<String, Object>param) {
		return pushDao.getBoardTitleInfo(sqlSession, param);
	}
	// free
	public String getBoardTitleFree(Map<String, Object>param) {
		return pushDao.getBoardTitleFree(sqlSession, param);
	}
	// board push blind
	public int boardPushBlind(Map<String, Object> param) {
		return pushDao.boardPushBlind(sqlSession, param);
	}
//	--------- (Comment)Info Board 정보 가져오기 ---------------
	public List<BoardPushDTO> getInfoList(int mNo){
		return pushDao.getInfoList(sqlSession, mNo);
	}
	// info board no를 통해 info board의 작성자 no를 가져오기
	public int getPushInfoNo(int infoBoardNo) {
		return pushDao.getPushInfoNo(sqlSession, infoBoardNo);
	}
	// info push Enroll
	public int infoPushEnroll(Map<String, Object> param) {
		return pushDao.infoPushEnroll(sqlSession, param);
	}
//	--------- (Comment)Free Board 정보 가져오기 ---------------
	public List<BoardPushDTO> getFreeList(int mNo){
		return pushDao.getFreeList(sqlSession, mNo);
	}
	// info board no를 통해 info board의 작성자 no를 가져오기
	public int getPushFreeNo(int freeBoardNo) {
		return pushDao.getPushFreeNo(sqlSession, freeBoardNo);
	}
	// info push Enroll
	public int freePushEnroll(Map<String, Object> param) {
		return pushDao.freePushEnroll(sqlSession, param);
	}
	
}
