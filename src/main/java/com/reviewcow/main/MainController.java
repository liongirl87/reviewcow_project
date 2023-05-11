package com.reviewcow.main;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/main")
@Controller
public class MainController {
	
	@RequestMapping("/main_view")
	public String mainView(Model model) {
		List<String> viewList = new ArrayList<>();

		viewList.add("include/main_bnr");
		viewList.add("include/main_category_box");
		viewList.add("include/deadline_product");
		viewList.add("include/deadline_product");
		viewList.add("include/main_online_product");
		
		// layout.jsp의 section의 연결 주소를 model(view)에 담아서 보낸다
		model.addAttribute("viewList", viewList);
		return "template/layout";
	}
}
