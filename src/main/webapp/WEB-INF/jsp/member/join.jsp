<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<div class="join-top-div d-flex justify-content-center">
	<div id="join">
		<div class='join-title'><i class="xi-angle-left"></i>ȸ������</div>
		<div class="join-form">
			<div class="join-form-lineTop d-flex"><span class="join-form-line-text">ȸ������</span><span class="essential-item">*</span>
				<div class="member-type-div">
					<label><input type="radio" name="member-type" value="member" class="radio-btn" checked="checked" onclick="member()">����ȸ��</label>
					<label><input type="radio" name="member-type" value="influencerMember" class="radio-btn" onclick="influencerMember()">���÷��</label>
					<label><input type="radio" name="member-type" value="businessMember" class="radio-btn" onclick="businessMember()">�����</label>
				</div>
			</div>
			<div class="semi-title">�⺻����</div>
			<div class="join-form-lineTopIncludeText line-top">
				<div class=" d-flex align-items-center">
					<span class="join-form-line-text">���̵�</span><span class="essential-item">*</span>
					<input type="text" class="form-control input-box" id="loginId" onkeyup="this.value=this.value.replace(/[^a-zA-Z-_0-9]/g,'');">
					<input type="button" id="checkDuplicatedId-btn" class="duplicateId-btn" value="�ߺ�Ȯ��"">
				</div>
				<span class="hiddenText d-none idLengthWarning">���̵� 5�� �̻� �Է����ּ���.</span>
				<span class="hiddenText d-none" id="idCheckDuplicated">�̹� ������� ID�Դϴ�.</span>
				<span class="hiddenText-success d-none" id="idCheckOk">��� ������ ID �Դϴ�.</span>
			</div>
			<div>
			</div>
			<div class="join-form-line line-bottom line-top d-flex align-items-center">
				<span class="join-form-line-text">��й�ȣ</span><span class="essential-item">*</span>
				<input type="password" class="form-control input-box" id="password">
			</div>
			<div class="join-form-lineIncludeText">
				<div class="d-flex align-items-center">
					<span class="join-form-line-text">��й�ȣ Ȯ��</span><span class="essential-item">*</span>
					<input type="password" class="form-control input-box" id="passwordCheck">
				</div>
				<span class="d-none hiddenText passwordNotMatch">��й�ȣ�� ��ġ���� �ʽ��ϴ�.</span>
			</div>
			<div class="join-form-line line-top d-flex align-items-center">
				<span class="join-form-line-text">�̸�</span><span class="essential-item">*</span>
				<input type="text" id="name" class="form-control input-box">
			</div>
			<div class="join-form-line-none1 d-flex align-items-center">
				<input type="text" id="postcode" class="form-control input-box-address1" placeholder="�����ȣ" readonly/>
				<input type="button" class="address-btn" id="addressSearchBtn" value="�ּҰ˻�" onclick="execDaumPostcode()">
			</div>
			<div class="join-form-line-none2 d-flex align-items-center">
				<span class="join-form-line-text">�ּ�</span><span class="essential-item">*</span>
				<input type="text" id="address" name="addressName" class="form-control input-box-address2" placeholder="�⺻�ּ�" readonly/>
			</div>
			<div class="join-form-line-none3 d-flex align-items-center">
				<input type="text" id="detailAddress" name="addressName" class="form-control input-box-address3" placeholder="���ּ�">
				<input type="text" id="extraAddress" name="addressName" class="form-control input-box-address3-1" readonly/>
			</div>
			<div class="join-form-lineTop d-flex align-items-center">
				<span class="join-form-line-text">�޴���ȭ</span><span class="essential-item">*</span>
				<input type="text" class="form-control input-box" id="mobilePhoneNumber">
			</div>
			<div class="join-form-line d-flex align-items-center">
				<span class="join-form-line-text">�Ϲ���ȭ</span>
				<input type="text" class="form-control input-box" id="telePhoneNumber">
			</div>
			<div class="join-form-line d-flex align-items-center">
				<span class="join-form-line-text">�̸���</span><span class="essential-item">*</span>
				<input type="text" class="form-control input-box" id="email">
			</div>
			<div class="influencer d-none" onclick="influencerMember()">
				<div class="join-form-line d-flex align-items-center influencer-box-padding">
					<span class="join-form-line-text">���÷�� ����</span><span class="essential-item">*</span>
					<div class="influencer-select-icon">
						<i class="xi-instagram xi-2x" onclick="instagram()"></i>
						<i class="xi-facebook-official xi-2x ml-1" onclick="facebook()"></i>
						<i class="xi-youtube xi-2x ml-1" onclick="youtube()"></i>
						<i class="xi-blogger xi-2x ml-1" onclick="blog()"></i>
						<i class="xi-twitter xi-2x ml-1" onclick="twitter()"></i>
						<i class="xi-plus-circle-o xi-2x ml-1" onclick="other()"></i>
					</div>
				</div>
				<div class="insta-url join-form-line d-flex align-items-center d-none">
					<span class="join-form-line-text">�ν�Ÿ</span><span class="essential-item">*</span>
					<input type="text" id="instagramId" class="form-control input-box" placeholder="�ν�Ÿ ID�� �Է��� �ּ���">
				</div>	
				<div class="facebook-url join-form-line d-flex align-items-center d-none" >
					<span class="join-form-line-text">���̽���</span><span class="essential-item">*</span>
					<input type="text" id="facebookUrl" class="form-control input-box" placeholder="���̽��� ID�� �Է��� �ּ���">
				</div>	
				<div class="youtube-url join-form-line d-flex align-items-center d-none">
					<span class="join-form-line-text">��Ʃ��</span><span class="essential-item">*</span>
					<input type="text" id="youtubeUrl" class="form-control input-box" placeholder="��Ʃ�� ULR�� �Է��� �ּ���">
				</div>	
				<div class="blog-url join-form-line d-flex align-items-center d-none">
					<span class="join-form-line-text">��α�</span><span class="essential-item">*</span>
					<input type="text" id="blogUrl" class="form-control input-box" placeholder="��α� ULR�� �Է��� �ּ���">
				</div>	
				<div class="twitter-url join-form-line d-flex align-items-center d-none">
					<span class="join-form-line-text">Ʈ����</span><span class="essential-item">*</span>
					<input type="text" id="twitterUrl" class="form-control input-box" placeholder="Ʈ���� ULR�� �Է��� �ּ���">
				</div>	
				<div class="other-url join-form-line d-flex align-items-center d-none">
					<span class="join-form-line-text">�׿�</span><span class="essential-item">*</span>
					<input type="text" id="OtherUrl" class="form-control input-box" placeholder="�׿� ULR�� �Է��� �ּ���">
				</div>	
			</div>
			<div class="business-member d-none">
				<div class="join-form-line d-flex align-items-center">
					<span class="join-form-line-text">��ȣ��</span><span class="essential-item">*</span>
					<input type="text" class="form-control input-box" id="businessName">
				</div>
				<div class="join-form-line d-flex align-items-center">
					<span class="join-form-line-text">����� ��Ϲ�ȣ</span><span class="essential-item">*</span>
					<input type="text" class="form-control input-box" id="businessLicenseNumber">
				</div>
			</div>
			<div class="semi-title">��ü����</div>
			<div class="d-flex align-items-center agreement-text">
				<input type="checkbox" id="agree-all-btn" class="mr-1" onclick="agreeAll()">
				<span>�̿��� �� ������������ �� �̿�, �������� ����(����)�� ��� �����մϴ�.</span>
			</div>
			<div class="semi-title">
				<span>[�ʼ�]�̿�������</span>
			</div>
			<div class="agreement-text-box">
			���������� ���ڡ� �̸�Ʈ�� 1�б� ������� 1�� Ÿ��Ʋ�� ���ο� �����. �̸�Ʈ ���� ���� ������� ���ο� ��ó�� ���� �̹��� ó���̴�. �ڷγ� Ư���� ���� ������ ������ ȿ���� ��������ݸ��� ���� �Һ�ɸ� ������ ������ ���ƴ�.
			�̸�Ʈ�� ���� 1�б� ���� ���� ��������� �۳� ���� ��� 1.9% ���� 7��1354����� ����ߴٰ� 11�� �����ߴ�. ���� �Ⱓ ���������� 137������� 60.4% �����ߴ�. ���������� 99.7% �پ�� 27������� ���ڸ� ������ ���ߴ�.
			������� 1�б� ���� 7��3990���(�б� ȯ�� 1275.6�� ����)�� ����� ���κ��� 2600��� �̻� ���� ��ġ��. �� �� ������ 1�� ���� ������ 1�б� 8382������� 4�б� 2338������� �پ�� �� �ִ�. ������ ����׿��� �̸�Ʈ�� �ռ� ���� �̹��� ó���̴�. �̸�Ʈ�� �������͵� 1362����� ����� ���ο� ũ�� �зȴ�.
			���� ������ �߸��� ��Ҵ�. ����κ��� ���캸�� 1�б� ������ ������� 3��169������� 2.5% �����ߴ�. ���������� 477������� 37.0% �����ߴ�. Ʈ���̴����� ����� 8184���, �������� 84������� ���� 2.7%, 44.4% ���� �����ߴ�. ��귣�� ���⡤�������� ȣ���� ������ �������͸� 79��� �����ߴ�.
			�̸�Ʈ �����ڴ� ���������� ���� ������ �ڷγ� �ñ� ���忡 ���� ������ȿ���� ��Ȳ���� ���� ��ٱ��� �δ� ��¡��̶�� ������ 1�б� ������ ���� ���� ��� 3�� �����߰� ��������Ų�ؽ��� ������ ���簡 ���� ����Ǹ鼭 ���� ������ ����١��� �����ߴ�.
			���� ��ȸ�縦 ���캸�� �¶��� ��ȸ��� ���ͼ� ������ �����ߴ�. SSG������ ����� 4213������� 0.9% ���������� ���� �Ը� 100��� �̻� ���̸� �����ս� 156����� ����ߴ�. G���� ���� ������� 3031������� 4.2% �پ����� �����ս� 109������� ���ͼ� ������ �����ߴ�. �����̾������ͼ� �߽��� ��ǰ ���� ��ȭ, ������������ ȿ��ȭ�� ���� ���� ������ �̷�´ٴ� �����̴�.
			������ ���� ���� ��ȯ�� ������ ����ȣ�ھظ���Ʈ�� ������ �������� ȣ������ �̾��. ������� 31.6% �þ 1194����� ��������� �������͵� 40������� �б� ���� ��ȯ�ߴ�. �ݸ鿡 �̸�Ʈ24�� 1�б� �����ս� 39������� ���� ���� Ȯ��ƴ�. ���� ���� 170���� ������ �� 6512�����̴�. ��Ÿ������ ������� 13.4% ����� 6829����� ��������� ȯ�� ��¿� ���� ���� �δ����� ���������� 29.3% ������ 205����� ����ߴ�. ��Ÿ�ʵ带 ��ϴ� �ż���������Ƽ�� �������� 29����� ����ϸ� ���� ��ȯ�ߴ�.
			�̸�Ʈ �����ڴ� �����ͼ� �߽��� ��ǰ ��ȭ, �������� ������ �� �̷��� ���� ü�� ������ �̾���� �ִ١��鼭 ������ ������ �㺸�� ���� ������ ���� ����� �͡��̶�� ���ߴ�.
			</div>
			<div class="agreement-text-box-small agreement-text d-flex justify-content-end align-items-center">
				<span>�̿����� ���� �Ͻʴϱ�?</span>
				<input type="checkbox" id="agree-check1" name="agreeChk" class="ml-1 mr-2" value="�̿���">
			</div>
			<div class="semi-title">
				<span>[�ʼ�]�������� ���� �� �̿� ����</span>
			</div>
			<div class="agreement-text-box">
			���������� ���ڡ� �̸�Ʈ�� 1�б� ������� 1�� Ÿ��Ʋ�� ���ο� �����. �̸�Ʈ ���� ���� ������� ���ο� ��ó�� ���� �̹��� ó���̴�. �ڷγ� Ư���� ���� ������ ������ ȿ���� ��������ݸ��� ���� �Һ�ɸ� ������ ������ ���ƴ�.
			�̸�Ʈ�� ���� 1�б� ���� ���� ��������� �۳� ���� ��� 1.9% ���� 7��1354����� ����ߴٰ� 11�� �����ߴ�. ���� �Ⱓ ���������� 137������� 60.4% �����ߴ�. ���������� 99.7% �پ�� 27������� ���ڸ� ������ ���ߴ�.
			������� 1�б� ���� 7��3990���(�б� ȯ�� 1275.6�� ����)�� ����� ���κ��� 2600��� �̻� ���� ��ġ��. �� �� ������ 1�� ���� ������ 1�б� 8382������� 4�б� 2338������� �پ�� �� �ִ�. ������ ����׿��� �̸�Ʈ�� �ռ� ���� �̹��� ó���̴�. �̸�Ʈ�� �������͵� 1362����� ����� ���ο� ũ�� �зȴ�.
			���� ������ �߸��� ��Ҵ�. ����κ��� ���캸�� 1�б� ������ ������� 3��169������� 2.5% �����ߴ�. ���������� 477������� 37.0% �����ߴ�. Ʈ���̴����� ����� 8184���, �������� 84������� ���� 2.7%, 44.4% ���� �����ߴ�. ��귣�� ���⡤�������� ȣ���� ������ �������͸� 79��� �����ߴ�.
			�̸�Ʈ �����ڴ� ���������� ���� ������ �ڷγ� �ñ� ���忡 ���� ������ȿ���� ��Ȳ���� ���� ��ٱ��� �δ� ��¡��̶�� ������ 1�б� ������ ���� ���� ��� 3�� �����߰� ��������Ų�ؽ��� ������ ���簡 ���� ����Ǹ鼭 ���� ������ ����١��� �����ߴ�.
			���� ��ȸ�縦 ���캸�� �¶��� ��ȸ��� ���ͼ� ������ �����ߴ�. SSG������ ����� 4213������� 0.9% ���������� ���� �Ը� 100��� �̻� ���̸� �����ս� 156����� ����ߴ�. G���� ���� ������� 3031������� 4.2% �پ����� �����ս� 109������� ���ͼ� ������ �����ߴ�. �����̾������ͼ� �߽��� ��ǰ ���� ��ȭ, ������������ ȿ��ȭ�� ���� ���� ������ �̷�´ٴ� �����̴�.
			������ ���� ���� ��ȯ�� ������ ����ȣ�ھظ���Ʈ�� ������ �������� ȣ������ �̾��. ������� 31.6% �þ 1194����� ��������� �������͵� 40������� �б� ���� ��ȯ�ߴ�. �ݸ鿡 �̸�Ʈ24�� 1�б� �����ս� 39������� ���� ���� Ȯ��ƴ�. ���� ���� 170���� ������ �� 6512�����̴�. ��Ÿ������ ������� 13.4% ����� 6829����� ��������� ȯ�� ��¿� ���� ���� �δ����� ���������� 29.3% ������ 205����� ����ߴ�. ��Ÿ�ʵ带 ��ϴ� �ż���������Ƽ�� �������� 29����� ����ϸ� ���� ��ȯ�ߴ�.
			�̸�Ʈ �����ڴ� �����ͼ� �߽��� ��ǰ ��ȭ, �������� ������ �� �̷��� ���� ü�� ������ �̾���� �ִ١��鼭 ������ ������ �㺸�� ���� ������ ���� ����� �͡��̶�� ���ߴ�.
			</div>
			<div class="agreement-text-box-small agreement-text d-flex justify-content-end align-items-center">
				<span>�������� ���� �� �̿뿡 �����Ͻʴϱ�?</span>
				<input type="checkbox" id="agree-check2" name="agreeChk" class="ml-1 mr-2"  value="�������� ���� �� �̿�">
			</div>
			<div class="d-flex justify-content-end mt-2">
				<input type="button" id="join-btn" value="ȸ������">
			</div>
		</div>
	</div>

