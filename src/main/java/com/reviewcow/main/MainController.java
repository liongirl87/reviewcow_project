package com.reviewcow.main;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/main")
@Controller
public class MainController {
	
	@RequestMapping("/main_view")
	public String mainView(Model model) {
		
		// layout.jsp의 section의 연결 주소를 model(view)에 담아서 보낸다
		model.addAttribute("view", "main/main");
		return "template/layout";
	}
}
