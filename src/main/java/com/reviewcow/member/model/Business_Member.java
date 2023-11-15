package com.reviewcow.member.model;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Business_Member {
	private int id;
	private String memberLoginId;
	private String businessName;
	private String businessLicenseNumber;
	private Date updatedAt;
}
