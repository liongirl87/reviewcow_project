package com.reviewcow.point;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.reviewcow.main.model.CardView;
import com.reviewcow.member.bo.MemberBo;
import com.reviewcow.point.bo.PointBo;
import com.reviewcow.point.model.Point;
import com.reviewcow.postpaging.model.PostPagingDTO;

@RequestMapping("/point")
@Controller
public class PointController {
	@Autowired
	private MemberBo memberBo;
	@Autowired
	private PointBo pointBo;
	
	@RequestMapping("/manage_point_view")
	public String managePointView(
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
		PostPagingDTO postpaging = new PostPagingDTO(postPage, pointBo.countPointContentsByMemberId(memberId, null));
		
		List<Point> pointList = pointBo.getPointListByMemberIdForPaging(memberId, null, postpaging.getMysqlSkip() ,postpaging.getPostsperpage()); 
	
		model.addAttribute("postPaging", postpaging);
		model.addAttribute("prevId", prevId);
		model.addAttribute("nextId", nextId);
		
		int nowPoint = pointBo.getNowPointByMemberId(memberId);
		
		viewList.add("include/side_menu");
		viewList.add("point/manage_point");
		model.addAttribute("viewList", viewList);
		model.addAttribute("nowPoint", nowPoint);
		model.addAttribute("pointList", pointList);
		return "template/layout";
	}
	
	@GetMapping("/change_point_status")
	public String changePointStatus(
			@RequestParam(value = "prevId", required=false) Integer prevIdParam,
			@RequestParam(value = "nextId", required=false) Integer nextIdParam,
			@RequestParam(value = "postPage" ,required=false) Integer postPage,
			@RequestParam(value = "status", required=false) Integer status,
			HttpSession session,
			Model model
			) {
		
		List<String> viewList = new ArrayList<>();
		Integer memberId = (Integer)session.getAttribute("memberId");
		
		Integer prevId = 0;
		Integer nextId = 0;
		
		if (postPage == null) {
			postPage = 1;
		}
		if (status == 3) {
			status = null; 
		}
		
		PostPagingDTO postpaging = new PostPagingDTO(postPage, pointBo.countPointContentsByMemberId(memberId, status));
		List<Point> pointList = pointBo.getPointListByMemberIdForPaging(memberId, status, postpaging.getMysqlSkip() ,postpaging.getPostsperpage()); 
	
		model.addAttribute("postPaging", postpaging);
		model.addAttribute("prevId", prevId);
		model.addAttribute("nextId", nextId);
		
		int nowPoint = pointBo.getNowPointByMemberId(memberId);
		
		// viewList.add("point/manage_point");
		
		// model.addAttribute("viewList", viewList);
		model.addAttribute("nowPoint", nowPoint);
		model.addAttribute("pointList", pointList);
		return "point/manage_point";
	}
	
}
