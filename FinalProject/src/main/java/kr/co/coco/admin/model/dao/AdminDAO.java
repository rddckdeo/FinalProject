package kr.co.coco.admin.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.co.coco.admin.common.paging.AdminPageInfo;
import kr.co.coco.admin.model.dto.AdminBoardDTO;
import kr.co.coco.board.model.dto.DeclarationDTO;
import kr.co.coco.board.model.dto.InfoDTO;
import kr.co.coco.colabo.model.dto.ColaboDTO;
import kr.co.coco.member.model.dto.MemberDTO;

@Repository
public class AdminDAO {
//	-------------------------Total-------------------------
	//visitCount
	public int visitCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("admin-totalMapper.visitCount");
	}
	//freeCount
	public int freeCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("admin-totalMapper.freeCount");
	}
	//infoCount
	public int infoCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("admin-totalMapper.infoCount");
	}
	//projectCount
	public int projectCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("admin-totalMapper.projectCount");
	}
	//boardCount
	public int boardCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("admin-totalMapper.boardCount");
	}
	//deCount
	public int deCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("admin-totalMapper.deCount");
	}
	// -----------------------list-------------------------
	public int freeListCountToday(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("admin-totalMapper.freeListCountToday");
	}
	public int infoListCountToday(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("admin-totalMapper.infoListCountToday");
	}
	public List<InfoDTO> freeListToday(SqlSessionTemplate sqlSession, InfoDTO info,AdminPageInfo pi){
		int offset = (pi.getCpage() - 1) * pi.getBoardLimit();
		RowBounds rb = new RowBounds(offset, pi.getBoardLimit());
		return sqlSession.selectList("admin-totalMapper.freeListToday",info, rb);
	}
	public List<InfoDTO> infoListToday(SqlSessionTemplate sqlSession, InfoDTO info,AdminPageInfo pi){
		int offset = (pi.getCpage() - 1) * pi.getBoardLimit();
		RowBounds rb = new RowBounds(offset, pi.getBoardLimit());
		return sqlSession.selectList("admin-totalMapper.infoListToday",info, rb);
	}
//	-------------------------visit-------------------------
//	-------------admin visit Page Summary------------------
	public int dayVisit(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("admin-visitMapper.dayVisit");
	}
	public int weekVisit(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("admin-visitMapper.weekVisit");		
	}
	public int monthVisit(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("admin-visitMapper.monthVisit");		
	}
	//visitList
	public List<MemberDTO> selectListToday(SqlSessionTemplate sqlSession, MemberDTO member,AdminPageInfo piVisit){
		int offset = (piVisit.getCpage() - 1) * piVisit.getBoardLimit();
		RowBounds rb = new RowBounds(offset, piVisit.getBoardLimit());
		return sqlSession.selectList("admin-visitMapper.visitListToday",member, rb);
	}
	public List<MemberDTO> selectListAll(SqlSessionTemplate sqlSession, MemberDTO member,AdminPageInfo piVisit){
		int offset = (piVisit.getCpage() - 1) * piVisit.getBoardLimit();
		RowBounds rb = new RowBounds(offset, piVisit.getBoardLimit());
		return sqlSession.selectList("admin-visitMapper.visitAllList",member, rb);
	}
	// visitList paging
	public int selectVistList(SqlSessionTemplate sqlSession, MemberDTO member) {
		return sqlSession.selectOne("admin-visitMapper.selectVisitList",member);
	}
	// visitList paging
	public int selectVistListAll(SqlSessionTemplate sqlSession, MemberDTO member) {
		return sqlSession.selectOne("admin-visitMapper.selectVisitListAll",member);
	}
//	-------------------------member-------------------------
//	-------------admin member Page Summary------------------
	public int newUserDay(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("admin-memberMapper.newUserDay");
	}
	public int newUserMonth(SqlSessionTemplate sqlSesison) {
		return sqlSesison.selectOne("admin-memberMapper.newUserMonth");
	}
	public int newUserYear(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("admin-memberMapper.newUserYear");
	}
	public int newUserTotal(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("admin-memberMapper.newUserTotal");
	}
