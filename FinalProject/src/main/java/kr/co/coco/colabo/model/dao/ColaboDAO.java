package kr.co.coco.colabo.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.co.coco.colabo.common.paging.PageInfo;
import kr.co.coco.colabo.model.dto.ColaboDTO;
import kr.co.coco.colabo.model.dto.InviteProjectDTO;
import kr.co.coco.colabo.model.dto.ScheduleDTO;
import kr.co.coco.colabo.model.dto.SkillChartDTO;
import kr.co.coco.colabo.model.dto.TeamProjectPerSonDTO;

@Repository
public class ColaboDAO {

	public int noticeEnroll(SqlSessionTemplate sqlSession, ColaboDTO colabo) {
		return sqlSession.insert("colaboMapper.noticeEnroll", colabo);
	}

	public int selectListCount(SqlSessionTemplate sqlSession, ColaboDTO colabo) {
		return sqlSession.selectOne("colaboMapper.selectListCount", colabo);
	}

	public List<ColaboDTO> selectListAll(SqlSessionTemplate sqlSession, PageInfo pi, ColaboDTO colabo) {
		// 현재 페이지의 게시글을 불러오기 위한 변수
		int offset = (pi.getCpage()-1) * pi.getBoardLimit();
		
		// 작은 규모일 경우에만 사용하는것을 권장
		RowBounds rb = new RowBounds(offset, pi.getBoardLimit());
		
		return sqlSession.selectList("colaboMapper.selectListAll", colabo, rb);
	}

	public ColaboDTO noticeDetail(SqlSessionTemplate sqlSession, int noticeNo) {
		return sqlSession.selectOne("colaboMapper.noticeDetail", noticeNo);
	}

	public int noticeDelete(SqlSessionTemplate sqlSession, ColaboDTO colabo) {
		return sqlSession.delete("colaboMapper.noticeDelete", colabo);
	}

	public int noticeEdit(SqlSessionTemplate sqlSession, ColaboDTO colabo) {
		return sqlSession.update("colaboMapper.noticeEdit", colabo);
	}

	public int scheduleEnroll(SqlSessionTemplate sqlSession, ScheduleDTO schedule) {
		return sqlSession.insert("colaboMapper.scheduleEnroll", schedule);
	}

	public List<ScheduleDTO> scheduleIO(SqlSessionTemplate sqlSession, ScheduleDTO schedule) {
		return sqlSession.selectList("colaboMapper.scheduleIO", schedule);
	}

	public int scheduleDelete(SqlSessionTemplate sqlSession, ScheduleDTO schedule) {
		return sqlSession.delete("colaboMapper.scheduleDelete", schedule);
	}

	public List<SkillChartDTO> skillChartGet(SqlSessionTemplate sqlSession, SkillChartDTO skillChart) {
		return sqlSession.selectList("colaboMapper.skillChartGet", skillChart);
	}

	public List<TeamProjectPerSonDTO> getProjectMember(SqlSessionTemplate sqlSession,
			TeamProjectPerSonDTO teamProject) {
		return sqlSession.selectList("colaboMapper.getProjectMember", teamProject);
	}

	public int enrollSkillList(SqlSessionTemplate sqlSession, SkillChartDTO skillChart) {
		return sqlSession.insert("colaboMapper.enrollSkillList", skillChart);
	}

	public List<SkillChartDTO> getSkillMember(SqlSessionTemplate sqlSession, SkillChartDTO skillChart) {
		return sqlSession.selectList("colaboMapper.getSkillMember", skillChart);
	}

	public int editSkillList(SqlSessionTemplate sqlSession, SkillChartDTO skillChart) {
		return sqlSession.update("colaboMapper.editSkillList", skillChart);
	}

	public int deleteSkillList(SqlSessionTemplate sqlSession, SkillChartDTO skillChart) {
		return sqlSession.delete("colaboMapper.deleteSkillList", skillChart);
	}

	public HashMap<String, Object> allSkillChartGet(SqlSessionTemplate sqlSession, SkillChartDTO skillChart) {
		
		Double frontResult = sqlSession.selectOne("colaboMapper.frontSkillAvg", skillChart);
		Double backResult = sqlSession.selectOne("colaboMapper.backSkillAvg", skillChart);
		
		HashMap<String, Object> list = new HashMap<>();
		list.put("front", frontResult);
		list.put("back", backResult);
		
		return list;
	}

	public ColaboDTO getMemberName(SqlSessionTemplate sqlSession, ColaboDTO colabo) {
		return sqlSession.selectOne("colaboMapper.getMemberName", colabo);
	}

	public int projectEnroll(SqlSessionTemplate sqlSession, ColaboDTO colabo) {
		return sqlSession.insert("colaboMapper.projectEnroll", colabo);
	}

	public int projectTeamEnroll(SqlSessionTemplate sqlSession, TeamProjectPerSonDTO teamProject) {
		return sqlSession.insert("colaboMapper.projectTeamEnroll", teamProject);
	}

	public int getProjectNumber(SqlSessionTemplate sqlSession, ColaboDTO colabo) {
		return sqlSession.selectOne("colaboMapper.getProjectNumber", colabo);
	}

	public List<TeamProjectPerSonDTO> selectProjectList(SqlSessionTemplate sqlSession, int memberNo) {
		return sqlSession.selectList("colaboMapper.selectProjectList", memberNo);
	}

