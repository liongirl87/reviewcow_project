package com.reviewcow.sellpost.model;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;

@Getter
public class SellPostUploadForm {
	private int memberId;
	private String memberLoginId;
	//공통
	private String serviceCategory1;
	private String serviceCategory2Online;
	private String serviceCategory2Offline;
	private String productName;
	private int numberOfApplicants;
	private String salesMethod;
	private String startDate;
	private String endDate;
	private String productDescriptions;
	private MultipartFile thumbnailImgPathOri;
	private String thumbnailImgPath;
	// 온라인
	private String productUrl;
	private int sellPrice;
	private int discountRate;
	// 오프라인
	private String storeName;
	private String storeAddress;
	// 기자단
	private int scriptFees;
	private MultipartFile corpsFileOri;
	private String corpsFile;
	
	public SellPostUploadForm() {}

	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}
	
	public void setMemberLoginId(String memberLoginId) {
		this.memberLoginId = memberLoginId;
	}

	public void setServiceCategory1(String serviceCategory1) {
		this.serviceCategory1 = serviceCategory1;
	}

	public void setServiceCategory2Online(String serviceCategory2Online) {
		this.serviceCategory2Online = serviceCategory2Online;
	}

	public void setServiceCategory2Offline(String serviceCategory2Offline) {
		this.serviceCategory2Offline = serviceCategory2Offline;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public void setNumberOfApplicants(String numberOfApplicants) {
		this.numberOfApplicants = Integer.parseInt(numberOfApplicants);
	}

	public void setSalesMethod(String salesMethod) {
		this.salesMethod = salesMethod;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public void setProductDescriptions(String productDescriptions) {
		this.productDescriptions = productDescriptions;
	}

	public void setThumbnailImgPathOri(MultipartFile thumbnailImgPathOri) {
		this.thumbnailImgPathOri = thumbnailImgPathOri;
	}
	
	public void setThumbnailImgPath(String thumbnailImgPath) {
		this.thumbnailImgPath = thumbnailImgPath;
	}

	public void setProductUrl(String productUrl) {
		this.productUrl = productUrl;
	}

	public void setSellPrice(String sellPrice) {
		
		this.sellPrice = Integer.parseInt(sellPrice.replace(",",""));
	}

	public void setDiscountRate(String discountRate) {
		this.discountRate = Integer.parseInt(discountRate.replace(",", ""));
	}

	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}

	public void setStoreAddress(String storeAddress) {
		this.storeAddress = storeAddress;
	}

	public void setScriptFees(String scriptFees) {
		this.scriptFees = Integer.parseInt(scriptFees.replace(",", ""));;
	}

	public void setCorpsFileOri(MultipartFile corpsFileOri) {
		this.corpsFileOri = corpsFileOri;
	}
	
	public void setCorpsFile(String corpsFile) {
		this.corpsFile = corpsFile;
	}
}
