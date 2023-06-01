package com.reviewcow.board;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/board")
public class BoardController {

	@RequestMapping("/helpdesk_write_view")
	public String helpdeskWrite(Model model) {
		List<String> viewList = new ArrayList<>();
		
		viewList.add("include/side_menu");
		viewList.add("board/helpdesk_write");
		model.addAttribute("viewList", viewList);
		return "template/layout";
	}
	
	@RequestMapping("/helpdesk_view")
	public String helpdeskView(Model model) {
		List<String> viewList = new ArrayList<>();
		
		viewList.add("include/side_menu");
		viewList.add("board/helpdesk");
		model.addAttribute("viewList", viewList);
		return "template/layout";
	}
}
