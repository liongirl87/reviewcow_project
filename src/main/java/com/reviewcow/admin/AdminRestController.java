package com.reviewcow.admin;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.reviewcow.board.bo.HelpdeskBo;
import com.reviewcow.board.bo.NoticeBo;
import com.reviewcow.common.EncryptUtils;
import com.reviewcow.member.bo.MemberBo;
import com.reviewcow.member.model.Member;
import com.reviewcow.point.bo.PointBo;
import com.reviewcow.sellpost.bo.SellPostBo;

@RestController
@RequestMapping("/admin")
public class AdminRestController {
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
	
	@PostMapping("/login")
	public Map<String, Object> login(
			@RequestParam("loginId") String loginId,
			@RequestParam("password") String password,
			HttpServletRequest request) {
		Map<String, Object> result = new HashMap<>();

		// salt값 가져오기 위해 loginId로 가져오기
		Member member = memberBo.getMemberByLoginId(loginId);
		
		
		if (loginId.equals("admin"))
			{ } else { result.put("code", 500);
			result.put("result", "관리자만 로그인이 가능합니다.");
			return result; }
		 
		
		if (member == null) { // loginId가 없는경우
			result.put("code", 500);
			result.put("result", "해당 아이디가 없습니다");
			return result;
		}

		String salt = member.getSalt();
		String hashedPassword = EncryptUtils.passWordHashing(password, salt);
		HttpSession session = request.getSession();
		
		if (hashedPassword.equals(member.getPassword())) { // 비밀번호 일치

			result.put("code", 1);
			result.put("result", "로그인 성공");

			// 세션에 유저정보 담기
			session.setAttribute("member", member);
			session.setAttribute("memberId", member.getId());
			session.setAttribute("memberLoginId", member.getLoginId());
			return result;
			
		} else {
			result.put("code", 500);
			result.put("result", "비밀번호가 일치하지 않습니다.");
			return result;
		}
	}
	
	@PutMapping("/approval_business_member")
	public Map<String, Object> approvalBusinessMember(
			@RequestParam("id") int id,
			@RequestParam("approvalCondition") int approvalCondition){
		Map<String, Object> result = new HashMap<>();
		
		memberBo.updateBusinessMemberById(id, approvalCondition);
		
		return result;
		
	}
	@PutMapping("/approval_sellpost")
	public Map<String, Object> approvalSellPost(
			@RequestParam("id")int id,
			@RequestParam("approvalCondition") int approvalCondition) {
		Map<String, Object> result = new HashMap<>();
		
		sellPostBo.approveSellPost(id, approvalCondition);
		
		return result;
	}
	
	@PutMapping("/approval_chargepoint")
	public Map<String, Object> approvalChargePoint(
			@RequestParam("id") int id,
			@RequestParam("approvalCondition") int approvalCondition) {
		Map<String, Object> result = new HashMap<>();
		
		pointBo.approvalChargePoint(id, approvalCondition);
		return result;
	}
	
	@PostMapping("/change_member_point")
	public Map<String, Object> changeMemberPoint(
			@RequestParam("memberId") int memberId,
			@RequestParam("point") int point
			) {
		Map<String, Object> result = new HashMap<>();

		// sort = 4(기타 +), sort = 5(기타-)
		int sort = 0;

		if(point > 0) {
			sort = 4;
		} else {
			sort = 5;
		}
		pointBo.addPointByMemberId(memberId, point, null, sort);
		
		return result;
	}
	
	@PostMapping("/helpdesk_reply")
	public Map<String, Object> helpdeskReply(
			@RequestParam("helpdeskId") int helpdeskId,
			@RequestParam("content") String content,
			HttpSession session
			){
		Map<String, Object> result = new HashMap<>();
		int memberId = (int)session.getAttribute("memberId");
		
		helpdeskBo.addHelpdeskReply(memberId, helpdeskId, content);
		return result;
	}
	
	@DeleteMapping("/del_helpdesk_reply")
	public Map<String, Object> delHelpdeskReply(
			@RequestParam("replyId") int replyId) {
		Map<String, Object> result = new HashMap<>();
		
		helpdeskBo.delHelpdeskReplyByReplyId(replyId);
		
		return result;
	}
	
	@GetMapping("/write_notice")
	public Map<String, Object> writeNotice(
			@RequestParam("category") String category,
			@RequestParam("postTitle") String postTitle,
			@RequestParam("content") String content,
			HttpSession session
			) {
		Map<String, Object> result = new HashMap<>();
		
		int memberId = (int)session.getAttribute("memberId");
		noticeBo.addNoticeByMemberId(memberId, category, postTitle, content);
		
		
		return result;
	}
	
	@PutMapping("/update_notice")
	public Map<String, Object> updateNoticeByNoticeId(
			@RequestParam("id") int id,
			@RequestParam("category") String category,
			@RequestParam("postTitle") String postTitle,
			@RequestParam("content") String content,
			HttpSession session
			) {
		Map<String, Object> result = new HashMap<>();
		
		int memberId = (int)session.getAttribute("memberId");
		
		noticeBo.updateNoticeByNoticeId(id, memberId, category, postTitle, content);
		
		return result;
	}
	
	@DeleteMapping("/delete_notice")
	public Map<String, Object> deleteNoticeByNoticeId(
			@RequestParam("id") int id) {
		Map<String, Object> result = new HashMap<>();
		
		noticeBo.deleteNoticeByNoticeId(id);
		
		return result;
	}
	
}
