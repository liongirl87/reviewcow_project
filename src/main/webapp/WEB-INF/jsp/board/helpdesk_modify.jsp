<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    
<div id="helpdesk-write" class="d-flex justify-content-center">
	<div id="side-view-right-Tdiv" class="mt-3">
		<div class="main-title"><i class="xi-angle-left"></i>1:1문의</div>
		<div class="semi-title">1:1문의 내용</div>
		<div class="helpdesk-write-bottom-text-line"></div>
		<div id="form-div">
			<div class="form-inputBox-pm d-flex justify-content-start align-items-center">
				<select id ="helpDeskCategory" class="custom-select product-select-design ml-3 disable-inputBox" style="pointer-events : none;">
					<option value="" disabled >문의유형</option>
					<option value="${helpdesk.inquiryType}" selected>${helpdesk.inquiryType}</option>
				</select>
				<input type="text" class="form-control helpdesk-subject-input disable-inputBox" value="${helpdesk.inquiryTitle}" style="pointer-events : none;"/>
			</div>
		</div>
		<div class="form-textbox d-flex align-items-center">
			<textarea class="helpdesk-textarea">
			
			</textarea>
		</div>
		<div class="d-flex justify-content-end mt-3 helpdesk-modify-btn-div">
			<input type="button" id="helpdeskUpdateBtn" class="helpdesk-bot-buttons text-center mr-1" value="저장" data-postid="${helpdesk.id}">		
			<input type="button" class="helpdesk-bot-buttons text-center" value="목록" onclick="location.href='/board/helpdesk_view'">	
		</div>
	</div>
</div>
<script>
$(document).ready(function(){
	$('.helpdesk-textarea').text("${helpdesk.inquiryContent}".replaceAll("<br>", "\r\n"));
	$('#helpdeskUpdateBtn').on('click',function(){
		let content = $('.helpdesk-textarea').val().replace(/\n/g, "<br>");
		let postId = $(this).data('postid');
		alert(postId);
		
		$.ajax({
			type:"PUT"
			, url:"/board/helpdesk_update"
			, data:{"postId":postId, "content":content}
				
			,success:function(data) {
				if(data.code == 1) {
					alert("성공");
				} else {
					alert("실패");
				}
			}
			,error:function(request, status, error) {
				alert("실패, 관리자에게 문의")
			}
		});
	});
	
});


</script>