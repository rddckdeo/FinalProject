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
//	아이디 중복체크
	@Override
	public String idCheck(String idInput) {
		return memberDao.idCheck(sqlSession, idInput);
	}
//	닉네임 중복체크
	@Override
	public String nicknameCheck(String nicknameInput) {
		return memberDao.nicknameCheck(sqlSession, nicknameInput);
	}
//	로그인
	@Override
	public MemberDTO login(MemberDTO member) {
		return memberDao.login(sqlSession, member);
	}
// 로그인 Date Update
	@Override
	public int loginDateUpdate(int no) {
		return memberDao.loginDateUpdate(sqlSession, no);
	}
}
