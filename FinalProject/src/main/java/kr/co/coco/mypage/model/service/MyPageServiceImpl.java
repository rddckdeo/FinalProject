package kr.co.coco.mypage.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.coco.mypage.model.dao.MyPageDAO;

@Service
public class MyPageServiceImpl implements MyPageService{
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private MyPageDAO mypageDao;
	
	
}
