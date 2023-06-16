<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<div id="managePoint-view" class="d-flex justify-content-center">
	<div id="side-view-right-Tdiv" class="mt-3">
		<div class="main-title"><i class="xi-angle-left"></i>������ ����</div>
		<div class="mp-header-top-text-line mt-3"></div>
		<div class="mp-menu-div d-flex justify-content-center">
			<div class="mp-menu"><a href="#" onclick="location.href='/application/manage_applicants_view/status_applicants_view?aprovalCondition=0'">���δ��</a></div>
			<div class="mp-menu"><a href="#" onclick="location.href='/application/manage_applicants_view/status_applicants_view?aprovalCondition=1'">����</a></div>
			<div class="mp-menu"><a href="#" onclick="location.href='/application/manage_applicants_view/status_applicants_view?aprovalCondition=0'">���޿Ϸ�</a></div>
			<div class="mp-menu"><a href="#" onclick="location.href='/application/manage_applicants_view/status_applicants_view?aprovalCondition=2'">�����û</a></div>
			<div class="mp-menu"><a href="#" onclick="location.href='/application/manage_applicants_view/status_applicants_view?aprovalCondition=3'">���</a></div>
		</div>
		<div class="mp-header-text-line"></div>
		<div class="board-table-style">
			<div class="d-flex board-table-header-div bot-line">
				<div class="statusApplicants-header-childText2 text-center">��û��</div>
				<div class="statusApplicants-header-childText1 text-center">ü���</div>
				<div class="statusApplicants-header-childText3 text-center">������</div>
				<div class="statusApplicants-header-childText5 text-center"></div>
			</div>
			<c:forEach items="${applicantsList}" var="applicant">
				<div class="d-flex board-table-content-div bot-line">
					<fmt:formatDate var="appliyDate" value="${applicant.applicationCreatedAt}" pattern="yyyy-MM-dd" />
					<div class="statusApplicants-header-childText2 text-center">${appliyDate}</div>
					<div class="statusApplicants-header-childText1 text-center">${applicant.productName}</div>
					<div class="statusApplicants-header-childText3 text-center">${applicant.memberLoginId}(${applicant.memberName})</div>
					<div class="statusApplicants-header-childText5 text-right">
						<c:choose>
							<c:when test="${nowAprovalCondition == 0}">
								<input type="button" class="statusApplicants-btn-style statusApplicants-AjaxBtn" value="����" data-applicant-id="${applicant.memberId}" data-sellpost-id="${applicant.sellPostId}">
								<input type="button" class="statusApplicants-btn-style statusApplicants-AjaxBtn" value="����" data-applicant-id="${applicant.memberId}" data-sellpost-id="${applicant.sellPostId}">
							</c:when>
							<c:when test="${nowAprovalCondition == 1}">
								<c:if test="${applicant.review.reviewPoint == null}">
									<input type="button" class="statusApplicants-btn-style slide-btn" value="������ۼ�" data-application-id="${applicant.applicationId}">
								</c:if>
								<c:if test="${applicant.review.reviewPoint != null}">
									<input type="button" class="statusApplicants-btn-style slide-btn" value="���亸��" data-application-id="${applicant.applicationId}">
								</c:if>
								<%-- <input type="button" class="statusApplicants-btn-style slide-btn" value="���亸��" data-application-id="${applicant.applicationId}"> --%>
							</c:when>
						</c:choose>
					</div>
				</div>
				<c:if test="${nowAprovalCondition == 1}">
					<div class="board-table-content-div applicants-review-table bot-line" style="display:none" data-application-id="${applicant.applicationId}">
						<div class="d-flex">
						<div class="statusApplicants-header-childText2 text-center">${applicant.review.reviewPoint}</div>
						<div class="statusApplicants-header-childText1 text-center">ü���</div>
						<div class="statusApplicants-header-childText3 text-center">������</div>
						<div class="statusApplicants-header-childText5 text-center">
							<input type="button" class="statusApplicants-btn-style statusApplicants-AjaxBtn" value="����Ʈ����" data-applicant-id="${applicant.memberId}" data-sellpost-id="${applicant.sellPostId}">
							<input type="button" class="statusApplicants-btn-style statusApplicants-AjaxBtn" value="�����û" data-applicant-id="${applicant.memberId}" data-sellpost-id="${applicant.sellPostId}">
						</div>
						</div>
					</div>
				</c:if>
			</c:forEach>
				
				
			<!-- ����¡ ��ư TEST -->
			<div class="list_number">
	    		<div>
		        	<div class="list_n_menu">
		        		<a href="/application/manage_applicants_view/status_applicants_view?aprovalCondition=${nowAprovalCondition}&postPage=${postPaging.nowPageNum - 1}" class="${postPaging.nowPageNum == 1 ? "disabled":"" }"><  ����</a>
			        	<c:forEach begin="${postPaging.startPage}" end="${postPaging.endPage}" var="num">
			        	<a href="/application/manage_applicants_view/status_applicants_view?aprovalCondition=${nowAprovalCondition}&postPage=${num}" class="${postPaging.nowPageNum == num ? "current":"" }">${num}</a>
			        	</c:forEach>
			        	<a href="/application/manage_applicants_view/status_applicants_view?aprovalCondition=${nowAprovalCondition}&postPage=${postPaging.nowPageNum + 1}" class="${postPaging.nowPageNum == postPaging.totalPages ? "disabled":"" }">����  >
			        	</a>
		        	</div>
	    		</div>
			</div>
		<!--  ����¡ ��ư TEST �� -->
	</div>	
</div>
<script>
	$(document).ready(function(){
		$(".slide-btn").click('on', function(e){
			e.preventDefault();
			var postid = $(this).data("application-id");
			
			if($('.applicants-review-table[data-application-id='+postid+']').is(":visible")) {
				$('.applicants-review-table[data-application-id='+postid+']').slideUp();
			} else {
				$('.applicants-review-table[data-application-id='+postid+']').slideDown();
			}
		});
		
		/* 	'.applicants-review-table[data-application-id={postId}]' */
		
		$('.statusApplicants-AjaxBtn').on('click',function(){
			let memberId = $(this).data("applicant-id");
			let sellPostId = $(this).data("sellpost-id");
			
			if ($(this).val() == '����') {
				var status = 1;
			} else if ($(this).val() == '����') {
				var status = 3;
			} else if ($(this).val() == '����Ʈ����') {
				var status = 4;
			} else if ($(this).val() == '�����û') {
				var status = 2;
			}
			
			$.ajax({
				type: "PUT"
				, url: "/application/approval_applicant"
				, data: {"memberId" : memberId, "sellPostId": sellPostId, "status" : status}
				, success:function(data) {
					if(data.code == 1) {
						location.reload();
					} else {
						alert("���ο� �����Ͽ����ϴ�.");
					}
				}
				, error:function(request,status,error){
					alert("���ο� �����Ͽ����ϴ�, �����ڿ��� �������ּ���.")
				}
				
			});
		});
	});

</script>
