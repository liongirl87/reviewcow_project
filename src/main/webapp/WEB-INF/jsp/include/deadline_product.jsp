<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div>
	<div class="deadline d-flex justify-content-center">
		<div class="title1">
		마감임박 체험단
		</div>
	</div>
	<div class="d-flex justify-content-center">	
		<div class="dealine-product d-flex justify-content-start">
			<c:forEach begin="0" end="5">
			<div class="dealine-product-child">
				<div class="product-img-box">
					<div class="product-img">
						<img src="/static/img/product1.jpg" alt="상품이미지" class="product-image">
					</div>
					<div class="d-flex justify-content-between align-items-end">
						<div class="like-productBtn"><i class="xi-heart-o"></i>30</div>
						<div class="remain-period">오늘마감</div>
						<div class="numberOf-applicant">신청 <span class="numberOf-applicant-now">22</span>/10</div>
					</div>
				</div>
				<div class="product-info">
					<div class="d-flex prduct-IN align-items-center">
						<div class="product-icon">
						<img src="/static/img/naver_icon.png" alt="아이콘" class="product-icon-img">
						</div>
						<div class="product-name">[다먹자]구운오징어</div>
					</div>
					<div class="d-flex align-items-center">
						<div class="sale-per">50%</div>
						<div class="sale-price">16,200원</div>
						<div class="original-price">32,400원</div>
					</div>
					<div class="d-flex justify-content-end align-items-center">
						<div class="d-flex align-items-center acquire-point">
							<div class="coin-box">
							<img src="/static/img/coin.png" class="coin-box-img">
							</div>
						16,200p 적립
						</div>
					</div>
				</div>
			</div>
			</c:forEach>
		</div>
	</div>
</div>
<div>
	<div class="hotItem d-flex justify-content-center">
		<div class="title1">
		인기 체험단
		</div>
	</div>
	<div class="d-flex justify-content-center">	
		<div class="dealine-product d-flex justify-content-start">
			<c:forEach begin="0" end="7">
			<div class="dealine-product-child">
				<div class="product-img-box">
					<div class="product-img">
						<img src="/static/img/product1.jpg" alt="상품이미지" class="product-image">
					</div>
					<div class="d-flex justify-content-between align-items-end">
						<div class="like-productBtn"><i class="xi-heart-o"></i>30</div>
						<div class="remain-period">오늘마감</div>
						<div class="numberOf-applicant">신청 <span class="numberOf-applicant-now">22</span>/10</div>
					</div>
				</div>
				<div class="product-info">
					<div class="d-flex prduct-IN align-items-center">
						<div class="product-icon">
						<img src="/static/img/naver_icon.png" alt="아이콘" class="product-icon-img">
						</div>
						<div class="product-name">[다먹자]구운오징어</div>
					</div>
					<div class="d-flex align-items-center">
						<div class="sale-per">50%</div>
						<div class="sale-price">16,200원</div>
						<div class="original-price">32,400원</div>
					</div>
					<div class="d-flex justify-content-end align-items-center">
						<div class="d-flex align-items-center acquire-point">
							<div class="coin-box">
							<img src="/static/img/coin.png" class="coin-box-img">
							</div>
						16,200p 적립
						</div>
					</div>
				</div>
			</div>
			</c:forEach>
		</div>
	</div>
</div>
