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

import com.google.gson.Gson;

import kr.co.coco.colabo.common.paging.PageInfo;
import kr.co.coco.colabo.common.paging.Pagination;
import kr.co.coco.colabo.model.dto.ColaboDTO;
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
	public String enterColabo() {
		
		return "colabo/colaboPage";
	}
	
	@GetMapping("/projectEnroll")
	public String projectEnroll() {
		return "colabo/projectEnroll";
	}
	
	// 기본개요 페이지로 이동 하면서 DB에 있는 팀원 리스트를 가져와서 넘겨줌과 동기적으로 나타나게 함 
	@GetMapping("/colaboBasicPage")
	public String BasicPage(Model model,HttpSession session) {
		
		TeamProjectPerSonDTO teamProject = new TeamProjectPerSonDTO();
		teamProject.setProjectNo(1);   //  프로젝트 넘버 세션으로 가져와서 수정
		
		
		List<TeamProjectPerSonDTO> list = colaboService.getProjectMember(teamProject); 
		
		for(TeamProjectPerSonDTO item : list) {
			String enrollDate = item.getTeamEnrollDate().substring(0,10);
			item.setTeamEnrollDate(enrollDate);
		}
		
		
		model.addAttribute("list", list);
		
		
		return "colabo/colaboBasic";
	}
	@GetMapping("/colaboSchedule")
	public String Schedule() {
		return "colabo/colaboSchedule";
	}
	@GetMapping("/colaboDraw")
	public String colaboDraw() {
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
		
		// 전체공지글을 보여주는게 아니라 프로젝트마다 따로만들것이기때문에  p_no 을 가져와야함 
		// 지금은 임의로 정해서 할 에정
		colabo.setNo(1);
		
		
		int listCount = colaboService.selectListCount(colabo);
		int pageLimit = 5;
		int boardLimit = 5;
		
		// 게시글 번호
		int row = listCount - (cpage-1) * boardLimit;
		
		PageInfo pi = Pagination.getPageInfo(listCount, cpage, pageLimit, boardLimit);
		
		// 목록 불러오기
		List<ColaboDTO> list = colaboService.selectListAll(pi, colabo);
		
		for(ColaboDTO item : list) {
			String noticeDate = item.getNoticeDate().substring(0,10);
			item.setNoticeDate(noticeDate);
		}
		String projectName = list.get(0).getName();
		
		model.addAttribute("projectName", projectName);
		model.addAttribute("row", row);
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		
		
		return "colabo/colaboNotice";
	}
	@GetMapping("/enterNoticePage")
	public String colaboEnterNoticePage() {
		return "colabo/colaboNoticeEnroll";
	}
	
	
	@PostMapping("/noticeEnroll.do")
	public String noticeEnroll(ColaboDTO colabo, HttpSession session) {
		colabo.setNo(1);
		colabo.setMemberNo(1); // 나중에 세션으로
		int result = colaboService.noticeEnroll(colabo);
		
		if(result == 1) {
			return  "redirect:/colabo/colaboNotice";
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
		
		int result = colaboService.noticeEdit(colabo);
		
		if(result == 1) {
			return "redirect:/colabo/colaboNotice";
		}else {
			return "error/errorPage";
		}
		
	}
	
	@PostMapping("/schedule.do")
	@ResponseBody
	public ArrayList<Map<String, String>> scheduleIO() {
		
		ScheduleDTO schedule = new ScheduleDTO();
		
		schedule.setProjectNo(1);   // 나중에 프로젝트넘버 받아서 넣기
		
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
	public String scheduleEnroll(ScheduleDTO inputSchedule) {
		
		// 파라미터 가져올때 객체가 생성되어있어서  그상태로  setProjectNo(1)을하게되면
		// 이미 생성된 객체엔 접근할수가없어서 새로 객체생성후 로직실행
		ScheduleDTO schedule = new ScheduleDTO();
		
		schedule.setProjectNo(1);  //  후에 프로젝트넘버 가져오기
		
		
		schedule.setTitle(inputSchedule.getTitle());
		schedule.setStart(inputSchedule.getStart());
		schedule.setEnd(inputSchedule.getEnd());
		
		
		Date startDate = new Date(schedule.getStart());
		Date endDate = new Date(schedule.getEnd());
		
		
		// 월에서 일정작성하는것과  일단위로 시간 포함 일정작성 하는것 구별
		SimpleDateFormat simple;
		
		if(startDate.toString().substring(11, 16).equals("00:00")) {
			simple = new SimpleDateFormat("yyyy-MM-DD");
		}else {
			simple = new SimpleDateFormat("yyyy-MM-DD HH:mm");
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
			simple = new SimpleDateFormat("yyyy-MM-DD");
		}else {
			simple = new SimpleDateFormat("yyyy-MM-DD HH:mm");
		}
		
		schedule.setProjectNo(1);   // 프로젝트넘버 나중에 가져와서 변경하기
		schedule.setTitle((String)scheduleJson.get("title"));
		schedule.setStart(simple.format(startDate));
		schedule.setEnd(simple.format(endDate));
		
		int result = colaboService.scheduleDelete(schedule);
		
		
		if (result > 0) {
			return "성공";
		}else {
			return "실패";
		}
		
	}
	
	@PostMapping("/SkillChart.do")
	@ResponseBody
	public ArrayList<Map<String, Object>> SkillChartGet() {
		
		SkillChartDTO skillChart = new SkillChartDTO();
		skillChart.setProjectNo(1); // 프로젝트 넘버 가져와서 수정
		
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
	public HashMap<String, Object> allSkillChartGet() {
		
		SkillChartDTO skillChart = new SkillChartDTO();
		skillChart.setProjectNo(1); // 프로젝트 넘버 가져와서 수정
		
		HashMap<String, Object> list = colaboService.allSkillChartGet(skillChart);
		
		// front back 을 합치고 평균을 낸 전체 달성도 변수
		double allResult;
		
		if(list.get("front") != null && list.get("back") != null) {
			
			allResult = Math.ceil(((double)list.get("front")+(double)list.get("back"))/2);
		}else if(list.get("front") == null) {
			allResult = Math.ceil((double)list.get("back")/2);
			
		}else if(list.get("back") == null) {
			allResult = Math.ceil((double)list.get("back")/2);
			
		}else {
			allResult = 0;
		}
		
		list.put("allResult", allResult);
//		
		
		return list;
	}
	
	// 프로젝트 참가인원들 가져오기  (기능추가 하기위함)
	@PostMapping("/getProjectMember.do")
	@ResponseBody
	public ArrayList<Map<String,Object>> getProjectMember() {
		
		TeamProjectPerSonDTO teamProject = new TeamProjectPerSonDTO();
		teamProject.setProjectNo(1); // 프로젝트넘버 가져와서 교체
		
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
	public ArrayList<Map<String,Object>> getSkillMember() {
		
		SkillChartDTO skillChart = new SkillChartDTO();
		skillChart.setProjectNo(1); // 프로젝트넘버 가져와서 교체
		
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
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
