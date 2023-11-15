package com.reviewcow.member.model;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Influencer_Member {
	private int id;
	private String memberLoginId;
	private String instagramId;
	private String facebookUrl;
	private String youtubeUrl;
	private String blogUrl;
	private String twitterUrl;
	private String otherUrl;
	private Date updatedAt;
}
