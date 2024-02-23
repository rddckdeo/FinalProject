package kr.co.coco.colabo.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;

import kr.co.coco.colabo.common.paging.PageInfo;
import kr.co.coco.colabo.common.paging.Pagination;
import kr.co.coco.colabo.common.upload.UploadFile;
import kr.co.coco.colabo.common.validation.DataValidation;
import kr.co.coco.colabo.model.dto.ColaboDTO;
import kr.co.coco.colabo.model.dto.InviteProjectDTO;
import kr.co.coco.colabo.model.dto.ProjectPushDTO;
import kr.co.coco.colabo.model.dto.ScheduleDTO;
import kr.co.coco.colabo.model.dto.SkillChartDTO;
import kr.co.coco.colabo.model.dto.TeamProjectPerSonDTO;
import kr.co.coco.colabo.model.service.ColaboServiceImpl;

@Controller
@RequestMapping("/colabo")
public class ColaboMainController {
	
	@Autowired
	private ColaboServiceImpl colaboService;
	
	
	@GetMapping("")
	public String enterColabo(Model model, HttpSession session) {
		
		// 최초에 colabo 페이지 들어왔을대 default 값으로 getProjectNo 을 0으로 넣어놈
		session.setAttribute("getProjectNo", 0);
		session.setAttribute("getProjectName", "이름이 없습니다");
//		System.out.println(session.getAttribute("getProjectNo"));
//		session.setAttribute("no", 1); // 나중에 멤버넘버 로그인했을때 생긴 세션으로 처리하기
		int memberNo =  (int)session.getAttribute("no");
		
//		if(memberNo == 0) {
//			return "";
//		}
		
		List<TeamProjectPerSonDTO> projectList = colaboService.selectProjectList(memberNo);
		
		session.setAttribute("projectList", projectList);
		
		return "colabo/colaboPage";
	}
	
	@GetMapping("/Chat")
	public String enterChat() {
		
		return "colabo/Chat";
	}
	
	@PostMapping("/getProjectSession.do")
	@ResponseBody
	public String getProjectSession(@RequestParam("projectNo")int projectNo,HttpSession session) {
		
		
		// 배너에 생성되어있는 프로젝트를 선택했을때 projectNo 기존에있던 세션제거 새로생성
		session.removeAttribute("getProjectNo");
		session.removeAttribute("getProjectName");
		
		String projectName = colaboService.getProjectName(projectNo);
		
		session.setAttribute("getProjectNo", projectNo);
		session.setAttribute("getProjectName", projectName);
//		System.out.println("가져온 넘버는 : "+projectNo);
		
		return "";
	}
	
	@PostMapping("/getPushProjectSession.do")
	@ResponseBody
	public String getPushProjectSession(@RequestParam(value="projectNo", defaultValue="0")int projectNo,HttpSession session) {
		
		// 포스트요청 들어옴
		getProjectSession(projectNo,session);
		
		
		return "";
	}
	
	
	@PostMapping("/getProjectNameNumberList.do")
	@ResponseBody
	public List<HashMap<String, Object>> getProjectNameNumberList(HttpSession session) {
		
		int memberNo =  (int)session.getAttribute("no");
		
		// 처음 협업페이지에 내가 지금 가입된 프로젝트들의 진행도를 나타낼수있는 리스트 만들기
				// 멤버넘버로 프로젝트 리스트 가져오는데 프로젝트의 이름들도 가져와야함. 
				// colaboDTO 로 프로젝트 넘버와 이름을 담아서 가져옴
				List<ColaboDTO> getProjectNameNumberList = colaboService.getProjectNameNumberList(memberNo);
				
//				System.out.println(getProjectNameNumberList.size());
//				System.out.println(getProjectNameNumberList.get(0).getNo());
//				System.out.println(getProjectNameNumberList.get(0).getName());
//				System.out.println(getProjectNameNumberList.size());
				
				List<HashMap<String, Object>> resultList = new ArrayList<>();
				SkillChartDTO skillChart = new SkillChartDTO();
				
				for(int i=0; i<getProjectNameNumberList.size(); i++) {
					skillChart.setProjectNo(getProjectNameNumberList.get(i).getNo());
					
					HashMap<String, Object> list = colaboService.allSkillChartGet(skillChart);
					// front back 을 합치고 평균을 낸 전체 달성도 변수
					double allResult = 0;
					if(list != null) {
						if(list.get("front") != null && list.get("back") != null) {
							
							allResult = Math.ceil(((double)list.get("front")+(double)list.get("back"))/2);
						}else if(list.get("front") == null && list.get("back") != null) {
							allResult = Math.ceil((double)list.get("back")/2);
							
						}else if(list.get("back") == null && list.get("front") != null) {
							allResult = Math.ceil((double)list.get("front")/2);
							
						}else {
							allResult = 0;
						}
						list.put("projectName", getProjectNameNumberList.get(i).getName());
						list.put("allResult", allResult);
						
					}else {
						list.put("projectName", "noList");
						list.put("allResult", 0);
						
					}
					resultList.add(list);
					
//					System.out.println("list 는 : " + list);
				
				}
//				System.out.println("resultList 결과는 : "+resultList.get(0));
//				System.out.println("resultList 결과는 : "+resultList.get(1));
//				System.out.println("resultList 결과는 : "+resultList.get(2));
				
		
		return resultList;
	}
	
	
	
	
	// 프로젝트생성 누를때 기존에 생성되어있는 memeberNo session 을 이용해서 프로젝트
	// 생성자 이름을 넣을에정. get매핑이라 가져오고난뒤 생성버튼을 눌렀을때의 로직을 실행할때
	// 거기서 다시한번 가져와서 생성시 memberNo 을 다시생성해서 거기서 가져온 이름과 비교 후 로직실행하게
	@GetMapping("/projectEnroll")
	public String getProjectMember(Model model, HttpSession session) {
		
		ColaboDTO colabo = new ColaboDTO();
		colabo.setMemberNo((int)session.getAttribute("no"));  // 나중에 세션으로 멤버넘버 가져오기 ********
		
		// 멤버의 이름과 멤버no 가져오기
		ColaboDTO list = colaboService.getMemberName(colabo); 
		
		model.addAttribute("list", list);
		
		
		return "colabo/projectEnroll";
	}
	
