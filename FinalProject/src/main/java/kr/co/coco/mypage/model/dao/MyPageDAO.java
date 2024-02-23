package kr.co.coco.mypage.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.coco.admin.model.dto.AdminBoardDTO;
import kr.co.coco.board.model.dto.FreeCommentDTO;
import kr.co.coco.board.model.dto.FreeDTO;
import kr.co.coco.board.model.dto.InfoCommentDTO;
import kr.co.coco.board.model.dto.InfoDTO;
import kr.co.coco.mypage.model.dto.MyPageDTO;

@Repository
public class MyPageDAO {

    @Autowired
    private SqlSessionTemplate sqlSession;
    
    // 특정 회원 정보 가져오기
    public MyPageDTO findMemberByNo(Integer mNo) {
        return sqlSession.selectOne("mypageMapper.findMemberByNo", mNo);
    }

    // 정보 게시판 게시글 조회
    public List<InfoDTO> fetchInfoBoardPosts(Integer mNo, int infoPage, int pageSize) {
        Map<String, Object> params = new HashMap<>();
        params.put("start", (infoPage - 1) * pageSize);  // 시작 인덱스 계산
        params.put("limit", pageSize);
        params.put("mNo", mNo);
        return sqlSession.selectList("infoMapper.fetchPostsByMemberNo", params);
    }

    // 자유 게시판 게시글 조회
    public List<FreeDTO> fetchFreeBoardPosts(Integer mNo, int freePage, int pageSize) {
        Map<String, Object> params = new HashMap<>();
        params.put("start", (freePage - 1) * pageSize);  // 시작 인덱스 계산
        params.put("limit", pageSize);
        params.put("mNo", mNo);
        return sqlSession.selectList("freeMapper.fetchPostsByMemberNo", params);
    }

 // 정보 게시판 총 게시글 조회 
    public int allInfoBoardPostsNo(Integer mNo) {
        return sqlSession.selectOne("infoMapper.allInfoBoardPostsNo", mNo);
    }

    // 자유게시판 총 게시글 조회
    public int allFreeBoardPostsNo(Integer mNo) {
        return sqlSession.selectOne("freeMapper.allFreeBoardPostsNo", mNo);
    }


	//정보게시판 댓글 가져오기 
	public List<InfoCommentDTO> fetchInfoCommentNo(Integer mNo) {
	    System.out.println("fetchInfoCommentNo"  + mNo);
	    return sqlSession.selectList("mypageMapper.fetchInfoCommentNo", mNo);
	}

	//자유게시판 댓글 가져오기 
	public List<FreeCommentDTO> fetchFreeCommentNo(Integer mNo) {
	    return sqlSession.selectList("mypageMapper.fetchFreeCommentNo", mNo);
	}


	 // 프로필 수정
    public boolean updateProfile(Integer mNo, String hopeAsString, String stackAsString, String intro, String nickname,
            String email, String number, String saveFileName, String uploadPath) {

        Map<String, Object> params = new HashMap<>();
        params.put("mNo", mNo);
        params.put("hopeAsString", hopeAsString);
        params.put("stackAsString", stackAsString);
        params.put("intro", intro);
        params.put("nickname", nickname);
        params.put("email", email);
        params.put("number", number);
        params.put("saveFileName", saveFileName);
        params.put("savePath", uploadPath);

        int result = sqlSession.update("mypageMapper.updateProfile", params);

        return result > 0;
    }

	// 문의사항 등록
	public int registerInquiry(Integer mNo, String infoTitle, String infoContent) {
	    Map<String, Object> params = new HashMap<>();
	    params.put("mNo", mNo);
	    params.put("infoTitle", infoTitle);
	    params.put("infoContent", infoContent);
	    
	    return sqlSession.insert("mypageMapper.registerInquiry", params);
	}

	//문의사항 진입 
	public List<AdminBoardDTO> getInquiries(Integer mNo) {
	    return sqlSession.selectList("admin-adminBoardMapper.getInquiries", mNo);
	}

	// 문의게시판 조회수 증가
	public int increaseViewCount(int no) {
		 return sqlSession.update("admin-adminBoardMapper.increaseViewCount", no);
	}

	// 문의게시판 디테일(정보가져오기)
	public AdminBoardDTO inquiryDtail(int no) {
	    return sqlSession.selectOne("admin-adminBoardMapper.inquiryDtail", no);
	}


	

}
