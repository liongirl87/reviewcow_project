package com.reviewcow.applyproduct.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.reviewcow.applyproduct.dao.ApplicationMapper;

@Service
public class ApplicationtBo {
	@Autowired
	private ApplicationMapper applicationMapper;
	
	public void checkApplyProduct(int memberId, int sellPostId) {
		int count = applicationMapper.selectApplyProductByMemberIdAndSellPostId(memberId, sellPostId);
		
		if( count > 0) {	// 존재하는 경우
			applicationMapper.deleteApplyProductByMemberIdAndSellPostId(memberId, sellPostId);
		} else {
			applicationMapper.insertApplyProductByMemberIdAndSellPostId(memberId, sellPostId);
		}
		
	}
	
	public int applyApplicantsCount(int sellPostId) {
		return applicationMapper.selectApplyProductByMemberIdAndSellPostId(null, sellPostId);
	}
	
	public boolean checkedApply(Integer memberId, int sellPostId) {
		if (memberId == null) {
			return false;
		}
		return applicationMapper.selectApplyProductByMemberIdAndSellPostId(memberId, sellPostId) > 0;
	}
	
	public int countApplyProductbyMemberId(Integer memberId) {
		return applicationMapper.countApplyProductbyMemberId(memberId);
	}
	
}
