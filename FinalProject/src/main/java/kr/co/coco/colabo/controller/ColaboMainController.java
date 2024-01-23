package kr.co.coco.colabo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/colabo")
public class ColaboMainController {

	
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
	@GetMapping("colaboDraw")
	public String colaboDraw() {
		return "colabo/colaboDraw";
	}
	
	
}
