<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<div class="join-top-div d-flex justify-content-center">
	<div id="join">
		<div class='join-title'><i class="xi-angle-left"></i>회원가입</div>
		<div class="join-form">
			<div class="join-form-lineTop d-flex"><span class="join-form-line-text">회원구분</span><span class="essential-item">*</span>
				<div class="member-type-div">
					<label><input type="radio" name="member_type" value="개인회원" class="radio-btn" checked="checked" onclick="member()">개인회원</label>
					<label><input type="radio" name="member_type" value="인플루언서" class="radio-btn" onclick="influencerMember()">인플루언서</label>
					<label><input type="radio" name="member_type" value="사업자" class="radio-btn" onclick="businessMember()">사업자</label>
				</div>
			</div>
			<div class="semi-title">기본정보</div>
			<div class="join-form-lineTop d-flex align-items-center">
				<span class="join-form-line-text">아이디</span><span class="essential-item">*</span>
				<input type="text" class="form-control input-box">
				<input type="button" class="duplicateId-btn" value="주소검색" onclick="execDaumPostcode()">
			</div>
			<div class="join-form-line d-flex align-items-center">
				<span class="join-form-line-text">비밀번호</span><span class="essential-item">*</span>
				<input type="text" class="form-control input-box">
			</div>
			<div class="join-form-line d-flex align-items-center">
				<span class="join-form-line-text">비밀번호 확인</span><span class="essential-item">*</span>
				<input type="text" class="form-control input-box">
			</div>
			<div class="join-form-line d-flex align-items-center">
				<span class="join-form-line-text">이름</span><span class="essential-item">*</span>
				<input type="text" class="form-control input-box">
			</div>
			<div class="join-form-line-none1 d-flex align-items-center">
				<input type="text" id="postcode" class="form-control input-box-address1" placeholder="우편번호" readonly/>
				<input type="button" class="address-btn" value="주소검색" onclick="execDaumPostcode()">
			</div>
			<div class="join-form-line-none2 d-flex align-items-center">
				<span class="join-form-line-text">주소</span><span class="essential-item">*</span>
				<input type="text" id="address" class="form-control input-box-address2" placeholder="기본주소" readonly/>
			</div>
			<div class="join-form-line-none3 d-flex align-items-center">
				<input type="text" id="detailAddress" class="form-control input-box-address3" placeholder="상세주소">
				<input type="text" id="extraAddress" class="form-control input-box-address3-1" readonly/>
			</div>
			<div class="join-form-lineTop d-flex align-items-center">
				<span class="join-form-line-text">휴대전화</span><span class="essential-item">*</span>
				<input type="text" class="form-control input-box">
			</div>
			<div class="join-form-line d-flex align-items-center">
				<span class="join-form-line-text">일반전화</span>
				<input type="text" class="form-control input-box">
			</div>
			<div class="join-form-line d-flex align-items-center">
				<span class="join-form-line-text">이메일</span><span class="essential-item">*</span>
				<input type="text" class="form-control input-box">
			</div>
			<div class="influencer d-none" onclick="influencerMember()">
				<div class="join-form-line d-flex align-items-center influencer-box-padding">
					<span class="join-form-line-text">인플루언서 유형</span><span class="essential-item">*</span>
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
					<span class="join-form-line-text">인스타</span><span class="essential-item">*</span>
					<input type="text" class="form-control input-box" placeholder="인스타 ID를 입력해 주세요">
				</div>	
				<div class="facebook-url join-form-line d-flex align-items-center d-none" >
					<span class="join-form-line-text">페이스북</span><span class="essential-item">*</span>
					<input type="text" class="form-control input-box" placeholder="페이스북 ID를 입력해 주세요">
				</div>	
				<div class="youtube-url join-form-line d-flex align-items-center d-none">
					<span class="join-form-line-text">유튜브</span><span class="essential-item">*</span>
					<input type="text" class="form-control input-box" placeholder="유튜브 ULR를 입력해 주세요">
				</div>	
				<div class="blog-url join-form-line d-flex align-items-center d-none">
					<span class="join-form-line-text">블로그</span><span class="essential-item">*</span>
					<input type="text" class="form-control input-box" placeholder="블로그 ULR를 입력해 주세요">
				</div>	
				<div class="twitter-url join-form-line d-flex align-items-center d-none">
					<span class="join-form-line-text">트위터</span><span class="essential-item">*</span>
					<input type="text" class="form-control input-box" placeholder="트위터 ULR를 입력해 주세요">
				</div>	
				<div class="other-url join-form-line d-flex align-items-center d-none">
					<span class="join-form-line-text">그외</span><span class="essential-item">*</span>
					<input type="text" class="form-control input-box" placeholder="그외 ULR를 입력해 주세요">
				</div>	
			</div>
			<div class="business-member d-none">
				<div class="join-form-line d-flex align-items-center">
					<span class="join-form-line-text">상호명</span><span class="essential-item">*</span>
					<input type="text" class="form-control input-box">
				</div>
				<div class="join-form-line d-flex align-items-center">
					<span class="join-form-line-text">사업자 등록번호</span><span class="essential-item">*</span>
					<input type="text" class="form-control input-box">
				</div>
			</div>
		</div>
	</div>
</div>
<!-- 다음주소 api -->
<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
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
	
	/* 주소입력창 on/off */
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
	
	/* 다음 주소API */
	execDaumPostcode = function() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("detailAddress").focus();
            }
        }).open();
    }
});

</script>