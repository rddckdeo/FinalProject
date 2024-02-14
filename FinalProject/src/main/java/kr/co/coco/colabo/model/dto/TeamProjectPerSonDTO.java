package kr.co.coco.colabo.model.dto;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor 
@AllArgsConstructor
public class TeamProjectPerSonDTO implements Serializable {

	private int projectNo;
	private String projectName;
	private int memberNo;
	private String memberName;
	private String memberEmail;
	private String teamEnrollDate;
	
	
	
}