	@GetMapping("/projectEditForm")
	public String projectEdit(HttpSession session, Model model) {
		
		int projectNo = (int)session.getAttribute("getProjectNo");
		
		ColaboDTO colabo = colaboService.getProjectContent(projectNo);
		
		model.addAttribute("list", colabo);
		
		return "colabo/projectEdit";
	}
	
	@PostMapping("/projectEdit.do")
	public String projectEdit(MultipartFile upload, ColaboDTO colabo, HttpSession session) {
		
		String submitPage = "error/errorPage";
		
		// 이용하고있는회원의 멤버넘버랑 프로젝트넘버를가지고 DB에 프로젝트 저장되어있는 멤버와 프로젝트넘버가 일치하는지 확인
		 int projectNo = (int)session.getAttribute("getProjectNo");
		
		colabo.setNo(projectNo);
		
		// 프로젝트 생성멤버
		int projectCreateMember = colaboService.getProjectCreateMember(projectNo);
		
		// 로그인한 멤버
		int loginMember = (int)session.getAttribute("no");
		
		// 수정 삭제하는 인원이 프로젝트를 생성한 인원인지 확인 후 수정삭제진행
		if(projectCreateMember == loginMember) {
			
				// 파일관련 수정은 프로젝트 수정일때만    삭제일때는 파일삭제하는 Delete 메소드만 실행
				if(colabo.getStateKor().equals("프로젝트수정")) {
					
					
					List<Object> arrayList = new ArrayList<>();
					arrayList.add(colabo.getSubject());
					arrayList.add(colabo.getName());
					arrayList.add(colabo.getDetail());
					arrayList.add(colabo.getStack());
					arrayList.add(colabo.getPersonCount());
					arrayList.add(colabo.getPeriod());
					
					// 글작성 내용들 제한 두기 
					List<Integer> limitNumberlist = new ArrayList<>(); 
					limitNumberlist.add(200);
					limitNumberlist.add(200);
					limitNumberlist.add(500);
					
					// 비어있는지 체크
					boolean emptyListCheckResult = DataValidation.emptyListCheck(arrayList);
					
					// 입력한 내용들이 일정 범위를 넘어가는지 조회
					boolean validationResult =  DataValidation.CheckListLength(limitNumberlist, arrayList);
					
					System.out.println("비어있는지 체크 : "+ emptyListCheckResult);
					System.out.println("일정범위 넘어가는지 조회 : "+ validationResult);
					
//					System.out.println("업로드 올린 파일이 비어있는지 체크 : "+upload.isEmpty());
//					System.out.println("업로드파일 보내는 이름이 비어있는지 체크 : "+colabo.getUploadName().isEmpty());
//					
//					System.out.println("히든타입의 업로드이름 내용 : "+ colabo.getUploadName());
					
					// 비어있는지 확인, 제한된 글자수를 넘어가는지 확인
					if(emptyListCheckResult && validationResult) {
						
						// 수정시 업로드된 파일이 있는지 여부, DB에 이미 저장된 파일이 있는지 여부에 따라 조건문
						if(!upload.isEmpty() && !colabo.getUploadName().isEmpty()) {
							// 업로드파일이 있고  DB에 이미 저장된 파일이 있을시
							UploadFile.deleteFile(colabo.getUploadName());
							UploadFile.uploadMethod(upload, colabo);
	//						System.out.println("둘다 비어있지않음 실행 ");
						}else if(!upload.isEmpty() && colabo.getUploadName().isEmpty()){
							// 업로드파일이 있고  DB에 저장된 파일이 없을시
							UploadFile.uploadMethod(upload, colabo);
	//						System.out.println("업로드파일 있고  DB에 값은 비어있음 실행 ");
						}
						// 이제 업로드 파일이 있을땐 다 처리를하였지만 업로드파일이 없는데 DB엔 있을때는 
						// mapper 에서 쿼리문을 작성할때  uploadPath 로 조건문을 돌린다. 이유는
						// 파일이있을땐 이미 업로드되어있는 이름이 hidden 으로 서버쪾으로 넘어오기때문에
						// 항상 들어있게되어서 업로드가 있는것처럼 쿼리문이 실행된다.
						// 업로드파일이 없을땐  UploadFile클래스가 실행이 안되기때문에 uploadName 을 제외하고는 다 비어있다.
						
						int result = colaboService.projectEdit(colabo);
						
						if(result == 1 ) {
							submitPage = "redirect:/colabo/colaboBasicPage";
						}else {
							submitPage = "error/errorPage";
						}
					
					}else {
						submitPage = "error/errorPage";
					}
					// 삭제같은경우 프로젝트를 지우게되면  그 해당 프로젝트에대한
					// 스케줄, 게시판, 프로젝트 기술, 팀원들이 남아있기때문에 Serivce 단에서 트랜잭션
					// 사용해서 스케줄데이터, 게시판데이터, 프로젝트 기술목록,
					// 팀원목록 삭제와 같이 진행할예정
				}else if(colabo.getStateKor().equals("프로젝트삭제")) {
					
					// 삭제일경우   기존에 업로드된 파일이 있을때와 없을때 구분
					// 있을때는 파일을 삭제하는 메소드만 추가해서 실행
					if(!colabo.getUploadName().isEmpty()) {
						UploadFile.deleteFile(colabo.getUploadName());
					}
					
					int result = colaboService.projectDelete(colabo);
					
					if(result == 1 ) {
						submitPage = "redirect:/colabo";
					}else {
						submitPage = "error/errorPage";
					}
					
					
				}
			
		}
		
		
		
		return submitPage;
	}
	
	
	@PostMapping("/projectEnroll.do")
	public String projectEnroll(MultipartFile upload, ColaboDTO colabo) {
		
		
		List<Object> arrayList = new ArrayList<>();
		arrayList.add(colabo.getSubject());
		arrayList.add(colabo.getName());
		arrayList.add(colabo.getDetail());
		arrayList.add(colabo.getStack());
		arrayList.add(colabo.getPersonCount());
		arrayList.add(colabo.getPeriod());
		
		// 글작성 내용들 제한 두기 
		List<Integer> limitNumberlist = new ArrayList<>(); 
		limitNumberlist.add(200);
		limitNumberlist.add(200);
		limitNumberlist.add(500);
		
		// 비어있는지 체크
		boolean emptyListCheckResult = DataValidation.emptyListCheck(arrayList);
		
		// 입력한 내용들이 일정 범위를 넘어가는지 조회
		boolean validationResult =  DataValidation.CheckListLength(limitNumberlist, arrayList);
		
		
		if(emptyListCheckResult && validationResult) {
		
			if(!upload.isEmpty()) {
				UploadFile.uploadMethod(upload, colabo);
			}
			
			// 클라이언트가 프로젝트 생성 버튼의 value 값을 수정안했을때 만 가능
			if(colabo.getStateKor().equals("프로젝트생성")) {
				colabo.setState('N');
				int result = colaboService.projectEnroll(colabo);
				
				if(result == 1) {
					return  "redirect:/colabo";
				}else {
					return "error/errorPage";
				}
				
			}else {
				
				return "error/errorPage";
			}
		
		}
		return "error/errorPage";
		
		
	}
	
	
	// 기본개요 페이지로 이동 하면서 DB에 있는 팀원 리스트를 가져와서 넘겨줌과 동기적으로 나타나게 함 
	// 현재 프로젝트의 진행 Type 가져오기 추가
	@GetMapping("/colaboBasicPage")
	public String BasicPage(Model model,HttpSession session) {
		
		// DB 에서 Char형으로 저장되어있는 값을가지고 jsp 단에 해당하는내용으로 변경후 보내기위한 변수
		String sendType = "";
		int getProjectNo = (int)session.getAttribute("getProjectNo");
		
		// 현재의 프로젝트 타입을 가져오기 
		ColaboDTO colabo = colaboService.getProjectType(getProjectNo);
		
		if(colabo.getState() == 'N') {
			sendType = "진행 전 입니다.";
		}else if(colabo.getState() == 'C') {
			sendType = "진행 중 입니다.";
		}else if(colabo.getState() == 'Y') {
			sendType = "완료 입니다.";
		}
		
		
//		System.out.println("colabo Type 은 : "+ colabo.getState());
		
		TeamProjectPerSonDTO teamProject = new TeamProjectPerSonDTO();
		teamProject.setProjectNo(getProjectNo);   //  프로젝트 넘버 세션으로 가져와서 수정
		
		
		List<TeamProjectPerSonDTO> list = colaboService.getProjectMember(teamProject); 
		
		for(TeamProjectPerSonDTO item : list) {
			String enrollDate = item.getTeamEnrollDate().substring(0,10);
			item.setTeamEnrollDate(enrollDate);
		}
		
		model.addAttribute("colabo", colabo);
		model.addAttribute("list", list);
		model.addAttribute("sendType", sendType);
		
		return "colabo/colaboBasic";
	}
	@GetMapping("/colaboSchedule")
	public String Schedule(HttpSession session, Model model) {
		return "colabo/colaboSchedule";
	}
	@GetMapping("/colaboDraw")
	public String colaboDraw(HttpSession session, Model model) {
		return "colabo/colaboDraw";
	}
	@GetMapping("/colaboSkill")
	public String colaboSkill() {
		return "colabo/colaboSkill";
	}
	
