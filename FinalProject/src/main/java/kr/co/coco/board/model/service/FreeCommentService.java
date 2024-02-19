package kr.co.coco.board.model.service;

import kr.co.coco.board.model.dto.DeclarationDTO;
import kr.co.coco.board.model.dto.FreeCommentDTO;


public interface FreeCommentService {

    // 정보 게시판 댓글 쓰기 
	FreeCommentDTO save(FreeCommentDTO commentDTO);

    // 댓글 수 업데이트 
    int countComments(int infoNo);

    // 댓글 삭제 
    int deleteById(int id);
    
    // 댓글 번호로 게시글 번호 가져오기
    public int getFreeNoFromComment(int freeCommentNo);

    //댓글 등록 시, info_comment_count 업데이트 
	void increaseCommentCount(int freeNo);

	// 해당 게시글에 연결된 모든 댓글 삭제
	void deleteCommentsByPostId(int freeNo);

	//댓글 신고하기 
	boolean reportComment(DeclarationDTO declarationDto);

	//댓글 수정하기 
	FreeCommentDTO updateComment(int commentId, String commentContent);
}
