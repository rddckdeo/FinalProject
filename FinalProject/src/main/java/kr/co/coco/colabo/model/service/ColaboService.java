package kr.co.coco.colabo.model.service;

import java.util.List;

import kr.co.coco.colabo.common.paging.PageInfo;
import kr.co.coco.colabo.model.dto.ColaboDTO;
import kr.co.coco.colabo.model.dto.ScheduleDTO;

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
}
