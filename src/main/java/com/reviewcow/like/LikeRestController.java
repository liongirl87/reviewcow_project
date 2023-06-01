package com.reviewcow.like;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.reviewcow.like.bo.LikeBo;
import com.reviewcow.member.model.Member;

import jakarta.servlet.http.HttpSession;

@RestController
public class LikeRestController {

	@Autowired
	private LikeBo likeBo;
	
	@RequestMapping("/like/{sellPostId}")
	public Map<String, Object> likeSellPost(
			@PathVariable int sellPostId,
			HttpSession session) {
		
		Map<String, Object>result = new HashMap<>();
		// 세션에서 현재 로그인 회원 정보 가져오기
		
		Member sessionMember = (Member)session.getAttribute("member");
		if (sessionMember == null) {
			result.put("code", 300);
			result.put("errorMessage", "로그인을 해주세요");
			return result;
		}
		Integer memberId = (Integer)sessionMember.getId();
		
		likeBo.checkLike(memberId, sellPostId);
		
		result.put("code", 1);
		
		return result;
	}
}
