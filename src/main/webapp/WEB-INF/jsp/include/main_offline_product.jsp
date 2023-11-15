<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div id="mainOfflineProduct" class="mainView-i-style">
	<div class="deadline d-flex justify-content-center">
		<div class="title1">
		오프라인 체험단
		</div>
	</div>
	<div class="d-flex justify-content-center">
		<div class="online-product d-flex justify-content-center"><!-- w:1200px -->
			<div class="top-category-bar d-flex"><!--w:100%  -->
				<div class="top-category-child ${offlineCategory == 'cafe' ? 'active':'' }" onclick="moveCategory(1)">카페</div>
				<div class="top-category-child ${offlineCategory == 'foodstore' ? 'active':'' }" onclick="moveCategory(2)">맛집</div>
				<div class="top-category-child ${offlineCategory == 'travel' ? 'active':'' }" onclick="moveCategory(3)">여행</div>
				<div class="top-category-child ${offlineCategory == 'beauty' ? 'active':'' }" onclick="moveCategory(4)">뷰티</div>
				<div class="top-category-child ${offlineCategory == 'other' ? 'active':'' }" onclick="moveCategory(5)">그외</div>
			</div>
		</div>
	</div>
	<div class="d-flex justify-content-center">	
		<div class="dealine-product d-flex justify-content-start">
			<c:forEach items="${offlineProductList}" var="card">
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
							<img src="/static/img/group_icon.png" alt="체험단" class="product-icon-img-paper">
							<!-- <i class="xi-group product-icon-experienceGroup"></i> -->
						</div>
						<div class="product-name">${card.sellPost.productName}</div>
					</div>
					<div class="d-flex justify-content-end align-items-center">
						<div class="sale-price"><fmt:formatNumber value="${card.sellPost.scriptFees}" type="number" />원</div>
					</div>
					<div class="d-flex justify-content-end align-items-center">
						<div class="d-flex align-items-center acquire-point">
							<div class="coin-box">
							<img src="/static/img/coin.png" class="coin-box-img">
							</div>
							<fmt:formatNumber value="${card.sellPost.scriptFees}" type="number" />p 적립
						</div>
					</div>
				</div>
			</div>
			</c:forEach>
		</div>
	</div>
	<div class="deadline-more d-flex justify-content-center">
		<div class="more-product-btn">
		<a href="/main/offline_product_view">체험단 더 보기</a>
		</div>
	</div>
</div>
<script>
$(document).ready(function(){
	moveCategory = function(n){
		if (n == 1) {
			$("#mainOfflineProduct").load("/sellpost/main_changeoffline_category2?categoryOffline2=cafe");
		} else if (n == 2) {
			$("#mainOfflineProduct").load("/sellpost/main_changeoffline_category2?categoryOffline2=foodstore");
		} else if (n == 3) {
			$("#mainOfflineProduct").load("/sellpost/main_changeoffline_category2?categoryOffline2=travel");
		} else if (n == 4) {
			$("#mainOfflineProduct").load("/sellpost/main_changeoffline_category2?categoryOffline2=beauty");
		} else if (n == 5) {
			$("#mainOfflineProduct").load("/sellpost/main_changeoffline_category2?categoryOffline2=other");
		}
	};
});
</script>