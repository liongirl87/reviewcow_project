package com.reviewcow.review;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.reviewcow.review.bo.ReviewBo;

import javax.servlet.http.HttpSession;

@RequestMapping("/review")
@RestController
public class ReviewRestController {
	@Autowired
	private ReviewBo reviewBo;
	
	@PostMapping("/write_review")
	public Map<String, Object> writeReview(
			@RequestParam("point") int point,
			@RequestParam("reviewImgPath") String reviewImgPath,
			@RequestParam("comment") String comment,
			@RequestParam("sellPostId") int sellPostId,
			HttpSession session){
		Map<String, Object> result = new HashMap<>();
		Integer memberId = (Integer)session.getAttribute("memberId");
		
		reviewBo.addReviewByMemberId(memberId, sellPostId, point, reviewImgPath, comment);
		
		
		result.put("code", "1");
		return result;
	}
}