	// 콜라보 팀 공지 페이지 가기
	@GetMapping("/colaboNotice")
	public String colaboNotice(ColaboDTO colabo, 
							@RequestParam(value="cpage", defaultValue="1")int cpage,
							Model model,
							HttpSession session) {
		
		int getProjectNo = (int)session.getAttribute("getProjectNo");
		
		// 전체공지글을 보여주는게 아니라 프로젝트마다 따로만들것이기때문에  p_no 을 가져와야함 
		// 지금은 임의로 정해서 할 에정
		colabo.setNo(getProjectNo);
		
		
		int listCount = colaboService.selectListCount(colabo);
		int pageLimit = 5;
		int boardLimit = 5;
		
		// 게시글 번호
		int row = listCount - (cpage-1) * boardLimit;
		
		PageInfo pi = Pagination.getPageInfo(listCount, cpage, pageLimit, boardLimit);
		
		// 목록 불러오기
		List<ColaboDTO> list = colaboService.selectListAll(pi, colabo);
		
		// 프로젝트 이름 가져오기
		String projectName = colaboService.getProjectName(getProjectNo);
		
		// 게시글 없는 프로젝트에서 공지부분 들어가게되면 nullpointException 나옴
		if(!list.isEmpty()) {
			for(ColaboDTO item : list) {
				String noticeDate = item.getNoticeDate().substring(0,10);
				item.setNoticeDate(noticeDate);
			}
			
			model.addAttribute("projectName", projectName);
			model.addAttribute("row", row);
			model.addAttribute("list", list);
			model.addAttribute("pi", pi);
			
		}else {
			model.addAttribute("projectName", projectName);
			model.addAttribute("row", row);
			model.addAttribute("list", list);
			model.addAttribute("pi", pi);
			
		}
		
		
		return "colabo/colaboNotice";
	}
	@GetMapping("/enterNoticePage")
	public String colaboEnterNoticePage() {
		return "colabo/colaboNoticeEnroll";
	}
	
	
	@PostMapping("/noticeEnroll.do")
	public String noticeEnroll(ColaboDTO colabo, HttpSession session) {
		int getProjectNo = (int)session.getAttribute("getProjectNo");
		
		colabo.setNo(getProjectNo);
		colabo.setMemberNo((int)session.getAttribute("no")); // 나중에 세션으로
		
		// 게시글 비었는지, 글자수제한 확인
		List<Object> arrayList = new ArrayList<>();
		arrayList.add(colabo.getNoticeTitle());
		arrayList.add(colabo.getNoticeContent());
		
		// 글작성 내용들 제한 두기 
		List<Integer> limitNumberlist = new ArrayList<>(); 
		limitNumberlist.add(100);
		limitNumberlist.add(500);
		
		// 비어있는지 체크
		boolean emptyListCheckResult = DataValidation.emptyListCheck(arrayList);
		
		// 입력한 내용들이 일정 범위를 넘어가는지 조회
		boolean validationResult =  DataValidation.CheckListLength(limitNumberlist, arrayList);
		
		if(emptyListCheckResult && validationResult) {
			int result = colaboService.noticeEnroll(colabo);
			
			if(result == 1) {
				return  "redirect:/colabo/colaboNotice";
			}else {
				return "error/errorPage";
			}
			
		}else {
			return "error/errorPage";
		}
		
		
	}
	
