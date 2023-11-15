package com.reviewcow.applyproduct.model;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Application {
	private int id;
	private int memberId;
	private int sellPostId;
	
	// 0: 승인대기, 1: 승인완료, 2: 검토요청, 3: 취소, 4: 지급완료
	private int status;
	private Date createdAt;
	private Date updatedAt;
	
	// 지원자 정보(이름)
	private String memberLoginId;
	private String memberName;
}
