package com.reviewcow.main;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.reviewcow.main.bo.MainBo;
import com.reviewcow.main.model.CardView;

import jakarta.servlet.http.HttpSession;

@RequestMapping("/main")
@Controller
public class MainController {
	@Autowired
	private MainBo mainBo;
	
	@RequestMapping("/main_view")
	public String mainView(Model model, HttpSession session) {
		//세션에서 로그인멤버 정보 가져오기
		Integer memberId = (Integer)session.getAttribute("memberId");
		
		List<String> viewList = new ArrayList<>();
		
		
		viewList.add("include/main_bnr");
		viewList.add("include/main_category_box");
		viewList.add("include/deadline_product");
		viewList.add("include/hotitem_product");
		viewList.add("include/main_online_product");
		
		// 마감임박 체험단
		List<CardView> deadlineItemList = mainBo.generateCardList(memberId);
		
		// 인기 체험단
		List<CardView> hotItemList = mainBo.generateHotItem(memberId);
		
		// 온라인 상품
		
		// 오프라인 상품
		
		// 기자단
		
		
		model.addAttribute("deadlineItemList", deadlineItemList);
		model.addAttribute("hotItemList", hotItemList);
		// layout.jsp의 section의 연결 주소를 model(view)에 담아서 보낸다
		model.addAttribute("viewList", viewList);
		return "template/layout";
	}
}
