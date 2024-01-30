package kr.co.coco.colabo.model.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor 
@AllArgsConstructor
public class TeamProjectPerSonDTO {

	private int projectNo;
	private int memberNo;
	private String memberName;
	private String memberEmail;
	private String teamEnrollDate;
	
	
	
}
