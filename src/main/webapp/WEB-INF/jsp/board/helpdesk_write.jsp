<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<div id="helpdesk-write" class="d-flex justify-content-center">
	<div id="side-view-right-Tdiv" class="mt-3">
		<div class="main-title"><i class="xi-angle-left"></i>�����ϱ�</div>
		<div class="semi-title">1:1�����ϱ�</div>
		<div class="helpdesk-write-bottom-text-line"></div>
		<div id="form-div">
			<div class="form-inputBox-pm d-flex justify-content-start align-items-center">
				<select name="order" id ="serviceCategory1" class="custom-select product-select-design ml-3">
					<option value="" disabled selected>��������</option>
					<option value="onlineProduct">����Ʈ����</option>
					<option value="offlineStore">ü��ܹ���</option>
					<option value="offlineStore">��������</option>
					<option value="offlineStore">���޹���</option>
					<option value="pressCorps">��Ÿ</option>
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