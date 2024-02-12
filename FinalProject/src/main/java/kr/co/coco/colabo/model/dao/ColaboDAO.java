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

}



























