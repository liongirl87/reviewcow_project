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
	private int applicationId;
	private int applicationStatus;
	private Date applicationCreatedAt;
	private int memberId;
	private String memberLoginId;
	private String memberName;
	
}
