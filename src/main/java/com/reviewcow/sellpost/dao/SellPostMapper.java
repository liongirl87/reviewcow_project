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
}
