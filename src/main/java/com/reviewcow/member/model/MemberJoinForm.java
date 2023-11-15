package com.reviewcow.member.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MemberJoinForm {
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
	private int approvalCondition;
	private String instagramId;
	private String facebookUrl;
	private String youtubeUrl;
	private String blogUrl;
	private String twitterUrl;
	private String OtherUrl;
	private String businessName;
	private String businessLicenseNumber;
	
	public MemberJoinForm() {}

}
