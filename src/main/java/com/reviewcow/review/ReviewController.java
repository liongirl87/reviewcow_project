package com.reviewcow.review;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/review")
@Controller
public class ReviewController {

	@RequestMapping("/myreview_list_view")
	public String myReviewList(Model model) {
		List<String> viewList = new ArrayList<>();
		
		viewList.add("include/side_menu");
		viewList.add("review/list_review");
		model.addAttribute("viewList", viewList);
		return "template/layout";
	}
	
	@RequestMapping("/write_review_view")
	public String writeReview(Model model) {
		List<String> viewList = new ArrayList<>();
		
		viewList.add("include/side_menu");
		viewList.add("review/write_review");
		model.addAttribute("viewList", viewList);
		return "template/layout";
	}
}
