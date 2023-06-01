<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<div id="helpdesk-write" class="d-flex justify-content-center">
	<div id="side-view-right-Tdiv" class="mt-3">
		<div class="main-title"><i class="xi-angle-left"></i>문의하기</div>
		<div class="semi-title">1:1문의하기</div>
		<div class="helpdesk-write-bottom-text-line"></div>
		<div id="form-div">
			<div class="form-inputBox-pm d-flex justify-content-start align-items-center">
				<select name="order" id ="serviceCategory1" class="custom-select product-select-design ml-3">
					<option value="" disabled selected>문의유형</option>
					<option value="onlineProduct">포인트문의</option>
					<option value="offlineStore">체험단문의</option>
					<option value="offlineStore">계정문의</option>
					<option value="offlineStore">제휴문의</option>
					<option value="pressCorps">기타</option>
				</select>
				<input type="text" class="form-control helpdesk-subject-input">
			</div>
		</div>
		<div class="form-textbox d-flex align-items-center">
			<textarea class="helpdesk-textarea"></textarea>
		</div>
		<div class="d-flex justify-content-end">
			<input type="button" id="helpdeskSubmitBtn" class="text-center" value="저장">		
		</div>
	</div>
</div>