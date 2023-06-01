package com.reviewcow.like.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.reviewcow.like.dao.LikeMapper;

@Service
public class LikeBo {

	@Autowired
	private LikeMapper likeMapper;
	
	public void checkLike(Integer memberId, int sellPostId) {
		
		// 좋아요 있는지확인
		int likeCount = likeMapper.selectLikeCountByLoginIdAndSellPostId(memberId, sellPostId);
		
		if (likeCount > 0) {
			// 있으면 제거 delete
			likeMapper.deleteLikeByLoginIdAndSellPostId(memberId, sellPostId);
		} else {
			// 없으면 추가 insert
			likeMapper.insertLikeByLoginIdAndSellPostId(memberId, sellPostId);
		}
	}
	
	public boolean checkKeepLike(Integer memberId, int sellPostId) {
		int likeCount = likeMapper.selectLikeCountByLoginIdAndSellPostId(memberId, sellPostId);
		
		if (memberId == null) {
			return false;
		}
		if (likeCount > 0) {
			return true;
		} else {
			return false;
		}
	}
	
	
	public int likeCount(int sellPostId) {
		return likeMapper.selectLikeCountBySellPostId(sellPostId);
	}
}
