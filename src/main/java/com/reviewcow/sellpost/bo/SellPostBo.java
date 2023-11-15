package com.reviewcow.sellpost.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.reviewcow.applyproduct.model.ManageProductApplicants;
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
		
		// 기자단 양식
		if(sellPostForm.getServiceCategory1().equals("pressCorps")) {
			sellPostForm.setCorpsFile(fileManager.saveFile(sellPostForm.getMemberLoginId(), sellPostForm.getCorpsFileOri()));
		}
		return sellPostMapper.insertSellPost(sellPostForm);
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
	public List<SellPost> getSellPostListOnlineProductByCategory(String categoryOnline2, Integer limit) {
		return sellPostMapper.selectSellPostListOnlineProductByCategory(categoryOnline2, limit);
	}
	
	// 오프라인 상품 카테고리별 불러오기
	public List<SellPost> getSellPostListOfflineProductByCategory(String categoryOffline2, Integer limit) {
		return sellPostMapper.selectSellPostListOfflineProductByCategory(categoryOffline2, limit);
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
	
	
	public ManageProductApplicants countSellPostStatusbyMemberId(int memberId) {
		
		ManageProductApplicants manageList = new ManageProductApplicants();
		// 승인대기
		manageList.setWaiting(sellPostMapper.countSellPostStatusbyMemberId(memberId, 0));
		// 진행중
		manageList.setOnSale(sellPostMapper.countSellPostStatusbyMemberId(memberId, 1));
		// 반려
		manageList.setReject(sellPostMapper.countSellPostStatusbyMemberId(memberId, 2));
		// 취소(판매자 신청)
		manageList.setCancelProduct(sellPostMapper.countSellPostStatusbyMemberId(memberId, 3));
		// 마감
		manageList.setFinish(sellPostMapper.countSellPostStatusbyMemberId(memberId, 4));
		
		// 지원자 관리
		// 신청인원(승인전)
		manageList.setApplicants(sellPostMapper.countApplicantsStatusByMemberId(memberId, 0));
		// 승인인원
		manageList.setApproval(sellPostMapper.countApplicantsStatusByMemberId(memberId, 1));
		// 지급완료
		manageList.setPaid(sellPostMapper.countApplicantsStatusByMemberId(memberId, 4));
		
		// 검토요청
		manageList.setComplain(sellPostMapper.countApplicantsStatusByMemberId(memberId, 2));
		// 취소
		manageList.setCancelPayment(sellPostMapper.countApplicantsStatusByMemberId(memberId, 3));

		return manageList;
	}
	// 내가 작성한 판매글 가져오기
	public List<SellPost> getSellPostListStatusByMemberId(int memberId, int approvalCondition, int skipLimit, int limit) {
		return sellPostMapper.selectSellPostListStatusByMemberId(memberId, approvalCondition, skipLimit, limit);
	}
	// (사업자) manage_applicants_view/status_product_view 하단페이징 count
	public int countSellPostListStatusByMemberId(int memberId, int approvalCondition) {
		return sellPostMapper.countSellPostListStatusByMemberId(memberId, approvalCondition);
	}
	
	// 포스트별 승인(총)인원 가져오기
	public int getNumberSellPostApplicantNumberBySellPostId(int sellPostId) {
		return sellPostMapper.selectNumberSellPostApplicantNumberBySellPostId(sellPostId);
	}
	
	// 체험단 카운팅
	public int countSellPostBeforeApproval(Integer allPost) {
		return sellPostMapper.countSellPostBeforeApproval(allPost);
	}
	
	// 승인대기중 체험단 가져오기(admin)
	public List<SellPost> getSellPostListBeforeApproval(int skipLimit, int limit, Integer status){
		return sellPostMapper.selectSellPostListBeforeApproval(skipLimit, limit, status);
	}
	
	// 체험단 승인하기(admin)
	public void approveSellPost (int id, int approvalCondition) {
		sellPostMapper.approveSellPost(id, approvalCondition);
	}
	
}
