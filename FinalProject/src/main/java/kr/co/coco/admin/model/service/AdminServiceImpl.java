package kr.co.coco.admin.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.coco.admin.common.paging.AdminPageInfo;
import kr.co.coco.admin.model.dao.AdminDAO;
import kr.co.coco.member.model.dto.MemberDTO;

@Service
public class AdminServiceImpl implements AdminService{
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private AdminDAO adminDao;
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
	
	
	
//	List 모음
	//visitList
	public List<MemberDTO> selectListAll(MemberDTO member, AdminPageInfo piVisit) {
		return adminDao.selectListAll(sqlSession,member,piVisit);
	}
	// visitList Paging
	public int selectVistList(MemberDTO member) {
		return adminDao.selectVistList(sqlSession, member);
	}
}
