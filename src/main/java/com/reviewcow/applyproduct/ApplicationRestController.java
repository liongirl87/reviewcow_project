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
			@RequestParam (value = "status", required = false)String status,
			HttpSession session){
		Map<String, Object> result = new HashMap<>();
		
		Integer memberId = (Integer)session.getAttribute("memberId");
		
		if (memberId == null) {
			result.put("code", 400);
			result.put("errorMessage", "로그인 후 이용해 주세요.");
			return result;
		}
		
		applicationBo.checkApplyProduct(memberId, sellPostId);
		
		if (status == null) {
			result.put("code", 1);
			return result;
		}
		
		
		if (status.equals("application")) {
			result.put("code", 1);
			result.put("result", "체험단에 신청하였습니다");
		} else if (status.equals("cancellation")) {
			result.put("code", 1);
			result.put("result", "체험단에 취소하였습니다");
		}
		
		return result;
	}
	
	@PutMapping("/approval_applicant")
	public Map<String, Object> approvalApplicant(
			@RequestParam("memberId") int memberId,
			@RequestParam("sellPostId") int sellPostId,
			@RequestParam("status") int status,
			@RequestParam(value = "point", required=false) Integer point
			){
		Map<String, Object> result = new HashMap<>();
		
		int resultCode = applicationBo.approvalApplicantBySellpostId(memberId, sellPostId, status, point);
		
		if( resultCode == 201) {
			result.put("code", 201);
			result.put("resultMessage", "승인에 성공했습니다.");
		} else if ( resultCode == 202 ) {
			result.put("code", 202);
			result.put("resultMessage", "검토를 요청하였습니다.");
		} else if (resultCode == 203) {
			result.put("code", 203);
			result.put("resultMessage", "거절처리 되었습니다.");
		} else if (resultCode == 204) {
			result.put("code", 204);
			result.put("resultMessage", "포인트가 지급 처리되었습니다.");
		} else if (resultCode == 205) {
			result.put("code", 205);
			result.put("resultMessage", "신청 인원수를 초과하였습니다.");
		} else if (resultCode == 400) {
			result.put("code", 400);
			result.put("resultMessage", "작업에 실패하였습니다");
		} else {
			result.put("code", 400);
			result.put("resultMessage", "작업에 실패하였습니다");
		}
		return result;
	}
}
