<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<div id="helpdesk-detail-top">
	<div><h5 class="font-weight-bold">공지수정</h5></div>
	<div class="helpdesk-detail-div">
		<div class="d-flex align-items-center">
			<!-- 1 -->
			<div class="d-flex align-items-center">
				<select name="noticeCategory" id="noticeCategory" class="notice-select-design form-control">
					<option value="" disabled>공지유형</option>
					<option value="배송공지">배송공지</option>
					<option value="연휴공지">연휴공지</option>
					<option value="이벤트">이벤트</option>
					<option value="공지사항">공지사항</option>
					<option value="기타">기타</option>
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
			<input type="button" value="수정" class="button confirm-button" data-notice-id="${notice.id}">
			<input type="button" value="취소" class="button ml-1 cancel-button">
		</div>
	</div>
</div>
<script>
	$(document).ready(function(){
		$('.notice-textarea').text("${notice.content}".replaceAll("<br>", "\r\n"));
		$('#noticeCategory').val("${notice.category}").prop("selected", true);
		
		$('.cancel-button').on('click', function(){
			let result = confirm("목록으로 돌아가시겠습니까?")
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
				type: "PUT"
				, url: "/admin/update_notice"
				, data: {"id" : id, "category" : category, "postTitle" : postTitle, "content" : content}
				, success:function(data) {
					alert("성공")
				}
				, error:function(request, status, error) {
					alert("승인에 실패하였습니다. 관리자에게 문의해주세요")
				}
			});
			
		});
		
		postPaging = function() {
		}

	});


</script>