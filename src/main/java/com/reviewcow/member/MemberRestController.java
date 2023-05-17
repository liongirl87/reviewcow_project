package com.reviewcow.member;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.reviewcow.common.EncryptUtils;
import com.reviewcow.member.BO.MemberBo;
import com.reviewcow.member.model.MemberJoinForm;

@RequestMapping("/member")
@RestController
public class MemberRestController {
	@Autowired
	private MemberBo memberBo;
	
	@PostMapping("/join")
	public Map<String, Object> join(
			@ModelAttribute MemberJoinForm member) 
		{
		Map<String, Object> result = new HashMap<>();
		//password 해싱
		member.setPassword(EncryptUtils.getSha512(member.getPassword()));
		
		
		String checkSalt = member.getSalt();
		
		result.put("code", 1 );
		result.put("result", "success");
		
		memberBo.addMember(member);
				
		return result;
	}
}
