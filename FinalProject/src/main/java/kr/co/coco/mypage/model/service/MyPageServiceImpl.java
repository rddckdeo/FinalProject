package kr.co.coco.mypage.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	System.out.println("allInfoBoardPostsNo :" +  mNo);
	    return mypageDao.allInfoBoardPostsNo(mNo);
	}

//	자유 게시판 총 게시글 조회 
	@Override
	public int allFreeBoardPostsNo(Integer mNo) {
		return mypageDao.allFreeBoardPostsNo(mNo);
	}

	//정보게시판 댓글 가져오기 
	@Override
	public List<InfoCommentDTO> fetchInfoCommentNo(Integer mNo) {
		return mypageDao.fetchInfoCommentNo(mNo);
	}
	
	//자유게시판 댓글 가져오기 
	@Override
	public List<FreeCommentDTO> fetchFreeCommentNo(Integer mNo) {
		return mypageDao.fetchFreeCommentNo(mNo);
	}

	 // 프로필 수정 
    @Override
    public boolean updateProfile(Integer mNo, String[] hope, String[] stack, String intro, String nickname, String email,
            String number, String saveFileName, String savePath) {
        // 'hope'와 'stack' 배열을 문자열로 변환
        String hopeString = String.join(",", hope);
        String stackString = String.join(",", stack);

        // 프로필 정보 업데이트
        int updatedRows = mypageDao.updateProfile(mNo, hopeString, stackString, intro, nickname, email, number, saveFileName, savePath);

        return updatedRows > 0; 
    }




}
