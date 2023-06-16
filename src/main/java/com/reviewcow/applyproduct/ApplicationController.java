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
import com.reviewcow.applyproduct.model.ManageApplicants;
import com.reviewcow.applyproduct.model.ManageProductApplicants;
import com.reviewcow.main.model.CardView;
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
	
	@GetMapping("/manage_applicants_view")
	public String manageApplicantsView(
			Model model,
			HttpSession session) {
		List<String> viewList = new ArrayList<>();
		ManageProductApplicants manageList = new ManageProductApplicants();
		
		int memberId = (int)session.getAttribute("memberId");
		
		manageList = sellPostBo.countSellPostStatusbyMemberId(memberId);
		
		// 마감
		manageList.setFinish(sellPostBo.countSellPostStatusFinishedByMemberId(memberId));
		
		viewList.add("include/side_menu");
		viewList.add("application/manage_applicants");
		model.addAttribute("viewList", viewList);
		model.addAttribute("manageList", manageList);
		
		return "template/layout";
	}
	
	@GetMapping("/manage_applicants_view/status_product_view")
	public String statusProductView(
			@RequestParam(value = "prevId", required=false) Integer prevIdParam,
			@RequestParam(value = "nextId", required=false) Integer nextIdParam,
			@RequestParam(value = "postPage" ,required=false) Integer postPage,
			@RequestParam("aprovalCondition") int aprovalCondition,
			Model model,
			HttpSession session) {
		List<String> viewList = new ArrayList<>();
		List<CardView> cardViewList = new ArrayList<>();
		
		int memberId = (int)session.getAttribute("memberId");
		int nowAprovalCondition = aprovalCondition;
		// 하단 페이징
		Integer prevId = 0;
		Integer nextId = 0;
		
		if (postPage == null) {
			postPage = 1;
		}
		
		PostPagingDTO postpaging = new PostPagingDTO(postPage, sellPostBo.countSellPostListStatusByMemberId(memberId, aprovalCondition));
	
		model.addAttribute("postPaging", postpaging);
		model.addAttribute("prevId", prevId);
		model.addAttribute("nextId", nextId);
		
		// 하단 페이징 끝
		cardViewList = applicationtBo.generateStatusProduct(memberId, aprovalCondition, postpaging.getMysqlSkip() ,postpaging.getPostsperpage());
		
		viewList.add("include/side_menu");
		viewList.add("application/status_product");
		model.addAttribute("viewList", viewList);
		model.addAttribute("cardViewList", cardViewList);
		model.addAttribute("nowAprovalCondition", nowAprovalCondition);
		return "template/layout";
	}
	
	@GetMapping("/manage_applicants_view/status_applicants_view")
	public String statusApplicantsView(
			@RequestParam(value = "prevId", required=false) Integer prevIdParam,
			@RequestParam(value = "nextId", required=false) Integer nextIdParam,
			@RequestParam(value = "postPage" ,required=false) Integer postPage,
			@RequestParam("aprovalCondition") int aprovalCondition,
			Model model,
			HttpSession session) {
		List<String> viewList = new ArrayList<>();
		List<ManageApplicants> applicantsList = new ArrayList<>();
		
		int memberId = (int)session.getAttribute("memberId");
		int nowAprovalCondition = aprovalCondition;
		// 하단 페이징
		Integer prevId = 0;
		Integer nextId = 0;
		
		if (postPage == null) {
			postPage = 1;
		}
		
		PostPagingDTO postpaging = new PostPagingDTO(postPage, sellPostBo.countApplicantsStatusByMemberId(memberId, aprovalCondition));
	
		model.addAttribute("postPaging", postpaging);
		model.addAttribute("prevId", prevId);
		model.addAttribute("nextId", nextId);
		
		// 하단 페이징 끝
		applicantsList = applicationtBo.generateStatusApplicantsList(memberId, aprovalCondition, postpaging.getMysqlSkip() ,postpaging.getPostsperpage());
		
		viewList.add("include/side_menu");
		viewList.add("application/status_applicants");
		model.addAttribute("viewList", viewList);
		model.addAttribute("applicantsList", applicantsList);
		model.addAttribute("nowAprovalCondition", nowAprovalCondition);
		return "template/layout";
	}
}