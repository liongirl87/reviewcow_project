<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<div id="reviewList"class="d-flex justify-content-center">
	<div id="side-view-right-Tdiv" class="mt-3">
		<div class="main-title"><i class="xi-angle-left"></i>리뷰목록</div>
		<div class="helpdesk-button-parentDiv semi-title-margin">
			<div class="semi-title">리뷰내역</div>
		</div>
		<div class="main-table-div">
			<div>
				<div class="form-inputBox-pm d-flex align-items-center top-header-div">
					<div class="text-margin01 text-center">평점</div>
					<div class="text-margin02 text-center">상태</div>
					<div class="text-margin03 text-center">체험단</div>
					<div class="text-margin04 text-center">후기상태</div>
				</div>
			</div>
			<c:forEach items="${reviewList}" var="review">
			<div class="d-flex align-items-center reveiwList-content-div">
				<div class="text-margin01 text-center">
					<div id="star-rating" class="rating-box">
						<div class="stars">
						    <i class="fa-solid fa-star"></i>
						    <i class="fa-solid fa-star"></i>
						    <i class="fa-solid fa-star"></i>
						    <i class="fa-solid fa-star"></i>
						    <i class="fa-solid fa-star"></i>
						  </div>
		  			</div>
		  		</div>	
				<div class="text-margin02 text-center">리뷰 미작성</div>
				<div class="text-margin03 text-center"><a href="/review/write_review_view?sellPostid=${review.id}">${review.productName}</a></div>
				<div class="text-margin04 text-center">리뷰쓰기</div>
			</div>
			</c:forEach>
		</div>
	</div>
</div>
