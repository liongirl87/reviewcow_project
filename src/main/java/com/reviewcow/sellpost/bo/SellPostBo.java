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
		return sellPostMapper.selectSellPostListForHotItem();
	}
	
	
	public SellPost getSellPostbyPostId(int postId) {
		return sellPostMapper.selectSellPostbyPostId(postId);
	}
	
}
