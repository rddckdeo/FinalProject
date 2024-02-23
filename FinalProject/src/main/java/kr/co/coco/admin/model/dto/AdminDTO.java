package kr.co.coco.admin.model.dto;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class AdminDTO {
//	info
	// 게시글 및 댓글 공용
	private int boardNo;
	private String title;
	private String content;
	private Date date;
	private Date updateDate;
	private Date deleteDate;
	private int views;
	private String tag1;
	private String tag2;
	private String tag3;
	private String blind;
	private int commentCount;
	
	// info
	private String category;
	
	// 댓글 공용
	private int commentNo;
	
	// free_comment
	private String writer;
	
	// member 공용
	private int mNo;
	private String name;
	private String id;
}
