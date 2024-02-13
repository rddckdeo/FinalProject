package kr.co.coco.member.model.dto;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MemberDTO {
	private int no;
	private String name;
	private String id;
	private String pwd;
	private String pwdAgain;
	private String email;
	private String type;
	private String nickname;
	private String picture;
	private String path;
	private String hope;
	private String stack;
	private String intro;
	private String inDate;
	private String deleteDate;
	private String loginDate;
	private String stop;
	private String stopDate;
	private String number;
	
	private String loginDay;
}
