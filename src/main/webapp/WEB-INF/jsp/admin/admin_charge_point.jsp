<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<div id="business-list-div">
	<c:if test="${sort == 2}">
	<div><h5 class="font-weight-bold">포인트충전</h5></div>
	</c:if>
	<c:if test="${sort == 3}">
	<div><h5 class="font-weight-bold">포인트인출</h5></div>
	</c:if>
	<div class="business-list-table">
		<div class="d-flex top-text-div">
			<div class="top-title text-div-width1 text-center">ID</div>
			<div class="top-title text-div-width1 text-center">아이디</div>
			<div class="top-title text-div-width1 text-center">이름</div>
			<div class="top-title text-div-width2 text-center">포인트</div>
			<div class="top-title text-div-width3 text-center">신청일</div>
			<div class="top-title text-div-width3 text-center">상태</div>
		</div>
		<c:forEach items="${pointMemberList}" var="point">
			<div class="d-flex bot-line p-1">
				<div class="text-div-width1 text-center">${point.point.id}</div>
				<div class="text-div-width1 text-center">${point.member.loginId}</div>
				<div class="text-div-width1 text-center">${point.member.name}</div>
				<div class="text-div-width2 text-center">
					<fmt:formatNumber value="${point.point.point}" type="number" />
				</div>
				<fmt:formatDate var="startDate" value="${point.point.updatedAt}" pattern="yyyy-MM-dd"/>
				<div class="text-div-width3 text-center">${startDate}</div>
				<div class="text-div-width3 text-center">
					<input type="button" class="button confirm-button" data-point-id="${point.point.id}" value="승인">
					<input type="button" class="button confirm-button" value="거절">
				</div>
			</div>
		</c:forEach>
			<c:choose>
				<c:when test="${sort == 2}">
				<!-- 페이징 버튼-->
				<div class="list_number">
		    		<div>
			        	<div class="list_n_menu">
			        		<a href="/admin/charge_points?postPage=${postPaging.nowPageNum - 1}" class="${postPaging.nowPageNum == 1 ? "disabled":"" }"><  이전</a>
				        	<c:forEach begin="${postPaging.startPage}" end="${postPaging.endPage}" var="num">
				        		<a href="/admin/charge_points?postPage=${num}" class="${postPaging.nowPageNum == num ? "current":"" }">${num}</a>
				        	</c:forEach>
				        	<a href="/admin/charge_points?postPage=${postPaging.nowPageNum + 1}" class="${postPaging.nowPageNum == postPaging.totalPages ? "disabled":"" }">다음  >
				        	</a>
			        	</div>
		    		</div>
				</div>
				<!--  페이징 버튼 끝 -->
				</c:when>
				<c:when test="${sort == 3}">
				<!-- 페이징 버튼-->
				<div class="list_number">
		    		<div>
			        	<div class="list_n_menu">
			        		<a href="/admin/withdraw_points?postPage=${postPaging.nowPageNum - 1}" class="${postPaging.nowPageNum == 1 ? "disabled":"" }"><  이전</a>
				        	<c:forEach begin="${postPaging.startPage}" end="${postPaging.endPage}" var="num">
				        		<a href="/admin/withdraw_points?postPage=${num}" class="${postPaging.nowPageNum == num ? "current":"" }">${num}</a>
				        	</c:forEach>
				        	<a href="/admin/withdraw_points?postPage=${postPaging.nowPageNum + 1}" class="${postPaging.nowPageNum == postPaging.totalPages ? "disabled":"" }">다음  >
				        	</a>
			        	</div>
		    		</div>
				</div>
				<!--  페이징 버튼 끝 -->
				</c:when>
			</c:choose>
	</div>
</div>
<script>
	$(document).ready(function(){
		$(".confirm-button").on('click', function(){
			let id = $(this).data("point-id");
			if ($(this).val() == '승인') {
				var approvalCondition = 1;
			} else if ($(this).val() == '거절') {
				var approvalCondition = 2;
			}
			
			$.ajax({
				type: "PUT"
				, url: "/admin/approval_chargepoint"
				, data: {"id" : id, "approvalCondition" : approvalCondition}
				, success:function(data) {
					location.reload();
					alert("성공");
				}
				, error:function(request, status, error) {
					alert("승인에 실패하였습니다. 관리자에게 문의해주세요");
				}
			});
			
		});
	});

</script>