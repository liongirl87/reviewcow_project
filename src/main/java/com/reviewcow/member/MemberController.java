package com.reviewcow.member;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.servlet.http.HttpSession;

@RequestMapping("/member")
@Controller
public class MemberController {
	
	// 회원가입
	@RequestMapping("/join_view")
	public String memeberJoin(Model model) {
		model.addAttribute("viewList","member/join");
		return "template/layout";
	}
	
	// 로그인
	@RequestMapping("/login_view")
	public String memeberLogin(Model model) {
		model.addAttribute("viewList", "member/login");
		return "template/layout";
	}
	
	// 로그아웃
	@RequestMapping("/sign_out")
	public String signOut(HttpSession session) {
		// 세션에 있는 모든 것을 비운다.
		session.invalidate();
		// 화면 이동(로그인화면)
		return "redirect:/main/main_view";
	}
	// 사이드메뉴 테스트
	@RequestMapping("/side_view")
	public String sideView(Model model) {
		List<String> viewList = new ArrayList<>();
		
		viewList.add("include/side_menu");
		viewList.add("member/modify_myinfo");
		model.addAttribute("viewList", viewList);
		return "template/layout";
	}
}
