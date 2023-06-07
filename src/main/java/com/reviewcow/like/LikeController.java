package com.reviewcow.like;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.reviewcow.sellpost.bo.SellPostBo;
import com.reviewcow.sellpost.model.SellPost;

import javax.servlet.http.HttpSession;

@Controller
public class LikeController {
	@Autowired
	private SellPostBo sellPostBo;
	
	@RequestMapping("/like_list_view")
	public String myLikeList(HttpSession session, Model model) {
		List<String> viewList = new ArrayList<>();
		Integer memberId = (Integer)session.getAttribute("memberId");
		List<SellPost> likeSellPostList = sellPostBo.getLikeSellPostListbyMemberId(memberId);
		
		viewList.add("include/side_menu");
		viewList.add("like/like_list");
		model.addAttribute("viewList", viewList);
		model.addAttribute("likeSellPostList", likeSellPostList);
		return "template/layout";
	}
}
