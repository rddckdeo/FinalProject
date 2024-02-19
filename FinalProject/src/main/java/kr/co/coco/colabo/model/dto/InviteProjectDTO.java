package kr.co.coco.colabo.model.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor 
@AllArgsConstructor
public class InviteProjectDTO {
	
	private int projectNo;
	private int memberNo;
	private int inviteMNo;
	private String inviteProjectDate;
	private String confirmText;
	private int applyMNo;
	private String applyProjectDate;

	
	
}
