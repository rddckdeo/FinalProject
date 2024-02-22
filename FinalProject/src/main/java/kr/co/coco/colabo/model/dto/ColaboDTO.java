package kr.co.coco.colabo.model.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor // 기본 생성자 (매개변수없는생성자)
@AllArgsConstructor // 매개변수 다 들어가있는 생성자
@ToString
public class ColaboDTO {
	
	// 멤버관련 변수 
	private int memberNo;
	private String memberEmail;
	private String memberHope;
	private String memberStack;
	private String memberNickname;
	private String memberPhone;
	
	// 프로젝트 관련 변수
	private int no;
	private String subject;
	private String name;
	private String detail;
	private String stack;
	private int personCount;
	private String period;
	private String stateKor;
	private char state;
	private String startDate;
	private String endDate;
	
	
	// 프로젝트 팀원 변수
	private String memberName;
	private String teamEnrollDate;
	
	
	// 프로젝트 팀 공지게시판 변수
	
	private int noticeNo;
	private String noticeTitle;
	private String noticeContent;
	private String noticeDate;
	private int noticeViews;
	
	
	// 공용 파일 업로드
	
	private String uploadPath; // 파일경로
	private String uploadName; // 수정된 파일 이름
	private String uploadOriginName; // 원본 파일 이름
	
	
	
	// 초대받은 프로젝트 DTO 
	
	private int inviteMNo;
	private String inviteProjectDate;
//	private String confirmText;
	
	// 신청받은 프로젝트 DTO
	
	private int applyMNo;
	private String applyProjectDate;
	
	
	
	
	
	
}
