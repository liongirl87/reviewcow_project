package com.reviewcow.review.model;

import com.reviewcow.applyproduct.model.Application;
import com.reviewcow.sellpost.model.SellPost;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class ReviewList {
	private Application application;

	private SellPost sellPost;
	private Review review;
		
}
