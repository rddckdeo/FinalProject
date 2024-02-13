package kr.co.coco.admin.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.coco.admin.common.paging.AdminPageInfo;
import kr.co.coco.admin.model.dao.AdminDAO;
import kr.co.coco.admin.model.dto.AdminDTO;
import kr.co.coco.member.model.dto.MemberDTO;

@Service
public class AdminServiceImpl implements AdminService{
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private AdminDAO adminDao;
//	-----------------------mainPage Summary------------------------------
	// visitCount
	@Override
	public int visitCount(){
		return adminDao.visitCount(sqlSession);
	}
	// freeCount
	@Override
	public int freeCount(){
		return adminDao.freeCount(sqlSession);
	}
	// infoCount
	@Override
	public int infoCount(){
		return adminDao.infoCount(sqlSession);
	}
	// projectCount
	@Override
	public int projectCount(){
		return adminDao.projectCount(sqlSession);
	}
	// boardCount
	@Override
	public int boardCount(){
		return adminDao.boardCount(sqlSession);
	}
	// deCount
	@Override
	public int deCount(){
		return adminDao.deCount(sqlSession);
	}
//	-----------------------------------------------------------------------
//	List 모음
	//visitList
	public List<MemberDTO> selectListToday(MemberDTO member, AdminPageInfo piVisit) {
		return adminDao.selectListToday(sqlSession,member,piVisit);
	}
	// visit Page List
	public List<MemberDTO> selectListAll(MemberDTO member, AdminPageInfo piVisit) {
		return adminDao.selectListAll(sqlSession,member,piVisit);
	}
	// visitList Paging
	public int selectVisitList(MemberDTO member) {
		return adminDao.selectVistList(sqlSession, member);
	}
	// visitList Paging All
	public int selectVisitListAll(MemberDTO member) {
		return adminDao.selectVistListAll(sqlSession, member);
	}
//	-----------------------------------------------------------------------
	//memberList
	public List<MemberDTO> totalList(MemberDTO member, AdminPageInfo piMember){
		return adminDao.totalList(sqlSession, member,piMember);
	}
	// memberList Count
	public int memberListCount() {
		return adminDao.memberListCount(sqlSession);
	}
	//new User Day
	public List<MemberDTO> newUserList(MemberDTO member, AdminPageInfo piNew){
		return adminDao.newUserList(sqlSession, member, piNew);
	}
	//new User Day Count
	public int newMemberCount() {
		return adminDao.newMemberCount(sqlSession);
	}
	// delete member
	public List<MemberDTO> deleteList(MemberDTO member, AdminPageInfo piDelete){
		return adminDao.deleteList(sqlSession ,member, piDelete);
	}
	// delete member Count
	public int deleteCount() {
		return adminDao.deleteCount(sqlSession);
	}
//	-----------------------------------------------------------------------
//	admin Visit Page
	public int dayVisit() {
		return adminDao.dayVisit(sqlSession);
	}
	public int weekVisit() {
		return adminDao.weekVisit(sqlSession);			
		}
	public int monthVisit() {
		return adminDao.monthVisit(sqlSession);		
	}
//	member Page
	public int newUserDay() {
		return adminDao.newUserDay(sqlSession);
	}
	public int newUserMonth() {
		return adminDao.newUserMonth(sqlSession);
	}
	public int newUserYear() {
		return adminDao.newUserYear(sqlSession);
	}
	public int newUserTotal() {
		return adminDao.newUserTotal(sqlSession);
	}
//	----------------------------------------------------
	//admin Member Delete
	public int deleteMember(int no) {
		return adminDao.deleteMember(sqlSession, no);
	}
	// admin member delete cancel
	public int deleteCancel(int no) {
		return adminDao.deleteCancel(sqlSession, no);
	}
//	// amdin search Member
//	public int searchMember(String searchMember) {
//		return adminDao.searchMember(sqlSession, searchMember);
//	}

// -----------------------------------------------------
// Admin Board Page

	// info
	public List<AdminDTO> infoList(AdminDTO admin){
		return adminDao.infoList(sqlSession, admin);
	}
	//info List Count
//	public int infoListCount() {
//		return adminDao.infoListCount();
//	}
}