//	-------------admin member List------------------
	//memberList
	public List<MemberDTO> totalList(SqlSessionTemplate sqlSession, MemberDTO member, AdminPageInfo piMember){
		int offset = (piMember.getCpage() - 1) * piMember.getBoardLimit();
		RowBounds rb = new RowBounds(offset, piMember.getBoardLimit());
		return sqlSession.selectList("admin-memberMapper.totalList",member,rb);
	}
	public int memberListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("admin-memberMapper.memberListCount");
	}
	//newMemberList
	public List<MemberDTO> newUserList(SqlSessionTemplate sqlSession, MemberDTO member, AdminPageInfo piNew){
		int offset = (piNew.getCpage() - 1) * piNew.getBoardLimit();
		RowBounds rb = new RowBounds(offset, piNew.getBoardLimit());
		
		return sqlSession.selectList("admin-memberMapper.newUserList",member, rb);
	}
	public int newMemberCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("admin-memberMapper.newUserCount");
	}
	//deleteList
	public List<MemberDTO> deleteList(SqlSessionTemplate sqlSession, MemberDTO member, AdminPageInfo piDelete){
		int offset = (piDelete.getCpage() - 1) * piDelete.getBoardLimit();
		RowBounds rb = new RowBounds(offset, piDelete.getBoardLimit());
		return sqlSession.selectList("admin-memberMapper.deleteList",member,rb);
	}
	public int deleteCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("admin-memberMapper.deleteCount");
	}
	public int memberSearchListCount(SqlSessionTemplate sqlSession, String searchInput) {
		return sqlSession.selectOne("admin-memberMapper.memberSearchListCount",searchInput);
	}
	//memberList
	public List<MemberDTO> searchList(SqlSessionTemplate sqlSession, MemberDTO member, AdminPageInfo piMember, String searchInput){
		int offset = (piMember.getCpage() - 1) * piMember.getBoardLimit();
		RowBounds rb = new RowBounds(offset, piMember.getBoardLimit());
		member.setSearchInput(searchInput);
		return sqlSession.selectList("admin-memberMapper.searchList",member,rb);
	}
//	-------------admin member 기능------------------
//	admin Member Delete
	public int deleteMember(SqlSessionTemplate sqlSession,int no) {
		return sqlSession.update("admin-memberMapper.deleteMember",no);
	}
//	admin member delete cancel
	public int deleteCancel(SqlSessionTemplate sqlSession, int no) {
		return sqlSession.delete("admin-memberMapper.deleteCancel",no);
	}
//	admin search Member
//	public int searchMember(SqlSessionTemplate sqlSession, String searchMember) {
//		return sqlSession.selectList("memberMapper.searchMember",searchMember);
//	}
//	-------------------Admini Board Page-------------------
//	-------------admin member Page Summary------------------
	public int infoTodayCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("admin-boardMapper.infoTodayCount");
	}
	public int infoCommentTodayCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("admin-boardMapper.infoCommentTodayCount");
	}
	public int freeTodayCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("admin-boardMapper.freeTodayCount");
	}
	public int freeCommentTodayCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("admin-boardMapper.freeCommentTodayCount");
	}
