package com.reviewcow.board;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.reviewcow.board.bo.HelpdeskBo;
import com.reviewcow.board.bo.NoticeBo;
import com.reviewcow.board.model.Helpdesk;
import com.reviewcow.board.model.HelpdeskMember;
import com.reviewcow.board.model.Notice;
import com.reviewcow.board.model.NoticeMember;
import com.reviewcow.member.bo.MemberBo;
import com.reviewcow.postpaging.model.PostPagingDTO;

@Controller
@RequestMapping("/board")
public class BoardController {
	@Autowired
	private HelpdeskBo helpdeskBo;
	@Autowired
	private MemberBo memberBo;
	@Autowired
	private NoticeBo noticeBo;

	@RequestMapping("/helpdesk_write_view")
	public String helpdeskWrite(Model model) {
		List<String> viewList = new ArrayList<>();
		
		viewList.add("include/side_menu");
		viewList.add("board/helpdesk_write");
		model.addAttribute("viewList", viewList);
		return "template/layout";
	}
	
	@RequestMapping("/helpdesk_view")
	public String helpdeskView(
			@RequestParam(value = "prevId", required=false) Integer prevIdParam,
			@RequestParam(value = "nextId", required=false) Integer nextIdParam,
			@RequestParam(value = "postPage" ,required=false) Integer postPage,
			Model model,
			HttpSession session) {
		List<String> viewList = new ArrayList<>();
		Integer memberId = (Integer)session.getAttribute("memberId");		
		
		// 비로그인 시 로그인 화면으로 이동 
		/*
		 * if(memberId == null) { viewList.add("member/login");
		 * model.addAttribute("viewList", viewList); return "template/layout"; }
		 */
		
		Integer prevId = 0;
		Integer nextId = 0;
		
		if (postPage == null) {
			postPage = 1;
		}
		PostPagingDTO postpaging = new PostPagingDTO(postPage, helpdeskBo.countPointContentsByMemberId(memberId));
		
		
		List<HelpdeskMember> helpdeskMemberList = helpdeskBo.getHelpdeskListByMemberId(memberId, postpaging.getMysqlSkip() ,postpaging.getPostsperpage());;
				
		model.addAttribute("postPaging", postpaging);
		model.addAttribute("prevId", prevId);
		model.addAttribute("nextId", nextId);
		
		viewList.add("include/side_menu");
		viewList.add("board/helpdesk");
		model.addAttribute("viewList", viewList);
		model.addAttribute("helpdeskMemberList", helpdeskMemberList);
		
		return "template/layout";
	}
	
	@GetMapping("/helpdesk_detail")
	public String helpdeskDetail(
			@RequestParam(value = "postId", required=false) Integer helpdeskId,
			Model model,
			HttpSession session) {
		List<String> viewList = new ArrayList<>();
		
		HelpdeskMember helpdeskMember = helpdeskBo.getHelpdeskMember(helpdeskId);
		
		viewList.add("include/side_menu");
		viewList.add("board/helpdesk_detail");
		model.addAttribute("viewList", viewList);
		model.addAttribute("helpdeskMember", helpdeskMember);
		
		return "template/layout";
	}
	
	@GetMapping("/helpdesk_modify")
	public String helpdeskModify(
			@RequestParam(value = "postId", required=false) Integer postId,
			Model model,
			HttpSession session) {
		List<String> viewList = new ArrayList<>();
		
		Helpdesk helpdesk = helpdeskBo.gethelpdeskContentsByPostId(postId);
		
		String memberLoginId = memberBo.getMemberLoginIdForHelpdesk(helpdesk.getMemberId());
		
		
		viewList.add("include/side_menu");
		viewList.add("board/helpdesk_modify");
		model.addAttribute("viewList", viewList);
		model.addAttribute("helpdesk", helpdesk);
		model.addAttribute("memberLoginId", memberLoginId);
		
		return "template/layout";
	}
	
	@RequestMapping("/notice_list")
	public String noticeList(
			@RequestParam(value = "prevId", required=false) Integer prevIdParam,
			@RequestParam(value = "nextId", required=false) Integer nextIdParam,
			@RequestParam(value = "postPage" ,required=false) Integer postPage,
			Model model,
			HttpSession session) {
		List<String> viewList = new ArrayList<>();
		
		Integer prevId = 0;
		Integer nextId = 0;
		
		if (postPage == null) {
			postPage = 1;
		}
		PostPagingDTO postpaging = new PostPagingDTO(postPage, noticeBo.countNotice());
		
		List<NoticeMember> noticeList = noticeBo.getNoticeList(postpaging.getMysqlSkip(),postpaging.getPostsperpage());
				
		model.addAttribute("postPaging", postpaging);
		model.addAttribute("prevId", prevId);
		model.addAttribute("nextId", nextId);
		
		viewList.add("include/side_menu");
		viewList.add("board/notice_list");
		model.addAttribute("viewList", viewList);
		model.addAttribute("noticeList", noticeList);
		
		return "template/layout";
	}
	
	@GetMapping("/notice_detail")
	public String noticeDetail(
			@RequestParam(value = "noticeId", required=false) Integer noticeId,
			Model model,
			HttpSession session) {
		List<String> viewList = new ArrayList<>();
		
		Notice notice = noticeBo.getNoticeByNoticeId(noticeId);
		
		viewList.add("include/side_menu");
		viewList.add("board/notice_detail");
		model.addAttribute("viewList", viewList);
		model.addAttribute("notice", notice);
		
		return "template/layout";
	}
	
}