	@GetMapping("/noticeDetail.do")
	public String noticeDetail(@RequestParam(value="noticeNo")int noticeNo ,Model model) {
		
		
		ColaboDTO list = colaboService.noticeDetail(noticeNo);
		
		model.addAttribute("list", list);
		
		return "colabo/colaboNoticeDetail";
	}
	
	@GetMapping("/enterNoticeEdit")
	public String enterNoticeEdit(@RequestParam(value="noticeNo")int noticeNo ,Model model) {
		ColaboDTO list = colaboService.noticeDetail(noticeNo);
		
		model.addAttribute("list", list);
		
		return "colabo/colaboNoticeEdit";
	}
	
	@PostMapping("/noticeDelete.do")
	@ResponseBody
	public String noticeDelete(ColaboDTO colabo) {
		
		int result = colaboService.noticeDelete(colabo);
		
		
		if(result == 1) {
			return "success";
		}else {
			return "failed";
		}
		
	}
	
	@PostMapping("/noticeEdit.do")
	public String noticeEdit(ColaboDTO colabo) {
		
		// 게시글 비었는지, 글자수제한 확인
		List<Object> arrayList = new ArrayList<>();
		arrayList.add(colabo.getNoticeTitle());
		arrayList.add(colabo.getNoticeContent());
		
		// 글작성 내용들 제한 두기 
		List<Integer> limitNumberlist = new ArrayList<>(); 
		limitNumberlist.add(100);
		limitNumberlist.add(500);
		
		// 비어있는지 체크
		boolean emptyListCheckResult = DataValidation.emptyListCheck(arrayList);
		
		// 입력한 내용들이 일정 범위를 넘어가는지 조회
		boolean validationResult =  DataValidation.CheckListLength(limitNumberlist, arrayList);
		
				if(emptyListCheckResult && validationResult) {
				
					int result = colaboService.noticeEdit(colabo);
					
					if(result == 1) {
						return "redirect:/colabo/colaboNotice";
					}else {
						return "error/errorPage";
					}
				}else {
					return "error/errorPage";
				}
	}
	
	@PostMapping("/schedule.do")
	@ResponseBody
	public ArrayList<Map<String, String>> scheduleIO(HttpSession session) {
		
		int getProjectNo = (int)session.getAttribute("getProjectNo");
		ScheduleDTO schedule = new ScheduleDTO();
		
		schedule.setProjectNo(getProjectNo);   // 나중에 프로젝트넘버 받아서 넣기
		
		List<ScheduleDTO> scheduleList = colaboService.scheduleIO(schedule);
		
		ArrayList<Map<String, String>> list = new ArrayList<>();
		
		
//		
		for(int i= 0; i<scheduleList.size(); i++) {
			Map<String, String> map = new HashMap<>();
			map.put("title", scheduleList.get(i).getTitle());
			map.put("start", scheduleList.get(i).getStart());
			map.put("end", scheduleList.get(i).getEnd());
			list.add(map);
		}
		
		
		return list;
	}
	
	@PostMapping("/scheduleEnroll.do")
	@ResponseBody
	public String scheduleEnroll(ScheduleDTO inputSchedule, HttpSession session) {
		
		int getProjectNo = (int)session.getAttribute("getProjectNo");
		
		
		// 비어있는지 체크
		boolean emptyCheckResult = DataValidation.emptyOneCheck(inputSchedule.getTitle());
		
		// 입력한 내용들이 일정 범위를 넘어가는지 조회
		boolean validationResult =  DataValidation.CheckOneLength(inputSchedule.getTitle(), 40);
		
		System.out.println("비어있는지 체크 : "+ emptyCheckResult);
		System.out.println("범위넘어가는지 체크 : "+ validationResult);
		
		if(emptyCheckResult && validationResult) {
			
			// 파라미터 가져올때 객체가 생성되어있어서  그상태로  setProjectNo(1)을하게되면
			// 이미 생성된 객체엔 접근할수가없어서 새로 객체생성후 로직실행
			ScheduleDTO schedule = new ScheduleDTO();
			
			schedule.setProjectNo(getProjectNo);  //  후에 프로젝트넘버 가져오기
			
			
			schedule.setTitle(inputSchedule.getTitle());
			schedule.setStart(inputSchedule.getStart());
			schedule.setEnd(inputSchedule.getEnd());
			
			Date startDate = new Date(schedule.getStart());
			Date endDate = new Date(schedule.getEnd());
			
			// 월에서 일정작성하는것과  일단위로 시간 포함 일정작성 하는것 구별
			SimpleDateFormat simple;
			
			if(startDate.toString().substring(11, 16).equals("00:00")) {
				simple = new SimpleDateFormat("yyyy-MM-dd");
			}else {
				simple = new SimpleDateFormat("yyyy-MM-dd HH:mm");
			}
			
			schedule.setStart(simple.format(startDate));
			schedule.setEnd(simple.format(endDate));
			
			int result = colaboService.scheduleEnroll(schedule);
			
			if(result == 1) {
				return "success";
			}else {
				return "failed";
			}
		}
		
		
		return "failed";
		
	}
	
	@PostMapping("/scheduleDelete.do")
	@ResponseBody                         //     js 에서 json 으로 데이터받는부분
	public String scheduleDelete(@RequestBody Map<String, Object> scheduleJson) {
		
		ScheduleDTO schedule = new ScheduleDTO();
		
		String startTime = (String)scheduleJson.get("start");
		String endTime = (String)scheduleJson.get("end");
		
		Date startDate = new Date(startTime);
		Date endDate = new Date(endTime);
		
		// 월에서 일정작성하는것과  일단위로 시간 포함 일정작성 하는것 구별
		SimpleDateFormat simple;
		
		if(startDate.toString().substring(11, 16).equals("00:00")) {
			simple = new SimpleDateFormat("yyyy-MM-dd");
		}else {
			simple = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		}
		
		schedule.setProjectNo(1);   // 프로젝트넘버 나중에 가져와서 변경하기
		schedule.setTitle((String)scheduleJson.get("title"));
		schedule.setStart(simple.format(startDate));
		schedule.setEnd(simple.format(endDate));
		
		int result = colaboService.scheduleDelete(schedule);
		
		if (result > 0) {
			return "success";
		}else {
			return "failed";
		}
		
	}
	
