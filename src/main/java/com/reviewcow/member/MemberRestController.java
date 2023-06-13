package com.reviewcow.member;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.reviewcow.common.EncryptUtils;
import com.reviewcow.member.bo.MemberBo;
import com.reviewcow.member.model.Business_Member;
import com.reviewcow.member.model.Influencer_Member;
import com.reviewcow.member.model.Member;
import com.reviewcow.member.model.MemberJoinForm;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@RequestMapping("/member")
@RestController
public class MemberRestController {
	@Autowired
	private MemberBo memberBo;
	
	/**
	 * 회원가입 API
	 * @param member
	 * @return
	 */
	@PostMapping("/join")
	public Map<String, Object> join(
			@ModelAttribute MemberJoinForm member) 
	{
		Map<String, Object> result = new HashMap<>();
		
		// salt값 생성
		String salt = EncryptUtils.getSalt();
		// 받아온 salt값 MemberJoinForm에 넣기
		member.setSalt(salt);
		
		//password 해싱
		member.setPassword(EncryptUtils.passWordHashing(member.getPassword(), salt));
		
		result.put("code", 1 );
		result.put("result", "success");
		
		// MemberBo로 전달(회원가입)
		memberBo.addMember(member);
		// MemberBo로 전달(회원타입별 추가정보)
		memberBo.addMemberType(member);
		return result;
	}
	
	/**
	 * 아이디 중복확인 API
	 * @param loginId
	 * @return
	 */
	@GetMapping("/is_duplicated_id")
	public Map<String, Object> isDuplicatedId(
			@RequestParam("loginId")String loginId)
	{
		Map<String, Object> result = new HashMap<>();
		
		Member member = memberBo.getMemberByLoginId(loginId);
		
		if (member != null) {
			// 아이디 사용불가(아이디 존재)
			result.put("code", 1);
			result.put("result", true);
		} else {
			// 아이디 사용가능(아이디 미 존재)
			result.put("code", 500);
			result.put("result", false);
		}
		return result;
	}
	/**
	 * 로그인
	 * @param loginId
	 * @param password
	 * @return
	 */
	
	@PostMapping("/login")
	public Map<String, Object> login(
			@RequestParam("loginId")String loginId,
			@RequestParam("password")String password,
			HttpServletRequest request)
	{
		Map<String, Object>result = new HashMap<>();
		// salt값 가져오기 위해 loginId로 가져오기
		Member member = memberBo.getMemberByLoginId(loginId);
		
		if (member == null) {	// loginId가 없는경우
			result.put("code", 500);
			result.put("result", "해당 아이디가 없습니다");
			return result;
		}
		
		String salt = member.getSalt();
		String hashedPassword = EncryptUtils.passWordHashing(password, salt);
		HttpSession session = request.getSession();
		
		if (hashedPassword.equals(member.getPassword())) {	// 비밀번호 일치
			
			if(member.getMemberType().equals("influencerMember")) {
				Influencer_Member Influencer = memberBo.getInfluencerMemberByLoginId(loginId);
				// 세션에 인플루언서 추가정보 담기
				session.setAttribute("Influencer", Influencer);
			} else if (member.getMemberType().equals("businessMember")) {
				Business_Member businessMember = memberBo.getBusinessMemberByLoginId(loginId);
				// 세션에 비지니스멤버 추가정보 담기
				session.setAttribute("businessMember", businessMember);
			}
			
			result.put("code", 1);
			result.put("result", "success");
			
			//세션에 유저정보 담기
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
	/**
	 * 회원정보 수정
	 * @param member
	 * @param session
	 * @return
	 */
	@PutMapping("/modify_myinfo")
	public Map<String, Object> result (
			@ModelAttribute MemberJoinForm member,
			HttpSession session) {
		Map<String, Object> result = new HashMap<>();
		
		// 세션에서 loginId값 가져오기
		Member sessionMember = (Member)session.getAttribute("member");
		
		// 한번 더 세션 로그인 아이디와 받아온 아이디가 동일한지 체크
		if (member.getLoginId().equals(sessionMember.getLoginId())) {
			memberBo.updateMemberByLoginId(member);
			
			result.put("code", 1);
			result.put("result", "success");
		} else {
			result.put("code", 500);
			result.put("errorMessage", "회원정보 수정에 실패");
		}
		
		// memeberType: influencer 인경우 추가정보 update
		if (sessionMember.getMemberType().equals("influencerMember")) {
			memberBo.updateInfluencerByLoginId(member);
		// memeberType: businessMember 인경우 추가정보 update	
		} else if (sessionMember.getMemberType().equals("businessMember")) {
			memberBo.updateBusinessMemberByLoginId(member);
		}
		
		return result;
		
	}
}

