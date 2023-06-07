package com.reviewcow.applyproduct;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.reviewcow.applyproduct.bo.ApplicationtBo;

import javax.servlet.http.HttpSession;

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
}