	public ColaboDTO getProjectContent(SqlSessionTemplate sqlSession, int projectNo) {
		return sqlSession.selectOne("colaboMapper.getProjectContent", projectNo);
	}

	public int projectEdit(SqlSessionTemplate sqlSession, ColaboDTO colabo) {
		return sqlSession.update("colaboMapper.projectEdit", colabo);
	}

	public int projectDelete(SqlSessionTemplate sqlSession, ColaboDTO colabo) {
		return sqlSession.delete("colaboMapper.projectDelete", colabo);
	}

	public boolean projectConnectDeleteAll(SqlSessionTemplate sqlSession, ColaboDTO colabo) {
		boolean result = false;
		
		int scheduleResult = sqlSession.delete("colaboMapper.AllScheduleDelete", colabo);
		int noticeResult = sqlSession.delete("colaboMapper.AllNoticeDelete", colabo);
		int skillResult = sqlSession.delete("colaboMapper.AllSkillDelete", colabo);
		int teamResult = sqlSession.delete("colaboMapper.AllTeamDelete", colabo);
		
//		System.out.println("스케줄 삭제결과 : " + scheduleResult);
//		System.out.println("스케줄 삭제결과 : " + noticeResult);
//		System.out.println("스케줄 삭제결과 : " + skillResult);
//		System.out.println("스케줄 삭제결과 : " + teamResult);
		
		if(scheduleResult >= 0 && noticeResult >= 0 &&
			skillResult >= 0 && teamResult >= 0) {
			result = true;
		}
		
		
		
		return result;
	}

	public int getProjectCreateMember(SqlSessionTemplate sqlSession, int projectNo) {
		return sqlSession.selectOne("colaboMapper.getProjectCreateMember", projectNo);
	}

	public List<ColaboDTO> getProjectNameNumberList(SqlSessionTemplate sqlSession, int memberNo) {
		return sqlSession.selectList("colaboMapper.getProjectNameNumberList", memberNo);
	}

	public List<ColaboDTO> selectEmailMember(SqlSessionTemplate sqlSession, String selectText) {
		return sqlSession.selectList("colaboMapper.selectEmailMember", selectText);
	}

	public ColaboDTO getMemberInfo(SqlSessionTemplate sqlSession, int memberNo) {
		return sqlSession.selectOne("colaboMapper.getMemberInfo", memberNo);
	}

	public int changeProjectType(SqlSessionTemplate sqlSession, ColaboDTO colabo) {
		return sqlSession.update("colaboMapper.changeProjectType", colabo);
	}

	public ColaboDTO getProjectType(SqlSessionTemplate sqlSession, int getProjectNo) {
		return sqlSession.selectOne("colaboMapper.getProjectType", getProjectNo);
	}

	public List<ColaboDTO> getProjectProfile(SqlSessionTemplate sqlSession, int memberNo) {
		return sqlSession.selectList("colaboMapper.getProjectProfile", memberNo);
	}

	public int inviteProject(SqlSessionTemplate sqlSession, InviteProjectDTO invite) {
		return sqlSession.insert("colaboMapper.inviteProject", invite);
	}

	public List<ColaboDTO> inviteApplyProject(SqlSessionTemplate sqlSession, int memberNo) {
		return sqlSession.selectList("colaboMapper.inviteApplyProject", memberNo);
	}

	public int inviteListCheck(SqlSessionTemplate sqlSession, InviteProjectDTO inviteListCheck) {
		return sqlSession.selectOne("colaboMapper.inviteListCheck", inviteListCheck);
	}

	public int enrollProjectTeam(SqlSessionTemplate sqlSession, ColaboDTO colabo) {
		return sqlSession.insert("colaboMapper.enrollProjectTeam", colabo);
	}

	public int deleteInviteList(SqlSessionTemplate sqlSession, ColaboDTO colabo) {
		return sqlSession.delete("colaboMapper.deleteInviteList", colabo);
	}

	public int projectTeamCheck(SqlSessionTemplate sqlSession, ColaboDTO colabo) {
		return sqlSession.selectOne("colaboMapper.projectTeamCheck", colabo);
	}

	public List<ColaboDTO> applyProject(SqlSessionTemplate sqlSession, int memberNo) {
		return sqlSession.selectList("colaboMapper.applyProject", memberNo);
	}

	public List<ColaboDTO> receiveApplyProject(SqlSessionTemplate sqlSession, int memberNo) {
		return sqlSession.selectList("colaboMapper.receiveApplyProject", memberNo);
	}

	public List<ColaboDTO> getNProjectList(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("colaboMapper.getNProjectList");
	}

	public int enrollApplyProject(SqlSessionTemplate sqlSession, InviteProjectDTO apply) {
		return sqlSession.insert("colaboMapper.enrollApplyProject", apply);
	}

	public int deleteApplyList(SqlSessionTemplate sqlSession, ColaboDTO colabo) {
		return sqlSession.delete("colaboMapper.deleteApplyList", colabo);
	}

	public int applyListCheck(SqlSessionTemplate sqlSession, InviteProjectDTO applyListCheck) {
		return sqlSession.selectOne("colaboMapper.applyListCheck", applyListCheck);
	}

}



























