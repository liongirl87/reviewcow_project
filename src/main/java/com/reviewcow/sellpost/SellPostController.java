package com.reviewcow.sellpost;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.reviewcow.main.bo.MainBo;
import com.reviewcow.main.model.CardView;
import com.reviewcow.member.model.Member;

@RequestMapping("/sellpost")
@Controller
public class SellPostController {
	@Autowired
	private MainBo mainBo;
	
	@RequestMapping("/upload_product_view")
	public String uploadProduct (
			Model model,
			HttpSession session,
			HttpServletResponse response
			) throws IOException {
		List<String> viewList = new ArrayList<>();
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		Member member = (Member)session.getAttribute("member");
		
		if (member.getApprovalCondition() == 0) {
			out.println("<script>alert('사업자 승인전에는 이용하실 수 없습니다.')</script>");
			out.flush();
			viewList.add("include/side_menu");
			viewList.add("member/modify_myinfo");
			model.addAttribute("viewList", viewList);
			return "template/layout";
		}
		
		viewList.add("include/side_menu");
		viewList.add("sellpost/upload_product");
		model.addAttribute("viewList", viewList);
		return "template/layout";
	}
	
	@GetMapping("/product_detail_view")
	public String productDetail (
			@RequestParam("postId") int postId,
			Model model,
			HttpSession session) {
		//세션에서 로그인멤버id 정보 가져오기
		Integer memberId = (Integer)session.getAttribute("memberId");
		
		CardView cardView = mainBo.generateCard(postId, memberId);
		
		model.addAttribute("cardView", cardView);
		model.addAttribute("viewList","sellpost/product_detail");
		
		return "template/layout";
	}
	
	@GetMapping("/main_changeonline_category2")
	public String changeMainOnlineProduct(
			@RequestParam("categoryOnline2") String category,
			HttpSession session,
			Model model
			) {
		Integer memberId = (Integer)session.getAttribute("memberId");
		List<CardView> onlineProductList = mainBo.generateOnlineProductByCategory(memberId, category,null);
		model.addAttribute("onlineProductList", onlineProductList);
		model.addAttribute("onlineCategory", category);
		
		return "include/main_online_product";
	}
	
	@GetMapping("/category_changeonline_category2")
	public String changeCategoryOnlineProduct(
			@RequestParam("categoryOnline2") String category,
			HttpSession session,
			Model model
			) {
		Integer memberId = (Integer)session.getAttribute("memberId");
		
		
		List<CardView> onlineProductList = mainBo.generateOnlineProductByCategory(memberId, category, 0);
		model.addAttribute("onlineProductList", onlineProductList);
		model.addAttribute("category", category);
		
		return "category/online_product";
	}
	
	
	@GetMapping("/main_changeoffline_category2")
	public String changeMainOfflineProduct(
			@RequestParam("categoryOffline2") String category,
			HttpSession session,
			Model model
			) {
		Integer memberId = (Integer)session.getAttribute("memberId");
		List<CardView> offlineProductList = mainBo.generateOfflineProductByCategory(memberId, category, null);
		model.addAttribute("offlineProductList", offlineProductList);
		model.addAttribute("offlineCategory", category);
		
		return "include/main_offline_product";
	}
	
	@GetMapping("/category_changeoffline_category2")
	public String changeCategoryOfflineProduct(
			@RequestParam("categoryOffline2") String category,
			HttpSession session,
			Model model
			) {
		Integer memberId = (Integer)session.getAttribute("memberId");
		
		List<CardView> offlineProductList = mainBo.generateOfflineProductByCategory(memberId, category, 0);
		model.addAttribute("offlineProductList", offlineProductList);
		model.addAttribute("category", category);
		
		return "category/offline_product";
	}
}
