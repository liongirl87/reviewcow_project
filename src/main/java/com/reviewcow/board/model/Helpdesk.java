package com.reviewcow.board.model;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Helpdesk {
	private int id;
	private int memberId;
	private String inquiryType;
	private String inquiryTitle;
	private String inquiryContent;
	private Date createdAt;
	private Date updatedAt;
}
