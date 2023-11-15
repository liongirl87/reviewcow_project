package com.reviewcow.like;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.reviewcow.postpaging.model.PostPagingDTO;
import com.reviewcow.sellpost.bo.SellPostBo;
import com.reviewcow.sellpost.model.SellPost;

@Controller
public class LikeController {
	@Autowired
	private SellPostBo sellPostBo;
	
	@RequestMapping("/like_list_view")
	public String myLikeList(
			@RequestParam(value = "prevId", required=false) Integer prevIdParam,
			@RequestParam(value = "nextId", required=false) Integer nextIdParam,
			@RequestParam(value = "postPage" ,required=false) Integer postPage,
			HttpSession session,
			Model model) {
		List<String> viewList = new ArrayList<>();
		Integer memberId = (Integer)session.getAttribute("memberId");
		
		// 비로그인 시 로그인 화면으로 이동 
		if(memberId == null) {
			viewList.add("member/login");
			model.addAttribute("viewList", viewList);
			return "template/layout";
		}
		
		//List<SellPost> likeSellPostList = sellPostBo.getLikeSellPostListbyMemberId(memberId);
		
		Integer prevId = 0;
		Integer nextId = 0;
		
		if (postPage == null) {
			postPage = 1;
		}
		PostPagingDTO postpaging = new PostPagingDTO(postPage, sellPostBo.countLikeSellPostListbyMemberId(memberId));
		
		List<SellPost> likeSellPostList = sellPostBo.getLikeSellPostListByMemberIdForPaging(memberId, postpaging.getMysqlSkip() ,postpaging.getPostsperpage()); 
	
		model.addAttribute("postPaging", postpaging);
		model.addAttribute("prevId", prevId);
		model.addAttribute("nextId", nextId);
		
		
		viewList.add("include/side_menu");
		viewList.add("like/like_list");
		model.addAttribute("viewList", viewList);
		model.addAttribute("likeSellPostList", likeSellPostList);
		return "template/layout";
	}
}
