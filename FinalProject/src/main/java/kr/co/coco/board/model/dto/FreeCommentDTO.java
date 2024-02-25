package kr.co.coco.board.model.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter // 게터
@Setter // 세터
@AllArgsConstructor
@NoArgsConstructor

public class FreeCommentDTO {

	private int freeCommentNo;  // 댓글 번호
    private int freeNo;  // 게시글 번호
    private String freeCommentContent;  // 댓글 내용
    private Date freeCommentDate;  // 댓글 작성일
    private Date freeCommentUpdateDate;  // 댓글 수정일
    private Date freeCommentDeleteDate;  // 댓글 삭제일
    private int mNo;
    private String freeCommentBlind; // 댓글 블라인드 여부
    private String freeCommentWriter; // 댓글 작성자 (닉네임)
    
    private String nickname; // 작성자 닉네임
    
    private String imageFileName;  
    private String imageFilePath;
}
