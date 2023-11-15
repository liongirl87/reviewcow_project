<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<div id="managePoint-view" class="d-flex justify-content-center">
	<div id="side-view-right-Tdiv" class="mt-3">
		<div class="main-title"><a href="javascript:history.back();"><i class="xi-angle-left"></i></a>지원자 관리${nowapprovalCondition}</div>
		<div class="mp-header-top-text-line mt-3"></div>
		<div class="mp-menu-div d-flex justify-content-center">
			<div class="mp-menu ${nowapprovalCondition == 0 ? "mp-menu-select":"" }"><a href="#" onclick="location.href='/application/manage_applicants_view/status_applicants_view?approvalCondition=0'">승인대기</a></div>
			<div class="mp-menu ${nowapprovalCondition == 1 ? "mp-menu-select":"" }"><a href="#" onclick="location.href='/application/manage_applicants_view/status_applicants_view?approvalCondition=1'">승인</a></div>
			<div class="mp-menu ${nowapprovalCondition == 4 ? "mp-menu-select":"" }"><a href="#" onclick="location.href='/application/manage_applicants_view/status_applicants_view?approvalCondition=4'">지급완료</a></div>
			<div class="mp-menu ${nowapprovalCondition == 2 ? "mp-menu-select":"" }"><a href="#" onclick="location.href='/application/manage_applicants_view/status_applicants_view?approvalCondition=2'">검토요청</a></div>
			<div class="mp-menu ${nowapprovalCondition == 3 ? "mp-menu-select":"" }"><a href="#" onclick="location.href='/application/manage_applicants_view/status_applicants_view?approvalCondition=3'">취소</a></div>
		</div>
		<div class="mp-header-text-line"></div>
		<div class="board-table-style">
			<c:choose>
			<c:when test="${nowapprovalCondition == 4}">
				<div class="d-flex board-table-header-div bot-line">
					<div class="statusApplicants-header-childText2-ap4 text-center">신청일</div>
					<div class="statusApplicants-header-childText1-ap4 text-center">체험단</div>
					<div class="statusApplicants-header-childText3-ap4 text-center">지원자</div>
					<div class="statusApplicants-header-childText5-ap4 text-center">지급일</div>
				</div>
			</c:when>
			<c:otherwise>
				<div class="d-flex board-table-header-div bot-line">
					<div class="statusApplicants-header-childText2 text-center">신청일</div>
					<div class="statusApplicants-header-childText1 text-center">체험단</div>
					<div class="statusApplicants-header-childText3 text-center">지원자</div>
					<div class="statusApplicants-header-childText5 text-center"></div>
				</div>
			</c:otherwise>
			</c:choose>
			<c:forEach items="${applicantsList}" var="applicant">
				<div class="d-flex board-table-content-div bot-line">
					<fmt:formatDate var="appliyDate" value="${applicant.applicationCreatedAt}" pattern="yyyy-MM-dd" />
					<div class="statusApplicants-header-childText2 text-center">${appliyDate}</div>
					<div class="statusApplicants-header-childText1 text-center">${applicant.productName}</div>
					<div class="statusApplicants-header-childText3 text-center">${applicant.memberLoginId}(${applicant.memberName})</div>
					<c:choose>
						<c:when test="${nowapprovalCondition == 4}">
							<fmt:formatDate var="applicationUpdatedAt" value="${applicant.applicationUpdatedAt}" pattern="yyyy-MM-dd" />
							<div class="statusApplicants-header-childText5 text-center">${applicationUpdatedAt}</div>
							<c:if test="${applicant.review.reviewPoint == null}">
								<span class="mr-3">리뷰미작성</span>
							</c:if>
							<c:if test="${applicant.review.reviewPoint != null}">
								<input type="button" class="statusApplicants-btn-style slide-btn" value="리뷰보기" data-application-id="${applicant.applicationId}">
								<i class="xi-angle-right-min" data-application-id="${applicant.applicationId}"></i>
							</c:if>
						</c:when>
						<c:otherwise>
							<div class="statusApplicants-header-childText5 text-right">
								<c:choose>
									<c:when test="${nowapprovalCondition == 0}">
										<input type="button" class="statusApplicants-btn-style statusApplicants-AjaxBtn" value="승인" data-applicant-id="${applicant.memberId}" data-sellpost-id="${applicant.sellPostId}" data-point="${applicant.discountRate}">
										<input type="button" class="statusApplicants-btn-style statusApplicants-AjaxBtn" value="거절" data-applicant-id="${applicant.memberId}" data-sellpost-id="${applicant.sellPostId}" data-point="${applicant.discountRate}">
									</c:when>
									<c:when test="${nowapprovalCondition == 1}">
										<c:if test="${applicant.review.reviewPoint == null}">
											<span class="mr-3">리뷰미작성</span>
										</c:if>
										<c:if test="${applicant.review.reviewPoint != null}">
											<input type="button" class="statusApplicants-btn-style slide-btn" value="리뷰보기" data-application-id="${applicant.applicationId}">
											<i class="xi-angle-right-min" data-application-id="${applicant.applicationId}"></i>
										</c:if>
									</c:when>
								</c:choose>
							</div>
						</c:otherwise>
					</c:choose>
					
				</div>
				<c:if test="${nowapprovalCondition == 1 or nowapprovalCondition == 4}">
					<div class="board-table-content-div applicants-review-table bot-line" style="display:none" data-application-id="${applicant.applicationId}">
						<div class="d-flex">
							<div class="member-profile-img">
							</div>
							<div class="ml-2">
								<div class="star-div">
									<c:forEach begin='1' end="${applicant.review.reviewPoint}"> 
									<i class="star fa-solid fa-star active"></i>
									</c:forEach>
									<c:forEach begin='1' end="${5 - applicant.review.reviewPoint}"> 
									<i class="star fa-solid fa-star"></i>
									</c:forEach>
								</div>
								<div>
								<fmt:formatDate var="reviewCreatedAt" value="${applicant.review.createdAt}" pattern="yyyy.MM.dd" />
								<span class="reviewCreatedAt-text">${reviewCreatedAt}</span>
								</div>
							</div>
							<div class="text-center font-weight-bold ml-2"><h6>${applicant.review.reviewPoint}</h6></div>
							<c:if test="${nowapprovalCondition == 1}">
							<div class="review-point-btn-div text-center">
								<input type="button" class="statusApplicants-btn-style statusApplicants-AjaxBtn" value="포인트지급" data-applicant-id="${applicant.memberId}" data-sellpost-id="${applicant.sellPostId}" data-point="${applicant.discountRate}">
								<input type="button" class="statusApplicants-btn-style statusApplicants-AjaxBtn" value="검토요청" data-applicant-id="${applicant.memberId}" data-sellpost-id="${applicant.sellPostId}" data-point="${applicant.discountRate}">
							</div>
							</c:if>
						</div>
						<div class="review-grey-div">
							<div class="d-flex">
								<div>
									${applicant.review.comment}
								</div>
							</div>
							<div class="review-image-div mt-3">
								<img src="${applicant.review.reviewImgPath}" alt="후기사진" class="review-image">	
							</div>
						</div>	
					</div>
				</c:if>
			</c:forEach>
				
				
			<!-- 페이징 버튼 TEST -->
			<div class="list_number">
	    		<div>
		        	<div class="list_n_menu">
		        		<a href="/application/manage_applicants_view/status_applicants_view?approvalCondition=${nowapprovalCondition}&postPage=${postPaging.nowPageNum - 1}" class="${postPaging.nowPageNum == 1 ? "disabled":"" }"><  이전</a>
			        	<c:forEach begin="${postPaging.startPage}" end="${postPaging.endPage}" var="num">
			        	<a href="/application/manage_applicants_view/status_applicants_view?approvalCondition=${nowapprovalCondition}&postPage=${num}" class="${postPaging.nowPageNum == num ? "current":"" }">${num}</a>
			        	</c:forEach>
			        	<a href="/application/manage_applicants_view/status_applicants_view?approvalCondition=${nowapprovalCondition}&postPage=${postPaging.nowPageNum + 1}" class="${postPaging.nowPageNum == postPaging.totalPages ? "disabled":"" }">다음  >
			        	</a>
		        	</div>
	    		</div>
			</div>
		<!--  페이징 버튼 TEST 끝 -->
	</div>	
