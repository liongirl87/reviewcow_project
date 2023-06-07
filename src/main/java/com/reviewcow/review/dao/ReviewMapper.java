package com.reviewcow.review.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface ReviewMapper {
	public void insertReviewByMemberId(
			@Param("memberId") Integer memberId,
			@Param("sellPostId") int sellPostId,
			@Param("point") int point,
			@Param("reviewImgPath") String reviewImgPath,
			@Param("comment") String comment);
}
