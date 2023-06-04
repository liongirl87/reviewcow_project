package com.reviewcow.main.model;

import com.reviewcow.sellpost.model.SellPost;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CardView {

	private SellPost sellPost;
	
	// 좋아요 카운트
	private int likeCount;
	
	// 내가 상품 좋아요 눌렀는지 여부
	private boolean checkedLike;
	
	// 상품 판매 남은 날
	private int restOfDay;
	
	// 소비자 판매가격
	private int price;
	
	// 현재 지원자 수
	private int nowApplicants;
	
	// 현재 로그인 회원이 지원했는지 여부
	private boolean checkedApply;
	
}
