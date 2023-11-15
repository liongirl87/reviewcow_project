<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<div id="business-list-div">
	<div><h5 class="font-weight-bold">체험단(대기중)</h5></div>
	<div class="business-list-table">
		<div class="d-flex top-text-div">
			<div class="top-title text-div-width0 text-center">ID</div>
			<div class="top-title text-div-width1 text-center">카테고리</div>
			<div class="top-title text-div-width1 text-center">쇼핑몰</div>
			<div class="top-title text-div-width2 text-center">상품</div>
			<div class="top-title text-div-date text-center">기간</div>
			<div class="top-title text-div-width6 text-center">상태</div>
		</div>
		<c:forEach items="${sellPostList}" var="sellPost">
			<div class="d-flex bot-line p-1">
				<div class="text-div-width0 text-center">${sellPost.id}</div>
				<div class="text-div-width1 text-center">${sellPost.serviceCategory1}</div>
				<div class="text-div-width1 text-center">${sellPost.serviceCategory2Online}</div>
				<div class="text-div-width2 text-center"><a href="/sellpost/product_detail_view?postId=${sellPost.id}" target='_blank'>${sellPost.productName}</a></div>
				<fmt:formatDate var="startDate" value="${sellPost.startDate}" pattern="yyyy-MM-dd"/>
				<fmt:formatDate var="endDate" value="${sellPost.endDate}" pattern="yyyy-MM-dd"/>
				<div class="text-div-date text-center">${startDate} ~ ${endDate}</div>
				<div class="text-div-width5 text-center">
					<input type="button" class="button confirm-button" data-sellpost-id="${sellPost.id}" value="승인">
					<input type="button" class="button confirm-button" data-sellpost-id="${sellPost.id}" value="거절">
				</div>
			</div>
		</c:forEach>
			<!-- 페이징 버튼 -->
			<div class="list_number">
	    		<div>
		        	<div class="list_n_menu">
		        		<a href="/admin/before_sellpost_list?postPage=${postPaging.nowPageNum - 1}" class="${postPaging.nowPageNum == 1 ? "disabled":"" }"><  이전</a>
			        	<c:forEach begin="${postPaging.startPage}" end="${postPaging.endPage}" var="num">
			        		<a href="/admin/before_sellpost_list?postPage=${num}" class="${postPaging.nowPageNum == num ? "current":"" }">${num}</a>
			        	</c:forEach>
			        	<a href="/admin/before_sellpost_list?postPage=${postPaging.nowPageNum + 1}" class="${postPaging.nowPageNum == postPaging.totalPages ? "disabled":"" }">다음  >
			        	</a>
		        	</div>
	    		</div>
			</div>
		<!--  페이징 버튼 끝 -->
	</div>
</div>
<script>
	$(document).ready(function(){
		$(".confirm-button").on('click', function(){
			let id = $(this).data("sellpost-id");
			var status = $(this).val();
			
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
					location.reload();
					alert(status + "성공");
				}
				, error:function(request, status, error) {
					alert("승인에 실패하였습니다. 관리자에게 문의해주세요");
				}
			});
			
		});
	});


</script>