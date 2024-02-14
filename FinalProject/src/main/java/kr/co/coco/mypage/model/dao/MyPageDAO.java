package kr.co.coco.mypage.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.coco.board.model.dto.FreeDTO;
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
    public List<InfoDTO> fetchInfoBoardPosts(Integer mNo, int page, int size) {
        Map<String, Object> params = new HashMap<>();
        params.put("start", (page - 1) * size);  // 시작 인덱스 계산
        params.put("limit", size);
        params.put("mNo", mNo);
        return sqlSession.selectList("infoBoardMapper.fetchPostsByMemberNo", params);
    }

    // 자유 게시판 게시글 조회
    public List<FreeDTO> fetchFreeBoardPosts(Integer mNo, int page, int size) {
        Map<String, Object> params = new HashMap<>();
        params.put("start", (page - 1) * size);  // 시작 인덱스 계산
        params.put("limit", size);
        params.put("mNo", mNo);
        return sqlSession.selectList("freeBoardMapper.fetchPostsByMemberNo", params);
    }

    // 정보 게시판 총 게시글 조회 
	public int getTotalInfoBoardPosts(Integer mNo) {
		return sqlSession.selectOne("infoBoardMapper.allInfoBoardPostsNo");
	}
	
//	자유게시판 총 게시글 조회
	public int getTotalFreeBoardPosts(Integer mNo) {
		return sqlSession.selectOne("freeBoardMapper.allInfoBoardPostsNo");
	}
	

}
