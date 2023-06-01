package com.reviewcow.main.bo;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	
	public List<CardView> generateCardList(Integer memberId) {
		List<CardView> cardViewList = new ArrayList<>();
		
		// 마감임박순으로 상품들을 불러오기
		List<SellPost> sellPostList = sellPostBo.getSellPostListOrderByDeadlineForOnline();
		
		for (SellPost sellPost: sellPostList) {
			CardView card = new CardView();
			
			// sell_post
			card.setSellPost(sellPost);
			
			// like_post count
			card.setLikeCount(likeBo.likeCount(sellPost.getId()));
			
			// 상품찜 여부(하트 컬러 채움)
			card.setCheckedLike(likeBo.checkKeepLike(memberId, sellPost.getId()));
			
			// 판매 남은 기간
			Date nowDate = new Date();
			SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
			// (dd-MM-yyyy)형식의 현재시간 객체 생성
			formatter.format(nowDate);
			
			long sec = (nowDate.getTime() - sellPost.getEndDate().getTime()) / 1000; // 초
			int days = (int) Math.abs(sec / (24*60*60) -1); // 일자수
			card.setRestOfDay(days);
			
			// 할인 후 실제 판매가격
			card.setPrice(sellPost.getSellPrice() - sellPost.getDiscountRate());
			
			
			// cardViewList에 채우기
			cardViewList.add(card);
		}
		return cardViewList;
		
	}
}
