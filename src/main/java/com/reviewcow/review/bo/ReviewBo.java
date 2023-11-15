package com.reviewcow.review.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.reviewcow.applyproduct.dao.ApplicationMapper;
import com.reviewcow.applyproduct.model.Application;
import com.reviewcow.common.FileManagerService;
import com.reviewcow.member.model.Member;
import com.reviewcow.review.dao.ReviewMapper;
import com.reviewcow.review.model.Review;
import com.reviewcow.review.model.ReviewList;
import com.reviewcow.sellpost.dao.SellPostMapper;

@Service
public class ReviewBo {
	@Autowired
	private ReviewMapper reviewMapper;
	@Autowired
	private SellPostMapper sellPostMapper;
	@Autowired
	private ApplicationMapper applicationMapper;
	@Autowired
	private FileManagerService fileManager;
	
	public void addReviewByMemberId(Member member,Integer memberId, int sellPostId, int point, MultipartFile reviewImgPathOri, String comment) {
		// String imagePath = fileManager.saveFile(sellPostForm.getMemberLoginId(), sellPostForm.getThumbnailImgPathOri());
		// 서버에 이미지 파일 업로드 후 imagePaht받아옴
		String reviewImgPath = fileManager.saveFile(member.getLoginId(), reviewImgPathOri);
		
		
		reviewMapper.insertReviewByMemberId(memberId, sellPostId, point, reviewImgPath, comment);
	}
	public List<ReviewList> getReviewListByMemberId(Integer memberId, int skipLimit, int limit) {
		List<ReviewList> reviewList = new ArrayList<>();

		// application(memberId) 로 전체 불러온다 status IN(1, 2, 4)
		List<Application> applicationList = applicationMapper.selectApplicationByMemberId(memberId, skipLimit, limit);
		
		for(Application application: applicationList) {
			ReviewList review = new ReviewList();
			
			review.setApplication(application);
			review.setReview(reviewMapper.selectReviewByMemberIdAndSellPostId(memberId,application.getSellPostId()));
			review.setSellPost(sellPostMapper.selectSellPostbyPostId(application.getSellPostId()));
	
			reviewList.add(review);
		}
		return reviewList;
	}
	
	public int countApplicationListByMemberId(Integer memberId) {
		return applicationMapper.countApplicationListByMemberId(memberId);
	}
	
	public Review getReviewByMemberIdAndSellPostId(int memberId, int sellPostId) {
		return reviewMapper.selectReviewByMemberIdAndSellPostId(memberId, sellPostId);
	}
}
