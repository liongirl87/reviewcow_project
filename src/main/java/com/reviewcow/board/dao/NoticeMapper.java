package com.reviewcow.board.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.reviewcow.board.model.Notice;

@Repository
public interface NoticeMapper {

	public void insertNoticeByMemberId(
			@Param("memberId") int memberId,
			@Param("category") String category,
			@Param("postTitle") String postTitle,
			@Param("content") String content);
	
	public List<Notice> selectNoticeList(
			@Param("skipLimit") int skipLimit,
			@Param("limit") int limit);
	
	public int countNotice();
	
	public Notice selectNoticeByNoticeId(int noticeId);
	
	public void updateNoticeByNoticeId(
			@Param("id") int id,
			@Param("memberId") int memberId,
			@Param("category") String category,
			@Param("postTitle") String postTitle,
			@Param("content") String content);
	
	public void deleteNoticeByNoticeId(int id);
}
