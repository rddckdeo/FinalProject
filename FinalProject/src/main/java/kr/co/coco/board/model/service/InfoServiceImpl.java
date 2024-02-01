package kr.co.coco.board.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.coco.board.model.dao.InfoCommentDAO;
import kr.co.coco.board.model.dao.InfoDAO;
import kr.co.coco.board.model.dto.InfoCommentDTO;
import kr.co.coco.board.model.dto.InfoDTO;

@Service
public class InfoServiceImpl implements InfoService {


	@Autowired
	private InfoDAO infoDao;
	
	 @Autowired
	private InfoCommentDAO infoCommentDAO;
	 

	// 게시글 등록
	 @Override
	 public int enrollBoard(InfoDTO info) {
	     return infoDao.enrollBoard(info);
	 }

	// 카테고리 목록 불러오기
	@Override
	public List<InfoDTO> getPostsByCategory(String categoryName) {
		return infoDao.selectPostsByCategory(categoryName);
	}

	// 게시글 디테일 페이지 진입
	@Override
	public InfoDTO getPostById(String infoNo) {
		return infoDao.getPostById(infoNo);
	}

	// 댓글 목록 불러오기
	@Override
	public List<InfoCommentDTO> getCommentsByPostId(String infoNo) {
		return infoCommentDAO.selectCommentsByPostId(infoNo);
	}

	//게시글 수정하기
	@Override
	public int updatePost(int infoNo, InfoDTO post) {
	    return infoDao.updatePost(post);
	}

	//게시글 삭제하기 
	@Override
    public int deletePost(int infoNo) {
        return infoDao.deletePost(infoNo);
    }

	//조회수 증가 
	@Override
	public int increaseViewCount(int infoNo) {
	    return infoDao.increaseViewCount(infoNo); 
	}


	

}










