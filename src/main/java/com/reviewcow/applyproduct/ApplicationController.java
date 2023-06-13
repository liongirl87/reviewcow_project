package com.reviewcow.applyproduct;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.reviewcow.applyproduct.bo.ApplicationtBo;
import com.reviewcow.postpaging.model.PostPagingDTO;
import com.reviewcow.sellpost.bo.SellPostBo;
import com.reviewcow.sellpost.model.SellPost;

@RequestMapping("/application")
@Controller
public class ApplicationController {
	@Autowired
	private SellPostBo sellPostBo;
	@Autowired
	private ApplicationtBo applicationtBo;
	
	@GetMapping("/apply_product_list_view")
	public String applyProductListView(
			@RequestParam(value = "prevId", required=false) Integer prevIdParam,
			@RequestParam(value = "nextId", required=false) Integer nextIdParam,
			@RequestParam(value = "postPage" ,required=false) Integer postPage,
			HttpSession session,
			Model model) {
		List<String> viewList = new ArrayList<>();
		Integer memberId = (Integer)session.getAttribute("memberId");
		
		// sellPostList = sellPostBo.getApplySellPostListbyMemberId(memberId);
		
		Integer prevId = 0;
		Integer nextId = 0;
		
		if (postPage == null) {
			postPage = 1;
		}
		PostPagingDTO postpaging = new PostPagingDTO(postPage, applicationtBo.countApplyProductbyMemberId(memberId));
		
		List<SellPost> sellPostList = sellPostBo.getApplyProductListbyMemberIdForPaging(memberId, postpaging.getMysqlSkip() ,postpaging.getPostsperpage()); 
	
		model.addAttribute("postPaging", postpaging);
		model.addAttribute("prevId", prevId);
		model.addAttribute("nextId", nextId);
		
		viewList.add("include/side_menu");
		viewList.add("application/apply_product_list");
		
		model.addAttribute("sellPostList",sellPostList);
		model.addAttribute("viewList", viewList);
		return "template/layout";
	}
}
