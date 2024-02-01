package kr.co.coco.board.model.dto;


import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter // 게터
@Setter // 세터
@NoArgsConstructor 

public class InfoDTO {

	private int infoNo;
    private String infoTitle;
    private String infoContent;
    private String infoCategory;
    private Date infoDate;
    private Date infoUpdateDate;
    private Date infoDeleteDate;
    private int infoViews;
    private String infoTag1;
    private String infoTag2;
    private String infoTag3;
    private int mNo;
    
    private String nickname; // 작성자 닉네임
    private int commentCount; // 댓글 수
 
}
