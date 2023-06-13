package com.reviewcow.sellpost.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.reviewcow.common.FileManagerService;
import com.reviewcow.sellpost.dao.SellPostMapper;
import com.reviewcow.sellpost.model.SellPost;
import com.reviewcow.sellpost.model.SellPostUploadForm;

@Service
public class SellPostBo {

	@Autowired
	private SellPostMapper sellPostMapper;
	@Autowired
	private FileManagerService fileManager;
	
	
	public int addSellPost(SellPostUploadForm sellPostForm) {
//		String imagePath = fileManager.saveFile(sellPostForm.getMemberLoginId(), sellPostForm.getThumbnailImgPathOri());
		// 서버에 이미지 파일 업로드 후 imagePaht받아옴
		sellPostForm.setThumbnailImgPath(fileManager.saveFile(sellPostForm.getMemberLoginId(), sellPostForm.getThumbnailImgPathOri()));
		
		if(sellPostForm.getServiceCategory1().equals("pressCorps")) {
			sellPostForm.setCorpsFile(fileManager.saveFile(sellPostForm.getMemberLoginId(), sellPostForm.getCorpsFileOri()));
		}
		return sellPostMapper.selectSellPost(sellPostForm);
	}
	// 마감임박 상품 불러오기
	public List<SellPost> getSellPostListOrderByDeadlineForOnline() {
		return sellPostMapper.selectSellPostListOrderByDeadlineForOnline();
	}
	
	// 인기 상품 불러오기
	public List<SellPost> getSellPostListForHotItem() {
		return sellPostMapper.selectSellPostListForHotItem(null);
	}
	// 신청한 체험단 리스트 불러오기 (인기 상품 불러오기와 함께 Mapper 사용)
	public List<SellPost> getApplySellPostListbyMemberId(Integer memberId) {
		return sellPostMapper.selectSellPostListForHotItem(memberId);
	}
	
	public List<SellPost> getApplyProductListbyMemberIdForPaging(Integer memberId, int skipLimit, int limit) {
		return sellPostMapper.selectApplyProductListbyMemberIdForPaging(memberId, skipLimit, limit);
	}
	
	// 내가 찜한 상품 목록 리스트 불러오기
	public List<SellPost> getLikeSellPostListbyMemberId(Integer memberId) {
		return sellPostMapper.selectLikeSellPostListbyMemberId(memberId);
	}
	
	public List<SellPost> getLikeSellPostListByMemberIdForPaging(Integer memberId, int skipLimit, int limit){
		return sellPostMapper.selectLikeSellPostListByMemberIdForPaging(memberId, skipLimit, limit);
	}
	
	
	// 내가 찜한 상품 목록 리스트 불러오기(카운트 FOR paging)
	public int countLikeSellPostListbyMemberId(Integer memberId) {
		return sellPostMapper.countLikeSellPostListbyMemberId(memberId);
	}
	
	
	
	// 온라인 상품 카테고리별 불러오기
	public List<SellPost> getSellPostListOnlineProductByCategory(String categoryOnline2) {
		return sellPostMapper.selectSellPostListOnlineProductByCategory(categoryOnline2);
	}
	
	// 오프라인 상품 카테고리별 불러오기
	public List<SellPost> getSellPostListOfflineProductByCategory(String categoryOffline2) {
		return sellPostMapper.selectSellPostListOfflineProductByCategory(categoryOffline2);
	}
	
	public List<SellPost> getSellPostListPressProduct() {
		return sellPostMapper.selectSellPostListPressProduct();
	}
	
	public SellPost getSellPostbyPostId(int postId) {
		return sellPostMapper.selectSellPostbyPostId(postId);
	}
	
	// 리뷰 리스트 가져오기
	public List<SellPost> getSellPostListForReviewListBymemberId(Integer memberId){
		return sellPostMapper.selectSellPostListForReviewListBymemberId(memberId);
	}
	
	
}
