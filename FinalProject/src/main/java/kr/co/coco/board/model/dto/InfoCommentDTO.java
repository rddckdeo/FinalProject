package kr.co.coco.board.model.dto;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter // 게터
@Setter // 세터
@NoArgsConstructor 

public class InfoCommentDTO {

	private int infoCommentNo;  // 댓글 번호
    private int infoNo;  // 게시글 번호
    private String infoCommentContent;  // 댓글 내용
    private Date infoCommentDate;  // 댓글 작성일
    private Date infoCommentUpdateDate;  // 댓글 수정일
    private Date infoCommentDeleteDate;  // 댓글 삭제일
    private int mNo;
    
    private String nickname; // 작성자 닉네임
    
}
