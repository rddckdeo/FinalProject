package kr.co.coco.boardPush.model.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BoardPushDTO {
	private int pushNo;
	private int mNo;
	private String pushType;
	private String pushContent;
	private String pushCheck;
	private String pushIndate;
	private String boardType;
	private int boardNo;
	private String pushWriter;
	
	private int comment_no;
	
}
