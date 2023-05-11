<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<div class="join-top-div d-flex justify-content-center">
	<div id="join">
		<div class='join-title'><i class="xi-angle-left"></i>ȸ������</div>
		<div class="join-form">
			<div class="join-form-lineTop d-flex"><span class="join-form-line-text">ȸ������</span><span class="essential-item">*</span>
				<div class="member-type-div">
					<label><input type="radio" name="member_type" value="����ȸ��" class="radio-btn" checked="checked" onclick="member()">����ȸ��</label>
					<label><input type="radio" name="member_type" value="���÷��" class="radio-btn" onclick="influencerMember()">���÷��</label>
					<label><input type="radio" name="member_type" value="�����" class="radio-btn" onclick="businessMember()">�����</label>
				</div>
			</div>
			<div class="semi-title">�⺻����</div>
			<div class="join-form-lineTop d-flex align-items-center">
				<span class="join-form-line-text">���̵�</span><span class="essential-item">*</span>
				<input type="text" class="form-control input-box">
				<input type="button" class="duplicateId-btn" value="�ּҰ˻�" onclick="execDaumPostcode()">
			</div>
			<div class="join-form-line d-flex align-items-center">
				<span class="join-form-line-text">��й�ȣ</span><span class="essential-item">*</span>
				<input type="text" class="form-control input-box">
			</div>
			<div class="join-form-line d-flex align-items-center">
				<span class="join-form-line-text">��й�ȣ Ȯ��</span><span class="essential-item">*</span>
				<input type="text" class="form-control input-box">
			</div>
			<div class="join-form-line d-flex align-items-center">
				<span class="join-form-line-text">�̸�</span><span class="essential-item">*</span>
				<input type="text" class="form-control input-box">
			</div>
			<div class="join-form-line-none1 d-flex align-items-center">
				<input type="text" id="postcode" class="form-control input-box-address1" placeholder="�����ȣ" readonly/>
				<input type="button" class="address-btn" value="�ּҰ˻�" onclick="execDaumPostcode()">
			</div>
			<div class="join-form-line-none2 d-flex align-items-center">
				<span class="join-form-line-text">�ּ�</span><span class="essential-item">*</span>
				<input type="text" id="address" class="form-control input-box-address2" placeholder="�⺻�ּ�" readonly/>
			</div>
			<div class="join-form-line-none3 d-flex align-items-center">
				<input type="text" id="detailAddress" class="form-control input-box-address3" placeholder="���ּ�">
				<input type="text" id="extraAddress" class="form-control input-box-address3-1" readonly/>
			</div>
			<div class="join-form-lineTop d-flex align-items-center">
				<span class="join-form-line-text">�޴���ȭ</span><span class="essential-item">*</span>
				<input type="text" class="form-control input-box">
			</div>
			<div class="join-form-line d-flex align-items-center">
				<span class="join-form-line-text">�Ϲ���ȭ</span>
				<input type="text" class="form-control input-box">
			</div>
			<div class="join-form-line d-flex align-items-center">
				<span class="join-form-line-text">�̸���</span><span class="essential-item">*</span>
				<input type="text" class="form-control input-box">
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
					<input type="text" class="form-control input-box" placeholder="�ν�Ÿ ID�� �Է��� �ּ���">
				</div>	
				<div class="facebook-url join-form-line d-flex align-items-center d-none" >
					<span class="join-form-line-text">���̽���</span><span class="essential-item">*</span>
					<input type="text" class="form-control input-box" placeholder="���̽��� ID�� �Է��� �ּ���">
				</div>	
				<div class="youtube-url join-form-line d-flex align-items-center d-none">
					<span class="join-form-line-text">��Ʃ��</span><span class="essential-item">*</span>
					<input type="text" class="form-control input-box" placeholder="��Ʃ�� ULR�� �Է��� �ּ���">
				</div>	
				<div class="blog-url join-form-line d-flex align-items-center d-none">
					<span class="join-form-line-text">��α�</span><span class="essential-item">*</span>
					<input type="text" class="form-control input-box" placeholder="��α� ULR�� �Է��� �ּ���">
				</div>	
				<div class="twitter-url join-form-line d-flex align-items-center d-none">
					<span class="join-form-line-text">Ʈ����</span><span class="essential-item">*</span>
					<input type="text" class="form-control input-box" placeholder="Ʈ���� ULR�� �Է��� �ּ���">
				</div>	
				<div class="other-url join-form-line d-flex align-items-center d-none">
					<span class="join-form-line-text">�׿�</span><span class="essential-item">*</span>
					<input type="text" class="form-control input-box" placeholder="�׿� ULR�� �Է��� �ּ���">
				</div>	
			</div>
			<div class="business-member d-none">
				<div class="join-form-line d-flex align-items-center">
					<span class="join-form-line-text">��ȣ��</span><span class="essential-item">*</span>
					<input type="text" class="form-control input-box">
				</div>
				<div class="join-form-line d-flex align-items-center">
					<span class="join-form-line-text">����� ��Ϲ�ȣ</span><span class="essential-item">*</span>
					<input type="text" class="form-control input-box">
				</div>
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
	}
	blog = function() {
		if ($(".blog-url").hasClass("d-none") == true) {
			$(".blog-url").removeClass("d-none");
		} else {
			$(".blog-url").addClass("d-none");
		}
	}
	twitter = function() {
		if ($(".twitter-url").hasClass("d-none") == true) {
			$(".twitter-url").removeClass("d-none");
		} else {
			$(".twitter-url").addClass("d-none");
		}
	}
	other = function() {
		if ($(".other-url").hasClass("d-none") == true) {
			$(".other-url").removeClass("d-none");
		} else {
			$(".other-url").addClass("d-none");
		}
	}
	
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
    }
});

</script>