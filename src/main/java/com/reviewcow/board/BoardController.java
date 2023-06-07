package com.reviewcow.board;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.reviewcow.board.bo.HelpdeskBo;
import com.reviewcow.board.model.Helpdesk;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/board")
public class BoardController {
	@Autowired
	private HelpdeskBo helpdeskBo;

	@RequestMapping("/helpdesk_write_view")
	public String helpdeskWrite(Model model) {
		List<String> viewList = new ArrayList<>();
		
		viewList.add("include/side_menu");
		viewList.add("board/helpdesk_write");
		model.addAttribute("viewList", viewList);
		return "template/layout";
	}
	
	@RequestMapping("/helpdesk_view")
	public String helpdeskView(
			Model model,
			HttpSession session) {
		List<String> viewList = new ArrayList<>();
		Integer memberId = (Integer)session.getAttribute("memberId");		
		
		List<Helpdesk> helpdeskList = helpdeskBo.getHelpdeskWritingListByMemberId(memberId);
		
		viewList.add("include/side_menu");
		viewList.add("board/helpdesk");
		model.addAttribute("viewList", viewList);
		model.addAttribute("helpdeskList", helpdeskList);
		
		return "template/layout";
	}
}
