package com.reviewcow.board.model;

import java.util.List;

import com.reviewcow.member.model.Member;

import lombok.Getter;
import lombok.Setter;


@Getter
@Setter
public class HelpdeskMember {

	private Helpdesk helpdesk;
	private Member member;
	private List<HelpdeskReply> helpdeskReply;
	
	private int numberOfReplies;
	
}