//	-------------admin member Page List------------------
	//info
	public List<InfoDTO> infoList(SqlSessionTemplate sqlSession, InfoDTO info, AdminPageInfo pi){
		int offset = (pi.getCpage() - 1) * pi.getBoardLimit();
		RowBounds rb = new RowBounds(offset, pi.getBoardLimit());
		return sqlSession.selectList("admin-boardMapper.infoList", info, rb);
	}
	//info count
	public int infoListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("admin-boardMapper.infoListCount");
	}
	//info comment
	public List<InfoDTO> infoCommentList(SqlSessionTemplate sqlSession, InfoDTO info, AdminPageInfo pi){
		int offset = (pi.getCpage() - 1) * pi.getBoardLimit();
		RowBounds rb = new RowBounds(offset, pi.getBoardLimit());
		return sqlSession.selectList("admin-boardMapper.infoCommentList", info, rb);
	}
	//info comment count
	public int infoCommentListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("admin-boardMapper.infoCommentListCount");
	}
	//free
	public List<InfoDTO> freeList(SqlSessionTemplate sqlSession, InfoDTO info, AdminPageInfo pi){
		int offset = (pi.getCpage() - 1) * pi.getBoardLimit();
		RowBounds rb = new RowBounds(offset, pi.getBoardLimit());
		return sqlSession.selectList("admin-boardMapper.freeList", info, rb);
	}
	//free count
	public int freeListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("admin-boardMapper.freeListCount");
	}
	//free comment
	public List<InfoDTO> freeCommentList(SqlSessionTemplate sqlSession, InfoDTO info, AdminPageInfo pi){
		int offset = (pi.getCpage() - 1) * pi.getBoardLimit();
		RowBounds rb = new RowBounds(offset, pi.getBoardLimit());
		return sqlSession.selectList("admin-boardMapper.freeCommentList", info, rb);
	}
	//free comment count
	public int freeCommentListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("admin-boardMapper.freeCommentListCount");
	}
	//board delete
	public int deleteBoard(SqlSessionTemplate sqlSession, Map<String,Object>param) {
		return sqlSession.update("admin-boardMapper.deleteBoard", param);
	}
