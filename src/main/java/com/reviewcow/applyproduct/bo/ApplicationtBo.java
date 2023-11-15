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
import com.reviewcow.point.bo.PointBo;
import com.reviewcow.review.bo.ReviewBo;
import com.reviewcow.sellpost.bo.SellPostBo;
import com.reviewcow.sellpost.dao.SellPostMapper;
import com.reviewcow.sellpost.model.SellPost;

@Service
public class ApplicationtBo {
	@Autowired
	private ApplicationMapper applicationMapper;
	@Autowired
	private SellPostMapper sellPostMapper;
	
	@Autowired
	private SellPostBo sellPostBo;
	@Autowired
	private ReviewBo reviewBo;
	@Autowired
	private PointBo pointBo;
	
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
	public List<CardView> generateStatusProduct(Integer memberId, int approvalCondition, int skipLimit, int limit) {
		List<CardView> cardViewList = new ArrayList<>();
		
		List<SellPost> sellPostList = sellPostBo.getSellPostListStatusByMemberId(memberId, approvalCondition, skipLimit, limit);
		
		for (SellPost sellPost: sellPostList) {
			CardView card = new CardView();
			
			// sell_post
			card.setSellPost(sellPost);
			
			// sellpostId로 조회하는 지원자 List
			card.setApplication(applicationMapper.selectApplicantsListBySellPostId(sellPost.getId()));
			
			// 현재 지원자 수
			card.setNowApplicants(applicationMapper.selectApplyProductByMemberIdAndSellPostId(null, sellPost.getId()));
			
			// 승인된 지원자 수
			card.setApprovedApplicants(applicationMapper.applicationNumberCheckAtApplication(sellPost.getId()));
			
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
	
	// 지원자 관리
	public List<ManageApplicants> generateStatusApplicantsList(int memberId, int approvalCondition, int skipLimit, int limit){
		List <ManageApplicants> applicants = applicationMapper.selectStatusApplicantsList(memberId, approvalCondition, skipLimit, limit);
		
		for (ManageApplicants applicant: applicants) {
			applicant.setReview(reviewBo.getReviewByMemberIdAndSellPostId(applicant.getMemberId(), applicant.getSellPostId()));
		}
				
		return applicants;
	}
	
	public int approvalApplicantBySellpostId(int memberId, int sellPostId, int status, Integer point) {
		// 0: 승인대기, 1: 승인완료, 2: 검토요청, 3: 취소, 4: 지급완료
		
		// 1:code(201), 2:code(202), 3:code(203), 4:code(204) 
		// 5:code(205)-> 승인 인원수 꽉 차서 승인불가
		// 실패: code(400)
		
		// status = 4 포인트 지급(지급완료 버튼)
		if (status == 4) {
			// 포인트 추가(지급)
			pointBo.addPointByMemberIdAndSellPostId(memberId, sellPostId, point);
			
			if(applicationMapper.approvalApplicantBySellpostId(memberId, sellPostId, status) > 0) {
				// 성공시
				return 204;
			} else {
				return 400;
			}
		}
		
		
		// status = 1 승인시 현재 신청 가능한 인원수 조회 후 가능하면 신청
		if (status == 1) {
			// 현재 승인된 인원수 >= 신청 가능한 총 인원수 `비교` 승인된 인원수가 같거나 더 많으면 승인실패
			if (applicationMapper.applicationNumberCheckAtApplication(sellPostId) >= sellPostMapper.selectSellPostbyPostId(sellPostId).getNumberOfApplicants()) {
				// 205 신청가능한 인원수가 꽉 차서 205로 전달
				return 205;
			} else {
				if(applicationMapper.approvalApplicantBySellpostId(memberId, sellPostId, status) > 0) {
					return 201;
				} else {
					return 400;
				}
			}
		};
		
		if (status == 2) {
			if(applicationMapper.approvalApplicantBySellpostId(memberId, sellPostId, status) > 0) {
				// 성공시
				return 202;
			} else {
				return 400;
			}
		};
		
		if (status == 3) {
			if(applicationMapper.approvalApplicantBySellpostId(memberId, sellPostId, status) > 0) {
				// 성공시
				return 203;
			} else {
				return 400;
			}
		};
		// 성공시 1, 실패시 0
		return 400;
	}
	
	// (사업자) manage_applicants_view/status_applicants_view 하단페이징 count
	public int countApplicantsStatusByMemberId(int memberId, int approvalCondition) {
		return applicationMapper.countApplicantsStatusByMemberId(memberId, approvalCondition);
	}
}
