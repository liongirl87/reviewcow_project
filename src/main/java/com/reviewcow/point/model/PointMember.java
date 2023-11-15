package com.reviewcow.point.model;

import com.reviewcow.member.model.Member;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PointMember {

	private Member member;
	private Point point;
	
}
