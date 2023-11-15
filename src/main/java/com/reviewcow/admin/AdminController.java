package com.reviewcow.admin;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.reviewcow.board.model.Notice;
import com.reviewcow.board.bo.HelpdeskBo;
import com.reviewcow.board.bo.NoticeBo;
import com.reviewcow.board.model.HelpdeskMember;
import com.reviewcow.board.model.NoticeMember;
import com.reviewcow.member.bo.MemberBo;
import com.reviewcow.member.model.Business_Member_List;
import com.reviewcow.member.model.Member;
import com.reviewcow.member.model.MemberPoint;
import com.reviewcow.point.bo.PointBo;
import com.reviewcow.point.model.PointMember;
import com.reviewcow.postpaging.model.PostPagingDTO;
import com.reviewcow.sellpost.bo.SellPostBo;
import com.reviewcow.sellpost.model.SellPost;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	private MemberBo memberBo;
	@Autowired
	private SellPostBo sellPostBo;
	@Autowired
	private PointBo pointBo;
	@Autowired
	private HelpdeskBo helpdeskBo;
	@Autowired
	private NoticeBo noticeBo;

	@RequestMapping("/login_view")
	public String login(Model model) {
		model.addAttribute("viewList", "admin/admin_login");

		return "admin/admin_layout";
	}

	@RequestMapping("/manage")
	public String manage(Model model) {
		List<String> viewList = new ArrayList<>();

		viewList.add("admin/admin_top");
		viewList.add("admin/admin_sidemenu");
		viewList.add("admin/admin_manage_view");

		model.addAttribute("viewList", viewList);
		return "admin/admin_layout";
	}

	@GetMapping("/business_member_list")
	public String businessMemberList(@RequestParam(value = "prevId", required = false) Integer prevIdParam,
			@RequestParam(value = "nextId", required = false) Integer nextIdParam,
			@RequestParam(value = "postPage", required = false) Integer postPage, Model model) {

		// 하단 페이징
		Integer prevId = 0;
		Integer nextId = 0;

		if (postPage == null) {
			postPage = 1;
		}

		PostPagingDTO postpaging = new PostPagingDTO(postPage, memberBo.countBusinessMember());

		model.addAttribute("postPaging", postpaging);
		model.addAttribute("prevId", prevId);
		model.addAttribute("nextId", nextId);

		// 하단 페이징 끝
		List<String> viewList = new ArrayList<>();

		viewList.add("admin/admin_top");
		viewList.add("admin/admin_sidemenu");
		viewList.add("admin/admin_business_member");

		model.addAttribute("viewList", viewList);

		List<Business_Member_List> businessMemberList = memberBo.getBusinessMemberList(postpaging.getMysqlSkip(),postpaging.getPostsperpage());

		model.addAttribute("businessMemberList", businessMemberList);

		return "admin/admin_layout";
	}

	@GetMapping("/member_list")
	public String memberList(
			@RequestParam(value = "memberType", required = false) String memberType,
			@RequestParam(value = "prevId", required = false) Integer prevIdParam,
			@RequestParam(value = "nextId", required = false) Integer nextIdParam,
			@RequestParam(value = "postPage", required = false) Integer postPage,
			Model model) {

		// 하단 페이징
		Integer prevId = 0;
		Integer nextId = 0;

		if (postPage == null) {
			postPage = 1;
		}

		// PostPagingDTO postPaging = new PostPagingDTO(postPage, memberBo.countMember());
		
		  if (memberType == null) { 
			  PostPagingDTO postPaging = new PostPagingDTO(postPage, memberBo.countMember());
			  List<Member> memberList = memberBo.getMemberList(postPaging.getMysqlSkip(), postPaging.getPostsperpage());
			  model.addAttribute("postPaging", postPaging);
			  model.addAttribute("memberList", memberList);
			  } else {
		  	  PostPagingDTO postPaging = new PostPagingDTO(postPage, memberBo.countMemberByMemberType(memberType));
		  	  List<Member> memberList = memberBo.getMemberListByMemberType(memberType, postPaging.getMysqlSkip(), postPaging.getPostsperpage());
		  	  model.addAttribute("postPaging", postPaging);
			  model.addAttribute("memberList", memberList);
		  }
		 
		// model.addAttribute("postPaging", postPaging);
		model.addAttribute("prevId", prevId);
		model.addAttribute("nextId", nextId);
		model.addAttribute("memberType", memberType);

		// 하단 페이징 끝
		List<String> viewList = new ArrayList<>();

		viewList.add("admin/admin_top");
		viewList.add("admin/admin_sidemenu");
		viewList.add("admin/admin_member");

		model.addAttribute("viewList", viewList);

		// List<Member> memberList = memberBo.getMemberList(postPaging.getMysqlSkip(), postPaging.getPostsperpage());

		// model.addAttribute("memberList", memberList);

		return "admin/admin_layout";
	}

	// 2.체험단관리 - 체험단(대기중)

	@GetMapping("/before_sellpost_list")
	public String beforeApprovalSellpost(@RequestParam(value = "prevId", required = false) Integer prevIdParam,
			@RequestParam(value = "nextId", required = false) Integer nextIdParam,
			@RequestParam(value = "postPage", required = false) Integer postPage, Model model) {
		// 하단 페이징
		Integer prevId = 0;
		Integer nextId = 0;

		if (postPage == null) {
			postPage = 1;
		}
		Integer beforePost = 0;
		PostPagingDTO postpaging = new PostPagingDTO(postPage, sellPostBo.countSellPostBeforeApproval(beforePost));

		model.addAttribute("postPaging", postpaging);
		model.addAttribute("prevId", prevId);
		model.addAttribute("nextId", nextId);

		// 하단 페이징 끝
		List<String> viewList = new ArrayList<>();

		viewList.add("admin/admin_top");
		viewList.add("admin/admin_sidemenu");
		viewList.add("admin/admin_before_sellpost");

		model.addAttribute("viewList", viewList);

		List<SellPost> sellPostList = sellPostBo.getSellPostListBeforeApproval(postpaging.getMysqlSkip(),
				postpaging.getPostsperpage(), beforePost);

		model.addAttribute("sellPostList", sellPostList);

		return "admin/admin_layout";
	}

	// 체험단목록
	@GetMapping("/sellpost_list")
	public String sellpostList(@RequestParam(value = "prevId", required = false) Integer prevIdParam,
			@RequestParam(value = "nextId", required = false) Integer nextIdParam,
			@RequestParam(value = "postPage", required = false) Integer postPage, Model model) {
		// 하단 페이징
		Integer prevId = 0;
		Integer nextId = 0;

		if (postPage == null) {
			postPage = 1;
		}
		Integer allPost = 1;
		PostPagingDTO postpaging = new PostPagingDTO(postPage, sellPostBo.countSellPostBeforeApproval(allPost));

		model.addAttribute("postPaging", postpaging);
		model.addAttribute("prevId", prevId);
		model.addAttribute("nextId", nextId);

		// 하단 페이징 끝
		List<String> viewList = new ArrayList<>();

		viewList.add("admin/admin_top");
		viewList.add("admin/admin_sidemenu");
		viewList.add("admin/admin_sellpost");

		model.addAttribute("viewList", viewList);

		List<SellPost> sellPostList = sellPostBo.getSellPostListBeforeApproval(postpaging.getMysqlSkip(),
				postpaging.getPostsperpage(), allPost);

		model.addAttribute("sellPostList", sellPostList);

		return "admin/admin_layout";
	}

	@GetMapping("/charge_points")
	public String chargePoints(
			@RequestParam(value = "prevId", required = false) Integer prevIdParam,
			@RequestParam(value = "nextId", required = false) Integer nextIdParam,
			@RequestParam(value = "postPage", required = false) Integer postPage,
			Model model) {
		// 하단 페이징
		Integer prevId = 0;
		Integer nextId = 0;

		if (postPage == null) {
			postPage = 1;
		}
		// sort:2->충전
		Integer sort = 2;
		// status:0->대기 status:1->승인
		Integer status = 0;

		PostPagingDTO postpaging = new PostPagingDTO(postPage, pointBo.countChargePointBeforeApproval(sort, status));

		model.addAttribute("postPaging", postpaging);
		model.addAttribute("prevId", prevId);
		model.addAttribute("nextId", nextId);

		// 하단 페이징 끝
		List<String> viewList = new ArrayList<>();

		viewList.add("admin/admin_top");
		viewList.add("admin/admin_sidemenu");
		viewList.add("admin/admin_charge_point");

		model.addAttribute("viewList", viewList);

		List<PointMember> pointMemberList = pointBo.getChargePointBeforeApproval(postpaging.getMysqlSkip(),
				postpaging.getPostsperpage(), sort, status);

		model.addAttribute("pointMemberList", pointMemberList);
		model.addAttribute("sort", sort);

		return "admin/admin_layout";
	}

	// 포인트 인출
	@GetMapping("/withdraw_points")
	public String withdrawPoints(
			@RequestParam(value = "prevId", required = false) Integer prevIdParam,
			@RequestParam(value = "nextId", required = false) Integer nextIdParam,
			@RequestParam(value = "postPage", required = false) Integer postPage,
			Model model) {
		// 하단 페이징
		Integer prevId = 0;
		Integer nextId = 0;

		if (postPage == null) {
			postPage = 1;
		}
		// sort:3->포인트 출금
		Integer sort = 3;
		// status:0->대기 status:1->승인
		Integer status = 0;

		PostPagingDTO postpaging = new PostPagingDTO(postPage, pointBo.countChargePointBeforeApproval(sort, status));

		model.addAttribute("postPaging", postpaging);
		model.addAttribute("prevId", prevId);
		model.addAttribute("nextId", nextId);

		// 하단 페이징 끝
		List<String> viewList = new ArrayList<>();

		viewList.add("admin/admin_top");
		viewList.add("admin/admin_sidemenu");
		viewList.add("admin/admin_charge_point");

		model.addAttribute("viewList", viewList);

		List<PointMember> pointMemberList = pointBo.getChargePointBeforeApproval(postpaging.getMysqlSkip(),
				postpaging.getPostsperpage(), sort, status);

		model.addAttribute("pointMemberList", pointMemberList);
		model.addAttribute("sort", sort);

		return "admin/admin_layout";
	}

	@GetMapping("/manage_points")
	public String managePoints(
			@RequestParam(value = "prevId", required = false) Integer prevIdParam,
			@RequestParam(value = "nextId", required = false) Integer nextIdParam,
			@RequestParam(value = "postPage", required = false) Integer postPage,
			Model model) {

		// 하단 페이징
		Integer prevId = 0;
		Integer nextId = 0;

		if (postPage == null) {
			postPage = 1;
		}

		PostPagingDTO postpaging = new PostPagingDTO(postPage, memberBo.countMember());

		model.addAttribute("postPaging", postpaging);
		model.addAttribute("prevId", prevId);
		model.addAttribute("nextId", nextId);

		// 하단 페이징 끝
		List<String> viewList = new ArrayList<>();

		viewList.add("admin/admin_top");
		viewList.add("admin/admin_sidemenu");
		viewList.add("admin/admin_manage_points");

		model.addAttribute("viewList", viewList);

		List<MemberPoint> memberList = memberBo.getMemberListWithPoint(postpaging.getMysqlSkip(),
				postpaging.getPostsperpage());

		model.addAttribute("memberList", memberList);

		return "admin/admin_layout";
	}

	// 1:1문의
	@GetMapping("/helpdesk")
	public String helpdesk(@RequestParam(value = "prevId", required = false) Integer prevIdParam,
			@RequestParam(value = "nextId", required = false) Integer nextIdParam,
			@RequestParam(value = "postPage", required = false) Integer postPage, Model model) {
		// 하단 페이징
		Integer prevId = 0;
		Integer nextId = 0;

		if (postPage == null) {
			postPage = 1;
		}

		PostPagingDTO postpaging = new PostPagingDTO(postPage, helpdeskBo.countHelpdesk());

		model.addAttribute("postPaging", postpaging);
		model.addAttribute("prevId", prevId);
		model.addAttribute("nextId", nextId);

		// 하단 페이징 끝
		List<String> viewList = new ArrayList<>();

		viewList.add("admin/admin_top");
		viewList.add("admin/admin_sidemenu");
		viewList.add("admin/admin_helpdesk");

		model.addAttribute("viewList", viewList);

		List<HelpdeskMember> helpdeskList = helpdeskBo.getHelpdeskList(postpaging.getMysqlSkip(),postpaging.getPostsperpage());

		model.addAttribute("helpdeskList", helpdeskList);

		return "admin/admin_layout";
	}

	@GetMapping("/helpdesk_detail")
	public String helpdeskDetail(
			@RequestParam(value = "helpdeskId", required = false) Integer helpdeskId,
			Model model) {

		List<String> viewList = new ArrayList<>();

		viewList.add("admin/admin_top");
		viewList.add("admin/admin_sidemenu");
		viewList.add("admin/admin_helpdesk_detail");

		model.addAttribute("viewList", viewList);
		HelpdeskMember helpdeskMember = helpdeskBo.getHelpdeskMember(helpdeskId);

		model.addAttribute("helpdeskMember", helpdeskMember);

		return "admin/admin_layout";
	}

	// 5.공지사항 - 공지작성
	@GetMapping("/write_notice_view")
	public String writeNoticeView(Model model, HttpSession session) {

		int memberId = (int) session.getAttribute("memberId");

		List<String> viewList = new ArrayList<>();

		viewList.add("admin/admin_top");
		viewList.add("admin/admin_sidemenu");
		viewList.add("admin/admin_write_notice");

		model.addAttribute("viewList", viewList);
		model.addAttribute("memberId", memberId);

		return "admin/admin_layout";
	}

	@GetMapping("/notice_list")
	public String noticeList(@RequestParam(value = "prevId", required = false) Integer prevIdParam,
			@RequestParam(value = "nextId", required = false) Integer nextIdParam,
			@RequestParam(value = "postPage", required = false) Integer postPage, Model model) {

		// 하단 페이징
		Integer prevId = 0;
		Integer nextId = 0;

		if (postPage == null) {
			postPage = 1;
		}

		PostPagingDTO postpaging = new PostPagingDTO(postPage, noticeBo.countNotice());

		model.addAttribute("postPaging", postpaging);
		model.addAttribute("prevId", prevId);
		model.addAttribute("nextId", nextId);

		// 하단 페이징 끝

		List<String> viewList = new ArrayList<>();

		List<NoticeMember> noticeList = noticeBo.getNoticeList(postpaging.getMysqlSkip(),postpaging.getPostsperpage());

		viewList.add("admin/admin_top");
		viewList.add("admin/admin_sidemenu");
		viewList.add("admin/admin_notice_list");
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("viewList", viewList);

		return "admin/admin_layout";
	}

	@GetMapping("/modify_notice")
	public String modifyNotice(@RequestParam(value = "noticeId") int noticeId, Model model) {
		List<String> viewList = new ArrayList<>();

		Notice notice = noticeBo.getNoticeByNoticeId(noticeId);

		viewList.add("admin/admin_top");
		viewList.add("admin/admin_sidemenu");
		viewList.add("admin/admin_notice_modify");
		model.addAttribute("viewList", viewList);
		model.addAttribute("notice", notice);

		return "admin/admin_layout";

	}

	// 로그아웃
	@RequestMapping("/sign_out")
	public String signOut(HttpSession session) {
		// 세션에 있는 모든 것을 비운다.
		session.invalidate();
		// 화면 이동(로그인화면)
		return "redirect:/admin/login_view";
	}
}
