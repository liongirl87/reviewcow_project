package com.reviewcow.board.model;

import com.reviewcow.member.model.Member;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class NoticeMember {

	private Notice notice;
	private Member member;
}
