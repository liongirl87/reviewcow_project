<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<div id="business-list-div">
	<div><h5 class="font-weight-bold">ü���(�����)</h5></div>
	<div class="business-list-table">
		<div class="d-flex top-text-div">
			<div class="top-title text-div-width0 text-center">ID</div>
			<div class="top-title text-div-width1 text-center">ī�װ�</div>
			<div class="top-title text-div-width1 text-center">���θ�</div>
			<div class="top-title text-div-width2 text-center">��ǰ</div>
			<div class="top-title text-div-date text-center">�Ⱓ</div>
			<div class="top-title text-div-width6 text-center">����</div>
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
					<input type="button" class="button confirm-button" data-sellpost-id="${sellPost.id}" value="����">
					<input type="button" class="button confirm-button" data-sellpost-id="${sellPost.id}" value="����">
				</div>
			</div>
		</c:forEach>
			<!-- ����¡ ��ư -->
			<div class="list_number">
	    		<div>
		        	<div class="list_n_menu">
		        		<a href="/admin/before_sellpost_list?postPage=${postPaging.nowPageNum - 1}" class="${postPaging.nowPageNum == 1 ? "disabled":"" }"><  ����</a>
			        	<c:forEach begin="${postPaging.startPage}" end="${postPaging.endPage}" var="num">
			        		<a href="/admin/before_sellpost_list?postPage=${num}" class="${postPaging.nowPageNum == num ? "current":"" }">${num}</a>
			        	</c:forEach>
			        	<a href="/admin/before_sellpost_list?postPage=${postPaging.nowPageNum + 1}" class="${postPaging.nowPageNum == postPaging.totalPages ? "disabled":"" }">����  >
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
			let id = $(this).data("sellpost-id");
			var status = $(this).val();
			
			if ($(this).val() == '����') {
				var approvalCondition = 1;
			} else if ($(this).val() == '����') {
				var approvalCondition = 3;
			}
			
			$.ajax({
				type: "PUT"
				, url: "/admin/approval_sellpost"
				, data: {"id" : id, "approvalCondition" : approvalCondition}
				, success:function(data) {
					location.reload();
					alert(status + "����");
				}
				, error:function(request, status, error) {
					alert("���ο� �����Ͽ����ϴ�. �����ڿ��� �������ּ���");
				}
			});
			
		});
	});


</script>