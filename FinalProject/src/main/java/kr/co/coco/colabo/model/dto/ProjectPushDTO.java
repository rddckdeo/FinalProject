package kr.co.coco.colabo.model.dto;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor 
@AllArgsConstructor
public class ProjectPushDTO {
	
	private int pushNo;
	private String pushType;
	private String pushContent;
	private String pushDate;
	private char pushCheck;
	private int addMNo;
	private String addMName;
	private int receiveMNo;
	private int projectNo;
	private String projectName;
	private int memberNo;
	private String checkMNo;
	
	private List<Integer> projectNoList;
	private List<Integer> pushNoList;
	
}
