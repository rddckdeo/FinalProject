package kr.co.coco.board.model.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter // 게터
@Setter // 세터
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class InfoCommentDTO {

    private int infoCommentNo; // 댓글 번호
    private int infoNo; // 게시글 번호
    private int mNo; // 회원 번호
    private String infoCommentContent; // 댓글 내용
    private Date infoCommentDate; // 댓글 작성일
    private Date infoCommentUpdateDate; // 댓글 수정일
    private Date infoCommentDeleteDate; // 댓글 삭제일
    private String infoCommentBlind; // 댓글 블라인드 여부
    private String infoCommentWriter; // 댓글 작성자 (닉네임)
    
    private String nickname; //작성 시, 닉네임 사용
    
    private String imageFileName;  
    private String imageFilePath;
    
    private String infoTitle;
    private String freeTitle;
    
    private String additionalField1;
    private String additionalField2;
}
