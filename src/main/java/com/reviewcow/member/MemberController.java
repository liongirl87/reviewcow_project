package com.reviewcow.member;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/member")
@Controller
public class MemberController {

	@RequestMapping("/join")
	public String memeberJoin(Model model) {
		model.addAttribute("viewList","member/join");
		return "template/layout";
	}
}
