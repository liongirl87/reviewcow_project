package com.reviewcow.sellpost.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.reviewcow.sellpost.model.SellPost;
import com.reviewcow.sellpost.model.SellPostUploadForm;

@Repository
public interface SellPostMapper {

	public int selectSellPost(SellPostUploadForm sellPostForm);
	
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
	
	public List<SellPost> selectSellPostListOnlineProductByCategory(String categoryOnline2);
	
	public List<SellPost> selectSellPostListOfflineProductByCategory(String categoryOffline2);
	
	public List<SellPost> selectSellPostListPressProduct();
	
	public SellPost selectSellPostbyPostId(int postId);
	
	public List<SellPost> selectSellPostListForReviewListBymemberId(Integer memberId);
	
	public int countSellPostStatusbyMemberId(
			@Param("memberId") int memberId,
			@Param("aprovalCondition") int aprovalCondition);
	
	public int countApplicantsStatusByMemberId(
			@Param("memberId") int memberId,
			@Param("aprovalCondition") int aprovalCondition);
	
	public int countSellPostStatusFinishedByMemberId(int memberId);
	
	public List<SellPost> selectSellPostListStatusByMemberId(
			@Param("memberId") int memberId,
			@Param("aprovalCondition") int aprovalCondition,
			@Param("skipLimit") int skipLimit,
			@Param("limit") int limit);
	
	public int countSellPostListStatusByMemberId(
			@Param("memberId") int memberId,
			@Param("aprovalCondition") int aprovalCondition);
}
