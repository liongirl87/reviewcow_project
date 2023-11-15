<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<div id="business-list-div">
	<c:if test="${sort == 2}">
	<div><h5 class="font-weight-bold">����Ʈ����</h5></div>
	</c:if>
	<c:if test="${sort == 3}">
	<div><h5 class="font-weight-bold">����Ʈ����</h5></div>
	</c:if>
	<div class="business-list-table">
		<div class="d-flex top-text-div">
			<div class="top-title text-div-width1 text-center">ID</div>
			<div class="top-title text-div-width1 text-center">���̵�</div>
			<div class="top-title text-div-width1 text-center">�̸�</div>
			<div class="top-title text-div-width2 text-center">����Ʈ</div>
			<div class="top-title text-div-width3 text-center">��û��</div>
			<div class="top-title text-div-width3 text-center">����</div>
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
					<input type="button" class="button confirm-button" data-point-id="${point.point.id}" value="����">
					<input type="button" class="button confirm-button" value="����">
				</div>
			</div>
		</c:forEach>
			<c:choose>
				<c:when test="${sort == 2}">
				<!-- ����¡ ��ư-->
				<div class="list_number">
		    		<div>
			        	<div class="list_n_menu">
			        		<a href="/admin/charge_points?postPage=${postPaging.nowPageNum - 1}" class="${postPaging.nowPageNum == 1 ? "disabled":"" }"><  ����</a>
				        	<c:forEach begin="${postPaging.startPage}" end="${postPaging.endPage}" var="num">
				        		<a href="/admin/charge_points?postPage=${num}" class="${postPaging.nowPageNum == num ? "current":"" }">${num}</a>
				        	</c:forEach>
				        	<a href="/admin/charge_points?postPage=${postPaging.nowPageNum + 1}" class="${postPaging.nowPageNum == postPaging.totalPages ? "disabled":"" }">����  >
				        	</a>
			        	</div>
		    		</div>
				</div>
				<!--  ����¡ ��ư �� -->
				</c:when>
				<c:when test="${sort == 3}">
				<!-- ����¡ ��ư-->
				<div class="list_number">
		    		<div>
			        	<div class="list_n_menu">
			        		<a href="/admin/withdraw_points?postPage=${postPaging.nowPageNum - 1}" class="${postPaging.nowPageNum == 1 ? "disabled":"" }"><  ����</a>
				        	<c:forEach begin="${postPaging.startPage}" end="${postPaging.endPage}" var="num">
				        		<a href="/admin/withdraw_points?postPage=${num}" class="${postPaging.nowPageNum == num ? "current":"" }">${num}</a>
				        	</c:forEach>
				        	<a href="/admin/withdraw_points?postPage=${postPaging.nowPageNum + 1}" class="${postPaging.nowPageNum == postPaging.totalPages ? "disabled":"" }">����  >
				        	</a>
			        	</div>
		    		</div>
				</div>
				<!--  ����¡ ��ư �� -->
				</c:when>
			</c:choose>
	</div>
</div>
<script>
	$(document).ready(function(){
		$(".confirm-button").on('click', function(){
			let id = $(this).data("point-id");
			if ($(this).val() == '����') {
				var approvalCondition = 1;
			} else if ($(this).val() == '����') {
				var approvalCondition = 2;
			}
			
			$.ajax({
				type: "PUT"
				, url: "/admin/approval_chargepoint"
				, data: {"id" : id, "approvalCondition" : approvalCondition}
				, success:function(data) {
					location.reload();
					alert("����");
				}
				, error:function(request, status, error) {
					alert("���ο� �����Ͽ����ϴ�. �����ڿ��� �������ּ���");
				}
			});
			
		});
	});

</script>