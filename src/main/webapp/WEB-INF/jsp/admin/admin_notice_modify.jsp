<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<div id="helpdesk-detail-top">
	<div><h5 class="font-weight-bold">��������</h5></div>
	<div class="helpdesk-detail-div">
		<div class="d-flex align-items-center">
			<!-- 1 -->
			<div class="d-flex align-items-center">
				<select name="noticeCategory" id="noticeCategory" class="notice-select-design form-control">
					<option value="" disabled>��������</option>
					<option value="��۰���">��۰���</option>
					<option value="���ް���">���ް���</option>
					<option value="�̺�Ʈ">�̺�Ʈ</option>
					<option value="��������">��������</option>
					<option value="��Ÿ">��Ÿ</option>
				</select>
			</div>
			<!-- 2 -->
			<div class="hepldesk-subject-title2 d-flex align-items-center">
				<input type="text" class="form-control notice-title-input" value="${notice.postTitle}">
			</div>
		</div>
		<div class="d-flex mt-3">
			<textarea class="notice-textarea">
			</textarea>
		</div>
		<div class="d-flex justify-content-end mt-2 notice-submit-btn">
			<input type="button" value="����" class="button confirm-button" data-notice-id="${notice.id}">
			<input type="button" value="���" class="button ml-1 cancel-button">
		</div>
	</div>
</div>
<script>
	$(document).ready(function(){
		$('.notice-textarea').text("${notice.content}".replaceAll("<br>", "\r\n"));
		$('#noticeCategory').val("${notice.category}").prop("selected", true);
		
		$('.cancel-button').on('click', function(){
			let result = confirm("������� ���ư��ðڽ��ϱ�?")
			if(result) {
				history.back();
			} else {
				return;
			} 
		});
		
		$(".confirm-button").on('click', function(){
			/* let id = $(this).data("member-id"); */
			let id = $(this).data("notice-id");
			let category = $('#noticeCategory').val();
			let postTitle = $('.notice-title-input').val();
			let content = $('.notice-textarea').val().replace(/\n/g, "<br>");
			
			if(!category) {
				alert("ī�װ��� �������ּ���");
				return;
			}
			if(!postTitle) {
				alert("������ �Է����ּ���");
				return;
			}
			if(!content) {
				alert("���� ������ �Է����ּ���");
				return;
			}
			
			
			$.ajax({
				type: "PUT"
				, url: "/admin/update_notice"
				, data: {"id" : id, "category" : category, "postTitle" : postTitle, "content" : content}
				, success:function(data) {
					alert("����")
				}
				, error:function(request, status, error) {
					alert("���ο� �����Ͽ����ϴ�. �����ڿ��� �������ּ���")
				}
			});
			
		});
		
		postPaging = function() {
		}

	});


</script>