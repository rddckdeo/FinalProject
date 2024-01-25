package kr.co.coco.colabo.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.co.coco.colabo.common.paging.PageInfo;
import kr.co.coco.colabo.model.dto.ColaboDTO;
import kr.co.coco.colabo.model.dto.ScheduleDTO;

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
		System.out.println("DAO ㄴㅇㄹㄴㅁㄻㄴㅇㄹ");
		System.out.println(schedule.getProjectNo());
		System.out.println(schedule.getTitle());
		System.out.println(schedule.getStart());
		System.out.println(schedule.getEnd());
		return sqlSession.delete("colaboMapper.scheduleDelete", schedule);
	}

}
