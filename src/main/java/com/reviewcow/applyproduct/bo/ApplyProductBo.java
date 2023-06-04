package com.reviewcow.applyproduct.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.reviewcow.applyproduct.dao.ApplyProductMapper;

@Service
public class ApplyProductBo {
	@Autowired
	private ApplyProductMapper applyProductMapper;
	
	public void checkApplyProduct(int memberId, int sellPostId) {
		int count = applyProductMapper.selectApplyProductByMemberIdAndSellPostId(memberId, sellPostId);
		
		if( count > 0) {	// 존재하는 경우
			applyProductMapper.deleteApplyProductByMemberIdAndSellPostId(memberId, sellPostId);
		} else {
			applyProductMapper.insertApplyProductByMemberIdAndSellPostId(memberId, sellPostId);
		}
		
	}
	
	public int applyApplicantsCount(int sellPostId) {
		return applyProductMapper.selectApplyProductByMemberIdAndSellPostId(null, sellPostId);
	}
	
	public boolean checkedApply(Integer memberId, int sellPostId) {
		if (memberId == null) {
			return false;
		}
		return applyProductMapper.selectApplyProductByMemberIdAndSellPostId(memberId, sellPostId) > 0;
	}
	
}
