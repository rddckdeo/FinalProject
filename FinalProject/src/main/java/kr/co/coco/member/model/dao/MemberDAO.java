package kr.co.coco.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.co.coco.member.model.dto.MemberDTO;

@Repository
public class MemberDAO {
	public int registerMember(SqlSessionTemplate sqlSession, MemberDTO member) {
		return sqlSession.insert("memberMapper.registerMember",member);
	}
}
