<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div id="categoryOnlineProduct" class="mainView-i-style category-top-margin">
	<div class="deadline d-flex justify-content-center">
		<div class="title1">
		<span class="title-bot-line">온라인 상품</span>
		</div>
	</div>
	<div class="d-flex justify-content-center">
		<div class="online-product d-flex justify-content-center"><!-- w:1200px -->
			<div class="top-category-bar d-flex"><!--w:100%  -->
				<div class="top-category-child ${category == 'smartstore' ? 'active':'' }" onclick="moveCategoryOnline('smartstore')">스마트스토어</div>
				<div class="top-category-child ${category == 'coupang' ? 'active':'' }" onclick="moveCategoryOnline('coupang')">쿠팡</div>
				<div class="top-category-child ${category == 'gmarket' ? 'active':'' }" onclick="moveCategoryOnline('gmarket')">지마켓</div>
				<div class="top-category-child ${category == 'auction' ? 'active':'' }" onclick="moveCategoryOnline('auction')">옥션</div>
				<div class="top-category-child ${category == '11st' ? 'active':'' }" onclick="moveCategoryOnline('11st')">11번가</div>
				<div class="top-category-child ${category == 'wemakeprice' ? 'active':'' }" onclick="moveCategoryOnline('wemakeprice')">위메프</div>
				<div class="top-category-child ${category == 'other' ? 'active':'' }" onclick="moveCategoryOnline('other')">그외</div>
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
							<a href="#" class="likeBtn" data-like="${card.sellPost.id}" data-category="${category}">
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
</div>
<script>
$(document).ready(function(){
	 $('.likeBtn').on("click",function(e){
			e.preventDefault();
			let likeSellPostId = "/like/" + $(this).data("like");
		    var category = $(this).data('category');
		    
	 		$.ajax({
				url: likeSellPostId
	 		
				,success:function(data) {
					if(data.code == 1) {
						alert("좋아요성공");
						moveCategoryOnline(category);
						/* location.reload();  */
						
					} else {
						alert("좋아요 실패, 로그인 해주세요");
					}
				}
				,error:function(request, status, error) {
					alert("좋아요에 실패하였습니다 관리자에게 문의해주세요")
				}
			}); 
		});
	 
	
	moveCategoryOnline = function(n){
		$("#categoryOnlineProduct").load("/sellpost/category_changeonline_category2?categoryOnline2="+ n);
	}
});

</script>