	@PostMapping("/SkillChart.do")
	@ResponseBody
	public ArrayList<Map<String, Object>> SkillChartGet(HttpSession session) {
		
		int getProjectNo = (int)session.getAttribute("getProjectNo");
		
		SkillChartDTO skillChart = new SkillChartDTO();
		skillChart.setProjectNo(getProjectNo); // 프로젝트 넘버 가져와서 수정
		
		ArrayList<Map<String, Object>> list = new ArrayList<>();
		
		List<SkillChartDTO> chartList = colaboService.skillChartGet(skillChart);
		
		for(int i =0; i<chartList.size(); i++) {
			Map<String, Object> map = new HashMap<>();
			map.put("memberNames", chartList.get(i).getMemberName());
			map.put("labels", chartList.get(i).getPmSkillName());
			map.put("full", chartList.get(i).getPmSkillFull());
			map.put("backgroundColors", chartList.get(i).getPmSkillColor());
			list.add(map);
		}
		
		
		return list;
	}
	
	// 전체 달성도 가져와서 계산하기
	// DB 에서 front ,  back 에 해당하는값을 가져올때  쿼리를 평균값 가져오는 avg(컬럼명) 으로 
	// 가져올생각   avg로 가져오게되면 따로 가져온뒤 안나눠줘도되고 맥스가 100퍼센트가 나오는이유는   
	// 처음에 skillChart 에 데이터를 넣을때  0~~100 에 해당하는 수만 넣게끔해놨기때문
	@PostMapping("/allSkillChart.do")
	@ResponseBody
	public HashMap<String, Object> allSkillChartGet(HttpSession session) {
		
		int getProjectNo = (int)session.getAttribute("getProjectNo");
		
		SkillChartDTO skillChart = new SkillChartDTO();
		skillChart.setProjectNo(getProjectNo); // 프로젝트 넘버 가져와서 수정
		
		HashMap<String, Object> list = colaboService.allSkillChartGet(skillChart);
		
		// front back 을 합치고 평균을 낸 전체 달성도 변수
		double allResult = 0;
		if(list != null) {
			
			if(list.get("front") != null && list.get("back") != null) {
				System.out.println(list.get("front"));
				
				allResult = Math.ceil(((double)list.get("front")+(double)list.get("back"))/2);
			}else if(list.get("front") == null && list.get("back") != null) {
				allResult = Math.ceil((double)list.get("back")/2);
				
			}else if(list.get("back") == null && list.get("front") != null) {
				allResult = Math.ceil((double)list.get("front")/2);
				
			}else {
				allResult = 0;
			}
			
			list.put("allResult", allResult);
			return list;
		}else {
			list.put("front", 0);
			list.put("back", 0);
			list.put("allResult", 0);
			return list;
			
		}
	}
	
	// 프로젝트 참가인원들 가져오기  (기능추가 하기위함)
	@PostMapping("/getProjectMember.do")
	@ResponseBody
	public ArrayList<Map<String,Object>> getProjectMember(HttpSession session) {
		
		int getProjectNo = (int)session.getAttribute("getProjectNo");
		
		TeamProjectPerSonDTO teamProject = new TeamProjectPerSonDTO();
		teamProject.setProjectNo(getProjectNo); // 프로젝트넘버 가져와서 교체
		
		ArrayList<Map<String,Object>> list = new ArrayList<>();
		
		List<TeamProjectPerSonDTO> teamPersonList = colaboService.getProjectMember(teamProject);
		
		for(int i =0; i<teamPersonList.size(); i++) {
			Map<String, Object> map = new HashMap<>();
			map.put("projectNo", teamPersonList.get(i).getProjectNo());
			map.put("memberNo", teamPersonList.get(i).getMemberNo());
			map.put("memberName", teamPersonList.get(i).getMemberName());
			map.put("memberEmail", teamPersonList.get(i).getMemberEmail());
			list.add(map);
		}
		
		return list;
	}
	
	// 기능 입력된인원들 가져오기 (기능 수정하기위함) 
	@PostMapping("/getSkillMember.do")
	@ResponseBody
	public ArrayList<Map<String,Object>> getSkillMember(HttpSession session) {
		
		int getProjectNo = (int)session.getAttribute("getProjectNo");
		
		SkillChartDTO skillChart = new SkillChartDTO();
		skillChart.setProjectNo(getProjectNo); // 프로젝트넘버 가져와서 교체
		
		ArrayList<Map<String,Object>> list = new ArrayList<>();
		
		List<SkillChartDTO> skillPersonList = colaboService.getSkillMember(skillChart);
		
		for(int i =0; i<skillPersonList.size(); i++) {
			Map<String, Object> map = new HashMap<>();
			map.put("projectNo", skillPersonList.get(i).getProjectNo());
			map.put("memberNo", skillPersonList.get(i).getMemberNo());
			map.put("memberName", skillPersonList.get(i).getMemberName());
			map.put("memberEmail", skillPersonList.get(i).getMemberEmail());
			map.put("skillName", skillPersonList.get(i).getPmSkillName());
			map.put("skillCategory", skillPersonList.get(i).getPmSkillCategory());
			list.add(map);
		}
		
		return list;
	}
	
	// 기능추가 리스트 DB 넣기
	@PostMapping("/enrollSkillList.do")
	@ResponseBody
	public String enrollSkillList(SkillChartDTO skillChart) {
		
		// DB 에 넣을때 랜덤으로 색을 주기위한 변수
		String[] skillColor = {"red","blue","green","black"};
		int color = (int)( Math.random()*4);
		
		// 진행도 기본값 0 
		skillChart.setPmSkillFull(0);
		skillChart.setPmSkillColor(skillColor[color]);
		
		
		
		
		
		// ajax에서 넘어오는 데이터가 비어있지 않을때만 DB에 저장하기위한 if 문
		if(skillChart.getMemberEmail() != "" &&
				skillChart.getMemberName() != "" &&
				skillChart.getPmSkillCategory() != "" &&
				skillChart.getPmSkillName() != "") {
			
			int result = colaboService.enrollSkillList(skillChart);
			
			if(result == 1) {
				return "success";
			}else {
				return "failed";
			}
		}
		
		
		
		return "failed";
	}
	
