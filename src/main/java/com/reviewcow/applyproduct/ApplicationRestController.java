package com.reviewcow.applyproduct;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.reviewcow.applyproduct.bo.ApplicationtBo;

@RequestMapping("/application")
@RestController
public class ApplicationRestController {

	@Autowired
	private ApplicationtBo applicationBo;
	
	@GetMapping("/apply_product/{sellPostId}")
	public Map<String, Object> applyProduct(
			@PathVariable int sellPostId,
			HttpSession session){
		Map<String, Object> result = new HashMap<>();
		int memberId = (int)session.getAttribute("memberId");
		
		applicationBo.checkApplyProduct(memberId, sellPostId);
		
		result.put("code", 1);
		
		return result;
	}
	
	@PutMapping("/approval_applicant")
	public Map<String, Object> approvalApplicant(
			@RequestParam("memberId") int memberId,
			@RequestParam("sellPostId") int sellPostId,
			@RequestParam("status") int status
			){
		Map<String, Object> result = new HashMap<>();
		
		if(applicationBo.approvalApplicantBySellpostId(memberId, sellPostId, status)) {
			result.put("code", 1);
		} else {
			result.put("code", 400);
			result.put("errorMessage", "해당 신청자 승인에 실패하였습니다");
		}
		
		return result;
	}
}
