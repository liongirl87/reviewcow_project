package com.reviewcow.member;

import java.util.HashMap;
import java.util.Map;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.reviewcow.common.EncryptUtils;

@RequestMapping("/member")
@RestController
public class MemberRestController {
	
	@PostMapping("/join")
	public Map<String, Object> join(
			@RequestParam("memberType") String memberType,
			@RequestParam("loginId") String loginId,
			@RequestParam("password") String password,
			@RequestParam("name") String name,
			@RequestParam("email") String email,
			@RequestParam("address") String address,
			@RequestParam(value = "telePhoneNumber", required=false) String telePhoneNumber,
			@RequestParam(value = "mobilePhoneNumber") String mobilePhoneNumber,
			@RequestParam(value = "instagramId", required=false) String instagramId,
			@RequestParam(value = "facebookUrl", required=false) String facebookUrl,
			@RequestParam(value = "youtubeUrl", required=false) String youtubeUrl,
			@RequestParam(value = "blogUrl", required=false) String blogUrl,
			@RequestParam(value = "twitterUrl", required=false) String twitterUrl,
			@RequestParam(value = "OtherUrl", required=false) String OtherUrl,
			@RequestParam(value = "businessName", required=false) String businessName,
			@RequestParam(value = "businessLicenseNumber", required=false) String businessLicenseNumber
			) 
		{
		
		Map<String, Object> result = new HashMap<>();
		String hashedPassword = EncryptUtils.getSha512(password);
		
		
		return result;
	}
}
