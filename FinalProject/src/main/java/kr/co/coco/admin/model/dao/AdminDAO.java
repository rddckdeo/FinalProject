package kr.co.coco.admin.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.co.coco.admin.common.paging.AdminPageInfo;
import kr.co.coco.admin.model.dto.AdminDTO;
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
	//info
	public List<AdminDTO> infoList(SqlSessionTemplate sqlSession, AdminDTO admin){
		return sqlSession.selectList("boardMapper.infoList");
	}
	
	
}
