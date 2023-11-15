package com.reviewcow.sellpost.model;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SellPostApplyList {
	
	private int id;
	private String memberLoginId;
	private String serviceCategory1;
	private String serviceCategory2Online;
	private String serviceCategory2Offline;
	private String productName;
	private int numberOfApplicants;
	private Date startDate;
	private Date endDate;
	private String productDescriptions;
	private String thumbnailImgPath;
	private String productURL;
	private int sellPrice;
	private int discountRate;
	private String storeName;
	private String storeAddress;
	private int scriptFees;
	private String corpsFile;
	private int approvalCondition;
	private Date createdAt;
	private Date updatedAt;
	
	private int status;
	private Date applicationCreatedAt;
}
