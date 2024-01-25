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
	@GetMapping("/colaboBasicPage")
	public String BasicPage() {
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
		
		
//		System.out.println("다 들어간 생성자 입니다. : "+newData);
//		
		for(int i= 0; i<scheduleList.size(); i++) {
			Map<String, String> map = new HashMap<>();
			map.put("title", scheduleList.get(i).getTitle());
			map.put("start", scheduleList.get(i).getStart());
			map.put("end", scheduleList.get(i).getEnd());
			list.add(map);
		}
		
//		Gson gson = new Gson();
//		// Java 객체 -> JSON 문자열로 변환
//		String jsonString = gson.toJson(scheduleList);
//		System.out.println("json 문자열 입니다. : "+jsonString);
//		
//		// JSON 문자열 -> Java 객체로 변환
//		ScheduleDTO data = gson.fromJson(jsonString, ScheduleDTO.class);
//		System.out.println(data);
//		System.out.println(data.getTitle());
		// list.add(map)
		
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
		
		SimpleDateFormat simple = new SimpleDateFormat("yyyy-MM-dd");
		
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
		
		SimpleDateFormat simple = new SimpleDateFormat("yyyy-MM-DD");
		
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
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
