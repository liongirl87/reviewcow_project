package com.reviewcow.member.model;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Member {
	private int id;
	private String memberType;
	private String loginId;
	private String password;
	private String salt;
	private String name;
	private String email;
	private String address;
	private String telePhoneNumber;
	private String mobilePhoneNumber;
	private int nowPoint;
	private Date createdAt;
	private Date updatedAt;
}
