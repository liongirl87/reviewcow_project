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
						<img src="${sellPost.thumbnailImgPath}" alt="상품이미지" class="product-image">
					</div>
					<div class="imgBotLine">
					</div>
					<div class="thumbnailbanner1">
						#베너 영역1(400 x 80)
					</div>
					<div class="thumbnailbanner2">
						#베너 영역2(400 x 200)
					</div>
				</div>
				<div class="rightTextDiv">
					<div class="titleText d-flex justify-content-end align-items-start">
						${sellPost.productName}
					</div>			
					<div class="categoryDetail d-flex justify-content-end align-items-start">
						<c:choose>
							<c:when test="${sellPost.serviceCategory1 == 'onlineProduct'}">
								온라인
							</c:when>
							<c:when test="${sellPost.serviceCategory1 == 'offlineStore'}">
								오프라인매장
							</c:when>
							<c:when test="${sellPost.serviceCategory1 == 'pressCorps'}">
								기자단
							</c:when>
						</c:choose> | 
						<c:choose>
							<c:when test="${sellPost.serviceCategory2Online == 'smartstore'}" >
								스마트스토어
							</c:when>
							<c:when test="${sellPost.serviceCategory2Online == 'coupang'}" >
								쿠팡
							</c:when>
							<c:when test="${sellPost.serviceCategory2Online == 'gmarket'}" >
								G마켓
							</c:when>
							<c:when test="${sellPost.serviceCategory2Online == 'auction'}" >
								옥션
							</c:when>
							<c:when test="${sellPost.serviceCategory2Online == '11st'}" >
								11st
							</c:when>
							<c:when test="${sellPost.serviceCategory2Online == 'wemakeprice'}" >
								위메프
							</c:when>
							<c:when test="${sellPost.serviceCategory2Online == 'other'}" >
								기타
							</c:when>
						</c:choose>
						 | 포인트 리워드
					</div>			
					<div class="priceDiv d-flex justify-content-between align-items-start">
						<div class="saleText">50%</div>
						<div class="originalPrice"><fmt:formatNumber value="${sellPost.sellPrice}" type="number" />원</div>
						<div class="price"><span class="font-weight-bold"><fmt:formatNumber value="${sellPost.sellPrice - sellPost.discountRate}" type="number" /></span>원</div>
					</div>
					<div class="rightTextDivBotLine">
					</div>
								
					<div class="rewardPoint d-flex justify-content-end align-items-start">
						<div class="rewardCoinImgDiv">
							<img src="/static/img/coin.png" class="pointIcon" alt="Point-icon">
						</div>
						<span class="font-weight-bold"><fmt:formatNumber value="${sellPost.discountRate}" type="number" /></span>P 리워드
					</div>
					<div class="dateInfo d-flex justify-content-between align-items-center">
						<div class="font-weight-bold ml-3">진행기간</div>
						<fmt:formatDate var="startDate" value="${sellPost.startDate}" pattern="yyyy-MM-dd"/>
						<fmt:formatDate var="endDate" value="${sellPost.endDate}" pattern="yyyy-MM-dd"/>
						<div class="mr-2">${startDate} ~ ${endDate}</div>
					</div>
					<div class="applicantsInfo1">
					현재신청인원
					</div>
					<div class="applicantsInfo2 d-flex justify-content-center">
						<div class="d-flex align-items-center">
						<span class="">30 / ${sellPost.numberOfApplicants} </span><span class="h2 applicantsSideText"> 명</span>
						</div>
					</div>
					<div class="applyBtnDiv">
						<input type="button" value="지금신청하기" class="applyBtn" data-postid="${sellPost.id}">
					</div>
					<div class="likeAndShareBtnDiv d-flex justify-content-between">
						<input type="button" value="찜하기" class="checkLikeBtn">
						<input type="button" value="공유하기" class="shareBtn">
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
					제공 서비스 / 물품
					</div>
					<div class="offeringServiceText">
						제공되는 서비스 내용!!!
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
					판매자 요청사항
					</div>
					<div class="requestedTermText">
						${sellPost.productDescriptions}
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
					alert("좋아요성공");
					location.reload();
				} else {
					alert("좋아요 실패, 로그인 해주세요");
				}
			}
			,error:function(request, status, error) {
				alert("좋아요에 실패하였습니다 관리자에게 문의해주세요")
			}
		}); 
	});
});


</script>
