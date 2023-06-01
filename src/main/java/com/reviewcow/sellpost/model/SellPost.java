package com.reviewcow.sellpost.model;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SellPost {
	private int id;
	private String memberLoginId;
	private String serviceCategory1;
	private String serviceCategory2Online;
	private String serviceCategory2Offline;
	private String productName;
	private int numberOfApplicants;
	private String salesMethod;
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
	private int nowApplicants;
	private int aprovalCondition;
	private int cancelBySeller;
	private Date createdAt;
	private Date updatedAt;
}
