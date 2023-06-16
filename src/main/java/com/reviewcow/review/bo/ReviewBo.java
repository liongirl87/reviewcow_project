package com.reviewcow.review.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.reviewcow.common.FileManagerService;
import com.reviewcow.member.model.Member;
import com.reviewcow.review.dao.ReviewMapper;
import com.reviewcow.review.model.Review;
import com.reviewcow.review.model.ReviewList;

@Service
public class ReviewBo {
	@Autowired
	private ReviewMapper reviewMapper;
	@Autowired
	private FileManagerService fileManager;
	
	public void addReviewByMemberId(Member member,Integer memberId, int sellPostId, int point, MultipartFile reviewImgPathOri, String comment) {
		// String imagePath = fileManager.saveFile(sellPostForm.getMemberLoginId(), sellPostForm.getThumbnailImgPathOri());
		// 서버에 이미지 파일 업로드 후 imagePaht받아옴
		String reviewImgPath = fileManager.saveFile(member.getLoginId(), reviewImgPathOri);
		
		
		reviewMapper.insertReviewByMemberId(memberId, sellPostId, point, reviewImgPath, comment);
	}
	public List<ReviewList> getReviewListByMemberId(Integer memberId) {
		return reviewMapper.selectReviewListByMemberId(memberId);
	}
	public Review getReviewByMemberIdAndSellPostId(int memberId, int sellPostId) {
		return reviewMapper.selectReviewByMemberIdAndSellPostId(memberId, sellPostId);
	}
}
