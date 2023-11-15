package com.reviewcow.member;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

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
	
	// 내정보 수정하기
	@RequestMapping("/modify_myinfo_view")
	public String modifyMyInfo(
			Model model
			,HttpSession session) {
		
		Integer memberId = (Integer)session.getAttribute("memberId");
		
		List<String> viewList = new ArrayList<>();
		
		// 비로그인 시 로그인 화면으로 이동 
		if(memberId == null) {
			viewList.add("member/login");
			model.addAttribute("viewList", viewList);
			return "template/layout";
		}
		
		viewList.add("include/side_menu");
		viewList.add("member/modify_myinfo");
		model.addAttribute("viewList", viewList);
		return "template/layout";
	}
}
