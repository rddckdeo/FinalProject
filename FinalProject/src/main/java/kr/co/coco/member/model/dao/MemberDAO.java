package kr.co.coco.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.co.coco.member.model.dto.MemberDTO;

@Repository
public class MemberDAO {
	// 회원가입
	public int registerMember(SqlSessionTemplate sqlSession, MemberDTO member) {
		return sqlSession.insert("memberMapper.registerMember",member);
	}
	// 아이디 중복체크
	public String idCheck(SqlSessionTemplate sqlSession, String idInput) {
		return sqlSession.selectOne("memberMapper.idCheck",idInput);
	}
	// 닉네임 중복체크
	public String nicknameCheck(SqlSessionTemplate sqlSession, String nicknameInput) {
		return sqlSession.selectOne("memberMapper.nicknameCheck",nicknameInput);
	}
	//login
	public MemberDTO login(SqlSessionTemplate sqlSession, MemberDTO member) {
		return sqlSession.selectOne("memberMapper.login",member);
	}
	// login Date Update
	public int loginDateUpdate(SqlSessionTemplate sqlSession, int no) {
		return sqlSession.update("memberMapper.loginDateUpdate",no);
	}

}
