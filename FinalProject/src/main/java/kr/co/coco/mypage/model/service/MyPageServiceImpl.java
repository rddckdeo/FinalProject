package kr.co.coco.mypage.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.coco.admin.model.dto.AdminBoardDTO;
import kr.co.coco.board.model.dto.FreeCommentDTO;
import kr.co.coco.board.model.dto.FreeDTO;
import kr.co.coco.board.model.dto.InfoCommentDTO;
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
	public List<InfoDTO> fetchInfoBoardPosts(Integer mNo, int infoPage, int pageSize) {
		return mypageDao.fetchInfoBoardPosts(mNo, infoPage, pageSize);
	}

	// 자유 게시판 게시글 조회
	@Override
	public List<FreeDTO> fetchFreeBoardPosts(Integer mNo, int freePage, int pageSize) {
		return mypageDao.fetchFreeBoardPosts(mNo, freePage, pageSize);
	}

//	정보 게시판 총 게시글 조회 
	@Override
	public int allInfoBoardPostsNo(Integer mNo) {
		System.out.println("allInfoBoardPostsNo :" + mNo);
		return mypageDao.allInfoBoardPostsNo(mNo);
	}

//	자유 게시판 총 게시글 조회 
	@Override
	public int allFreeBoardPostsNo(Integer mNo) {
		return mypageDao.allFreeBoardPostsNo(mNo);
	}

	// 정보게시판 댓글 가져오기
	@Override
	public List<InfoCommentDTO> fetchInfoCommentNo(Integer mNo) {
		return mypageDao.fetchInfoCommentNo(mNo);
	}

	// 자유게시판 댓글 가져오기
	@Override
	public List<FreeCommentDTO> fetchFreeCommentNo(Integer mNo) {
		return mypageDao.fetchFreeCommentNo(mNo);
	}

	// 문의사항 등록
	@Override
	public void registerInquiry(Integer mNo, String infoTitle, String infoContent) {
		mypageDao.registerInquiry(mNo, infoTitle, infoContent);
	}

	// 문의사항 진입
	@Override
	public List<AdminBoardDTO> getInquiries(Integer mNo) {
		return mypageDao.getInquiries(mNo);
	}

	// 문의게시판 조회수 증가
	@Override
	public void increaseViewCount(int no) {
		mypageDao.increaseViewCount(no);
		
	}

	// 문의게시판 디테일(정보가져오기)
	@Override
	public AdminBoardDTO inquiryDtail(int no) {
		return mypageDao.inquiryDtail(no);
	}

    // 프로필 수정
    @Override
    public boolean updateProfile(Integer mNo, String hopeAsString, String stackAsString, String intro, String nickname,
            String email, String number, String saveFileName, String uploadPath) {

        return mypageDao.updateProfile(mNo, hopeAsString, stackAsString, intro, nickname, email, number, saveFileName, uploadPath);
    }





}
