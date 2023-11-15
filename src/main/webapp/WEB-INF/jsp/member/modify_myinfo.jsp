<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   
<div class="d-flex justify-content-center">
	<div id="side-view-right-Tdiv" class="mt-3">
		<div class="main-title"><a href="javascript:history.back()"><i class="xi-angle-left"></i></a>������</div>
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
			<input type="button" id="change-passwordBtn" class="input-side-btn" value="�����ϱ�">
		</div>
		<div class="pw-change" style="display:none">
			<div class="form-inputBox-pm line-top d-flex align-items-center ml-2">
				<span class="text-style">> ���� ��й�ȣ</span>
				<input type="password" class="form-inputBox-on form-control nowPassword">
				<input type="button" id="check-passwordBtn" class="input-side-btn" value="Ȯ��">
			</div>
			<div>
				<span class="pw-matches-text hiden hidden-pw-text1 text-primary" style="display:none">��й�ȣ�� ��ġ�մϴ�.</span>
				<span class="pw-notmatches-text hidden-pw-text text-danger" style="display:none">��й�ȣ�� ��ġ���� �ʽ��ϴ�.</span>
			</div>
			<div class="pw-change-div" style="display:none">
				<div class="form-inputBox-pm line-top d-flex align-items-center ml-2">
					<span class="text-style">> ������ ��й�ȣ</span>
					<input type="password" class="form-inputBox-on form-control" id="password-changed">
				</div>
			</div>
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
			<!-- 	<input type="button" id="modify-myInfoBtn-cancel" value="���"> -->
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
					alert("��û�� �����Ͽ����ϴ�, �����ڿ��� �������ּ���");
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
			
			let result = confirm("������ �����Ͻðڽ��ϱ�?");
	
			if(result) {
			}else {
				return;
			}
	
			if($('.pw-matches-text').is(':visible')) {
				// ��й�ȣ�� �����Ϸ��� ������
				if (password.length < 5) {
					alert("������ ��й�ȣ�� 5�� �̻��Է����ּ���");
					return;
				}
				
			} else {}
			
			// �ڵ�����ȣ 010���� ��ȿ�� �˻�
			if (!mobilePhoneNumber.startsWith('010')){
				alert("�ڵ��� ��ȣ�� 010���� �����ؾ��մϴ�.");
				return;
			}
			
			// �̸��� ��ȿ�� �˻�
			if (!email.endsWith('.com')) {
				alert("�������� email�ּҰ� �ƴմϴ�.");
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
					alert("��û�� �����߽��ϴ� �����ڿ��� �����ּ���");
				}
			})
		});
	});

</script>