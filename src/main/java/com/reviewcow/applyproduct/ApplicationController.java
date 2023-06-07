package com.reviewcow.applyproduct;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.reviewcow.sellpost.bo.SellPostBo;
import com.reviewcow.sellpost.model.SellPost;

import javax.servlet.http.HttpSession;

@RequestMapping("/application")
@Controller
public class ApplicationController {
	@Autowired
	private SellPostBo sellPostBo;
	
	@GetMapping("/apply_product_list_view")
	public String applyProductListView(
			HttpSession session,
			Model model) {
		List<String> viewList = new ArrayList<>();
		Integer memberId = (Integer)session.getAttribute("memberId");
		List<SellPost> sellPostList = new ArrayList<>();
		
		sellPostList = sellPostBo.getApplySellPostListbyMemberId(memberId);
		
		
		viewList.add("include/side_menu");
		viewList.add("application/apply_product_list");
		model.addAttribute("sellPostList",sellPostList);
		model.addAttribute("viewList", viewList);
		return "template/layout";
	}
}
