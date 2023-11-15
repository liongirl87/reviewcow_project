package com.reviewcow.board.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.reviewcow.board.model.HelpdeskReply;

@Repository
public interface HelpdeskReplyMapper {
	
	public void insertHelpdeskReply(
			@Param("memberId") int memberId, 
			@Param("helpdeskId")int helpdeskId, 
			@Param("content") String content);
	public List<HelpdeskReply> selectHelpdeskReplybyHelpdeskId (int helpdeskId);
	
	public void delHelpdeskReplyByReplyId(int replyId);
}
