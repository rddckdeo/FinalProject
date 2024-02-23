package kr.co.coco.admin.model.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class AdminBoardDTO {
	private int no;
	private String title;
	private String content;
	private int view;
	private String inDate;
	private String updateDate;
	private String deleteDate;
	private String answer;
	private String answerContent;
	private String answerDate;
	
	private int mNo;
	private String name;
	
	private String imageFilePath;
	private String imageFileName;

}
