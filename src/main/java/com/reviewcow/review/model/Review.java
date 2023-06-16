package com.reviewcow.review.model;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Review {
	
	private int id;
	private int memberId;
	private int sellPostId;
	private int reviewPoint;
	private String reviewImgPath;
	private String comment;
	private Date createdAt;
	private Date updatedAt;
}
