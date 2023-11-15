package com.reviewcow.main;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.reviewcow.main.bo.MainBo;
import com.reviewcow.main.model.CardView;

import javax.servlet.http.HttpSession;

@RequestMapping("/main")
@Controller
public class MainController {
	@Autowired
	private MainBo mainBo;
	
	@RequestMapping("/main_view")
	public String mainView(
			Model model,
			HttpSession session) {
		//세션에서 로그인멤버 정보 가져오기
		Integer memberId = (Integer)session.getAttribute("memberId");
		
		List<String> viewList = new ArrayList<>();
		
		
		viewList.add("include/main_bnr");
		viewList.add("include/main_category_box");
		// 마감임박
		viewList.add("include/deadline_product");
		// 인기상품
		viewList.add("include/hotitem_product");
		// 온라인상품
		viewList.add("include/main_online_product");
		// 오프라인상품
		viewList.add("include/main_offline_product");
		// 기자단
		viewList.add("include/main_presscorps_product");
		
		// 마감임박 체험단
		List<CardView> deadlineItemList = mainBo.generateDeadLineItem(memberId);
		
		// 인기 체험단
		List<CardView> hotItemList = mainBo.generateHotItem(memberId);
		
		// 온라인 상품
		String mainOnlineCategory ="smartstore";
		List<CardView> onlineProductList = mainBo.generateOnlineProductByCategory(memberId,mainOnlineCategory,null);
		
		// 오프라인 상품
		String mainOfflineCategory ="cafe";
		List<CardView> offlineProductList = mainBo.generateOfflineProductByCategory(memberId,mainOfflineCategory,null);
		
		// 기자단
		List<CardView> pressProductList = mainBo.generatePressProductByCategory(memberId);
		
		
		model.addAttribute("offlineCategory", mainOfflineCategory);
		model.addAttribute("onlineCategory", mainOnlineCategory);
		model.addAttribute("deadlineItemList", deadlineItemList);
		model.addAttribute("hotItemList", hotItemList);
		model.addAttribute("onlineProductList", onlineProductList);
		model.addAttribute("offlineProductList", offlineProductList);
		model.addAttribute("pressProductList", pressProductList);
		
		// layout.jsp의 section의 연결 주소를 model(view)에 담아서 보낸다
		model.addAttribute("viewList", viewList);
		return "template/layout";
	}
	@RequestMapping("/online_product_view")
	public String onlineProductView(Model model,
			HttpSession session) {
		Integer memberId = (Integer)session.getAttribute("memberId");
		List<String> viewList = new ArrayList<>();
		
		String mainOnlineCategory ="smartstore";
		List<CardView> onlineProductList = mainBo.generateOnlineProductByCategory(memberId,mainOnlineCategory,0);
		
		viewList.add("category/online_product");
		
		model.addAttribute("category", mainOnlineCategory);
		model.addAttribute("onlineProductList", onlineProductList);
		model.addAttribute("viewList", viewList);
		
		return "template/layout";
	}
	
	@RequestMapping("/offline_product_view")
	public String offlineProductView(Model model,
			HttpSession session) {
		Integer memberId = (Integer)session.getAttribute("memberId");
		List<String> viewList = new ArrayList<>();
		
		String mainOfflineCategory ="cafe";
		List<CardView> offlineProductList = mainBo.generateOfflineProductByCategory(memberId, mainOfflineCategory, 0);
		
		viewList.add("category/offline_product");
		
		model.addAttribute("category", mainOfflineCategory);
		model.addAttribute("offlineProductList", offlineProductList);
		model.addAttribute("viewList", viewList);
		
		return "template/layout";
	}
	
	@RequestMapping("/presscorps_product_view")
	public String pressCorpsProductView(Model model,
			HttpSession session) {
		Integer memberId = (Integer)session.getAttribute("memberId");
		List<String> viewList = new ArrayList<>();
		
		
		List<CardView> pressProductList = mainBo.generatePressProductByCategory(memberId);
		
		viewList.add("category/presscorps_product");
		
		model.addAttribute("pressProductList", pressProductList);
		model.addAttribute("viewList", viewList);
		
		return "template/layout";
	}
	
}
