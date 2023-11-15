<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<div id="business-list-div">
	<div><h5 class="font-weight-bold">포인트관리</h5></div>
	<div class="business-list-table">
		<div class="d-flex top-text-div">
			<div class="top-title text-div-width1 text-center">ID</div>
			<div class="top-title text-div-width1 text-center">아이디</div>
			<div class="top-title text-div-width2 text-center">이름</div>
			<div class="top-title text-div-width2 text-center">현재포인트</div>
			<div class="top-title text-div-noticeTitle text-center">포인트지급(+,-)</div>
		</div>
		<c:forEach items="${memberList}" var="member">
			<div class="d-flex bot-line p-1">
				<div class="text-div-width1 text-center">${member.member.id}</div>
				<div class="text-div-width1 text-center">${member.member.loginId}</div>
				<div class="text-div-width2 text-center">${member.member.name}</div>
				<div class="text-div-width2 text-center">
					<fmt:formatNumber value="${member.point}" type="number" />
				</div>
				<div class="d-flex justify-content-center text-div-noticeTitle text-center">
					<!-- onkeyup="this.value = this.value.replace(/[^0-9]/g, '').replace(/\d(?=(?:\d{3})+$)/g, '$&,')" -->
					<input type="text" class="input-price" data-price-id="${member.member.id}" onkeyup="this.value = this.value.replace(/[^-?0-9]/g, '').replace(/\d(?=(?:\d{3})+$)/g, '$&,')"/>
					<input type="button" class="button confirm-button ml-1" data-member-id="${member.member.id}" value="적용">
				</div>
				<div>
					
				</div>
				<!-- 8 -->
			</div>
		</c:forEach>
			<!-- 페이징 버튼 -->
			<div class="list_number">
	    		<div>
		        	<div class="list_n_menu">
		        		<a href="/admin/manage_points?postPage=${postPaging.nowPageNum - 1}" class="${postPaging.nowPageNum == 1 ? "disabled":"" }"><  이전</a>
			        	<c:forEach begin="${postPaging.startPage}" end="${postPaging.endPage}" var="num">
			        	<a href="/admin/manage_points?postPage=${num}" class="${postPaging.nowPageNum == num ? "current":"" }">${num}</a>
			        	</c:forEach>
			        	<a href="/admin/manage_points?postPage=${postPaging.nowPageNum + 1}" class="${postPaging.nowPageNum == postPaging.totalPages ? "disabled":"" }">다음  >
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
			let memberId = $(this).data("member-id");
			
			
			var point = null;
 			$('.input-price').each(function(){
				if(memberId == $(this).data("price-id")) {
				point = $(this).val().replaceAll(",", "");
				};
			});
 			var status = null
 			
 			if (point >= 0) {
 				status = "지급";
 			} else {
 				status = "차감";
 			}
 			
			$.ajax({
				type: "POST"
				, url: "/admin/change_member_point"
				, data: {"memberId" : memberId, "point" : point}
				, success:function(data) {
					location.reload();
					alert("포인트 "+ status +"성공");
				}
				, error:function(request, status, error) {
					alert("승인에 실패하였습니다. 관리자에게 문의해주세요");
				}
			});
			
		});

	});


</script>