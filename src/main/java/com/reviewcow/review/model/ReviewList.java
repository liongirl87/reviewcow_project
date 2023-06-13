package com.reviewcow.review.model;

import java.util.Date;

import lombok.Setter;

@Setter

public class ReviewList {
	private int id;
	private String productName;
	private Integer reviewPoint;
	private int point;
	private int sort;
	private int status;
	private Date updatedAt;	
	
	public int getId() {
		return id;
	}
	public String getProductName() {
		return productName;
	}
	public Integer getReviewPoint() {
		return reviewPoint;
	}
	public int getPoint() {
		return point;
	}
	public int getSort() {
		return sort;
	}
	public int getStatus() {
		return status;
	}
	public Date getUpdatedAt() {
		return updatedAt;
	}
	
	
	
	
}
