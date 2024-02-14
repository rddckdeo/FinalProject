package kr.co.coco.mypage.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.coco.board.model.dto.FreeDTO;
import kr.co.coco.board.model.dto.InfoDTO;
import kr.co.coco.mypage.model.dao.MyPageDAO;
import kr.co.coco.mypage.model.dto.MyPageDTO;

@Service
public class MyPageServiceImpl implements MyPageService {

	@Autowired
	private MyPageDAO mypageDao;

	// 회원 정보 조회
	@Override
	public MyPageDTO findMemberByNo(Integer mNo) {
		return mypageDao.findMemberByNo(mNo);
	}

	// 정보 게시판 게시글 조회
	@Override
	public List<InfoDTO> fetchInfoBoardPosts(Integer mNo, int page, int size) {
		return mypageDao.fetchInfoBoardPosts(mNo, page, size);
	}

	// 자유 게시판 게시글 조회
	@Override
	public List<FreeDTO> fetchFreeBoardPosts(Integer mNo, int page, int size) {
		return mypageDao.fetchFreeBoardPosts(mNo, page, size);
	}

//	정보 게시판 총 게시글 조회 
	@Override
	public int getTotalInfoBoardPosts(Integer mNo) {
		return mypageDao.getTotalInfoBoardPosts(mNo);
	}

//	자유 게시판 총 게시글 조회 
	@Override
	public int getTotalFreeBoardPosts(Integer mNo) {
		return mypageDao.getTotalInfoBoardPosts(mNo);
	}

}
