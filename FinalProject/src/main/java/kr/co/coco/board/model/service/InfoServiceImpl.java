package kr.co.coco.board.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.coco.board.model.dao.DeclarationDAO;
import kr.co.coco.board.model.dao.InfoCommentDAO;
import kr.co.coco.board.model.dao.InfoDAO;
import kr.co.coco.board.model.dto.DeclarationDTO;
import kr.co.coco.board.model.dto.InfoCommentDTO;
import kr.co.coco.board.model.dto.InfoDTO;

@Service
public class InfoServiceImpl implements InfoService {


	@Autowired
	private InfoDAO infoDao;
	
	 @Autowired
	private InfoCommentDAO infoCommentDAO;
	 
	 @Autowired
		private DeclarationDAO declarationDao;
	 

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
	
    // 카테고리별 게시글 조회 (페이징 처리)
    @Override
    public List<InfoDTO> getPostsByCategory(String categoryName, int startIndex, int pageSize) {
        return infoDao.getPostsByCategory(categoryName, startIndex, pageSize);
    }
    
    // 카테고리별 게시글 수 조회
    @Override
    public int countPostsByCategory(String categoryName) {
        return infoDao.countPostsByCategory(categoryName);
    }

	// 게시글 디테일 페이지 진입
    @Override
    public InfoDTO getPostById(int infoNo) {
        return infoDao.getPostById(infoNo);
    }

	// 댓글 목록 불러오기
	@Override
	public List<InfoCommentDTO> getCommentsByPostId(int infoNo) {
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
	    return infoDao.increaseViews(infoNo); 
	}

	//전체 게시글 조회 
	@Override
	public List<InfoDTO> getAllPosts(int startIndex, int pageSize) {
	    return infoDao.getAllPosts(startIndex, pageSize);
	}

	//검색 로직 
	@Override
	public List<InfoDTO> searchInfoPosts(String query, int infoPage, int pageSize) {
	    int startIndex = (infoPage - 1) * pageSize;
	    int endIndex = startIndex + pageSize;
	    return infoDao.searchPosts(query, startIndex, endIndex);
	}



	//카테고리 게시글 조회(정렬)
	public List<InfoDTO> getPostsByCategory(String categoryName, String sortType, int startIndex, int pageSize) {
	    List<InfoDTO> posts;

	    System.out.println("Start index: " + startIndex);
	    System.out.println("Page size: " + pageSize);

	    switch (sortType) {
	        case "date":
	            posts = infoDao.selectPostsOrderByDate(categoryName, startIndex, pageSize);
	            break;
	        case "comments":
	            posts = infoDao.selectPostsOrderByComments(categoryName, startIndex, pageSize);
	            break;
	        case "views":
	            posts = infoDao.selectPostsOrderByViews(categoryName, startIndex, pageSize);
	            break;
	        default:
	            posts = infoDao.selectPostsOrderByDate(categoryName, startIndex, pageSize);
	            break;
	    }

	    System.out.println("Returned posts: " + posts.size());

	    return posts;
	}

	//신고하기 
	@Override
    public boolean processDeclaration(DeclarationDTO declarationDto) {
        return declarationDao.insertDeclaration(declarationDto);
    }



}











	











