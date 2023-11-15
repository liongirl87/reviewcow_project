<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   
<div class="d-flex justify-content-center">
	<div id="side-view-right-Tdiv" class="mt-3">
		<div class="main-title"><a href="javascript:history.back()"><i class="xi-angle-left"></i></a>내정보</div>
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
			<input type="button" id="change-passwordBtn" class="input-side-btn" value="변경하기">
		</div>
		<div class="pw-change" style="display:none">
			<div class="form-inputBox-pm line-top d-flex align-items-center ml-2">
				<span class="text-style">> 현재 비밀번호</span>
				<input type="password" class="form-inputBox-on form-control nowPassword">
				<input type="button" id="check-passwordBtn" class="input-side-btn" value="확인">
			</div>
			<div>
				<span class="pw-matches-text hiden hidden-pw-text1 text-primary" style="display:none">비밀번호가 일치합니다.</span>
				<span class="pw-notmatches-text hidden-pw-text text-danger" style="display:none">비밀번호가 일치하지 않습니다.</span>
			</div>
			<div class="pw-change-div" style="display:none">
				<div class="form-inputBox-pm line-top d-flex align-items-center ml-2">
					<span class="text-style">> 변경할 비밀번호</span>
					<input type="password" class="form-inputBox-on form-control" id="password-changed">
				</div>
			</div>
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
			<!-- 	<input type="button" id="modify-myInfoBtn-cancel" value="취소"> -->
			</div>
		</div>
	</div>
</div>
<script>
	$(document).ready(function(){
		
		$('#check-passwordBtn').on('click', function(){
			let password = $('.nowPassword').val();
			
			$.ajax({
				type: 'POST'
				, url: '/member/check_pw'
				, data: {"password" : password}
				, success:function(data) {
					if(data.code == "success" ) {
						$('.pw-matches-text').css("display", "block");
						if($('.pw-notmatches-text').is(":visible")) {
							$('.pw-notmatches-text').css("display", "none");
						}
					} else if(data.code == "fail") {
						$('.pw-notmatches-text').css("display", "block");
						if($('.pw-matches-text').is(":visible")) {
							$('.pw-matches-text').css("display", "none");
						}
					}
				}
				, error:function(request, status, error) {
					alert("요청에 실패하였습니다, 관리자에게 문의해주세요");
				}
			});
		});
		
		
		$('#change-passwordBtn').on('click', function(){
			if($('.pw-change').is(":visible")){
				$('.pw-change').slideUp();
			} else { 
				$('.pw-change').slideDown();
			}
			
		});
		
		$('#modify-myInfoBtn').on('click', function(){
			let loginId =$('#loginId').val();
			let email = $('#email').val().trim();
			let mobilePhoneNumber = $('#mobilePhoneNumber').val();
			let password = $('#password-changed').val()
			
			let result = confirm("정보를 수정하시겠습니까?");
	
			if(result) {
			}else {
				return;
			}
	
			if($('.pw-matches-text').is(':visible')) {
				// 비밀번호를 변경하려고 했을때
				if (password.length < 5) {
					alert("변경할 비밀번호를 5자 이상입력해주세요");
					return;
				}
				
			} else {}
			
			// 핸드폰번호 010시작 유효성 검사
			if (!mobilePhoneNumber.startsWith('010')){
				alert("핸드폰 번호는 010으로 시작해야합니다.");
				return;
			}
			
			// 이메일 유효성 검사
			if (!email.endsWith('.com')) {
				alert("정상적인 email주소가 아닙니다.");
				return;
			}
			
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
				,error:function(request, status, error) {
					alert("요청에 실패했습니다 관리자에게 문의주세요");
				}
			})
		});
	});

</script>