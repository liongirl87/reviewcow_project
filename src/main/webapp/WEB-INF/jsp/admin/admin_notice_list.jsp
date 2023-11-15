<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<div id="business-list-div">
	<div><h5 class="font-weight-bold">�������</h5></div>
	<div class="business-list-table">
		<div class="d-flex top-text-div">
			<div class="top-title text-div-width1 text-center">ID</div>
			<div class="top-title text-div-width1 text-center">�ۼ���(�̸�)</div>
			<div class="top-title text-div-width1 text-center">�з�</div>
			<div class="top-title text-div-noticeTitle text-center">����</div>
			<div class="top-title text-div-width5 text-center">�ۼ���</div>
			<div class="top-title text-div-width6 text-center">����</div>
		</div>
		<c:forEach items="${noticeList}" var="notice">
			<div class="d-flex bot-line p-1">
				<div class="text-div-width1 text-center">${notice.notice.id}</div>
				<div class="text-div-width1 text-center">${notice.member.loginId}(${notice.member.name})</div>
				<div class="text-div-width1 text-center">${notice.notice.category}</div>
				<div class="text-div-noticeTitle text-center">
					<a href="/admin/modify_notice?noticeId=${notice.notice.id}">${notice.notice.postTitle}</a>
				</div>
				<fmt:formatDate var="createdDate" value="${notice.notice.createdAt}" pattern="yyyy-MM-dd"/>
				<div class="text-div-width5 text-center">${createdDate}</div>
				<div class="text-div-width5 text-center">
					<input type="button" class="button del-button" value="����" data-notice-id="${notice.notice.id}">
					<input type="button" class="button" value="����" data-notice-id="${notice.notice.id}" onClick="location.href='/admin/modify_notice?noticeId=${notice.notice.id}'">
				</div>
			</div>
		</c:forEach>
			<!-- ����¡ ��ư -->
			<div class="list_number">
	    		<div>
		        	<div class="list_n_menu">
		        		<a href="/admin/notice_list?postPage=${postPaging.nowPageNum - 1}" class="${postPaging.nowPageNum == 1 ? "disabled":"" }"><  ����</a>
			        	<c:forEach begin="${postPaging.startPage}" end="${postPaging.endPage}" var="num">
			        	<a href="/admin/notice_list?postPage=${num}" class="${postPaging.nowPageNum == num ? "current":"" }" onclick="postPaging()">${num}</a>
			        	</c:forEach>
			        	<a href="/admin/notice_list?postPage=${postPaging.nowPageNum + 1}" class="${postPaging.nowPageNum == postPaging.totalPages ? "disabled":"" }">����  >
			        	</a>
		        	</div>
	    		</div>
			</div>
		<!--  ����¡ ��ư �� -->
	</div>
</div>
<script>
	$(document).ready(function(){
		$('.del-button').on('click', function(){
			let id = $(this).data("notice-id");
			let result = confirm("�ش� ���������� �����Ͻðڽ��ϱ�?")
			
			if(result) {
			} else
			{
				alert("������ ����Ͽ����ϴ�")
				return;	
			}
			
			$.ajax({
				type: 'DELETE'
				, url: '/admin/delete_notice'
				, data: {"id" : id}
				, success:function(data) {
					location.reload();
					alert("������ �Ϸ��߽��ϴ�");
				}
				, error: function(request, status, error) {
					alert("���ο� �����Ͽ����ϴ�. �����ڿ��� �������ּ���");
				}
			});
		});
	});
</script>