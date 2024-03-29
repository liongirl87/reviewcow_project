<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<div id="helpdesk-write" class="d-flex justify-content-center">
	<div id="side-view-right-Tdiv" class="mt-3">
		<div class="main-title"><i class="xi-angle-left"></i>문의하기</div>
		<div class="semi-title">1:1문의하기</div>
		<div class="helpdesk-write-bottom-text-line"></div>
		<div id="form-div">
			<div class="form-inputBox-pm d-flex justify-content-start align-items-center">
				<select name="order" id ="helpDeskCategory" class="custom-select product-select-design ml-3">
					<option value="" disabled selected>문의유형</option>
					<option value="포인트문의">포인트문의</option>
					<option value="체험단문의">체험단문의</option>
					<option value="계정문의">계정문의</option>
					<option value="제휴문의">제휴문의</option>
					<option value="기타">기타</option>
				</select>
				<input type="text" class="form-control helpdesk-subject-input">
			</div>
		</div>
		<div class="form-textbox d-flex align-items-center">
			<textarea class="helpdesk-textarea p-2"></textarea>
		</div>
		<div class="d-flex justify-content-end">
			<input type="button" id="helpdeskSubmitBtn" class="text-center" value="저장">		
		</div>
	</div>
</div>
<script>
$(document).ready(function(){
	$('#helpdeskSubmitBtn').on('click',function(){
		let category = $('#helpDeskCategory option:checked').val();
		let subject = $('.helpdesk-subject-input').val();
		let content = $('.helpdesk-textarea').val().replace(/\n/g, "<br>");
		
		// 유효성 검사
		if (!category) {
			alert("카테고리를 선택해주세요");
			return;
		}
		
		if (!subject) {
			alert("문의제목을 입력해주세요");
			return;
		}
		
		if (content.length <= 30) {
			alert("문의내용을 30자이상 입력해주세요");
			return;
		}
		
		$.ajax({
			url:"/board/helpdesk_write"
			, data:{"category":category,"subject":subject,"content":content}
			,success:function(data) {
				if(data.code == 1) {
					alert("문의글을 작성하였습니다.");
					location.href = "/board/helpdesk_view";
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