package com.reviewcow.main.bo;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.reviewcow.applyproduct.bo.ApplicationtBo;
import com.reviewcow.like.bo.LikeBo;
import com.reviewcow.main.model.CardView;
import com.reviewcow.sellpost.bo.SellPostBo;
import com.reviewcow.sellpost.model.SellPost;

@Service
public class MainBo {

	@Autowired
	private SellPostBo sellPostBo;
	@Autowired
	private LikeBo likeBo;
	@Autowired
	private ApplicationtBo applicationBo;
	
	
	public List<CardView> generateDeadLineItem(Integer memberId) {
		List<CardView> cardViewList = new ArrayList<>();
		
		// 마감임박 상품 불러오기
		List<SellPost> sellPostList = sellPostBo.getSellPostListOrderByDeadlineForOnline();
		
		for (SellPost sellPost: sellPostList) {
			CardView card = new CardView();
			
			// sell_post
			card.setSellPost(sellPost);
			
			// like_post count
			card.setLikeCount(likeBo.likeCount(sellPost.getId()));
			
			// 상품찜 여부(하트 컬러 채움)
			card.setCheckedLike(likeBo.checkKeepLike(memberId, sellPost.getId()));
			
			// 현재 지원자 수
			card.setNowApplicants(applicationBo.applyApplicantsCount(sellPost.getId()));
			
			// 로그인유저 지원했는지 여부
			card.setCheckedApply(applicationBo.checkedApply(memberId, sellPost.getId()));
			
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
	
	public List<CardView> generateHotItem(Integer memberId) {
		List<CardView> cardViewList = new ArrayList<>();
		
		// 인기상품 불러오기(지원자 순서대로)
		List<SellPost> sellPostList = sellPostBo.getSellPostListForHotItem();
		
		for (SellPost sellPost: sellPostList) {
			CardView card = new CardView();
			
			// sell_post
			card.setSellPost(sellPost);
			
			// like_post count
			card.setLikeCount(likeBo.likeCount(sellPost.getId()));
			
			// 상품찜 여부(하트 컬러 채움)
			card.setCheckedLike(likeBo.checkKeepLike(memberId, sellPost.getId()));
			
			// 현재 지원자 수
			card.setNowApplicants(applicationBo.applyApplicantsCount(sellPost.getId()));
			
			// 로그인유저 지원했는지 여부
			card.setCheckedApply(applicationBo.checkedApply(memberId, sellPost.getId()));
			
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
	
	// 메인화면 온라인 상품 영역 불러오기
	public List<CardView> generateOnlineProductByCategory(Integer memberId, String categoryOnline2) {
		List<CardView> cardViewList = new ArrayList<>();
		
		List<SellPost> sellPostList = sellPostBo.getSellPostListOnlineProductByCategory(categoryOnline2);
		
		for (SellPost sellPost: sellPostList) {
			CardView card = new CardView();
			
			// sell_post
			card.setSellPost(sellPost);
			
			// like_post count
			card.setLikeCount(likeBo.likeCount(sellPost.getId()));
			
			// 상품찜 여부(하트 컬러 채움)
			card.setCheckedLike(likeBo.checkKeepLike(memberId, sellPost.getId()));
			
			// 현재 지원자 수
			card.setNowApplicants(applicationBo.applyApplicantsCount(sellPost.getId()));
			
			// 로그인유저 지원했는지 여부
			card.setCheckedApply(applicationBo.checkedApply(memberId, sellPost.getId()));
			
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
	
	// 메인화면 오프라인상품 영역 불러오기
	public List<CardView> generateOfflineProductByCategory(Integer memberId, String categoryOffline2) {
		List<CardView> cardViewList = new ArrayList<>();
		
		List<SellPost> sellPostList = sellPostBo.getSellPostListOfflineProductByCategory(categoryOffline2);
		
		for (SellPost sellPost: sellPostList) {
			CardView card = new CardView();
			
			// sell_post
			card.setSellPost(sellPost);
			
			// like_post count
			card.setLikeCount(likeBo.likeCount(sellPost.getId()));
			
			// 상품찜 여부(하트 컬러 채움)
			card.setCheckedLike(likeBo.checkKeepLike(memberId, sellPost.getId()));
			
			// 현재 지원자 수
			card.setNowApplicants(applicationBo.applyApplicantsCount(sellPost.getId()));
			
			// 로그인유저 지원했는지 여부
			card.setCheckedApply(applicationBo.checkedApply(memberId, sellPost.getId()));
			
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
	
	// 메인화면 기자단 영역 불러오기
	public List<CardView> generatePressProductByCategory(Integer memberId) {
		List<CardView> cardViewList = new ArrayList<>();
		
		List<SellPost> sellPostList = sellPostBo.getSellPostListPressProduct();
		
		for (SellPost sellPost: sellPostList) {
			CardView card = new CardView();
			
			// sell_post
			card.setSellPost(sellPost);
			
			// like_post count
			card.setLikeCount(likeBo.likeCount(sellPost.getId()));
			
			// 상품찜 여부(하트 컬러 채움)
			card.setCheckedLike(likeBo.checkKeepLike(memberId, sellPost.getId()));
			
			// 현재 지원자 수
			card.setNowApplicants(applicationBo.applyApplicantsCount(sellPost.getId()));
			
			// 로그인유저 지원했는지 여부
			card.setCheckedApply(applicationBo.checkedApply(memberId, sellPost.getId()));
			
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
	
	/**
	 * 상품 상세페이지 화면 뷰
	 * @param memberId
	 * @return
	 */
	public CardView generateCard(int postId,Integer memberId) {
		SellPost sellPost = sellPostBo.getSellPostbyPostId(postId);
	
		CardView cardView = new CardView();
		
		// sell_post
		cardView.setSellPost(sellPost);
			
		// like_post count
		cardView.setLikeCount(likeBo.likeCount(sellPost.getId()));
			
		// 상품찜 여부(하트 컬러 채움)
		cardView.setCheckedLike(likeBo.checkKeepLike(memberId, sellPost.getId()));
			
		// 현재 지원자 수
		cardView.setNowApplicants(applicationBo.applyApplicantsCount(sellPost.getId()));
			
		// 로그인유저 지원했는지 여부
		cardView.setCheckedApply(applicationBo.checkedApply(memberId, sellPost.getId()));
			
		// 판매 남은 기간
		Date nowDate = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
			
		// (dd-MM-yyyy)형식의 현재시간 객체 생성
		formatter.format(nowDate);
			
		long sec = ( sellPost.getEndDate().getTime() - nowDate.getTime()) / 1000; // 초
		int days = (int)sec / (24*60*60) + 1; // 일자수
		cardView.setRestOfDay(days);
			
		// 할인 후 실제 판매가격
		cardView.setPrice(sellPost.getSellPrice() - sellPost.getDiscountRate());
			
		return cardView;
	}
}
