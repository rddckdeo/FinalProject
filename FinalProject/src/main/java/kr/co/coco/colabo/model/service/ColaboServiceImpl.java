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
import kr.co.coco.colabo.model.dto.InviteProjectDTO;
import kr.co.coco.colabo.model.dto.ProjectPushDTO;
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


	public ColaboDTO getMemberInfo(int memberNo) {
		return colaboDAO.getMemberInfo(sqlSession, memberNo);
	}


	public int changeProjectType(ColaboDTO colabo) {
		return colaboDAO.changeProjectType(sqlSession, colabo);
	}


	public ColaboDTO getProjectType(int getProjectNo) {
		return colaboDAO.getProjectType(sqlSession, getProjectNo);
	}


	public List<ColaboDTO> getProjectProfile(int memberNo) {
		return colaboDAO.getProjectProfile(sqlSession, memberNo);
	}


	public int inviteProject(InviteProjectDTO invite) {
		return colaboDAO.inviteProject(sqlSession, invite);
	}


	public List<ColaboDTO> inviteApplyProject(int memberNo) {
		return colaboDAO.inviteApplyProject(sqlSession, memberNo);
	}


	public int inviteListCheck(InviteProjectDTO inviteListCheck) {
		return colaboDAO.inviteListCheck(sqlSession, inviteListCheck);
	}

	// 초대 승인눌렀을때 해당하는 프로젝트 팀원리스트에 넣고 
	// 넣음과동시에 초대테이블에서 해당하는데이터를 삭제해야하기때문에
	// 트랜잭션 사용
	@Transactional
	public int enrollProjectTeam(ColaboDTO colabo) {

		DefaultTransactionDefinition transactionDefinition = new DefaultTransactionDefinition();
		
		TransactionStatus status = transactionManager.getTransaction(transactionDefinition);
		
		try {
			// 승인일때 이미 프로젝트 팀원에 들어가있으면 다시 넣으면안되기때문에 
			// 확인후 없으면 로직실행
			int projectTeamCheck = projectTeamCheck(colabo);
			
			if(projectTeamCheck == 0) {
				
				int enrollResult = colaboDAO.enrollProjectTeam(sqlSession, colabo);
				
				if(enrollResult == 1) {
					int deleteResult = colaboDAO.deleteInviteList(sqlSession, colabo);
					
					if(deleteResult > 0) {
						// 이미 팀에 가입완료되었으니 신청리스트에 같은데이터있는지
						// 확인하고 Apply 테이블에서도 삭제
						deleteApplyList(colabo);
						transactionManager.commit(status);
						return deleteResult;
					}else {
						transactionManager.rollback(status);
					}
					
				}
				
			}
			
		}catch(Exception e) {
//			System.out.println("에러발생 롤백됨 ");
			transactionManager.rollback(status);
			throw e;
		}
		
		
		transactionManager.rollback(status);
		
		
		return 0;
	}


	public int deleteInviteList(ColaboDTO colabo) {
		return colaboDAO.deleteInviteList(sqlSession, colabo);
	}
	
	public int deleteApplyList(ColaboDTO colabo) {
		return colaboDAO.deleteApplyList(sqlSession, colabo);
	}

	public int projectTeamCheck(ColaboDTO colabo) {
		return colaboDAO.projectTeamCheck(sqlSession, colabo);
	}


	public List<ColaboDTO> applyProject(int memberNo) {
		return colaboDAO.applyProject(sqlSession, memberNo);
	}


	public List<ColaboDTO> receiveApplyProject(int memberNo) {
		return colaboDAO.receiveApplyProject(sqlSession, memberNo);
	}


	public List<ColaboDTO> getNProjectList() {
		return colaboDAO.getNProjectList(sqlSession);
	}


	public int enrollApplyProject(InviteProjectDTO apply) {
		return colaboDAO.enrollApplyProject(sqlSession, apply);
	}


	// 신청 승인을 눌렀을때 신청한 인원을 프로젝트 팀원 리스트에 넣고
	// 기존에 신청테이블에 있던데이터는 삭제해야하기때문에 트랜잭션사용
	@Transactional
	public int enrollApplyProjectTeam(ColaboDTO colabo) {
		
		DefaultTransactionDefinition transactionDefinition = new DefaultTransactionDefinition();
		
		TransactionStatus status = transactionManager.getTransaction(transactionDefinition);
		
		try {
			
			// 이미 팀에 들어있는지 체크
			int projectTeamCheck = projectTeamCheck(colabo);
			
			if(projectTeamCheck == 0) {
				
				// 프로젝트  팀원리스트에 넣기
				int enrollResult = colaboDAO.enrollProjectTeam(sqlSession, colabo);
				
				if(enrollResult == 1) {
					
					// 팀에 들어갔으니 기존 apply 테이블에서 데이터삭제
					int deleteResult = deleteApplyList(colabo);
					
					if(deleteResult > 0) {
						// 이미 팀에 가입완료되었으니 초대리스트에 같은데이터있는지
						// 확인하고 invite 테이블에서도 삭제
						deleteInviteList(colabo);
						transactionManager.commit(status);
						return deleteResult;
					}
				}
			}
		}catch(Exception e) {
//			System.out.println("에러발생 롤백됨 ");
			transactionManager.rollback(status);
			throw e;
		}
		
		
		
		transactionManager.rollback(status);
		
		return 0;
	}


	public int applyListCheck(InviteProjectDTO applyListCheck) {
		return colaboDAO.applyListCheck(sqlSession, applyListCheck);
	}


	public int projectPush(ProjectPushDTO push) {
		return colaboDAO.projectPush(sqlSession, push);
	}


	public List<Integer> getprojectList(ProjectPushDTO projectPush) {
		return colaboDAO.getprojectList(sqlSession, projectPush);
	}


	public List<ProjectPushDTO> getPushList(List<Integer> pushList) {
		return colaboDAO.getPushList(sqlSession, pushList);
	}


	public int changePushType(ProjectPushDTO push) {
		return colaboDAO.changePushType(sqlSession, push);
	}


	public int allChangePushType(ProjectPushDTO push) {
		return colaboDAO.allChangePushType(sqlSession, push);
	}


	public String getProjectName(int getProjectNo) {
		return colaboDAO.getProjectName(sqlSession, getProjectNo);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}






































