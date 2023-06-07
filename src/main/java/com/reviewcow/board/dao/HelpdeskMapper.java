package com.reviewcow.board.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.reviewcow.board.model.Helpdesk;

@Repository
public interface HelpdeskMapper {

	public void insertHelpdeskWriting(
			@Param("memberId") int memberId,
			@Param("inquiryType") String category,
			@Param("inquiryTitle") String subject,
			@Param("inquiryContent") String content);
	public List<Helpdesk> selectHelpdeskWritingListByMemberId(Integer memberId);
}