</div>

<!-- �����ּ� api -->
<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="�ݱ� ��ư">
</div>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
$(document).ready(function(){
	
	$('#name').keyup(function(){
		let value = $(this).val();
		
/* 		this.value = this.value.replace(/[^a-zA-Z-_0-9]/g,''); */
		
		if ($(this).val().match(/[^a-zA-Z-_0-9]/g)) {
			value.replace(/[^a-zA-Z-_0-9]/g,'');
			alert("����");
		}
	});
	
	
	// ���̵� �ߺ� Ȯ��
	$("#checkDuplicatedId-btn").on("click",function(){
		// ��� ���� �ʱ�ȭ
		$('#idCheckDuplicated').addClass("d-none");
		$('#idCheckOk').addClass("d-none");
		
		let loginId = $('#loginId').val().trim();
		
		if ( loginId.length < 5){
			alert("���̵� 5�� �̻� �Է��ϼ���.");
			return;
		}
		$.ajax({
			type: "GET"
			, url: "/member/is_duplicated_id"
			, data: {"loginId" : loginId}
			,success:function(data){
				if(data.result) {		// ���̵� �ߺ�(true)
					$("#idCheckDuplicated").removeClass("d-none");
				} else {	// ��밡���� ���̵�
					$("#idCheckOk").removeClass("d-none");
				}
			}
			,error:function(request, status, error) {
				alert("���̵� �ߺ�Ȯ�ο� �����߽��ϴ� �����ڿ��� �����ּ���.");
			}
		});
	});
	
	$("#join-btn").on("click",function(){
		let memberType = $('input[name=member-type]:checked').val();
		let loginId = $('#loginId').val().trim();
		let password = $('#password').val();
		let name = $('#name').val().trim();
		let email = $('#email').val().trim();
		let address = "";
		$('input[name=addressName]').each(function(){
			address += $(this).val();
		});
		let telePhoneNumber = $('#telePhoneNumber').val();
		let mobilePhoneNumber = $('#mobilePhoneNumber').val();
		
		
		/* memberType:influencerMember */
		let instagramId = $("#instagramId").val().trim();
		let facebookUrl = $("#facebookUrl").val().trim();
		let youtubeUrl = $("#youtubeUrl").val().trim();
		let blogUrl = $("#blogUrl").val().trim();
		let twitterUrl = $("#twitterUrl").val().trim();
		let OtherUrl = $("#OtherUrl").val().trim();
		
		/* memberType:businessMember */
		let businessName = $("#businessName").val().trim();
		let businessLicenseNumber = $("#businessLicenseNumber").val().trim();
		
		// validation
		if(!loginId) {
			alert("���̵� �Է��ϼ���.");
			document.getElementById("loginId").focus();
			return;
		}
		if ($('.idLengthWarning').hasClass("d-none") == false) {
			alert("���̵� 5�� �̻� �Է��ϼ���.");
			document.getElementById("loginId").focus();
			return;
		}
		if(!password) {
			alert("��й�ȣ�� �Է��ϼ���.");
			document.getElementById("password").focus();
			return;
		}
		if ($('.passwordNotMatch').hasClass("d-none") == false) {
			alert("��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
			document.getElementById("passwordCheck").focus();
			return;
		}
		if(!name) {
			alert("�̸��� �Է��ϼ���.");
			document.getElementById("name").focus();
			return;
		}
		if(!address) {
			alert("�ּҸ� �Է��ϼ���.");
			document.getElementById("addressSearchBtn").focus();
			return;
		}
		if(!mobilePhoneNumber) {
			alert('�ڵ�����ȣ�� �Է��ϼ���.');
			document.getElementById("mobilePhoneNumber").focus();
			return;
		}
		if(!email) {
			alert('�̸����� �Է��ϼ���.');
			document.getElementById("email").focus();
			return;
		}
		// validation email �ּ� Ȯ��
		if (!$('#email').val().endsWith('.com')) {
			alert("�������� email�ּҰ� �ƴմϴ�.");
			document.getElementById("email").focus();
			return;
		}
		
		// validation �̿��� üũ �׸� 2�� 
		$('input[name=agreeChk]').each(function(){
			console.log(this);
			if (!$(this).is(':checked')) {
				alert($(this).val()+"�� �������ּ���");
				return;
			}
		});
		
		$.ajax({
			//request
			type:'POST'
			, url: '/member/join'
			, data: {"memberType":memberType
					,"loginId":loginId
					,"password":password
					,"name":name
					,"email":email
					,"address":address
					,"telePhoneNumber":telePhoneNumber
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
					/* location.href="/main/main_view" */
				} else {
					alert(data.errorMessage);
				}
			}
			, error:function(request, status ,error) {
				alert("��û�� �����߽��ϴ� �����ڿ��� �����ּ���");
			}
		})
	});
	
	// validation id�ּ� ���ڼ�
	$("#loginId").on("propertychange change paste input", function(){
		// ��� ���� �ʱ�ȭ
		$('#idCheckDuplicated').addClass("d-none");
		$('#idCheckOk').addClass("d-none");
		
		var loginIdLength = $(this).val().length;
		console.log(loginIdLength);
		if ( loginIdLength < 5) {
			$(".idLengthWarning").removeClass('d-none');
		} else {
			$(".idLengthWarning").addClass('d-none');
		}
		
	});
	
	//validation ��ȣ��ġ ���� Ȯ��
	$("#passwordCheck").keyup(function(){
		console.log($('#passwordCheck').val());
		console.log($('#password').val());
		if ($('#passwordCheck').val() == $('#password').val()) {
			$('.passwordNotMatch').addClass('d-none');
		} else {
			$('.passwordNotMatch').removeClass('d-none');
		}
	});
	// validation �ڵ��� 010���� Ȯ��
	$('#mobilePhoneNumber').keyup(function(){
		let mobilePhoneValidation = $('#mobilePhoneNumber').val();
		if (mobilePhoneValidation.length > 3) {
			if (!mobilePhoneValidation.startsWith('010')){
				alert("�ڵ��� ��ȣ�� 010���� �����ؾ��մϴ�.");
			}
		}
	});
	
	// validation �̸��� .com���� �������� Ȯ��
	$('#email').change(function(){
		if (!$('#email').val().endsWith('.com')) {
			alert("�������� email�ּҰ� �ƴմϴ�.");
		}
	});
	
	member = function() {
		$(".influencer").addClass("d-none");
		$(".business-member").addClass("d-none");
	};
	
	influencerMember = function() {
		$(".influencer").removeClass("d-none");
		$(".business-member").addClass("d-none");
	};
	
	businessMember = function() {
		$(".business-member").removeClass("d-none");
		$(".influencer").addClass("d-none");
	};
	
	/* �ּ��Է�â on/off */
	instagram = function() {
		if ($(".insta-url").hasClass("d-none") == true) {
			$(".insta-url").removeClass("d-none");
		} else {
			$(".insta-url").addClass("d-none");
		}
	};
	facebook = function() {
		if ($(".facebook-url").hasClass("d-none") == true) {
			$(".facebook-url").removeClass("d-none");
		} else {
			$(".facebook-url").addClass("d-none");
		}
	};
	youtube = function() {
		if ($(".youtube-url").hasClass("d-none") == true) {
			$(".youtube-url").removeClass("d-none");
		} else {
			$(".youtube-url").addClass("d-none");
		}
	};
	blog = function() {
		if ($(".blog-url").hasClass("d-none") == true) {
			$(".blog-url").removeClass("d-none");
		} else {
			$(".blog-url").addClass("d-none");
		}
	};
	twitter = function() {
		if ($(".twitter-url").hasClass("d-none") == true) {
			$(".twitter-url").removeClass("d-none");
		} else {
			$(".twitter-url").addClass("d-none");
		}
	};
	other = function() {
		if ($(".other-url").hasClass("d-none") == true) {
			$(".other-url").removeClass("d-none");
		} else {
			$(".other-url").addClass("d-none");
		}
	};
	/* �̿��� ��ü���� */
	agreeAll = function() {
		var chkList = $("input[name=agreeChk]");
		
		if ($('#agree-all-btn').is(':checked')){
			chkList.prop('checked',true);
		} else {
			chkList.prop('checked',false);
		}
	};

	
	/* ���� �ּ�API */
	execDaumPostcode = function() {
        new daum.Postcode({
            oncomplete: function(data) {
                // �˾����� �˻���� �׸��� Ŭ�������� ������ �ڵ带 �ۼ��ϴ� �κ�.

                // �� �ּ��� ���� ��Ģ�� ���� �ּҸ� �����Ѵ�.
                // �������� ������ ���� ���� ��쿣 ����('')���� �����Ƿ�, �̸� �����Ͽ� �б� �Ѵ�.
                var addr = ''; // �ּ� ����
                var extraAddr = ''; // �����׸� ����

                //����ڰ� ������ �ּ� Ÿ�Կ� ���� �ش� �ּ� ���� �����´�.
                if (data.userSelectedType === 'R') { // ����ڰ� ���θ� �ּҸ� �������� ���
                    addr = data.roadAddress;
                } else { // ����ڰ� ���� �ּҸ� �������� ���(J)
                    addr = data.jibunAddress;
                }

                // ����ڰ� ������ �ּҰ� ���θ� Ÿ���϶� �����׸��� �����Ѵ�.
                if(data.userSelectedType === 'R'){
                    // ���������� ���� ��� �߰��Ѵ�. (�������� ����)
                    // �������� ��� ������ ���ڰ� "��/��/��"�� ������.
                    if(data.bname !== '' && /[��|��|��]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // �ǹ����� �ְ�, ���������� ��� �߰��Ѵ�.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // ǥ���� �����׸��� ���� ���, ��ȣ���� �߰��� ���� ���ڿ��� �����.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // ���յ� �����׸��� �ش� �ʵ忡 �ִ´�.
                    document.getElementById("extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("extraAddress").value = '';
                }

                // �����ȣ�� �ּ� ������ �ش� �ʵ忡 �ִ´�.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("address").value = addr;
                // Ŀ���� ���ּ� �ʵ�� �̵��Ѵ�.
                document.getElementById("detailAddress").focus();
            }
        }).open();
    };
});

</script>