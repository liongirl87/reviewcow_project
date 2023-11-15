<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<div id="business-list-div">
	<div><h5 class="font-weight-bold">�����ȸ��(�����)</h5></div>
	<div class="business-list-table">
		<div class="d-flex top-text-div">
			<div class="top-title text-div-width1 text-center">���̵�</div>
			<div class="top-title text-div-width2 text-center">�̸�</div>
			<div class="top-title text-div-width3 text-center">��ȣ��</div>
			<div class="top-title text-div-width4 text-center">����ڹ�ȣ</div>
			<div class="top-title text-div-width5 text-center">������</div>
			<div class="top-title text-div-width6 text-center">����</div>
		</div>
		<c:forEach items="${businessMemberList}" var="member">
			<div class="d-flex bot-line p-1">
				<div class="text-div-width1 text-center">${member.loginId}</div>
				<div class="text-div-width2 text-center">${member.name}</div>
				<div class="text-div-width3 text-center">${member.businessName}</div>
				<div class="text-div-width4 text-center">${member.businessLicenseNumber}</div>
				<fmt:formatDate var="createdDate" value="${member.createdAt}" pattern="yyyy-MM-dd"/>
				<div class="text-div-width5 text-center">${createdDate}</div>
				<div class="top-title text-div-width6 text-center">
					<input type="button" class="button confirm-button" data-member-id="${member.id}" value="����">
					<input type="button" class="button confirm-button" value="����">
				</div>
			</div>
		</c:forEach>
			<!-- ����¡ ��ư -->
			<div class="list_number">
	    		<div>
		        	<div class="list_n_menu">
		        		<a href="/admin/business_member_list?postPage=${postPaging.nowPageNum - 1}" class="${postPaging.nowPageNum == 1 ? "disabled":"" }"><  ����</a>
			        	<c:forEach begin="${postPaging.startPage}" end="${postPaging.endPage}" var="num">
			        	<a href="/admin/business_member_list?postPage=${num}" class="${postPaging.nowPageNum == num ? "current":"" }">${num}</a>
			        	</c:forEach>
			        	<a href="/admin/business_member_list?postPage=${postPaging.nowPageNum + 1}" class="${postPaging.nowPageNum == postPaging.totalPages ? "disabled":"" }">����  >
		        	</div>
	    		</div>
			</div>
		<!--  ����¡ ��ư �� -->
	</div>
</div>
<script>
	$(document).ready(function(){
		$(".confirm-button").on('click', function(){
			let id = $(this).data("member-id");
			if ($(this).val() == '����') {
				var approvalCondition = 1;
			} else if ($(this).val() == '����') {
				var approvalCondition = 3;
			}
			
			$.ajax({
				type: "PUT"
				, url: "/admin/approval_business_member"
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