// --------------------------Admin Project Page---------------------------
	// Summary
	public int newProject(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("admin-projectMapper.newProject");
	}
	public int startProject(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("admin-projectMapper.startProject");
	}
	public int endProject(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("admin-projectMapper.endProject");
	}	
	// paging
	public int newProjectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("admin-projectMapper.newProjectListCount");
	}
	
	public int startProjectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("admin-projectMapper.startProjectListCount");	
	}
	
	public int endProjectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("admin-projectMapper.endProjectListCount");
	}
	// List
	public List<ColaboDTO> newProjectList(SqlSessionTemplate sqlSession, ColaboDTO colabo, AdminPageInfo pi1){
		int offset = (pi1.getCpage() - 1) * pi1.getBoardLimit();
		RowBounds rb = new RowBounds(offset, pi1.getBoardLimit());
		return sqlSession.selectList("admin-projectMapper.newProjectList",colabo, rb);
	}
	public List<ColaboDTO> startProjectList(SqlSessionTemplate sqlSession, ColaboDTO colabo, AdminPageInfo pi2){
		int offset = (pi2.getCpage() - 1) * pi2.getBoardLimit();
		RowBounds rb = new RowBounds(offset, pi2.getBoardLimit());
		return sqlSession.selectList("admin-projectMapper.startProjectList",colabo, rb);
	}
	public List<ColaboDTO> endProjectList(SqlSessionTemplate sqlSession, ColaboDTO colabo, AdminPageInfo pi3){
		int offset = (pi3.getCpage() - 1) * pi3.getBoardLimit();
		RowBounds rb = new RowBounds(offset, pi3.getBoardLimit());
		return sqlSession.selectList("admin-projectMapper.endProjectList",colabo, rb);
	}
	// project delete
	public int deleteProject(SqlSessionTemplate sqlSession, Map<String, Object> param) {
		return sqlSession.delete("admin-projectMapper.deleteProject", param);
	}
	// --------------------------Admin AdminBoard Page---------------------------
	// Summary Count
	public int incomCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("admin-adminBoardMapper.incomCount");
	}
	public int comCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("admin-adminBoardMapper.comCount");
	}
	public int totalCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("admin-adminBoardMapper.totalCount");
	}
	// List
	public List<AdminBoardDTO> incomList(SqlSessionTemplate sqlSession,AdminBoardDTO admin, AdminPageInfo pi){
		int offset = (pi.getCpage() - 1) * pi.getBoardLimit();
		RowBounds rb = new RowBounds(offset, pi.getBoardLimit());
		return sqlSession.selectList("admin-adminBoardMapper.incomList",admin, rb);
	}
	public List<AdminBoardDTO> comList(SqlSessionTemplate sqlSession,AdminBoardDTO admin, AdminPageInfo pi){
		int offset = (pi.getCpage() - 1) * pi.getBoardLimit();
		RowBounds rb = new RowBounds(offset, pi.getBoardLimit());
		return sqlSession.selectList("admin-adminBoardMapper.comList",admin, rb);
	}
	public List<AdminBoardDTO> AdminBoardTotalList(SqlSessionTemplate sqlSession,AdminBoardDTO admin, AdminPageInfo pi){
		int offset = (pi.getCpage() - 1) * pi.getBoardLimit();
		RowBounds rb = new RowBounds(offset, pi.getBoardLimit());
		return sqlSession.selectList("admin-adminBoardMapper.AdminBoardTotalList",admin, rb);
	}
	// admin board answer Enroll
	public int adminBoardEnroll(SqlSessionTemplate sqlSession, int no, String content) {
		Map<String, Object> params = new HashMap<>();
	    params.put("no", no);
	    params.put("content", content);
		return sqlSession.update("admin-adminBoardMapper.adminBoardEnroll",params);
	}
	// admiin board delete
	public int adminBoardDelete(SqlSessionTemplate sqlSession, int no) {
		return sqlSession.update("admin-adminBoardMapper.adminBoardDelete",no);
	}
	// admin board push witer 정보 가져오기 (inquiry)
	public int adminBoardWriter(SqlSessionTemplate sqlSession,int boardNo) {
		return sqlSession.selectOne("admin-adminBoardMapper.adminBoardWriter",boardNo);
	}
	// --------------------------Admin Declaration Page---------------------------
	// summary
	public int deTodayCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("admin-declarationMapper.deTodayCount");
	}
	public int noneBlindCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("admin-declarationMapper.noneBlindCount");
	}
	public int blindCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("admin-declarationMapper.blindCount");
	}
	public int deTotalCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("admin-declarationMapper.deTotalCount");
	}
	// List
	public List<DeclarationDTO> deTodayList(SqlSessionTemplate sqlSession, DeclarationDTO dec, AdminPageInfo pi){
		int offset = (pi.getCpage() - 1) * pi.getBoardLimit();
		RowBounds rb = new RowBounds(offset, pi.getBoardLimit());
		return sqlSession.selectList("admin-declarationMapper.deTodayList",dec, rb);
	}
	public List<DeclarationDTO> noneBlindList(SqlSessionTemplate sqlSession, DeclarationDTO dec, AdminPageInfo pi){
		int offset = (pi.getCpage() - 1) * pi.getBoardLimit();
		RowBounds rb = new RowBounds(offset, pi.getBoardLimit());
		return sqlSession.selectList("admin-declarationMapper.noneBlindList",dec, rb);
	}
	public List<DeclarationDTO> blindList(SqlSessionTemplate sqlSession, DeclarationDTO dec, AdminPageInfo pi){
		int offset = (pi.getCpage() - 1) * pi.getBoardLimit();
		RowBounds rb = new RowBounds(offset, pi.getBoardLimit());
		return sqlSession.selectList("admin-declarationMapper.blindList",dec, rb);
	}
	public List<DeclarationDTO> deTotalList(SqlSessionTemplate sqlSession, DeclarationDTO dec, AdminPageInfo pi){
		int offset = (pi.getCpage() - 1) * pi.getBoardLimit();
		RowBounds rb = new RowBounds(offset, pi.getBoardLimit());
		return sqlSession.selectList("admin-declarationMapper.deTotalList",dec, rb);
	}
	// blind 처리
	public int declarationBlind(SqlSessionTemplate sqlSession, int no) {
		return sqlSession.update("admin-declarationMapper.declarationBlind",no);
	}
	public int declarationNoneBlind(SqlSessionTemplate sqlSession, int no) {
		return sqlSession.update("admin-declarationMapper.declarationNoneBlind",no);
	}
}
