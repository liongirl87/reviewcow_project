<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div id="categoryOnlineProduct" class="mainView-i-style category-top-margin">
	<div class="deadline d-flex justify-content-center">
		<div class="title1">
		<span class="title-bot-line">�¶��� ��ǰ</span>
		</div>
	</div>
	<div class="d-flex justify-content-center">
		<div class="online-product d-flex justify-content-center"><!-- w:1200px -->
			<div class="top-category-bar d-flex"><!--w:100%  -->
				<div class="top-category-child ${category == 'smartstore' ? 'active':'' }" onclick="moveCategoryOnline('smartstore')">����Ʈ�����</div>
				<div class="top-category-child ${category == 'coupang' ? 'active':'' }" onclick="moveCategoryOnline('coupang')">����</div>
				<div class="top-category-child ${category == 'gmarket' ? 'active':'' }" onclick="moveCategoryOnline('gmarket')">������</div>
				<div class="top-category-child ${category == 'auction' ? 'active':'' }" onclick="moveCategoryOnline('auction')">����</div>
				<div class="top-category-child ${category == '11st' ? 'active':'' }" onclick="moveCategoryOnline('11st')">11����</div>
				<div class="top-category-child ${category == 'wemakeprice' ? 'active':'' }" onclick="moveCategoryOnline('wemakeprice')">������</div>
				<div class="top-category-child ${category == 'other' ? 'active':'' }" onclick="moveCategoryOnline('other')">�׿�</div>
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
							<img src="${card.sellPost.thumbnailImgPath}" alt="��ǰ�̹���" class="product-image">
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
							<div class="remain-period">���ø���</div>
							</c:when>
							<c:otherwise>
							<div class="remain-period ml-3">${card.restOfDay}�� ����</div>
							</c:otherwise>
						</c:choose>
						<div class="numberOf-applicant">��û <span class="numberOf-applicant-now">${card.nowApplicants}</span>/${card.sellPost.numberOfApplicants}</div>
					</div>
				</div>
				<div class="product-info">
					<div class="d-flex prduct-IN align-items-center">
						<div class="product-icon">
						<c:choose>
							<c:when test="${card.sellPost.serviceCategory2Online == 'smartstore'}" >
								<img src="/static/img/naver_icon.png" alt="����Ʈ�����" class="product-icon-img">
							</c:when>
							<c:when test="${card.sellPost.serviceCategory2Online == 'coupang'}" >
								<img src="/static/img/coupang_icon.png" alt="����" class="product-icon-img">
							</c:when>
							<c:when test="${card.sellPost.serviceCategory2Online == 'gmarket'}" >
								<img src="/static/img/gmarket_icon.png" alt="G����" class="product-icon-img">
							</c:when>
							<c:when test="${card.sellPost.serviceCategory2Online == 'auction'}" >
								<img src="/static/img/auction_icon.png" alt="����" class="product-icon-img">
							</c:when>
							<c:when test="${card.sellPost.serviceCategory2Online == '11st'}" >
								<img src="/static/img/11st_icon.png" alt="11����" class="product-icon-img">
							</c:when>
							<c:when test="${card.sellPost.serviceCategory2Online == 'wemakeprice'}" >
								<img src="/static/img/wemakeprice_icon.png" alt="������" class="product-icon-img">
							</c:when>
							<c:when test="${card.sellPost.serviceCategory2Online == 'other'}" >
								<img src="/static/img/other_icon.png" alt="��Ÿ" class="product-icon-img">
							</c:when>
							<c:otherwise>
								<img src="/static/img/other_icon.png" alt="11����" class="product-icon-img">
							</c:otherwise>
						</c:choose>
						</div>
						<div class="product-name">${card.sellPost.productName}</div>
					</div>
					<div class="d-flex align-items-center">
						<div class="sale-per"><fmt:formatNumber value="${card.sellPost.discountRate / card.sellPost.sellPrice * 100}" pattern="#" />%</div>
						<div class="sale-price"><fmt:formatNumber value="${card.price}" type="number" />��</div>
						<div class="original-price"><fmt:formatNumber value="${card.sellPost.sellPrice}" type="number" />��</div>
					</div>
					<div class="d-flex justify-content-end align-items-center">
						<div class="d-flex align-items-center acquire-point">
							<div class="coin-box">
							<img src="/static/img/coin.png" class="coin-box-img">
							</div>
							<fmt:formatNumber value="${card.sellPost.discountRate}" type="number" />p ����
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
						alert("���ƿ伺��");
						moveCategoryOnline(category);
						/* location.reload();  */
						
					} else {
						alert("���ƿ� ����, �α��� ���ּ���");
					}
				}
				,error:function(request, status, error) {
					alert("���ƿ信 �����Ͽ����ϴ� �����ڿ��� �������ּ���")
				}
			}); 
		});
	 
	
	moveCategoryOnline = function(n){
		$("#categoryOnlineProduct").load("/sellpost/category_changeonline_category2?categoryOnline2="+ n);
	}
});

</script>