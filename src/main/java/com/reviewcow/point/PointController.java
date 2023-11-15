package com.reviewcow.point;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
			HttpServletResponse response,
			HttpSession session) throws IOException {
		List<String> viewList = new ArrayList<>();
		Integer memberId = (Integer)session.getAttribute("memberId");
		
		/*
		 * response.setContentType("text/html; charset=UTF-8"); PrintWriter out =
		 * response.getWriter();
		 */
		
		// 비로그인 시 로그인 화면으로 이동 
		/*
		 * if(memberId == null) { out.println("<script>alert('로그인 후 이용해주세요')</script>");
		 * out.flush(); viewList.add("member/login"); model.addAttribute("viewList",
		 * viewList); return "template/layout"; }
		 */
		
		Integer prevId = 0;
		Integer nextId = 0;
		
		if (postPage == null) {
			postPage = 1;
		}
		PostPagingDTO postpaging = new PostPagingDTO(postPage, pointBo.countPointContentsByMemberId(memberId, null));
		
		// 포인트 리스트 가져오기
		List<Point> pointList = pointBo.getPointListByMemberIdForPaging(memberId, null, postpaging.getMysqlSkip() ,postpaging.getPostsperpage()); 
	
		model.addAttribute("postPaging", postpaging);
		model.addAttribute("prevId", prevId);
		model.addAttribute("nextId", nextId);
		
		// 현재 포인트 가져오기
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
	@RequestMapping("/manage_point_view/deposit_view")
	public String depositPointView(
			HttpSession session,
			Model model) {
		Integer memberId = (Integer)session.getAttribute("memberId");
		List<String> viewList = new ArrayList<>();
		
		viewList.add("include/side_menu");
		viewList.add("point/deposit_point");
		model.addAttribute("viewList", viewList);
		
		return "template/layout";
	}
	
	@RequestMapping("/manage_point_view/withdraw_view")
	public String withdrawPointView(
			HttpSession session,
			Model model) {
		Integer memberId = (Integer)session.getAttribute("memberId");
		List<String> viewList = new ArrayList<>();
		
		// 현재 포인트 가져오기
		int nowPoint = pointBo.getNowPointByMemberId(memberId);
		
		viewList.add("include/side_menu");
		viewList.add("point/withdraw_point");
		
		model.addAttribute("nowPoint", nowPoint);
		model.addAttribute("viewList", viewList);
		
		return "template/layout";
	}
}
