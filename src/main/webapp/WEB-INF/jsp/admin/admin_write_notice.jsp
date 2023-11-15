<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<div id="helpdesk-detail-top">
	<div><h5 class="font-weight-bold">공지작성</h5></div>
	<div class="helpdesk-detail-div">
		<div class="d-flex align-items-center">
			<div class="d-flex align-items-center">
				<select name="noticeCategory" id="noticeCategory" class="notice-select-design form-control">
					<option value="" disabled selected>공지유형</option>
					<option value="배송공지">배송공지</option>
					<option value="연휴공지">연휴공지</option>
					<option value="이벤트">이벤트</option>
					<option value="공지사항">공지사항</option>
					<option value="기타">기타</option>
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
			<input type="button" value="작성" class="confirm-button">
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
				alert("카테고리를 선택해주세요");
				return;
			}
			if(!postTitle) {
				alert("제목을 입력해주세요");
				return;
			}
			if(!content) {
				alert("공지 내용을 입력해주세요");
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
					alert("승인에 실패하였습니다. 관리자에게 문의해주세요")
				}
			});
			
		});

	});


</script>