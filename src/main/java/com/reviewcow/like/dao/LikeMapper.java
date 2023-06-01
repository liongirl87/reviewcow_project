package com.reviewcow.like.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface LikeMapper {

	public int selectLikeCountByLoginIdAndSellPostId(
			@Param("memberId") Integer memberId,
			@Param("sellPostId") int sellPostId);
	
	public void deleteLikeByLoginIdAndSellPostId(
			@Param("memberId") Integer memberId,
			@Param("sellPostId") int sellPostId);
	
	public void insertLikeByLoginIdAndSellPostId(
			@Param("memberId") Integer memberId,
			@Param("sellPostId") int sellPostId);
	
	public int selectLikeCountBySellPostId(
			@Param("sellPostId") int sellPostId);
}
