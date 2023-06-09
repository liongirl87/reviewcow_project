package com.reviewcow.review;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.reviewcow.member.model.Member;
import com.reviewcow.review.bo.ReviewBo;

@RequestMapping("/review")
@RestController
public class ReviewRestController {
	@Autowired
	private ReviewBo reviewBo;
	
	@PostMapping("/write_review")
	public Map<String, Object> writeReview(
			@RequestParam("point") int point,
			@RequestParam("reviewImgPath") MultipartFile reviewImgPathOri,
			@RequestParam("comment") String comment,
			@RequestParam("sellPostId") int sellPostId,
			HttpSession session){
		Map<String, Object> result = new HashMap<>();
		/* Integer memberId = (Integer)session.getAttribute("memberId"); */
		Member member = (Member)session.getAttribute("member");
		Integer memberId = (Integer)session.getAttribute("memberId");
		
		reviewBo.addReviewByMemberId(member, memberId, sellPostId, point, reviewImgPathOri, comment);
		
		
		result.put("code", "1");
		return result;
	}
}
