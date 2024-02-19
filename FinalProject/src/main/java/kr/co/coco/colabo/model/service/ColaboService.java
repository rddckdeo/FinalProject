package kr.co.coco.colabo.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.co.coco.colabo.common.paging.PageInfo;
import kr.co.coco.colabo.model.dto.ColaboDTO;
import kr.co.coco.colabo.model.dto.InviteProjectDTO;
import kr.co.coco.colabo.model.dto.ScheduleDTO;
import kr.co.coco.colabo.model.dto.SkillChartDTO;
import kr.co.coco.colabo.model.dto.TeamProjectPerSonDTO;

public interface ColaboService {
	
	// 프로젝트 공지 게시글 작성
	public int noticeEnroll(ColaboDTO colabo);
	
	// 페이징처리 게시글 카운트 가져오기
	public int selectListCount(ColaboDTO colabo);
	
	// 공지 게시글 리스트 가져오기
	public List<ColaboDTO> selectListAll(PageInfo pi, ColaboDTO colabo);
	
	// 공지 게시글 디테일
	public ColaboDTO noticeDetail(int noticeNo);
	
	// 공지 게시글 지우기
	public int noticeDelete(ColaboDTO colabo);
	
	// 공시 게시글 수정
	public int noticeEdit(ColaboDTO colabo);
	
	// 스케줄 데이터 넣기
	public int scheduleEnroll(ScheduleDTO schedule);
	
	// DB 저장된 스케줄 가져오기
	public List<ScheduleDTO> scheduleIO(ScheduleDTO schedule);
	
	// 스케줄 선택시 삭제 구현
	public int scheduleDelete(ScheduleDTO schedule);
	
	// 기능분담 데이터 가져오기
	public List<SkillChartDTO> skillChartGet(SkillChartDTO skillChart);
	
	// 프로젝트 가입된 인원 리스트 가져오기 
	public List<TeamProjectPerSonDTO> getProjectMember(TeamProjectPerSonDTO teamProject);
	
	// skillChart 기능추가 DB에 넣기
	public int enrollSkillList(SkillChartDTO skillChart);
	
	// skillChart 기능수정 DB List 가져오기
	public List<SkillChartDTO> getSkillMember(SkillChartDTO skillChart);
	
	// skillChart 기능 완료 퍼센트 수정
	public int editSkillList(SkillChartDTO skillChart);
	
	// skillChart 기능 리스트에서 삭제
	public int deleteSkillList(SkillChartDTO skillChart);
	
	// 전체 skillChart (front, back) 퍼센트 가져오기
	public HashMap<String, Object> allSkillChartGet(SkillChartDTO skillChart);
	
	// ------------------------프로젝트 생성관련 -----
	
	// 프로젝트 생성시 생성멤버 이름과 No 가져오기
	public ColaboDTO getMemberName(ColaboDTO colabo);
	
	// 프로젝트 생성 
	public int projectEnroll(ColaboDTO colabo);
	
	// 프로젝트 수정을위해 페이지 가기전 프로젝트넘버를 이용해 해당프로젝트의 컨텐츠들을 가져옴
	public ColaboDTO getProjectContent(int projectNo);
	
	// 프로젝트 수정
	public int projectEdit(ColaboDTO colabo);
	
	// 프로젝트 삭제
	public int projectDelete(ColaboDTO colabo);
	
	// 프로젝트 수정삭제시 프로젝트생성한 멤버넘버 가져오기
	public int getProjectCreateMember(int projectNo);
	
	// 가입되어있는 프로젝트 리스트 (프로젝트넘버, 프로젝트 이름) 들 가져오기 멤버세션사용
	public List<ColaboDTO> getProjectNameNumberList(int memberNo);
	
	// 기본개요 홈페이지에서 이메일로 검색후 인원 초대하기 
	public List<ColaboDTO> selectEmailMember(String selectText);
	
	// 채팅에서 보내는사람 이름 가져오기, 이메일도 넣음
	public ColaboDTO getMemberInfo(int memberNo);
	
	// colabo 베이직 페이지에서 프로젝트타입 진행중,완료 선택버튼
	public int changeProjectType(ColaboDTO colabo);
	
	// 프로젝트 타입 가져오기
	public ColaboDTO getProjectType(int getProjectNo);
	
	// 프로젝트에서 인원초대
	public int inviteProject(InviteProjectDTO invite);
}


















