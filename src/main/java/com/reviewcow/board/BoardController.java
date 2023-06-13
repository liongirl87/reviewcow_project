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
import com.reviewcow.board.model.Helpdesk;
import com.reviewcow.member.bo.MemberBo;
import com.reviewcow.postpaging.model.PostPagingDTO;

@Controller
@RequestMapping("/board")
public class BoardController {
	@Autowired
	private HelpdeskBo helpdeskBo;
	@Autowired
	private MemberBo memberBo;

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
		
		Integer prevId = 0;
		Integer nextId = 0;
		
		if (postPage == null) {
			postPage = 1;
		}
		PostPagingDTO postpaging = new PostPagingDTO(postPage, helpdeskBo.countPointContentsByMemberId(memberId));
		
		List<Helpdesk> helpdeskList = helpdeskBo.getHelpdeskContentsByMemberIdForPaging(memberId, postpaging.getMysqlSkip() ,postpaging.getPostsperpage()); 
	
		model.addAttribute("postPaging", postpaging);
		model.addAttribute("prevId", prevId);
		model.addAttribute("nextId", nextId);
		
		// List<Helpdesk> helpdeskList = helpdeskBo.getHelpdeskWritingListByMemberId(memberId);
		
		viewList.add("include/side_menu");
		viewList.add("board/helpdesk");
		model.addAttribute("viewList", viewList);
		model.addAttribute("helpdeskList", helpdeskList);
		
		return "template/layout";
	}
	
	@GetMapping("/helpdesk_detail")
	public String helpdeskDetail(
			@RequestParam(value = "postId", required=false) Integer postId,
			Model model,
			HttpSession session) {
		List<String> viewList = new ArrayList<>();
		
		Helpdesk helpdesk = helpdeskBo.gethelpdeskContentsByPostId(postId);
		
		String memberLoginId = memberBo.getMemberLoginIdForHelpdesk(helpdesk.getMemberId());
		
		
		viewList.add("include/side_menu");
		viewList.add("board/helpdesk_detail");
		model.addAttribute("viewList", viewList);
		model.addAttribute("helpdesk", helpdesk);
		model.addAttribute("memberLoginId", memberLoginId);
		
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
	
}
