package com.reviewcow.applyproduct.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface ApplyProductMapper {

	public void insertApplyProductByMemberIdAndSellPostId(
			@Param("memberId") int memberId,
			@Param("sellPostId") int sellPostId);

	public int selectApplyProductByMemberIdAndSellPostId(
			@Param("memberId") Integer memberId,
			@Param("sellPostId") int sellPostId);
	
	public void deleteApplyProductByMemberIdAndSellPostId(
			@Param("memberId") int memberId,
			@Param("sellPostId") int sellPostId);
	
}