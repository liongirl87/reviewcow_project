package com.reviewcow.point.model;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Point {
	private int id;
	private int memberId;
	private int sellPostId;
	private int point;
	// sort-> 0:체험단적립(+), 1:체험단지출(-), 2:충전하기(+), 3:출금하기(-) 4.기타(+) 5.기타(-)
	private int sort;
	// status-> 0: 대기, 1: 승인 2: 취소
	private int status;
	private Date createdAt;
	private Date updatedAt;
}
