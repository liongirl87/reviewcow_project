package com.reviewcow.board;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.reviewcow.board.bo.HelpdeskBo;

import javax.servlet.http.HttpSession;

@RequestMapping("/board")
@Controller
public class BoardRestController {

	@Autowired
	private HelpdeskBo helpdeskBo;
	
	@GetMapping("/helpdesk_write")
	public Map<String, Object> writeHelpdesk(
			@RequestParam("category")String category,
			@RequestParam("subject")String subject,
			@RequestParam("content")String content,
			HttpSession session){
		Map<String, Object> result = new HashMap<>();
		
		Integer memberId = (Integer)session.getAttribute("memberId");
		helpdeskBo.addHelpdeskWriting(memberId, category, subject, content);
		
		result.put("code", "1");
		return result;
	}
}
