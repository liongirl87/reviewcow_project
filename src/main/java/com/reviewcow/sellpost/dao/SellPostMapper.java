package com.reviewcow.sellpost.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.reviewcow.sellpost.model.SellPost;
import com.reviewcow.sellpost.model.SellPostUploadForm;

@Repository
public interface SellPostMapper {

	public int selectSellPost(SellPostUploadForm sellPostForm);
	
	public List<SellPost> selectSellPostListOrderByDeadlineForOnline();
	
	public List<SellPost> selectSellPostListForHotItem(Integer memberId);
	
	public List<SellPost> selectLikeSellPostListbyMemberId(Integer memberId);
	
	public List<SellPost> selectSellPostListOnlineProductByCategory(String categoryOnline2);
	
	public List<SellPost> selectSellPostListOfflineProductByCategory(String categoryOffline2);
	
	public List<SellPost> selectSellPostListPressProduct();
	
	public SellPost selectSellPostbyPostId(int postId);
	
	public List<SellPost> selectSellPostListForReviewListBymemberId(Integer memberId);
}
