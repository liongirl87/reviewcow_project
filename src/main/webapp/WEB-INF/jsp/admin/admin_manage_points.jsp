<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<div id="business-list-div">
	<div><h5 class="font-weight-bold">����Ʈ����</h5></div>
	<div class="business-list-table">
		<div class="d-flex top-text-div">
			<div class="top-title text-div-width1 text-center">ID</div>
			<div class="top-title text-div-width1 text-center">���̵�</div>
			<div class="top-title text-div-width2 text-center">�̸�</div>
			<div class="top-title text-div-width2 text-center">��������Ʈ</div>
			<div class="top-title text-div-noticeTitle text-center">����Ʈ����(+,-)</div>
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
					<input type="button" class="button confirm-button ml-1" data-member-id="${member.member.id}" value="����">
				</div>
				<div>
					
				</div>
				<!-- 8 -->
			</div>
		</c:forEach>
			<!-- ����¡ ��ư -->
			<div class="list_number">
	    		<div>
		        	<div class="list_n_menu">
		        		<a href="/admin/manage_points?postPage=${postPaging.nowPageNum - 1}" class="${postPaging.nowPageNum == 1 ? "disabled":"" }"><  ����</a>
			        	<c:forEach begin="${postPaging.startPage}" end="${postPaging.endPage}" var="num">
			        	<a href="/admin/manage_points?postPage=${num}" class="${postPaging.nowPageNum == num ? "current":"" }">${num}</a>
			        	</c:forEach>
			        	<a href="/admin/manage_points?postPage=${postPaging.nowPageNum + 1}" class="${postPaging.nowPageNum == postPaging.totalPages ? "disabled":"" }">����  >
			        	</a>
		        	</div>
	    		</div>
			</div>
		<!--  ����¡ ��ư �� -->
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
 				status = "����";
 			} else {
 				status = "����";
 			}
 			
			$.ajax({
				type: "POST"
				, url: "/admin/change_member_point"
				, data: {"memberId" : memberId, "point" : point}
				, success:function(data) {
					location.reload();
					alert("����Ʈ "+ status +"����");
				}
				, error:function(request, status, error) {
					alert("���ο� �����Ͽ����ϴ�. �����ڿ��� �������ּ���");
				}
			});
			
		});

	});


</script>