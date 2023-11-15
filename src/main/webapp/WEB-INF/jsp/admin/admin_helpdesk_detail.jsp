<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<div id="helpdesk-detail-top">
	<div><h5 class="font-weight-bold">1:1����</h5></div>
	<div class="helpdesk-detail-div">
		<div class="d-flex align-items-center helpdesk-subject-div">
			<!-- 1 -->
			<div class="hepldesk-subject-title1 d-flex align-items-center">
				<span class="ml-2">����</span>
			</div>
			<!-- 2 -->
			<div class="hepldesk-subject-title2 d-flex align-items-center">
				<span>${helpdeskMember.helpdesk.inquiryTitle}</span>
			</div>
		</div>
		<div class="d-flex align-items-center helpdesk-subject-div">
			<!-- 1 -->
			<div class="hepldesk-subject-title1 d-flex align-items-center">
				<span class="ml-2">�ۼ���</span>
			</div>
			<!-- 2 -->
			<div class="hepldesk-subject-title2 d-flex align-items-center">
				<span>${helpdeskMember.member.name}(${helpdeskMember.member.loginId})</span>
			</div>
		</div>
		<div class="d-flex justify-content-end hepldesk-date-div">
			<div>
			<fmt:formatDate var="createdDate" value="${helpdeskMember.helpdesk.createdAt}" pattern="yyyy-MM-dd"/>
			�ۼ��� : ${createdDate}
			</div>
		</div>
		<div class="d-flex hepldesk-content-div p-3">
			<div class="hepldesk-content-text">
				${helpdeskMember.helpdesk.inquiryContent}
			</div>
		</div>
		<!-- ���� �亯 �ҷ����� -->
		<c:forEach items="${helpdeskMember.helpdeskReply}" var="reply">
			<div class="hepldesk-pre-reply mt-2">
				<div class="d-flex hepldesk-pre-reply-top">
					<div class="hepldesk-pre-reply-writer">
					${reply.member.name}
					</div>
					<fmt:formatDate var="createdAt" value="${reply.createdAt}" pattern="yyyy-MM-dd HH:mm:ss" />
					<div class="hepldesk-pre-reply-date">${createdAt}</div>
					<div><a href="javascript:void(0);"><i class="helpdesk-reply-del xi-close-square-o" onclick="deleteReply(${reply.id})" data-reply-id="${reply.id}"></i></a></div>
				</div>
				<div class="p-2">
				${reply.content}
				</div>
			</div>
		</c:forEach>
		<div class="d-flex justify-content-end textarea-div mt-3">
			<textarea cols="100" rows="6" class="replyContent">
			</textarea>
		</div>
		<div class="d-flex justify-content-end mt-1">
			<input type="button" value="�ۼ�" class="confirm-button" data-helpdesk-id="${helpdeskMember.helpdesk.id}">
		</div>
	</div>
</div>
<script>
	$(document).ready(function(){
		$(".confirm-button").on('click', function(){
			var helpdeskId = $(this).data("helpdesk-id");
			var content = $('.replyContent').val();
			
			$.ajax({
				type: "POST"
				, url: "/admin/helpdesk_reply"
				, data: {"helpdeskId" : helpdeskId, "content" : content}
				, success:function(data) {
					location.reload();
				}
				, error:function(request, status, error) {
					alert("���ο� �����Ͽ����ϴ�. �����ڿ��� �������ּ���")
				}
			});
			
		});
		
		deleteReply = function(id) {
			let result = confirm("�ش� �亯�� �����Ͻðڽ��ϱ�?")
			if(result) {
				
			} else {
				return;
			}
			$.ajax({
				type: "DELETE"
				, url: "/admin/del_helpdesk_reply"
				, data: {"replyId" : id}
				, success:function(data) {
					location.reload();
				}
				, error:function(request, status, error) {
					alert("���ο� �����Ͽ����ϴ�. �����ڿ��� �������ּ���")
				}
			});
		}

	});


</script>