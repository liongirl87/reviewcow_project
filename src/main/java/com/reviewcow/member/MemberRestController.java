package com.reviewcow.member;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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

@RequestMapping("/member")
@RestController
public class MemberRestController {
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private MemberBo memberBo;

	/**
	 * 회원가입 API
	 * 
	 * @param member
	 * @return
	 */
	@PostMapping("/join")
	public Map<String, Object> join(@ModelAttribute MemberJoinForm member) {
		Map<String, Object> result = new HashMap<>();

		// salt값 생성
		String salt = EncryptUtils.getSalt();
		// 받아온 salt값 MemberJoinForm에 넣기
		member.setSalt(salt);

		// password 해싱
		member.setPassword(EncryptUtils.passWordHashing(member.getPassword(), salt));

		result.put("code", 1);
		result.put("result", "회원가입에 성공했습니다 로그인 후 이용해주세요.");

		// MemberBo로 전달(회원가입)
		memberBo.addMember(member);
		// MemberBo로 전달(회원타입별 추가정보)
		memberBo.addMemberType(member);
		return result;
	}

	/**
	 * 아이디 중복확인 API
	 * 
	 * @param loginId
	 * @return
	 */
	@GetMapping("/is_duplicated_id")
	public Map<String, Object> isDuplicatedId(
			@RequestParam("loginId") String loginId) {
		Map<String, Object> result = new HashMap<>();
		
		Member member = memberBo.getMemberByLoginId(loginId);

		// 가입시 아이디 중복체크
		if (member != null) {
			// 아이디가 존재하는경우 -> 가입불가
			result.put("code", 1);
			result.put("result", true);
			logger.warn("[Unable to join]ID already exists. ID:{}", member.getLoginId());
		} else {
			// 아이디 존재하지 않는경우 -> 가입가능
			result.put("code", 500);
			result.put("result", false);
		}
		return result;
	}

	/**
	 * 로그인
	 * 
	 * @param loginId
	 * @param password
	 * @return
	 */
	@PostMapping("/login")
	public Map<String, Object> login(
			@RequestParam("loginId") String loginId,
			@RequestParam("password") String password,
			HttpServletRequest request) {
		
		Map<String, Object> result = new HashMap<>();

		// salt값 가져오기 위해 loginId로 가져오기
		Member member = memberBo.getMemberByLoginId(loginId);

		if (member == null) { // loginId가 없는경우
			result.put("code", 500);
			result.put("result", "해당 아이디가 없습니다");
			return result;
		}

		String salt = member.getSalt();
		
		String hashedPassword = EncryptUtils.passWordHashing(password, salt);
		HttpSession session = request.getSession();

		if (hashedPassword.equals(member.getPassword())) { // 비밀번호 일치

			if (member.getMemberType().equals("influencerMember")) {
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

	/**
	 * 회원정보 수정
	 * 
	 * @param member
	 * @param session
	 * @return
	 */
	@PutMapping("/modify_myinfo")
	public Map<String, Object> result(
			@ModelAttribute MemberJoinForm member,
			HttpSession session) {
		Map<String, Object> result = new HashMap<>();

		// 세션에서 loginId값 가져오기
		Member sessionMember = (Member) session.getAttribute("member");
		String loginId = (String) session.getAttribute("memberLoginId");
		
		
		if (member.getPassword() != null && !member.getPassword().equals("")) {
			// salt값 생성
			String salt = EncryptUtils.getSalt();
			// 받아온 salt값 MemberJoinForm에 넣기
			member.setSalt(salt);
			// password 해싱
			member.setPassword(EncryptUtils.passWordHashing(member.getPassword(), salt));
		}

		// 한번 더 세션 로그인 아이디와 받아온 아이디가 동일한지 체크
		if (member.getLoginId().equals(sessionMember.getLoginId())) {
			memberBo.updateMemberByLoginId(member);

			Member updateMember = memberBo.getMemberByLoginId(loginId);
			session.setAttribute("member", updateMember);
			
			// memeberType: influencer 인경우 추가정보 update
			if (sessionMember.getMemberType().equals("influencerMember")) {
				memberBo.updateInfluencerByLoginId(member);
				
				Influencer_Member Influencer = memberBo.getInfluencerMemberByLoginId(loginId);
				session.setAttribute("Influencer", Influencer);
			// memeberType: businessMember 인경우 추가정보 update
			} else if (sessionMember.getMemberType().equals("businessMember")) {
				memberBo.updateBusinessMemberByLoginId(member);
				
				Business_Member businessMember = memberBo.getBusinessMemberByLoginId(loginId);
				session.setAttribute("businessMember", businessMember);
			}
			result.put("code", 1);
			result.put("result", "정보수정에 성공하였습니다");
			
		} else {
			result.put("code", 500);
			result.put("errorMessage", "회원정보 수정에 실패");
			
		}
		return result;
	}
	/**
	 * 
	 * @param password
	 * @param session
	 * @return
	 */
	@PostMapping("/check_pw")
	public Map<String, Object> checkPassword(
			@RequestParam("password") String password,
			HttpSession session) {
		Map<String, Object> result = new HashMap<>();
		
		// 세션에서 member 꺼내오기
		Member member =(Member)session.getAttribute("member");
		// 솔트값 가져오기
		String salt = member.getSalt();
		
		String hashedPassword = EncryptUtils.passWordHashing(password, salt);
		
		if (hashedPassword.equals(member.getPassword())) {
			result.put("code", "success");
			//암호 일치경우
		} else {
			//암호 비일치
			result.put("code", "fail");
		}
		return result;
	}
}
