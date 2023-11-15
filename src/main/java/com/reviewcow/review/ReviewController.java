package com.reviewcow.review;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.reviewcow.applyproduct.bo.ApplicationtBo;
import com.reviewcow.postpaging.model.PostPagingDTO;
import com.reviewcow.review.bo.ReviewBo;
import com.reviewcow.review.model.ReviewList;
import com.reviewcow.sellpost.bo.SellPostBo;
import com.reviewcow.sellpost.model.SellPost;

@RequestMapping("/review")
@Controller
public class ReviewController {

	@Autowired
	private ReviewBo reviewBo;
	@Autowired
	private SellPostBo sellPostBo;
	@Autowired
	private ApplicationtBo applicationBo;
	
	@RequestMapping("/myreview_list_view")
	public String myReviewList(
			@RequestParam(value = "prevId", required=false) Integer prevIdParam,
			@RequestParam(value = "nextId", required=false) Integer nextIdParam,
			@RequestParam(value = "postPage" ,required=false) Integer postPage,
			Model model,
			HttpSession session) {
		List<String> viewList = new ArrayList<>();
		Integer memberId = (Integer)session.getAttribute("memberId");
		
		Integer prevId = 0;
		Integer nextId = 0;
		
		if (postPage == null) {
			postPage = 1;
		}
		PostPagingDTO postpaging = new PostPagingDTO(postPage, reviewBo.countApplicationListByMemberId(memberId));
		
		List<ReviewList> reviewList = reviewBo.getReviewListByMemberId(memberId,postpaging.getMysqlSkip(),postpaging.getPostsperpage());
		
		model.addAttribute("postPaging", postpaging);
		model.addAttribute("prevId", prevId);
		model.addAttribute("nextId", nextId);
		
		viewList.add("include/side_menu");
		viewList.add("review/list_review");
		model.addAttribute("reviewList",reviewList);
		model.addAttribute("viewList", viewList);
		return "template/layout";
	}
	
	@RequestMapping("/write_review_view")
	public String writeReview(
			@RequestParam("sellPostid") Integer sellPostid,
			Model model) {
		List<String> viewList = new ArrayList<>();
		
		
		SellPost sellPost = sellPostBo.getSellPostbyPostId(sellPostid);
		
		viewList.add("include/side_menu");
		viewList.add("review/write_review");
		model.addAttribute("sellPost", sellPost);
		model.addAttribute("viewList", viewList);
		return "template/layout";
	}
}
