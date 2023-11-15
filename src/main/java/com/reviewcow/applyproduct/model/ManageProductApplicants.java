package com.reviewcow.applyproduct.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ManageProductApplicants {
	private int waiting;
	private int onSale;
	private int reject;
	private int cancelProduct;
	private int finish;
	
	private int applicants;
	private int approval;
	private int paid;
	private int complain;
	private int cancelPayment;
	
}
