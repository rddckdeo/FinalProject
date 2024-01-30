package kr.co.coco.colabo.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.coco.colabo.common.paging.PageInfo;
import kr.co.coco.colabo.model.dao.ColaboDAO;
import kr.co.coco.colabo.model.dto.ColaboDTO;
import kr.co.coco.colabo.model.dto.ScheduleDTO;
import kr.co.coco.colabo.model.dto.SkillChartDTO;
import kr.co.coco.colabo.model.dto.TeamProjectPerSonDTO;

@Service
public class ColaboServiceImpl implements ColaboService{

	@Autowired
	private ColaboDAO colaboDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	public int noticeEnroll(ColaboDTO colabo) {
		return colaboDAO.noticeEnroll(sqlSession, colabo);
	}


	public int selectListCount(ColaboDTO colabo) {
		return colaboDAO.selectListCount(sqlSession, colabo);
	}


	public List<ColaboDTO> selectListAll(PageInfo pi, ColaboDTO colabo) {
		return colaboDAO.selectListAll(sqlSession, pi, colabo);
	}


	public ColaboDTO noticeDetail(int noticeNo) {
		return colaboDAO.noticeDetail(sqlSession, noticeNo);
	}


	public int noticeDelete(ColaboDTO colabo) {
		return colaboDAO.noticeDelete(sqlSession, colabo);
	}


	public int noticeEdit(ColaboDTO colabo) {
		return colaboDAO.noticeEdit(sqlSession, colabo);
	}


	public int scheduleEnroll(ScheduleDTO schedule) {
		return colaboDAO.scheduleEnroll(sqlSession, schedule);
	}


	public List<ScheduleDTO> scheduleIO(ScheduleDTO schedule) {
		return colaboDAO.scheduleIO(sqlSession, schedule);
	}


	public int scheduleDelete(ScheduleDTO schedule) {
		return colaboDAO.scheduleDelete(sqlSession, schedule);
	}


	public List<SkillChartDTO> skillChartGet(SkillChartDTO skillChart) {
		return colaboDAO.skillChartGet(sqlSession, skillChart);
	}


	public List<TeamProjectPerSonDTO> getProjectMember(TeamProjectPerSonDTO teamProject) {
		return colaboDAO.getProjectMember(sqlSession, teamProject);
	}


	public int enrollSkillList(SkillChartDTO skillChart) {
		return colaboDAO.enrollSkillList(sqlSession, skillChart);
	}


	public List<SkillChartDTO> getSkillMember(SkillChartDTO skillChart) {
		return colaboDAO.getSkillMember(sqlSession, skillChart);
	}


	public int editSkillList(SkillChartDTO skillChart) {
		return colaboDAO.editSkillList(sqlSession, skillChart);
	}


	public int deleteSkillList(SkillChartDTO skillChart) {
		return colaboDAO.deleteSkillList(sqlSession, skillChart);
	}


	public HashMap<String, Object> allSkillChartGet(SkillChartDTO skillChart) {
		return colaboDAO.allSkillChartGet(sqlSession, skillChart);
	}

}






































