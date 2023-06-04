<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="productDetail">
	<div class="d-flex justify-content-center">
		<div class="productDetail-child1">
			<div class="product-top-detail d-flex justify-content-between">
				<div class="leftImgDiv">
					<div class="thumbnailImg">
						<img src="${cardView.sellPost.thumbnailImgPath}" alt="��ǰ�̹���" class="product-image">
					</div>
					<div class="imgBotLine">
					</div>
					<div class="thumbnailbanner1">
						#���� ����1(400 x 80)
					</div>
					<div class="thumbnailbanner2">
						#���� ����2(400 x 200)
					</div>
				</div>
				<div class="rightTextDiv">
					<div class="titleText d-flex justify-content-end align-items-start">
						${cardView.sellPost.productName}
					</div>			
					<div class="categoryDetail d-flex justify-content-end align-items-start">
						<c:choose>
							<c:when test="${cardView.sellPost.serviceCategory1 == 'onlineProduct'}">
								�¶���
							</c:when>
							<c:when test="${cardView.sellPost.serviceCategory1 == 'offlineStore'}">
								�������θ���
							</c:when>
							<c:when test="${cardView.sellPost.serviceCategory1 == 'pressCorps'}">
								���ڴ�
							</c:when>
						</c:choose> | 
						<c:choose>
							<c:when test="${cardView.sellPost.serviceCategory2Online == 'smartstore'}" >
								����Ʈ�����
							</c:when>
							<c:when test="${cardView.sellPost.serviceCategory2Online == 'coupang'}" >
								����
							</c:when>
							<c:when test="${cardView.sellPost.serviceCategory2Online == 'gmarket'}" >
								G����
							</c:when>
							<c:when test="${cardView.sellPost.serviceCategory2Online == 'auction'}" >
								����
							</c:when>
							<c:when test="${cardView.sellPost.serviceCategory2Online == '11st'}" >
								11st
							</c:when>
							<c:when test="${cardView.sellPost.serviceCategory2Online == 'wemakeprice'}" >
								������
							</c:when>
							<c:when test="${cardView.sellPost.serviceCategory2Online == 'other'}" >
								��Ÿ
							</c:when>
						</c:choose>
						 | ����Ʈ ������
					</div>			
					<div class="priceDiv d-flex justify-content-between align-items-start">
						<div class="saleText"><fmt:formatNumber value="${cardView.sellPost.discountRate / cardView.price * 100}" pattern="#" />%</div>
						<div class="originalPrice"><fmt:formatNumber value="${cardView.sellPost.sellPrice}" type="number" />��</div>
						<div class="price"><span class="font-weight-bold"><fmt:formatNumber value="${cardView.sellPost.sellPrice - cardView.sellPost.discountRate}" type="number" /></span>��</div>
					</div>
					<div class="rightTextDivBotLine">
					</div>
								
					<div class="rewardPoint d-flex justify-content-end align-items-start">
						<div class="rewardCoinImgDiv">
							<img src="/static/img/coin.png" class="pointIcon" alt="Point-icon">
						</div>
						<span class="font-weight-bold"><fmt:formatNumber value="${cardView.sellPost.discountRate}" type="number" /></span>P ������
					</div>
					<div class="dateInfo d-flex justify-content-between align-items-center">
						<div class="font-weight-bold ml-3">����Ⱓ</div>
						<fmt:formatDate var="startDate" value="${cardView.sellPost.startDate}" pattern="yyyy-MM-dd"/>
						<fmt:formatDate var="endDate" value="${cardView.sellPost.endDate}" pattern="yyyy-MM-dd"/>
						<div class="mr-2">${startDate} ~ ${endDate}</div>
					</div>
					<div class="applicantsInfo1">
					�����û�ο�
					</div>
					<div class="applicantsInfo2 d-flex justify-content-center">
						<div class="d-flex align-items-center">
						<span class="">${cardView.nowApplicants} / ${cardView.sellPost.numberOfApplicants} </span><span class="h2 applicantsSideText"> ��</span>
						</div>
					</div>
					<div class="applyBtnDiv">
					<c:choose>
						<c:when test="${cardView.checkedApply == true}">
						<input type="button" value="����ϱ�" class="applyBtn" data-postid="${cardView.sellPost.id}">
						</c:when>
						<c:when test="${cardView.checkedApply == false}">
						<input type="button" value="���ݽ�û�ϱ�" class="applyBtn" data-postid="${cardView.sellPost.id}">
						</c:when>
					</c:choose>
					</div>
					<div class="likeAndShareBtnDiv d-flex justify-content-between">
						<input type="button" value="���ϱ�" class="checkLikeBtn">
						<input type="button" value="�����ϱ�" class="shareBtn">
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="d-flex justify-content-center">
		<div class="productDetail-child2">
			<div class="product-top-detail2">
				<div>
					<div class="child2MainText">
					���� ���� / ��ǰ
					</div>
					<div class="offeringServiceText">
						�����Ǵ� ���� ����!!!
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="d-flex justify-content-center">
		<div class="productDetail-child3">
			<div class="product-top-detail3">
				<div>
					<div class="child2MainText">
					�Ǹ��� ��û����
					</div>
					<div class="requestedTermText">
						${cardView.sellPost.productDescriptions}
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
$(document).ready(function(){
	
	$('.applyBtn').on("click",function(){
		let SellPostId = "/apply_product/" + $(this).data("postid");
		    
	 	$.ajax({
			url: SellPostId
	 		
			,success:function(data) {
				if(data.code == 1) {
					alert("���ƿ伺��");
					location.reload();
				} else {
					alert("���ƿ� ����, �α��� ���ּ���");
				}
			}
			,error:function(request, status, error) {
				alert("���ƿ信 �����Ͽ����ϴ� �����ڿ��� �������ּ���")
			}
		}); 
	});
});


</script>
