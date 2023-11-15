<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div id="mainOnlineProduct" class="mainView-i-style">
	<div class="deadline d-flex justify-content-center">
		<div class="title1">
		온라인 상품
		</div>
	</div>
	<div class="d-flex justify-content-center">
		<div class="online-product d-flex justify-content-center"><!-- w:1200px -->
			<div class="top-category-bar d-flex"><!--w:100%  -->
				<div class="top-category-child ${onlineCategory == 'smartstore' ? 'active':'' }" onclick="moveCategoryOnline(1)">스마트스토어</div>
				<div class="top-category-child ${onlineCategory == 'coupang' ? 'active':'' }" onclick="moveCategoryOnline(2)">쿠팡</div>
				<div class="top-category-child ${onlineCategory == 'gmarket' ? 'active':'' }" onclick="moveCategoryOnline(3)">지마켓</div>
				<div class="top-category-child ${onlineCategory == 'auction' ? 'active':'' }" onclick="moveCategoryOnline(4)">옥션</div>
				<div class="top-category-child ${onlineCategory == '11st' ? 'active':'' }" onclick="moveCategoryOnline(5)">11번가</div>
				<div class="top-category-child ${onlineCategory == 'wemakeprice' ? 'active':'' }" onclick="moveCategoryOnline(6)">위메프</div>
				<div class="top-category-child ${onlineCategory == 'other' ? 'active':'' }" onclick="moveCategoryOnline(7)">그외</div>
			</div>
		</div>
	</div>
	<div class="d-flex justify-content-center">	
		<div class="dealine-product d-flex justify-content-start">
			<c:forEach items="${onlineProductList}" var="card">
			<div class="dealine-product-child">
				<div class="product-img-box">
					<div class="product-img">
						<a href="/sellpost/product_detail_view?postId=${card.sellPost.id}" class="goToSellPostDetail" data-post="${card.sellPost.id}">
							<img src="${card.sellPost.thumbnailImgPath}" alt="상품이미지" class="product-image">
						</a>
					</div>
					<div class="mt-1 d-flex justify-content-between align-items-end">
						<div class="like-productBtn">
							<a href="#" class="likeBtn" data-like="${card.sellPost.id}">
								<c:if test="${card.checkedLike == true}">
									<i class="xi-heart active"></i>
								</c:if>
								<c:if test="${card.checkedLike == false}">
									<i class="xi-heart-o"></i>
								</c:if>
							</a>
						</div>
						<div class="like-productText">
						${card.likeCount}
						</div>
						<c:choose>
							<c:when test="${card.restOfDay == 0}">
							<div class="remain-period">오늘마감</div>
							</c:when>
							<c:otherwise>
							<div class="remain-period ml-3">${card.restOfDay}일 남음</div>
							</c:otherwise>
						</c:choose>
						<div class="numberOf-applicant">신청 <span class="numberOf-applicant-now">${card.nowApplicants}</span>/${card.sellPost.numberOfApplicants}</div>
					</div>
				</div>
				<div class="product-info">
					<div class="d-flex prduct-IN align-items-center">
						<div class="product-icon">
						<c:choose>
							<c:when test="${card.sellPost.serviceCategory2Online == 'smartstore'}" >
								<img src="/static/img/naver_icon.png" alt="스마트스토어" class="product-icon-img">
							</c:when>
							<c:when test="${card.sellPost.serviceCategory2Online == 'coupang'}" >
								<img src="/static/img/coupang_icon.png" alt="쿠팡" class="product-icon-img">
							</c:when>
							<c:when test="${card.sellPost.serviceCategory2Online == 'gmarket'}" >
								<img src="/static/img/gmarket_icon.png" alt="G마켓" class="product-icon-img">
							</c:when>
							<c:when test="${card.sellPost.serviceCategory2Online == 'auction'}" >
								<img src="/static/img/auction_icon.png" alt="옥션" class="product-icon-img">
							</c:when>
							<c:when test="${card.sellPost.serviceCategory2Online == '11st'}" >
								<img src="/static/img/11st_icon.png" alt="11번가" class="product-icon-img">
							</c:when>
							<c:when test="${card.sellPost.serviceCategory2Online == 'wemakeprice'}" >
								<img src="/static/img/wemakeprice_icon.png" alt="위메프" class="product-icon-img">
							</c:when>
							<c:when test="${card.sellPost.serviceCategory2Online == 'other'}" >
								<img src="/static/img/other_icon.png" alt="기타" class="product-icon-img">
							</c:when>
							<c:otherwise>
								<img src="/static/img/other_icon.png" alt="11번가" class="product-icon-img">
							</c:otherwise>
						</c:choose>
						</div>
						<div class="product-name">${card.sellPost.productName}</div>
					</div>
					<div class="d-flex align-items-center">
						<div class="sale-per"><fmt:formatNumber value="${card.sellPost.discountRate / card.sellPost.sellPrice * 100}" pattern="#" />%</div>
						<div class="sale-price"><fmt:formatNumber value="${card.price}" type="number" />원</div>
						<div class="original-price"><fmt:formatNumber value="${card.sellPost.sellPrice}" type="number" />원</div>
					</div>
					<div class="d-flex justify-content-end align-items-center">
						<div class="d-flex align-items-center acquire-point">
							<div class="coin-box">
							<img src="/static/img/coin.png" class="coin-box-img">
							</div>
							<fmt:formatNumber value="${card.sellPost.discountRate}" type="number" />p 적립
						</div>
					</div>
				</div>
			</div>
			</c:forEach>
		</div>
	</div>
	<div class="deadline-more d-flex justify-content-center">
		<div class="more-product-btn">
		<a href="/main/online_product_view">온라인상품 더 보기</a>
		</div>
	</div>
</div>
<script>
$(document).ready(function(){
	moveCategoryOnline = function(n){
		if (n == 1) {
			$("#mainOnlineProduct").load("/sellpost/main_changeonline_category2?categoryOnline2=smartstore");
		} else if (n == 2) {
			$("#mainOnlineProduct").load("/sellpost/main_changeonline_category2?categoryOnline2=coupang");
		} else if (n == 3) {
			$("#mainOnlineProduct").load("/sellpost/main_changeonline_category2?categoryOnline2=gmarket");
		} else if (n == 4) {
			$("#mainOnlineProduct").load("/sellpost/main_changeonline_category2?categoryOnline2=auction");
		} else if (n == 5) {
			$("#mainOnlineProduct").load("/sellpost/main_changeonline_category2?categoryOnline2=11st");
		} else if (n == 6) {
			$("#mainOnlineProduct").load("/sellpost/main_changeonline_category2?categoryOnline2=wemakeprice");
		} else if (n == 7) {
			$("#mainOnlineProduct").load("/sellpost/main_changeonline_category2?categoryOnline2=other");
		}
	}
});

</script>