	@PostMapping("/editSkillList.do")
	@ResponseBody
	public String editSkillList(SkillChartDTO skillChart) {
		
		
		int result = colaboService.editSkillList(skillChart);
		
		if(result == 1) {
			return "success";
		}else {
			return "failed";
		}
	}
	
	@PostMapping("/deleteSkillList.do")
	@ResponseBody
	public String deleteSkillList(SkillChartDTO skillChart) {
		
		
		int result = colaboService.deleteSkillList(skillChart);
		
		if(result == 1) {
			return "success";
		}else {
			return "failed";
		}
		
	}
	
	
	@PostMapping("/selectEmailMember.do")
	@ResponseBody
	public List<ColaboDTO> selectEmailMember(@RequestParam("selectText")String selectText) {
		
		
		List<ColaboDTO> list = colaboService.selectEmailMember(selectText);
		
		System.out.println(selectText);
		
		return list;
	}
	
	@PostMapping("/getMemberInfo.do")
	@ResponseBody
	public Map<String,Object> getMemberInfo(HttpSession session) {
		
		int memberNo = (int)session.getAttribute("no");
		ColaboDTO colabo = colaboService.getMemberInfo(memberNo);
		
		
		Map<String, Object> list = new HashMap<>();
		
		list.put("memberNo", colabo.getMemberNo());
		list.put("memberName", colabo.getMemberName());
		list.put("memberEmail", colabo.getMemberEmail());
		
		System.out.println(colabo);
		return list;  
	}
	
	
	@PostMapping("/changeProjectType.do")
	@ResponseBody
	public String changeProjectType(ColaboDTO colabo, HttpSession session) {
//		System.out.println(colabo.getNo());
//		System.out.println(colabo.getStateKor());
		
		// 타입변경하는 멤버와  프로젝트를 생성한 멤버가 같은지 확인을위해  기존에 프로젝트넘버로
		// 생성한 멤버를 가져오는 코드를 진행후 Session 에 저장된 memberNo 와 비교후 같으면 진행
		int creatMemberNo = colaboService.getProjectCreateMember(colabo.getNo());
		
//		System.out.println("생성멤버는 : " + creatMemberNo);
//		System.out.println("세션멤버는 : " + (int)session.getAttribute("no"));
		
		if(creatMemberNo == (int)session.getAttribute("no")) {
			
			if(colabo.getStateKor().equals("프로젝트진행") || colabo.getStateKor().equals("프로젝트완료")) {
				
				ProjectPushDTO push = new ProjectPushDTO();
				
				push.setProjectNo((int)session.getAttribute("getProjectNo"));
				push.setAddMNo((int)session.getAttribute("no"));
				push.setReceiveMNo(0);
				push.setPushContent("프로젝트");
				push.setPushCheck('N');
				
				if(colabo.getStateKor().equals("프로젝트진행")) {
					push.setPushType("진행");
				}else if(colabo.getStateKor().equals("프로젝트완료")) {
					push.setPushType("완료");
				}
				
				int pushResult = colaboService.projectPush(push);
				
				System.out.println("프로젝트 신청 알람 결과값 : "+ pushResult);
				
				
				
				int result = colaboService.changeProjectType(colabo);
				
				if(result == 1) {
					return "success";
				}
			}
		}
		
		
		return "failed";
	}
	
	
	
	// 마이페이지에서 진행전,중,완료 프로젝트 나타내게 하기
	@GetMapping("/myProjectProfile")
	public String getProjectProfile(HttpSession session, Model model) {
		
		int memberNo = (int)session.getAttribute("no");
		
		// 리스트 세개로 나눠서  해당되는 리스트에 넣을생각
		List<ColaboDTO> NList = new ArrayList<>();
		List<ColaboDTO> CList = new ArrayList<>();
		List<ColaboDTO> YList = new ArrayList<>();
		
		
		// 내가 속한 프로젝트 전체리스트 가져오기
		List<ColaboDTO> allList = colaboService.getProjectProfile(memberNo);
		
		// 전체리스트에서 State 를 조회해서 해당되는 리스트에 넣기
		for(int i =0; i< allList.size(); i++) {
//			System.out.println(allList.get(i).getUploadName());
//			System.out.println(allList.get(i).getState());
			if(allList.get(i).getState() == 'N') {
				NList.add(allList.get(i));
			}else if(allList.get(i).getState() == 'C') {
				CList.add(allList.get(i));
			}else if(allList.get(i).getState() == 'Y') {
				YList.add(allList.get(i));
			}
			
		}
		
		model.addAttribute("NList", NList);
		model.addAttribute("CList", CList);
		model.addAttribute("YList", YList);
		
		
		
		return "myPage/myProject";
	}
	
	@PostMapping("/inviteProject.do")
	public String inviteProject(InviteProjectDTO inviteValue ,HttpSession session) {
		int projectNo = (int)session.getAttribute("getProjectNo");
		int memberNo = (int)session.getAttribute("no");
		
		InviteProjectDTO invite = new InviteProjectDTO();
		
		invite.setMemberNo(inviteValue.getMemberNo());
		invite.setProjectNo(projectNo);
		invite.setInviteMNo(memberNo);
			
		ProjectPushDTO push = new ProjectPushDTO();
		
		push.setProjectNo(invite.getProjectNo());
		push.setAddMNo(invite.getInviteMNo());
		push.setReceiveMNo(invite.getMemberNo());
		push.setPushType("초대");
		push.setPushContent("프로젝트");
		push.setPushCheck('N');
		
		int pushResult = colaboService.projectPush(push);
		
		System.out.println("프로젝트 초대 알람 결과값 : "+ pushResult);
		
		
		int result = colaboService.inviteProject(invite);
		
		System.out.println(result);
		if(result == 1) {
			return "success";
		}else {
			return "failed";
		}
		
	}
	
