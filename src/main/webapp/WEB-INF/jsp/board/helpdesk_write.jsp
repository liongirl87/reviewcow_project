<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<div id="helpdesk-write" class="d-flex justify-content-center">
	<div id="side-view-right-Tdiv" class="mt-3">
		<div class="main-title"><i class="xi-angle-left"></i>�����ϱ�</div>
		<div class="semi-title">1:1�����ϱ�</div>
		<div class="helpdesk-write-bottom-text-line"></div>
		<div id="form-div">
			<div class="form-inputBox-pm d-flex justify-content-start align-items-center">
				<select name="order" id ="helpDeskCategory" class="custom-select product-select-design ml-3">
					<option value="" disabled selected>��������</option>
					<option value="����Ʈ����">����Ʈ����</option>
					<option value="ü��ܹ���">ü��ܹ���</option>
					<option value="��������">��������</option>
					<option value="���޹���">���޹���</option>
					<option value="��Ÿ">��Ÿ</option>
				</select>
				<input type="text" class="form-control helpdesk-subject-input">
			</div>
		</div>
		<div class="form-textbox d-flex align-items-center">
			<textarea class="helpdesk-textarea"></textarea>
		</div>
		<div class="d-flex justify-content-end">
			<input type="button" id="helpdeskSubmitBtn" class="text-center" value="����">		
		</div>
	</div>
</div>
<script>
$(document).ready(function(){
	$('#helpdeskSubmitBtn').on('click',function(){
		let category = $('#helpDeskCategory option:checked').val();
		let subject = $('.helpdesk-subject-input').val();
		let content = $('.helpdesk-textarea').val();
		
		
		$.ajax({
			url:"/board/helpdesk_write"
			, data:{"category":category,"subject":subject,"content":content}
				
			,success:function(data) {
				if(data.code == 1) {
					alert("����");
				} else {
					alert("����");
				}
			}
			,error:function(request, status, error) {
				alert("����, �����ڿ��� ����")
			}
		});
	});
	
});


</script>