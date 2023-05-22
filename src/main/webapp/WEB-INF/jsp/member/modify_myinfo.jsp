<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   
<div class="d-flex justify-content-center">
	<div id="side-view-right-Tdiv" class="mt-3">
		<div class="main-title"><i class="xi-angle-left"></i>������</div>
		<div class="semi-title">�⺻����</div>
		<div id="form-div">
			<div class="form-inputBox-pm line-top d-flex align-items-center">
				<span class="text-style">���̵�</span>
				<input type="text" class="form-inputBox form-control" id="loginId" value="${member.loginId}" readonly/>
			</div>
		</div>
		<div class="form-inputBox-pm line-top d-flex align-items-center">
			<span class="text-style">�̸�</span>
			<input type="text" class="form-inputBox form-control" id="name" value="${member.name}"readonly/>
		</div>
		<div class="form-inputBox-pm line-top d-flex align-items-center">
			<span class="text-style">��й�ȣ</span>
			<input type="text" class="form-inputBox form-control" id="password" readonly/>
			<input type="button" id="change-passwordBtn" class="input-side-btn" value="����">
		</div>
		<div class="form-inputBox-pm line-top d-flex align-items-center">
			<span class="text-style">�޴���ȭ</span>
			<input type="text" class="form-inputBox-on form-control" id="mobilePhoneNumber" value="${member.mobilePhoneNumber}">
		</div>
		<div class="form-inputBox-pm line-top line-bottom d-flex align-items-center">
			<span class="text-style">�̸���</span>
			<input type="text" class="form-inputBox-on form-control" id="email" value="${member.email}">
		</div>
		<div>
			<c:if test="${member.memberType eq 'influencerMember'}">
				<div class="semi-title">���÷�� ����</div>
				<div id="form-div">
					<div class="form-inputBox-pm line-top d-flex align-items-center">
						<span class="text-style">�ν�Ÿ</span>
						<input type="text" class="form-inputBox-on form-control" id="instagramId" value="${Influencer.instagramId}">
					</div>
				</div>
				<div class="form-inputBox-pm line-top d-flex align-items-center">
					<span class="text-style">���̽���</span>
					<input type="text" class="form-inputBox-on form-control" id="facebookUrl" value="${Influencer.facebookUrl}">
				</div>
				<div class="form-inputBox-pm line-top d-flex align-items-center">
					<span class="text-style">��Ʃ��</span>
					<input type="text" class="form-inputBox-on form-control" id="youtubeUrl" value="${Influencer.youtubeUrl}">
				</div>
				<div class="form-inputBox-pm line-top d-flex align-items-center">
					<span class="text-style">��α�</span>
					<input type="text" class="form-inputBox-on form-control" id="blogUrl" value="${Influencer.blogUrl}">
				</div>
				<div class="form-inputBox-pm line-top line-bottom d-flex align-items-center">
					<span class="text-style">Ʈ����</span>
					<input type="text" class="form-inputBox-on form-control" id="twitterUrl" value="${Influencer.twitterUrl}">
				</div>
				<div class="form-inputBox-pm line-bottom d-flex align-items-center">
					<span class="text-style">�׿�</span>
					<input type="text" class="form-inputBox-on form-control" id="OtherUrl" value="${Influencer.otherUrl}">
				</div>
			</c:if>
			<c:if test="${member.memberType eq 'businessMember'}">
				<div class="semi-title">����� ����</div>
				<div id="form-div">
					<div class="form-inputBox-pm line-top d-flex align-items-center">
						<span class="text-style">��ȣ��</span>
						<input type="text" class="form-inputBox-on form-control" id="businessName" value="${businessMember.businessName}">
					</div>
				</div>
				<div class="form-inputBox-pm line-top d-flex align-items-center">
					<span class="text-style">����� ��Ϲ�ȣ</span>
					<input type="text" class="form-inputBox-on form-control" id="businessLicenseNumber" value="${businessMember.businessLicenseNumber}">
				</div>
			</c:if>	
			<div class="d-flex justify-content-center">
				<input type="button" id="modify-myInfoBtn" value="ȸ����������">
				<input type="button" id="modify-myInfoBtn-cancel" value="���">
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
					alert("��û�� �����߽��ϴ� �����ڿ��� �����ּ���");
				}
			})
		});
	});

</script>