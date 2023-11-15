package com.reviewcow.sellpost.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.reviewcow.sellpost.model.SellPost;
import com.reviewcow.sellpost.model.SellPostUploadForm;

@Repository
public interface SellPostMapper {

	public int insertSellPost(SellPostUploadForm sellPostForm);
	
	public List<SellPost> selectSellPostListOrderByDeadlineForOnline();
	
	public List<SellPost> selectSellPostListForHotItem(Integer memberId);
	
	public List<SellPost> selectApplyProductListbyMemberIdForPaging(
			@Param("memberId") Integer memberId,
			@Param("skipLimit") int skipLimit,
			@Param("limit") int limit);
	
	public List<SellPost> selectLikeSellPostListbyMemberId(Integer memberId);
	
	public int countLikeSellPostListbyMemberId(Integer memberId);
	
	public List<SellPost> selectLikeSellPostListByMemberIdForPaging(
			@Param("memberId") Integer memberId,
			@Param("skipLimit") int skipLimit,
			@Param("limit") int limit);
	
	public List<SellPost> selectSellPostListOnlineProductByCategory(
			@Param("categoryOnline2") String categoryOnline2,
			@Param("limit") Integer limit
			);
	
	public List<SellPost> selectSellPostListOfflineProductByCategory(
			@Param("categoryOffline2") String categoryOffline2,
			@Param("limit") Integer limit
			);
	
	public List<SellPost> selectSellPostListPressProduct();
	
	public SellPost selectSellPostbyPostId(int postId);
	
	public List<SellPost> selectSellPostListForReviewListBymemberId(Integer memberId);
	
	public int countSellPostStatusbyMemberId(
			@Param("memberId") int memberId,
			@Param("approvalCondition") int approvalCondition);
	
	public int countApplicantsStatusByMemberId(
			@Param("memberId") int memberId,
			@Param("approvalCondition") int approvalCondition);
	
	
	public List<SellPost> selectSellPostListStatusByMemberId(
			@Param("memberId") int memberId,
			@Param("approvalCondition") int approvalCondition,
			@Param("skipLimit") int skipLimit,
			@Param("limit") int limit);
	
	public int countSellPostListStatusByMemberId(
			@Param("memberId") int memberId,
			@Param("approvalCondition") int approvalCondition);
	
	public int selectNumberSellPostApplicantNumberBySellPostId(int sellPostId);
	
	public int countSellPostBeforeApproval(Integer allPost);
	
	public List<SellPost> selectSellPostListBeforeApproval(
			@Param("skipLimit") int skipLimit,
			@Param("limit") int limit,
			@Param("status") Integer status
			);
	
	public void approveSellPost (
			@Param("id") int id,
			@Param("approvalCondition") int approvalCondition);
}
