package kr.co.coco.board.model.service;

import kr.co.coco.board.model.dto.InfoCommentDTO;

public interface InfoCommentService {

    // 정보 게시판 댓글 쓰기 
	InfoCommentDTO save(InfoCommentDTO commentDTO);

    // 댓글 수 업데이트 
    int countComments(int infoNo);

    // 댓글 삭제 
    int deleteById(int id);
    
    // 댓글 번호로 게시글 번호 가져오기
    public int getInfoNoFromComment(int infoCommentNo);

    //댓글 등록 시, info_comment_count 업데이트 
	void increaseCommentCount(int infoNo);

	// 해당 게시글에 연결된 모든 댓글 삭제
	void deleteCommentsByPostId(int infoNo);

	// 댓글 수정
	InfoCommentDTO updateComment(int infoCommentNo, String commentContent);


}
