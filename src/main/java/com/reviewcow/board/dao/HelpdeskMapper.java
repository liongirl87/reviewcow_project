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
	
	public int countPointContentsByMemberId(Integer memberId);
	
	public List<Helpdesk> selectHelpdeskContentsByMemberIdForPaging (
			@Param("memberId") Integer memberId,
			@Param("skipLimit") int skipLimit,
			@Param("limit") int limit);
	
	public Helpdesk selecthelpdeskContentsByPostId(Integer postId);
	
	public int deleteHelpdsekByPostId(int postId);
	
	public int updateHelpdeskByPostId(
			@Param("content") String content,
			@Param("postId") int postId);
}

