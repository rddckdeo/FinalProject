package kr.co.coco.admin.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.co.coco.admin.common.paging.AdminPageInfo;
import kr.co.coco.member.model.dto.MemberDTO;

@Repository
public class AdminDAO {
	//visitCount
	public int visitCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.visitCount");
	}
	//freeCount
	public int freeCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.freeCount");
	}
	//infoCount
	public int infoCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.infoCount");
	}
	//projectCount
	public int projectCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.projectCount");
	}
	//boardCount
	public int boardCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.boardCount");
	}
	//deCount
	public int deCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.deCount");
	}
	
	//visitList
	public List<MemberDTO> selectListAll(SqlSessionTemplate sqlSession, MemberDTO member,AdminPageInfo piVisit){
		int offset = (piVisit.getVcpage() - 1) * piVisit.getBoardLimit();
		RowBounds rb = new RowBounds(offset, piVisit.getBoardLimit());
		return sqlSession.selectList("memberMapper.visitList",member, rb);
	}
	// visitList paging
	public int selectVistList(SqlSessionTemplate sqlSession, MemberDTO member) {
		return sqlSession.selectOne("memberMapper.selectVisitList",member);
	}
}
