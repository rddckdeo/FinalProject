package kr.co.coco.member.model.Service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.coco.member.model.dao.MemberDAO;
import kr.co.coco.member.model.dto.MemberDTO;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private MemberDAO memberDao;
//	회원가입
	@Override
	public int registerMember(MemberDTO member) {
		return memberDao.registerMember(sqlSession, member);
	}
}
