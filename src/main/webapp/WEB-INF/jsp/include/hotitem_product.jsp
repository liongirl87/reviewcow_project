<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div id="dedlineProduct" class="mainView-i-style">
	<div class="deadline d-flex justify-content-center">
		<div class="title1">
		�α� ü���
		</div>
	</div>
	<div class="d-flex justify-content-center">	
		<div class="dealine-product d-flex justify-content-start">
			<c:forEach items="${hotItemList}" var="card">
			<div class="dealine-product-child">
				<c:if test="${card.sellPost.numberOfApplicants <= card.approvedApplicants}">
					<div class="closed-text">����</div>
				</c:if>
				<div class="product-img-box">
					<div class="product-img">
						<a href="/sellpost/product_detail_view?postId=${card.sellPost.id}" class="goToSellPostDetail" data-post="${card.sellPost.id}">
							<img src="${card.sellPost.thumbnailImgPath}" alt="��ǰ�̹���" class="product-image">
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
					<div class="d-flex prduct-IN align-items-center justify-content-center">
						<div class="product-icon d-flex align-items-center justify-content-center">
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