	@PostMapping("/applyProject.do")
	@ResponseBody
	public String applyProject(HttpSession session, InviteProjectDTO sendApply) {
		int memberNo = (int)session.getAttribute("no");
		
		InviteProjectDTO apply = new InviteProjectDTO();
		apply.setProjectNo(sendApply.getProjectNo());
		apply.setMemberNo(memberNo);
		apply.setApplyMNo(sendApply.getApplyMNo());
		
		ProjectPushDTO push = new ProjectPushDTO();
		
		push.setProjectNo(apply.getProjectNo());
		push.setAddMNo(apply.getMemberNo());
		push.setReceiveMNo(apply.getApplyMNo());
		push.setPushType("신청");
		push.setPushContent("프로젝트");
		push.setPushCheck('N');
		
		int pushResult = colaboService.projectPush(push);
		
		System.out.println("프로젝트 신청 알람 결과값 : "+ pushResult);
		
		int result = colaboService.enrollApplyProject(apply);
		
		if(result >0) {
			return "success";
		}
		
		return "failed";
	}
	
	
	@GetMapping("/inviteApplyProject")
	public String inviteApplyProject(HttpSession session, Model model) {
		
		int memberNo = (int)session.getAttribute("no");
		
		// 초대받은것 가져오기
		List<ColaboDTO> InviteList = colaboService.inviteApplyProject(memberNo);
		
		// 신청관련 같은경우 같은테이블에 신청한 멤버와  신청받은 프로젝트 대표가 있는데
		// 두가지를 따로 가져와야함 먼저 신청중인것을 가져오기.  
		List<ColaboDTO> ApplyList = colaboService.applyProject(memberNo);
		
		// 신청 받은 리스트 가져오기 : 이부분에선 기존 신청한 인원인 M_NO 로 가져오는게아니라 
		// apply_No 로 가져와야함
		List<ColaboDTO> receiveApplyList = colaboService.receiveApplyProject(memberNo);
		
		
		model.addAttribute("InviteList", InviteList);
		model.addAttribute("ApplyList", ApplyList);
		model.addAttribute("receiveApplyList", receiveApplyList);
		
		return "colabo/myInviteApplyProject";
	}
	
	@PostMapping("/inviteConfirm.do")
	@ResponseBody
	public String inviteConfirm(HttpSession session, InviteProjectDTO sendInvite) {
		
		int memberNo = (int)session.getAttribute("no");
		// 프로젝트에 팀원으로 데이터를넣을때  멤버의 이름, 이메일을 가져와야함
		// 만들어논 메서드 사용 넘버,이름,이메일 들어있음
		ColaboDTO colabo = colaboService.getMemberInfo(memberNo);
		
		// 전에 클라이언트단에서 프로젝트넘버를 매개변수로 넣어보냈기때문에
		// 수정할 가능성이있어서 받은 프로젝트넘버와 세션멤버넘버로 
		// 초대테이블에서 해당하는값이 있는지 파악후 있을때만 로직실행
		
		InviteProjectDTO inviteListCheck = new InviteProjectDTO();
		inviteListCheck.setMemberNo(memberNo);
		inviteListCheck.setProjectNo(sendInvite.getProjectNo());
		
		int checkList = colaboService.inviteListCheck(inviteListCheck);
//		System.out.println(checkList);
		
		
		// 트랜젝션처리 Service 에서 해야함
		// 참가눌렀을때  팀원리스트에 넣고 기존에있던 초대테이블에서 삭제
		InviteProjectDTO invite = new InviteProjectDTO();
		
		invite.setConfirmText(sendInvite.getConfirmText());
//		// 참가, 거절
//		System.out.println(invite.getConfirmText());
		
		colabo.setNo(inviteListCheck.getProjectNo());

		if(checkList > 0) {
			
			ProjectPushDTO push = new ProjectPushDTO();
				if(invite.getConfirmText().equals("참가")) {
					
					
					push.setProjectNo(inviteListCheck.getProjectNo());
					push.setAddMNo(colabo.getMemberNo());
					push.setReceiveMNo(0);
					push.setPushType("초대"+invite.getConfirmText());
					push.setPushContent("프로젝트");
					push.setPushCheck('N');
					
					int pushResult = colaboService.projectPush(push);
					
					System.out.println("프로젝트 참가 알람 결과값 : "+ pushResult);
					
					int result = colaboService.enrollProjectTeam(colabo);
					
					if(result >0) {
						return "success";
					}else {
						return "failed";
					}
					
				}else if(invite.getConfirmText().equals("거절")) {
					
					push.setProjectNo(inviteListCheck.getProjectNo());
					push.setAddMNo(colabo.getMemberNo());
					push.setReceiveMNo(0);
					push.setPushType("초대"+invite.getConfirmText());
					push.setPushContent("프로젝트");
					push.setPushCheck('N');
					
					int pushResult = colaboService.projectPush(push);
					
					System.out.println("프로젝트 거절 알람 결과값 : "+ pushResult);
					
					int result = colaboService.deleteInviteList(colabo);
					
					if(result >0) {
						return "success";
					}else {
						return "failed";
					}
					
				}
		}
		
		
		return "failed";
	}
	
	@PostMapping("/applyConfirm.do")
	@ResponseBody
	public String applyConfirm(HttpSession session, InviteProjectDTO sendApply) {
		
		// 신청한 인원의 no 로 데이터 가져오기
		ColaboDTO colabo = colaboService.getMemberInfo(sendApply.getMemberNo());
		
		colabo.setNo(sendApply.getProjectNo());
		
		// invite 테이블과 동일한 체크
		// 전에 클라이언트단에서 프로젝트넘버를 매개변수로 넣어보냈기때문에
		// 수정할 가능성이있어서 받은 프로젝트넘버와 세션멤버넘버로 
		// 초대테이블에서 해당하는값이 있는지 파악후 있을때만 로직실행
		
		InviteProjectDTO applyListCheck = new InviteProjectDTO();
		applyListCheck.setMemberNo(colabo.getMemberNo());
		applyListCheck.setProjectNo(colabo.getNo());
		
		
		
		
		int checkList = colaboService.applyListCheck(applyListCheck);
//				System.out.println(checkList);
		
		
		if(checkList > 0) {
			
			ProjectPushDTO push = new ProjectPushDTO();
			if(sendApply.getConfirmText().equals("승인")) {
				
				
				push.setProjectNo(colabo.getNo());
				push.setAddMNo((int)session.getAttribute("no"));
				push.setReceiveMNo(colabo.getMemberNo());
				push.setPushType("신청"+sendApply.getConfirmText());
				push.setPushContent("프로젝트");
				push.setPushCheck('N');
				
				int pushResult = colaboService.projectPush(push);
				
				System.out.println("프로젝트 신청승인 알람 결과값 : "+ pushResult);
				
				int result = colaboService.enrollApplyProjectTeam(colabo);
				
				if(result > 0) {
					return "success";
				}else {
					return "failed";
				}
			}else if(sendApply.getConfirmText().equals("거절")) {
				
				push.setProjectNo(colabo.getNo());
				push.setAddMNo((int)session.getAttribute("no"));
				push.setReceiveMNo(colabo.getMemberNo());
				push.setPushType("신청"+sendApply.getConfirmText());
				push.setPushContent("프로젝트");
				push.setPushCheck('N');
				
				int pushResult = colaboService.projectPush(push);
				
				System.out.println("프로젝트 신청거절 알람 결과값 : "+ pushResult);
				
				int result = colaboService.deleteApplyList(colabo);
				
				if(result > 0) {
					return "success";
				}else {
					return "failed";
				}
			}
			
		}
		
		return "failed";
	}
	
	
	
