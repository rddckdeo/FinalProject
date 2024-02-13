package kr.co.coco.board.model.dto;

import java.util.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter // 게터
@Setter // 세터
@NoArgsConstructor

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

	private int mNo;

	private String nickname; // 작성자 닉네임
	private int commentCount; // 댓글 수

	
	@Override
	public String toString() {
		return "FreeDTO [freeNo=" + freeNo + ", freeTitle=" + freeTitle + ", freeContent=" + freeContent + ", freeDate="
				+ freeDate + ", freeUpdateDate=" + freeUpdateDate + ", freeDeleteDate=" + freeDeleteDate
				+ ", freeViews=" + freeViews + ", freeTag1=" + freeTag1 + ", freeTag2=" + freeTag2 + ", freeTag3="
				+ freeTag3 + ", freeBlind=" + freeBlind + ", freeCommentCount=" + freeCommentCount + ", freeCategory="
				+ freeCategory + ", mNo=" + mNo + ", nickname=" + nickname + ", commentCount=" + commentCount + "]";
	}

}
