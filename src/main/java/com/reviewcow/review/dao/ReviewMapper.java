package com.reviewcow.review.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.reviewcow.review.model.ReviewList;

@Repository
public interface ReviewMapper {
	public void insertReviewByMemberId(
			@Param("memberId") Integer memberId,
			@Param("sellPostId") int sellPostId,
			@Param("point") int point,
			@Param("reviewImgPath") String reviewImgPath,
			@Param("comment") String comment);
	
	public List<ReviewList> selectReviewListByMemberId(Integer memberId);
}
	
