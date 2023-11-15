package com.reviewcow.board.model;

import java.util.Date;

import com.reviewcow.member.model.Member;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class HelpdeskReply {
	private Member member;
	
	private int id;
	private int memberId;
	private int helpdeskId;
	private String content;
	private Date createdAt;
	private Date updatedAt;
	
}