</div>
<script>
	$(document).ready(function(){
		$(".slide-btn").click('on', function(e){
			e.preventDefault();
			var postid = $(this).data("application-id");
			if($('.xi-angle-right-min[data-application-id='+postid+']').hasClass('rotation')){
			$('.xi-angle-right-min[data-application-id='+postid+']').removeClass('rotation');
			} else {
			$('.xi-angle-right-min[data-application-id='+postid+']').addClass('rotation');
			}
			
			if($('.applicants-review-table[data-application-id='+postid+']').is(":visible")) {
				$('.applicants-review-table[data-application-id='+postid+']').slideUp();
				$(this).val('리뷰보기');
			} else {
				$('.applicants-review-table[data-application-id='+postid+']').slideDown();
				$(this).val('리뷰닫기');
			}
		});
		
		/* 	'.applicants-review-table[data-application-id={postId}]' */
		
		$('.statusApplicants-AjaxBtn').on('click',function(){
			let memberId = $(this).data("applicant-id");
			let sellPostId = $(this).data("sellpost-id");
			let point = $(this).data("point");
			
			if ($(this).val() == '승인') {
				var status = 1;
			} else if ($(this).val() == '거절') {
				var status = 3;
			} else if ($(this).val() == '포인트지급') {
				var status = 4;
			} else if ($(this).val() == '검토요청') {
				var status = 2;
			}
			
			$.ajax({
				type: "PUT"
				, url: "/application/approval_applicant"
				, data: {"memberId" : memberId, "sellPostId": sellPostId, "status" : status, "point" : point}
				, success:function(data) {
					if(data.code >= 200 && data.code < 400) {
						alert(data.resultMessage);
						location.reload();
					} else if (data.code >= 400) {
						alert(data.resultMessage);
						location.reload();
					} 
					else {
						alert("승인에 실패하였습니다.");
					}
				}
				, error:function(request,status,error){
					alert("승인에 실패하였습니다, 관리자에게 문의해주세요.")
				}
				
			});
		});
	});

</script>
