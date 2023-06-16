package com.reviewcow.applyproduct.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.reviewcow.applyproduct.model.ManageApplicants;
import com.reviewcow.sellpost.model.SellPost;

@Repository
public interface ApplicationMapper {

	public void insertApplyProductByMemberIdAndSellPostId(
			@Param("memberId") int memberId,
			@Param("sellPostId") int sellPostId);

	public int selectApplyProductByMemberIdAndSellPostId(
			@Param("memberId") Integer memberId,
			@Param("sellPostId") int sellPostId);
	
	public int countApplyProductbyMemberId(Integer memberId);
	
	public void deleteApplyProductByMemberIdAndSellPostId(
			@Param("memberId") int memberId,
			@Param("sellPostId") int sellPostId);
	
	public List<SellPost> getapplicantsListStatusByMemberId(
			@Param("memberId") int memberId,
			@Param("aprovalCondition") int aprovalCondition,
			@Param("skipLimit") int skipLimit,
			@Param("limit") int limit);
	
	public List<ManageApplicants> selectStatusApplicantsList(
			@Param("memberId") int memberId,
			@Param("aprovalCondition") int aprovalCondition,
			@Param("skipLimit") int skipLimit,
			@Param("limit") int limit);
	
	public int approvalApplicantBySellpostId(
			@Param("memberId") int memberId,
			@Param("sellPostId") int sellPostId,
			@Param("status") int status
			);
}