package com.reviewcow.review.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.reviewcow.review.dao.ReviewMapper;

@Service
public class ReviewBo {
	@Autowired
	private ReviewMapper reviewMapper;
	
	public void addReviewByMemberId(Integer memberId, int sellPostId, int point, String reviewImgPath, String comment) {
		reviewMapper.insertReviewByMemberId(memberId, sellPostId, point, reviewImgPath, comment);
	}
}
