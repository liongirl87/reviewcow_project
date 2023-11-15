package com.reviewcow.applyproduct.model;

import java.util.Date;

import com.reviewcow.review.model.Review;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ManageApplicants {
	private Review review;
	
	private int sellPostId;
	private String productName;
	private int discountRate;
	private int applicationId;
	// 0: 승인대기, 1: 승인완료, 2: 검토요청, 3: 취소, 4: 지급완료
	private int applicationStatus;
	private Date applicationCreatedAt;
	private Date applicationUpdatedAt;
	
	private int memberId;
	private String memberLoginId;
	private String memberName;
	
}
