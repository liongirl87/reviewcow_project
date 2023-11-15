<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<div id="reviewList" class="d-flex justify-content-center">
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
							<c:choose>
								<c:when test="${empty review.review}">
									<i class="fa-solid fa-star"></i>
									<i class="fa-solid fa-star"></i>
									<i class="fa-solid fa-star"></i>
									<i class="fa-solid fa-star"></i>
									<i class="fa-solid fa-star"></i>
								</c:when>
								<c:when test="${not empty review.review}">
									<c:forEach begin='1' end="${review.review.reviewPoint}"> 
								    <i class="fa-solid fa-star active"></i>
								    </c:forEach>
								    <c:forEach begin='1' end="${5 - review.review.reviewPoint}"> 
								    <i class="fa-solid fa-star"></i>
								    </c:forEach>
								</c:when>
								<c:otherwise>
									<i class="fa-solid fa-star"></i>
								</c:otherwise>
							</c:choose>
						  </div>
		  			</div>
		  		</div>
		  		<c:choose>
		  			<c:when test="${review.application.status == 1}">
						<div class="text-margin02 text-center text-primary">승인완료</div>
		  			</c:when>
		  			<c:when test="${review.application.status == 2}">
						<div class="text-margin02 text-center">검토요청</div>
		  			</c:when>
		  			<c:when test="${review.application.status == 4}">
						<div class="text-margin02 text-center">지급완료</div>
		  			</c:when>
		  		</c:choose>	
		  		<c:choose>
				<c:when test="${not empty review.review}">
<%-- 					<div class="text-margin03 text-center"><a href="/review/write_review_view?sellPostid=${review.sellPost.id}" class="pointNone" onclick="return false;">${review.sellPost.productName}</a></div> --%>
					<div class="text-margin03 text-center review-list-productname showReview" data-review-id="${review.review.id}"><a href="" onclick="return false;">${review.sellPost.productName}</a></div>
				</c:when>
				<c:when test="${empty review.review}">
					<div class="text-margin03 text-center review-list-productname"><a href="/review/write_review_view?sellPostid=${review.sellPost.id}">${review.sellPost.productName}</a></div>
				</c:when>
				</c:choose>
				<c:choose>
					<c:when test="${not empty review.review}">
						<div class="text-margin04 text-center">
							<a href=""  data-review-id="${review.review.id}" class="showReview">작성완료
								<i class="xi-angle-right-min" data-review-id="${review.review.id}"></i>
							</a>
						</div>
					</c:when>
					<c:when test="${empty review.review}">
						<c:choose>
							<c:when test="${review.application.status == 2}">
								<div class="text-margin04 text-center">검토중</div>
			  				</c:when>
			  				<c:otherwise>
			  					<div class="text-margin04 text-center">
			  					<input type="button" class="write-review-btn" value="미작성" onclick="location.href='/review/write_review_view?sellPostid=${review.sellPost.id}'">
			  					</div>	
								<!-- <div class="text-margin04 text-center text-danger">미작성</div> -->
							</c:otherwise>
						</c:choose>
					</c:when>
				</c:choose>
			</div>
			<c:if test="${not empty review.review}">
					<div id="managePoint-view" class="board-table-content-div applicants-review-table bot-line mt-2" style="display:none" data-application-id="${review.review.id}">
						<div class="d-flex">
							<div class="ml-2">
								<div>
								<fmt:formatDate var="reviewCreatedAt" value="${review.review.createdAt}" pattern="yyyy.MM.dd HH:mm:ss" />
								<span class="reviewCreatedAt-text">작성일: ${reviewCreatedAt}</span>
								</div>
							</div>
						</div>
						<div class="review-grey-div">
							<div class="d-flex">
								<div>
									${review.review.comment}
								</div>
							</div>
							<div class="review-image-div mt-3">
								<img src="${review.review.reviewImgPath}" alt="후기사진" class="review-image">	
							</div>
						</div>	
					</div>
				</c:if>
			</c:forEach>
			<!-- 페이징 버튼-->
			<div class="list_number">
	    		<div>
		        	<div class="list_n_menu">
		        		<a href="/review/myreview_list_view?postPage=${postPaging.nowPageNum - 1}" class="${postPaging.nowPageNum == 1 ? "disabled":"" }"><  이전</a>
			        	<c:forEach begin="${postPaging.startPage}" end="${postPaging.endPage}" var="num">
			        	<a href="/review/myreview_list_view?postPage=${num}" class="${postPaging.nowPageNum == num ? "current":"" }">${num}</a>
			        	</c:forEach>
			        	<a href="/review/myreview_list_view?postPage=${postPaging.nowPageNum + 1}" class="${postPaging.nowPageNum == postPaging.totalPages ? "disabled":"" }">다음  >
			        	</a>
		        	</div>
	    		</div>
			</div>
			<!--  페이징 버튼 끝 -->
		</div>
	</div>
</div>
<script>
	$(document).ready(function(){
		$('.write-review-btn').mouseover(function(){
			$(this).val("리뷰작성");
			
		});
		
		$('.write-review-btn').mouseout(function(){
			$(this).val("미작성");
			
		});
		
		
		$('.showReview').on('click', function(e){
			e.preventDefault();
			
 			var id = $(this).data("review-id");
 			
			if($('.xi-angle-right-min[data-review-id='+id+']').hasClass('rotation')){
				$('.xi-angle-right-min[data-review-id='+id+']').removeClass('rotation');
			} else {
			$('.xi-angle-right-min[data-review-id='+id+']').addClass('rotation');
			
			}
			
			if($('.applicants-review-table[data-application-id='+id+']').is(":visible")) {
				$('.applicants-review-table[data-application-id='+id+']').slideUp();
				$(this).val('리뷰보기');
			} else {
				$('.applicants-review-table[data-application-id='+id+']').slideDown();
				$(this).val('리뷰닫기');
			}  
		});
	});
</script>
