<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<div id="helpdesk-detail-top">
	<div><h5 class="font-weight-bold">�����ۼ�</h5></div>
	<div class="helpdesk-detail-div">
		<div class="d-flex align-items-center">
			<div class="d-flex align-items-center">
				<select name="noticeCategory" id="noticeCategory" class="notice-select-design form-control">
					<option value="" disabled selected>��������</option>
					<option value="��۰���">��۰���</option>
					<option value="���ް���">���ް���</option>
					<option value="�̺�Ʈ">�̺�Ʈ</option>
					<option value="��������">��������</option>
					<option value="��Ÿ">��Ÿ</option>
				</select>
			</div>
			<div class="hepldesk-subject-title2 d-flex align-items-center">
				<input type="text" class="form-control notice-title-input">
			</div>
		</div>
		<div class="d-flex mt-3">
			<textarea class="notice-textarea">
			</textarea>
		</div>
		<div class="d-flex justify-content-end mt-2 notice-submit-btn">
			<input type="button" value="�ۼ�" class="confirm-button">
		</div>
	</div>
</div>
<script>
	$(document).ready(function(){
		$(".confirm-button").on('click', function(){
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
				type: "GET"
				, url: "/admin/write_notice"
				, data: {"category" : category, "postTitle" : postTitle, "content" : content}
				, success:function(data) {
					location.href = "/admin/notice_list";
				}
				, error:function(request, status, error) {
					alert("���ο� �����Ͽ����ϴ�. �����ڿ��� �������ּ���")
				}
			});
			
		});

	});


</script>