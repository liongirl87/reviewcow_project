package com.reviewcow.sellpost.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.reviewcow.sellpost.model.SellPost;
import com.reviewcow.sellpost.model.SellPostUploadForm;

@Repository
public interface SellPostMapper {

	public int selectSellPost(SellPostUploadForm sellPostForm);
	
	public List<SellPost> selectSellPostListOrderByDeadlineForOnline();
	
	public List<SellPost> selectSellPostListForHotItem();
	
	public SellPost selectSellPostbyPostId(int postId);
}