	@GetMapping("/projectPushReceive.do")
	@ResponseBody
	public List<ProjectPushDTO> projectPushReceive(HttpSession session) {
		
		int memberNo = (int)session.getAttribute("no");
		
		// 멤버넘버로 조회하는것에서 프로젝트 넘버들로 foreach 문작성으로 변경
		// 넘버들 가져오기
		List<ColaboDTO> enrollProjectList = colaboService.getProjectNameNumberList(memberNo); 
		List<Integer> projectNoList = new ArrayList<>(); 
		
		// projectPushDTO 에 넣기위해 enrollProjectList 에서 가져온 p_no 만
		// List<Integer> 에 넣기위한 반복문
		for(int i =0; i<enrollProjectList.size(); i++) {
			projectNoList.add(enrollProjectList.get(i).getNo());
		}
		
		// 멤버로 프로젝트 가입되어있는것들 중에  push_no (알림넘버) 리스트들 가져오기
		// 쿼리에 receive_m_no 가   0 과  자기자신멤버넘버  인것만 가져옴  
		// 이유는 0이면 전체전송이기때문에 가져와야하고  0이아닐땐 받는인원이기때문에
		// 가져올때 알림테이블에서 확인한 멤버 추가되는 컬럼인 check_m_no 에 가져오는 인원의 값이 없는지 확인후 가져옴
		
		// 위에서 가져온 enrollProjectList 를 pushDTO 에 List변수에 p_no 만 넣고
		// 리스트를가져올때 객체를 보냄
		
		ProjectPushDTO projectPush = new ProjectPushDTO();
		
		projectPush.setMemberNo(memberNo);
		projectPush.setProjectNoList(projectNoList);
		
		
		
		List<Integer> pushList = colaboService.getprojectList(projectPush);
		
		
		
//		for(int i=0; i<projectList.size(); i++) {
//			System.out.println(projectList.get(i));
//		}
		
		// 들어가있는 프로젝트가 있을때만 실행
		if(!pushList.isEmpty()) {
			List<ProjectPushDTO> getPushList = colaboService.getPushList(pushList);
//			System.out.println("비어있지않음");
//			System.out.println(getPushList);
//			for(int i=0; i<getPushList.size(); i++) {
//				System.out.println(getPushList.get(i).getPushType());
//			}
			
			return getPushList;
			
			
		}
		
		
		return null;
	}
	
	@PostMapping("/changePushType.do")
	@ResponseBody
	public String changePushType(ProjectPushDTO sendPush, HttpSession session) {
		
		
		ProjectPushDTO push = new ProjectPushDTO();
		
			push.setPushNo(sendPush.getPushNo());
			push.setMemberNo((int)session.getAttribute("no"));
			
			// 쿼리작성시 이미들어가있을때  ',' 구분자를 사용하기때문에  String 타입으로 변경후 
			// 그부분에넣을 memberNo 변수값
			push.setCheckMNo(String.valueOf(session.getAttribute("no")));
			
			int result = colaboService.changePushType(push);
			
//			System.out.println(result);
			
		
		return "";
	}
	
	@PostMapping("/allChangePushType.do")
	@ResponseBody
	public String allChangePushType(HttpSession session) {
		
		int memberNo = (int)session.getAttribute("no");
		
		List<ColaboDTO> enrollProjectList = colaboService.getProjectNameNumberList(memberNo); 
		List<Integer> projectNoList = new ArrayList<>(); 
		
		// projectPushDTO 에 넣기위해 enrollProjectList 에서 가져온 p_no 만
		// List<Integer> 에 넣기위한 반복문
		for(int i =0; i<enrollProjectList.size(); i++) {
			projectNoList.add(enrollProjectList.get(i).getNo());
		}
		
		// 멤버로 프로젝트 가입되어있는것들 중에  push_no (알림넘버) 리스트들 가져오기
		// 쿼리에 receive_m_no 가   0 과  자기자신멤버넘버  인것만 가져옴  
		// 이유는 0이면 전체전송이기때문에 가져와야하고  0이아닐땐 받는인원이기때문에
		// 가져올때 알림테이블에서 확인한 멤버 추가되는 컬럼인 check_m_no 에 가져오는 인원의 값이 없는지 확인후 가져옴
		
		// 위에서 가져온 enrollProjectList 를 pushDTO 에 List변수에 p_no 만 넣고
		// 리스트를가져올때 객체를 보냄
		
		ProjectPushDTO projectPush = new ProjectPushDTO();
		
		projectPush.setMemberNo(memberNo);
		projectPush.setProjectNoList(projectNoList);
		
		ProjectPushDTO push = new ProjectPushDTO();		
		push.setMemberNo(memberNo);
		
		// 쿼리작성시 이미들어가있을때  ',' 구분자를 사용하기때문에  String 타입으로 변경후 
		// 그부분에넣을 memberNo 변수값
		push.setCheckMNo(String.valueOf(session.getAttribute("no")));
		List<Integer> pushList = colaboService.getprojectList(projectPush);
		
		// 해당하는 알림에대해 전체 타입변경을 할 pushNo 가담긴 List
		// 객체안에있는 변수에 담아서 넣을땐 mapper 에서 
		// collection 에 해당하는 변수이름을 넣는다  
		// 리스트 자체를넣을땐 collection 에 list 를넣는다
		push.setPushNoList(pushList);
		
		int result = colaboService.allChangePushType(push);
		
		
		return "";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
