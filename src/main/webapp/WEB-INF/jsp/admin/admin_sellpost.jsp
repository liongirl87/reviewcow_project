<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<div id="business-list-div">
	<div><h5 class="font-weight-bold">체험단목록</h5></div>
	<div class="business-list-table">
		<div class="d-flex top-text-div">
			<!-- 1 -->
			<div class="top-title text-div-width0 text-center">ID</div>
			<!-- 2 -->
			<div class="top-title text-div-width1 text-center">카테고리</div>
			<!-- 3 -->
			<div class="top-title text-div-width1 text-center">쇼핑몰</div>
			<!-- 4 -->
			<div class="top-title text-div-width2 text-center">상품</div>
			<!-- 5 -->
			<div class="top-title text-div-date text-center">시작일</div>
			<!-- 8 -->
			<div class="top-title text-div-width6 text-center">상태</div>
		</div>
		<c:forEach items="${sellPostList}" var="sellPost">
			<div class="d-flex bot-line p-1">
				<!-- 1 -->
				<div class="text-div-width0 text-center">${sellPost.id}</div>
				<!-- 2 -->
				<div class="text-div-width1 text-center">${sellPost.serviceCategory1}</div>
				<!-- 3 -->
				<div class="text-div-width1 text-center">${sellPost.serviceCategory2Online}</div>
				<!-- 4 -->
				<div class="text-div-width2 text-center"><a href="/sellpost/product_detail_view?postId=${sellPost.id}" target='_blank'>${sellPost.productName}</a></div>
				<fmt:formatDate var="startDate" value="${sellPost.startDate}" pattern="yyyy-MM-dd"/>
				<fmt:formatDate var="endDate" value="${sellPost.endDate}" pattern="yyyy-MM-dd"/>
				<div class="text-div-date text-center">${startDate} ~ ${endDate}</div>
				<!-- 7 -->
				<div class="text-div-width6 text-center">
					<c:choose>
						<c:when test="${sellPost.approvalCondition == 0}">
							미승인
						</c:when>
						<c:when test="${sellPost.approvalCondition == 1}">
							승인
						</c:when>
						<c:when test="${sellPost.approvalCondition == 2}">
							거절
						</c:when>
						<c:when test="${sellPost.approvalCondition == 3}">
							취소
						</c:when>
					</c:choose>
				</div>
				<!-- 8 -->
			</div>
		</c:forEach>
			<!-- 페이징 버튼 TEST -->
			<div class="list_number">
	    		<div>
		        	<div class="list_n_menu">
		        		<a href="/admin/sellpost_list?postPage=${postPaging.nowPageNum - 1}" class="${postPaging.nowPageNum == 1 ? "disabled":"" }"><  이전</a>
			        	<c:forEach begin="${postPaging.startPage}" end="${postPaging.endPage}" var="num">
			        	<a href="/admin/sellpost_list?postPage=${num}" class="${postPaging.nowPageNum == num ? "current":"" }" onclick="postPaging()">${num}</a>
			        	</c:forEach>
			        	<a href="/admin/sellpost_list?postPage=${postPaging.nowPageNum + 1}" class="${postPaging.nowPageNum == postPaging.totalPages ? "disabled":"" }">다음  >
			        	</a>
		        	</div>
	    		</div>
			</div>
		<!--  페이징 버튼 TEST 끝 -->
	</div>
</div>
<script>
	$(document).ready(function(){
		$(".confirm-button").on('click', function(){
			let id = $(this).data("sellpost-id");
			if ($(this).val() == '승인') {
				var approvalCondition = 1;
			} else if ($(this).val() == '거절') {
				var approvalCondition = 3;
			}
			
			$.ajax({
				type: "PUT"
				, url: "/admin/approval_sellpost"
				, data: {"id" : id, "approvalCondition" : approvalCondition}
				, success:function(data) {
					alert("성공")
				}
				, error:function(request, status, error) {
					alert("승인에 실패하였습니다. 관리자에게 문의해주세요")
				}
			});
			
		});
		postPaging = function() {
		}

	});


</script>