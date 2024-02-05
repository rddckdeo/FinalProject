package kr.co.coco.colabo.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.DefaultTransactionDefinition;

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
	
	@Autowired
	private PlatformTransactionManager transactionManager;
	
	
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


	public ColaboDTO getMemberName(ColaboDTO colabo) {
		return colaboDAO.getMemberName(sqlSession, colabo);
	}

	
	// 프로젝트 생성시 생성한인원은 자동으로 프로젝트멤버로 들어가야하기때문에 
	// 동시에 해당쿼리들이 작성할수있게 트랜잭션 사용
	@Transactional
	public int projectEnroll(ColaboDTO colabo) {
		
		DefaultTransactionDefinition transactionDefinition = new DefaultTransactionDefinition();
		
		TransactionStatus status = transactionManager.getTransaction(transactionDefinition);
		
		try {
		
		int projectEnrollresult = colaboDAO.projectEnroll(sqlSession, colabo);
		
		// System.out.println("프로젝트 생성 결과 : " + projectEnrollresult);
		if(projectEnrollresult == 1) {
			
			// 프로젝트 생성완료한뒤에 그 해당 프로젝트의 넘버를 가져와야함
			int getProjectNumber = colaboDAO.getProjectNumber(sqlSession, colabo); 
			
			// System.out.println("생성된 프로젝트 넘버 가져온결과 : "+ getProjectNumber);
			
			TeamProjectPerSonDTO teamProject = new TeamProjectPerSonDTO();
			teamProject.setProjectNo(getProjectNumber);
			teamProject.setMemberNo(colabo.getMemberNo());
			teamProject.setMemberName(colabo.getMemberName());
			teamProject.setMemberEmail(colabo.getMemberEmail());
			
			int projectPersonEnroll = colaboDAO.projectTeamEnroll(sqlSession, teamProject);
			
			// System.out.println("프로젝트 인원추가 결과 : " + projectPersonEnroll);
				if(projectPersonEnroll == 1) {
					transactionManager.commit(status);
					return projectPersonEnroll;
				}else {
					transactionManager.rollback(status);
				}
			}
		}catch(Exception e) {
			transactionManager.rollback(status);
			throw e;
		}
		return 0;
		
	}


	public List<TeamProjectPerSonDTO> selectProjectList(int memberNo) {
		return colaboDAO.selectProjectList(sqlSession, memberNo);
	}


	public ColaboDTO getProjectContent(int projectNo) {
		return colaboDAO.getProjectContent(sqlSession, projectNo);
	}


	public int projectEdit(ColaboDTO colabo) {
		return colaboDAO.projectEdit(sqlSession, colabo);
	}

	
	// 프로젝트 삭제부분은 그 프로젝트에 해당하는 데이터들을 모두 삭제해야하기
	// 때문에  트랜잭션 사용
	@Transactional
	public int projectDelete(ColaboDTO colabo) {
		
		DefaultTransactionDefinition transactionDefinition = new DefaultTransactionDefinition();

		
		TransactionStatus status = transactionManager.getTransaction(transactionDefinition);
		
		try {
			boolean result = colaboDAO.projectConnectDeleteAll(sqlSession ,colabo);
			
//			System.out.println("내부연결된 사항들 삭제결과는 : "+result);
			
			if(result) {
				
				int projectDeleteResult = colaboDAO.projectDelete(sqlSession, colabo);
				
//				System.out.println("프로젝트 삭제결과 : "+ projectDeleteResult);
				if(projectDeleteResult == 1) {
					transactionManager.commit(status);
					return projectDeleteResult;
				}else {
//					System.out.println("롤백됨 ");
					transactionManager.rollback(status);
				}
				
			}
		}catch(Exception e) {
//			System.out.println("에러발생 롤백됨 ");
			transactionManager.rollback(status);
			throw e;
		}
		
		return 0;
		
	}


	public int getProjectCreateMember(int projectNo) {
		return colaboDAO.getProjectCreateMember(sqlSession, projectNo);
	}


	public List<ColaboDTO> getProjectNameNumberList(int memberNo) {
		return colaboDAO.getProjectNameNumberList(sqlSession, memberNo);
	}


	public List<ColaboDTO> selectEmailMember(String selectText) {
		return colaboDAO.selectEmailMember(sqlSession, selectText);
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}






































