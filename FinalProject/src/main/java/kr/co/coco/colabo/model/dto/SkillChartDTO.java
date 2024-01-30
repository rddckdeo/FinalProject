package kr.co.coco.colabo.model.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor 
@AllArgsConstructor
public class SkillChartDTO {

	private int projectNo;
	private int memberNo;
	private String memberName;
	private String memberEmail;
	private String pmSkillName;
	private int pmSkillFull;
	private String pmSkillColor;
	private String pmSkillCategory;
	
	// 메인페이지  전체 퍼센트 리스트 가져오기위한 변수
	private String front = "front";
	private String back = "back";
	
	
}
