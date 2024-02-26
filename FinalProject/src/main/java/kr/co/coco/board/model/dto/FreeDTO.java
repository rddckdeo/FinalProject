package kr.co.coco.board.model.dto;

import java.util.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter // 게터
@Setter // 세터
@NoArgsConstructor
@ToString
public class FreeDTO {

	private int freeNo;
	private String freeTitle;
	private String freeContent;
	private Date freeDate;
	private Date freeUpdateDate;
	private Date freeDeleteDate;
	private int freeViews;
	private String freeTag1;
	private String freeTag2;
	private String freeTag3;
	private String freeBlind;
	private int freeCommentCount;
	private String freeCategory;

	private int memberNo;

	private String nickname; // 작성자 닉네임
	private int commentCount; // 댓글 수

	private String imageFileName;
	private String imageFilePath;




}
