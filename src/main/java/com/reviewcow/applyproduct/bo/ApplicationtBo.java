package com.reviewcow.applyproduct.bo;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.reviewcow.applyproduct.dao.ApplicationMapper;
import com.reviewcow.applyproduct.model.ManageApplicants;
import com.reviewcow.main.model.CardView;
import com.reviewcow.review.bo.ReviewBo;
import com.reviewcow.sellpost.bo.SellPostBo;
import com.reviewcow.sellpost.model.SellPost;

@Service
public class ApplicationtBo {
	@Autowired
	private ApplicationMapper applicationMapper;
	@Autowired
	private SellPostBo sellPostBo;
	@Autowired
	private ReviewBo reviewBo;
	
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
	
	// application/manage_applicants_view/status_product_view 화면 구성
	
	public List<CardView> generateStatusProduct(Integer memberId, int aprovalCondition, int skipLimit, int limit) {
		List<CardView> cardViewList = new ArrayList<>();
		
		List<SellPost> sellPostList = sellPostBo.getSellPostListStatusByMemberId(memberId, aprovalCondition, skipLimit, limit);
		
		for (SellPost sellPost: sellPostList) {
			CardView card = new CardView();
			
			// sell_post
			card.setSellPost(sellPost);
			
			// 현재 지원자 수
			card.setNowApplicants(applicationMapper.selectApplyProductByMemberIdAndSellPostId(null, sellPost.getId()));
			
			// 판매 남은 기간
			Date nowDate = new Date();
			SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
			
			// (dd-MM-yyyy)형식의 현재시간 객체 생성
			formatter.format(nowDate);
			
			long sec = ( sellPost.getEndDate().getTime() - nowDate.getTime()) / 1000; // 초
			int days = (int)sec / (24*60*60) + 1; // 일자수
			card.setRestOfDay(days);
			
			// 할인 후 실제 판매가격
			card.setPrice(sellPost.getSellPrice() - sellPost.getDiscountRate());
			
			
			// cardViewList에 채우기
			cardViewList.add(card);
		}
		return cardViewList;
	}
	public List<ManageApplicants> generateStatusApplicantsList(Integer memberId, int aprovalCondition, int skipLimit, int limit){
		List <ManageApplicants> applicants = applicationMapper.selectStatusApplicantsList(memberId, aprovalCondition, skipLimit, limit);
		
		for (ManageApplicants applicant: applicants) {
			applicant.setReview(reviewBo.getReviewByMemberIdAndSellPostId(applicant.getMemberId(), applicant.getSellPostId()));
		}
				
		return applicants;
	}
	
	public boolean approvalApplicantBySellpostId(int memberId, int sellPostId, int status) {
		return applicationMapper.approvalApplicantBySellpostId(memberId, sellPostId, status) > 0;
	}
}
