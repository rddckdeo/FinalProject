package kr.co.coco.member.model.Service;

import kr.co.coco.member.model.dto.MemberDTO;

public interface MemberService {
	// 회원가입
	int registerMember(MemberDTO member);
	// 아이디 중복체크
	String idCheck(String idInput);
	// 닉네임 중복체크
	String nicknameCheck(String nicknameInput);
	// 로그인
	MemberDTO login(MemberDTO member);
	// 로그인 Date Update
	int loginDateUpdate(int no);

}

