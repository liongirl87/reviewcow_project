<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div>
	<div class="deadline d-flex justify-content-center">
		<div class="title1">
		�����ӹ� ü���
		</div>
	</div>
	<div class="d-flex justify-content-center">	
		<div class="dealine-product d-flex justify-content-start">
			<c:forEach begin="0" end="5">
			<div class="dealine-product-child">
				<div class="product-img-box">
					<div class="product-img">
						<img src="/static/img/product1.jpg" alt="��ǰ�̹���" class="product-image">
					</div>
					<div class="d-flex justify-content-between align-items-end">
						<div class="like-productBtn"><i class="xi-heart-o"></i>30</div>
						<div class="remain-period">���ø���</div>
						<div class="numberOf-applicant">��û <span class="numberOf-applicant-now">22</span>/10</div>
					</div>
				</div>
				<div class="product-info">
					<div class="d-flex prduct-IN align-items-center">
						<div class="product-icon">
						<img src="/static/img/naver_icon.png" alt="������" class="product-icon-img">
						</div>
						<div class="product-name">[�ٸ���]�����¡��</div>
					</div>
					<div class="d-flex align-items-center">
						<div class="sale-per">50%</div>
						<div class="sale-price">16,200��</div>
						<div class="original-price">32,400��</div>
					</div>
					<div class="d-flex justify-content-end align-items-center">
						<div class="d-flex align-items-center acquire-point">
							<div class="coin-box">
							<img src="/static/img/coin.png" class="coin-box-img">
							</div>
						16,200p ����
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
		�α� ü���
		</div>
	</div>
	<div class="d-flex justify-content-center">	
		<div class="dealine-product d-flex justify-content-start">
			<c:forEach begin="0" end="7">
			<div class="dealine-product-child">
				<div class="product-img-box">
					<div class="product-img">
						<img src="/static/img/product1.jpg" alt="��ǰ�̹���" class="product-image">
					</div>
					<div class="d-flex justify-content-between align-items-end">
						<div class="like-productBtn"><i class="xi-heart-o"></i>30</div>
						<div class="remain-period">���ø���</div>
						<div class="numberOf-applicant">��û <span class="numberOf-applicant-now">22</span>/10</div>
					</div>
				</div>
				<div class="product-info">
					<div class="d-flex prduct-IN align-items-center">
						<div class="product-icon">
						<img src="/static/img/naver_icon.png" alt="������" class="product-icon-img">
						</div>
						<div class="product-name">[�ٸ���]�����¡��</div>
					</div>
					<div class="d-flex align-items-center">
						<div class="sale-per">50%</div>
						<div class="sale-price">16,200��</div>
						<div class="original-price">32,400��</div>
					</div>
					<div class="d-flex justify-content-end align-items-center">
						<div class="d-flex align-items-center acquire-point">
							<div class="coin-box">
							<img src="/static/img/coin.png" class="coin-box-img">
							</div>
						16,200p ����
						</div>
					</div>
				</div>
			</div>
			</c:forEach>
		</div>
	</div>
</div>
