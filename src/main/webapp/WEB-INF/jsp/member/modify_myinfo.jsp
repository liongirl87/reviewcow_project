<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   
<div class="d-flex justify-content-center">
	<div id="side-view-right-Tdiv" class="mt-3">
		<div class="main-title"><i class="xi-angle-left"></i>내정보</div>
		<div class="semi-title">기본정보</div>
		<div id="form-div">
			<div class="form-inputBox-pm line-top d-flex align-items-center">
				<span class="text-style">아이디</span>
				<input type="text" class="form-inputBox form-control" id="loginId" value="${member.loginId}" readonly/>
			</div>
		</div>
		<div class="form-inputBox-pm line-top d-flex align-items-center">
			<span class="text-style">이름</span>
			<input type="text" class="form-inputBox form-control" id="name" value="${member.name}"readonly/>
		</div>
		<div class="form-inputBox-pm line-top d-flex align-items-center">
			<span class="text-style">비밀번호</span>
			<input type="text" class="form-inputBox form-control" id="password" readonly/>
			<input type="button" id="change-passwordBtn" class="input-side-btn" value="변경">
		</div>
		<div class="form-inputBox-pm line-top d-flex align-items-center">
			<span class="text-style">휴대전화</span>
			<input type="text" class="form-inputBox-on form-control" id="mobilePhoneNumber" value="${member.mobilePhoneNumber}">
		</div>
		<div class="form-inputBox-pm line-top line-bottom d-flex align-items-center">
			<span class="text-style">이메일</span>
			<input type="text" class="form-inputBox-on form-control" id="email" value="${member.email}">
		</div>
		<div>
			<c:if test="${member.memberType eq 'influencerMember'}">
				<div class="semi-title">인플루언서 유형</div>
				<div id="form-div">
					<div class="form-inputBox-pm line-top d-flex align-items-center">
						<span class="text-style">인스타</span>
						<input type="text" class="form-inputBox-on form-control" id="instagramId" value="${Influencer.instagramId}">
					</div>
				</div>
				<div class="form-inputBox-pm line-top d-flex align-items-center">
					<span class="text-style">페이스북</span>
					<input type="text" class="form-inputBox-on form-control" id="facebookUrl" value="${Influencer.facebookUrl}">
				</div>
				<div class="form-inputBox-pm line-top d-flex align-items-center">
					<span class="text-style">유튜브</span>
					<input type="text" class="form-inputBox-on form-control" id="youtubeUrl" value="${Influencer.youtubeUrl}">
				</div>
				<div class="form-inputBox-pm line-top d-flex align-items-center">
					<span class="text-style">블로그</span>
					<input type="text" class="form-inputBox-on form-control" id="blogUrl" value="${Influencer.blogUrl}">
				</div>
				<div class="form-inputBox-pm line-top line-bottom d-flex align-items-center">
					<span class="text-style">트위터</span>
					<input type="text" class="form-inputBox-on form-control" id="twitterUrl" value="${Influencer.twitterUrl}">
				</div>
				<div class="form-inputBox-pm line-bottom d-flex align-items-center">
					<span class="text-style">그외</span>
					<input type="text" class="form-inputBox-on form-control" id="OtherUrl" value="${Influencer.otherUrl}">
				</div>
			</c:if>
			<c:if test="${member.memberType eq 'businessMember'}">
				<div class="semi-title">사업자 정보</div>
				<div id="form-div">
					<div class="form-inputBox-pm line-top d-flex align-items-center">
						<span class="text-style">상호명</span>
						<input type="text" class="form-inputBox-on form-control" id="businessName" value="${businessMember.businessName}">
					</div>
				</div>
				<div class="form-inputBox-pm line-top d-flex align-items-center">
					<span class="text-style">사업자 등록번호</span>
					<input type="text" class="form-inputBox-on form-control" id="businessLicenseNumber" value="${businessMember.businessLicenseNumber}">
				</div>
			</c:if>	
			<div class="d-flex justify-content-center">
				<input type="button" id="modify-myInfoBtn" value="회원정보수정">
				<input type="button" id="modify-myInfoBtn-cancel" value="취소">
			</div>
		</div>
	</div>
</div>
<script>
	$(document).ready(function(){
		$('#modify-myInfoBtn').on('click', function(){
			//alert("111");
			let loginId =$('#loginId').val();
			let password = $('#password').val();
			let email = $('#email').val().trim();
			let mobilePhoneNumber = $('#mobilePhoneNumber').val();
			
			
			/* memberType:influencerMember */
			let instagramId = $("#instagramId").val();
			let facebookUrl = $("#facebookUrl").val();
			let youtubeUrl = $("#youtubeUrl").val();
			let blogUrl = $("#blogUrl").val();
			let twitterUrl = $("#twitterUrl").val();
			let OtherUrl = $("#OtherUrl").val();
			
			/* memberType:businessMember */
 			let businessName = $("#businessName").val();
			
 			let businessLicenseNumber = $("#businessLicenseNumber").val();
			
			$.ajax({
				type: 'PUT'
				, url: '/member/modify_myinfo'
				, data: {
					"loginId":loginId
					,"password":password
					,"name":name
					,"email":email
					,"mobilePhoneNumber":mobilePhoneNumber
					,"instagramId":instagramId
					,"facebookUrl":facebookUrl
					,"youtubeUrl":youtubeUrl
					,"blogUrl":blogUrl
					,"twitterUrl":twitterUrl
					,"OtherUrl":OtherUrl
 					,"businessName":businessName 
 					,"businessLicenseNumber":businessLicenseNumber}
				,success:function(data){
					if(data.code == 1) {
						alert(data.result);
						location.reload();
					} else {
						alert(data.errorMessage);
						location.reload();
					}
				}
				,error:function(request, request, error) {
					alert("요청에 실패했습니다 관리자에게 문의주세요");
				}
			})
		});
	});

</script>