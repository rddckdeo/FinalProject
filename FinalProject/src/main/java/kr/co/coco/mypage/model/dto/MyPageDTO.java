package kr.co.coco.mypage.model.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor

public class MyPageDTO {
	
	
	private int no;
	private String name;
	private String id;
	private String pwd;
	private String pwdAgain;
	private String email;
	private int type;
	private String nickname;
	private String picture;
	private String path;
	private String hope;
	private String[] hopeList;
	private String stack;
	private String intro;
	private Date inDate;
	private Date deleteDate;
	private Date loginDate;
	private String stop;
	private Date stopDate;
	private String number;
	
	private String imageFileName;
	private String imageFilePath;
	
    private String infoCommentWriter;  
    private String infoTitle; 
	private String freeTitle;
	
	
	@Override
	public String toString() {
		return "MyPageDTO [no=" + no + ", name=" + name + ", id=" + id + ", pwd=" + pwd + ", pwdAgain=" + pwdAgain
				+ ", email=" + email + ", type=" + type + ", nickname=" + nickname + ", picture=" + picture + ", path="
				+ path + ", hope=" + hope + ", stack=" + stack + ", intro=" + intro + ", inDate=" + inDate
				+ ", deleteDate=" + deleteDate + ", loginDate=" + loginDate + ", stop=" + stop + ", stopDate="
				+ stopDate + ", number=" + number + "]";
	}
	
	
	
	
}
