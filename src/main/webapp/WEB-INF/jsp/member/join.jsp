<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<div class="join-top-div d-flex justify-content-center">
	<div id="join">
		<div class='join-title'><i class="xi-angle-left"></i>회원가입</div>
		<div class="join-form">
			<div class="join-form-lineTop d-flex"><span class="join-form-line-text">회원구분</span><span class="essential-item">*</span>
				<div class="member-type-div">
					<label><input type="radio" name="member-type" value="member" class="radio-btn" checked="checked" onclick="member()">개인회원</label>
					<label><input type="radio" name="member-type" value="influencerMember" class="radio-btn" onclick="influencerMember()">인플루언서</label>
					<label><input type="radio" name="member-type" value="businessMember" class="radio-btn" onclick="businessMember()">사업자</label>
				</div>
			</div>
			<div class="semi-title">기본정보</div>
			<div class="join-form-lineTopIncludeText line-top">
				<div class=" d-flex align-items-center">
					<span class="join-form-line-text">아이디</span><span class="essential-item">*</span>
					<input type="text" class="form-control input-box" id="loginId" onkeyup="this.value=this.value.replace(/[^a-zA-Z-_0-9]/g,'');">
					<input type="button" id="checkDuplicatedId-btn" class="duplicateId-btn" value="중복확인"">
				</div>
				<span class="hiddenText d-none idLengthWarning">아이디를 5자 이상 입력해주세요.</span>
				<span class="hiddenText d-none" id="idCheckDuplicated">이미 사용중인 ID입니다.</span>
				<span class="hiddenText-success d-none" id="idCheckOk">사용 가능한 ID 입니다.</span>
			</div>
			<div>
			</div>
			<div class="join-form-line line-bottom line-top d-flex align-items-center">
				<span class="join-form-line-text">비밀번호</span><span class="essential-item">*</span>
				<input type="password" class="form-control input-box" id="password">
			</div>
			<div class="join-form-lineIncludeText">
				<div class="d-flex align-items-center">
					<span class="join-form-line-text">비밀번호 확인</span><span class="essential-item">*</span>
					<input type="password" class="form-control input-box" id="passwordCheck">
				</div>
				<span class="d-none hiddenText passwordNotMatch">비밀번호가 일치하지 않습니다.</span>
			</div>
			<div class="join-form-line line-top d-flex align-items-center">
				<span class="join-form-line-text">이름</span><span class="essential-item">*</span>
				<input type="text" id="name" class="form-control input-box">
			</div>
			<div class="join-form-line-none1 d-flex align-items-center">
				<input type="text" id="postcode" class="form-control input-box-address1" placeholder="우편번호" readonly/>
				<input type="button" class="address-btn" id="addressSearchBtn" value="주소검색" onclick="execDaumPostcode()">
			</div>
			<div class="join-form-line-none2 d-flex align-items-center">
				<span class="join-form-line-text">주소</span><span class="essential-item">*</span>
				<input type="text" id="address" name="addressName" class="form-control input-box-address2" placeholder="기본주소" readonly/>
			</div>
			<div class="join-form-line-none3 d-flex align-items-center">
				<input type="text" id="detailAddress" name="addressName" class="form-control input-box-address3" placeholder="상세주소">
				<input type="text" id="extraAddress" name="addressName" class="form-control input-box-address3-1" readonly/>
			</div>
			<div class="join-form-lineTop d-flex align-items-center">
				<span class="join-form-line-text">휴대전화</span><span class="essential-item">*</span>
				<input type="text" class="form-control input-box" id="mobilePhoneNumber">
			</div>
			<div class="join-form-line d-flex align-items-center">
				<span class="join-form-line-text">일반전화</span>
				<input type="text" class="form-control input-box" id="telePhoneNumber">
			</div>
			<div class="join-form-line d-flex align-items-center">
				<span class="join-form-line-text">이메일</span><span class="essential-item">*</span>
				<input type="text" class="form-control input-box" id="email">
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
					<input type="text" id="instagramId" class="form-control input-box" placeholder="인스타 ID를 입력해 주세요">
				</div>	
				<div class="facebook-url join-form-line d-flex align-items-center d-none" >
					<span class="join-form-line-text">페이스북</span><span class="essential-item">*</span>
					<input type="text" id="facebookUrl" class="form-control input-box" placeholder="페이스북 ID를 입력해 주세요">
				</div>	
				<div class="youtube-url join-form-line d-flex align-items-center d-none">
					<span class="join-form-line-text">유튜브</span><span class="essential-item">*</span>
					<input type="text" id="youtubeUrl" class="form-control input-box" placeholder="유튜브 ULR를 입력해 주세요">
				</div>	
				<div class="blog-url join-form-line d-flex align-items-center d-none">
					<span class="join-form-line-text">블로그</span><span class="essential-item">*</span>
					<input type="text" id="blogUrl" class="form-control input-box" placeholder="블로그 ULR를 입력해 주세요">
				</div>	
				<div class="twitter-url join-form-line d-flex align-items-center d-none">
					<span class="join-form-line-text">트위터</span><span class="essential-item">*</span>
					<input type="text" id="twitterUrl" class="form-control input-box" placeholder="트위터 ULR를 입력해 주세요">
				</div>	
				<div class="other-url join-form-line d-flex align-items-center d-none">
					<span class="join-form-line-text">그외</span><span class="essential-item">*</span>
					<input type="text" id="OtherUrl" class="form-control input-box" placeholder="그외 ULR를 입력해 주세요">
				</div>	
			</div>
			<div class="business-member d-none">
				<div class="join-form-line d-flex align-items-center">
					<span class="join-form-line-text">상호명</span><span class="essential-item">*</span>
					<input type="text" class="form-control input-box" id="businessName">
				</div>
				<div class="join-form-line d-flex align-items-center">
					<span class="join-form-line-text">사업자 등록번호</span><span class="essential-item">*</span>
					<input type="text" class="form-control input-box" id="businessLicenseNumber">
				</div>
			</div>
			<div class="semi-title">전체동의</div>
			<div class="d-flex align-items-center agreement-text">
				<input type="checkbox" id="agree-all-btn" class="mr-1" onclick="agreeAll()">
				<span>이용약관 및 개인정보수집 및 이용, 쇼핑정보 수신(선택)에 모두 동의합니다.</span>
			</div>
			<div class="semi-title">
				<span>[필수]이용약관동의</span>
			</div>
			<div class="agreement-text-box">
			‘오프라인 강자’ 이마트가 1분기 유통업계 1위 타이틀을 쿠팡에 내줬다. 이마트 연결 기준 매출액이 쿠팡에 뒤처진 것은 이번이 처음이다. 코로나 특수를 누린 지난해 역기저 효과에 고물가·고금리로 인한 소비심리 위축이 영향을 미쳤다.
			이마트는 올해 1분기 연결 기준 순매출액이 작년 동기 대비 1.9% 오른 7조1354억원을 기록했다고 11일 공시했다. 같은 기간 영업이익은 137억원으로 60.4% 감소했다. 당기순이익은 99.7% 줄어든 27억원으로 적자를 간신히 면했다.
			매출액은 1분기 매출 7조3990억원(분기 환율 1275.6원 기준)을 기록한 쿠팡보다 2600억원 이상 낮은 수치다. 양 사 격차는 1년 전인 지난해 1분기 8382억원에서 4분기 2338억원까지 줄어든 바 있다. 쿠팡이 매출액에서 이마트를 앞선 것은 이번이 처음이다. 이마트는 영업이익도 1362억원을 기록한 쿠팡에 크게 밀렸다.
			본업 부진이 발목을 잡았다. 사업부별로 살펴보면 1분기 할인점 매출액은 3조169억원으로 2.5% 감소했다. 영업이익은 477억원으로 37.0% 감소했다. 트레이더스도 매출액 8184억원, 영업이익 84억원으로 각각 2.7%, 44.4% 동반 감소했다. 노브랜드 매출·영업이익 호조로 전문점 영업이익만 79억원 증가했다.
			이마트 관계자는 “영업이익 감소 요인은 코로나 시기 성장에 대한 역기저효과와 불황으로 인한 장바구니 부담 상승”이라며 “올해 1분기 공휴일 수가 전년 대비 3일 감소했고 연수점·킨텍스점 리뉴얼 공사가 조기 진행되면서 매출 공백이 생겼다”고 설명했다.
			연결 자회사를 살펴보면 온라인 자회사는 수익성 개선에 성공했다. SSG닷컴은 매출액 4213억원으로 0.9% 감소했지만 적자 규모를 100억원 이상 줄이며 영업손실 156억원을 기록했다. G마켓 또한 매출액은 3031억원으로 4.2% 줄었지만 영업손실 109억원으로 수익성 개선에 성공했다. 프리미엄·수익성 중심의 상품 구성 강화, 물류·마케팅 효율화를 통해 적자 개선을 이뤄냈다는 설명이다.
			지난해 연간 흑자 전환에 성공한 조선호텔앤리조트는 투숙률 개선으로 호조세를 이어갔다. 매출액은 31.6% 늘어난 1194억원을 기록했으며 영업이익도 40억원으로 분기 흑자 전환했다. 반면에 이마트24는 1분기 영업손실 39억원으로 적자 폭이 확대됐다. 점포 수는 170개점 증가한 총 6512개점이다. 스타벅스는 매출액이 13.4% 상승한 6829억원을 기록했지만 환율 상승에 따른 원가 부담으로 영업이익은 29.3% 감소한 205억원을 기록했다. 스타필드를 운영하는 신세계프라퍼티는 영업이익 29억원을 기록하며 흑자 전환했다.
			이마트 관계자는 “수익성 중심의 상품 강화, 오프라인 리뉴얼 등 미래를 위한 체질 개선을 이어나가고 있다”면서 “향후 수익을 담보한 지속 성장을 위해 노력할 것”이라고 말했다.
			</div>
			<div class="agreement-text-box-small agreement-text d-flex justify-content-end align-items-center">
				<span>이용약관에 동의 하십니까?</span>
				<input type="checkbox" id="agree-check1" name="agreeChk" class="ml-1 mr-2" value="이용약관">
			</div>
			<div class="semi-title">
				<span>[필수]개인정보 수집 및 이용 동의</span>
			</div>
			<div class="agreement-text-box">
			‘오프라인 강자’ 이마트가 1분기 유통업계 1위 타이틀을 쿠팡에 내줬다. 이마트 연결 기준 매출액이 쿠팡에 뒤처진 것은 이번이 처음이다. 코로나 특수를 누린 지난해 역기저 효과에 고물가·고금리로 인한 소비심리 위축이 영향을 미쳤다.
			이마트는 올해 1분기 연결 기준 순매출액이 작년 동기 대비 1.9% 오른 7조1354억원을 기록했다고 11일 공시했다. 같은 기간 영업이익은 137억원으로 60.4% 감소했다. 당기순이익은 99.7% 줄어든 27억원으로 적자를 간신히 면했다.
			매출액은 1분기 매출 7조3990억원(분기 환율 1275.6원 기준)을 기록한 쿠팡보다 2600억원 이상 낮은 수치다. 양 사 격차는 1년 전인 지난해 1분기 8382억원에서 4분기 2338억원까지 줄어든 바 있다. 쿠팡이 매출액에서 이마트를 앞선 것은 이번이 처음이다. 이마트는 영업이익도 1362억원을 기록한 쿠팡에 크게 밀렸다.
			본업 부진이 발목을 잡았다. 사업부별로 살펴보면 1분기 할인점 매출액은 3조169억원으로 2.5% 감소했다. 영업이익은 477억원으로 37.0% 감소했다. 트레이더스도 매출액 8184억원, 영업이익 84억원으로 각각 2.7%, 44.4% 동반 감소했다. 노브랜드 매출·영업이익 호조로 전문점 영업이익만 79억원 증가했다.
			이마트 관계자는 “영업이익 감소 요인은 코로나 시기 성장에 대한 역기저효과와 불황으로 인한 장바구니 부담 상승”이라며 “올해 1분기 공휴일 수가 전년 대비 3일 감소했고 연수점·킨텍스점 리뉴얼 공사가 조기 진행되면서 매출 공백이 생겼다”고 설명했다.
			연결 자회사를 살펴보면 온라인 자회사는 수익성 개선에 성공했다. SSG닷컴은 매출액 4213억원으로 0.9% 감소했지만 적자 규모를 100억원 이상 줄이며 영업손실 156억원을 기록했다. G마켓 또한 매출액은 3031억원으로 4.2% 줄었지만 영업손실 109억원으로 수익성 개선에 성공했다. 프리미엄·수익성 중심의 상품 구성 강화, 물류·마케팅 효율화를 통해 적자 개선을 이뤄냈다는 설명이다.
			지난해 연간 흑자 전환에 성공한 조선호텔앤리조트는 투숙률 개선으로 호조세를 이어갔다. 매출액은 31.6% 늘어난 1194억원을 기록했으며 영업이익도 40억원으로 분기 흑자 전환했다. 반면에 이마트24는 1분기 영업손실 39억원으로 적자 폭이 확대됐다. 점포 수는 170개점 증가한 총 6512개점이다. 스타벅스는 매출액이 13.4% 상승한 6829억원을 기록했지만 환율 상승에 따른 원가 부담으로 영업이익은 29.3% 감소한 205억원을 기록했다. 스타필드를 운영하는 신세계프라퍼티는 영업이익 29억원을 기록하며 흑자 전환했다.
			이마트 관계자는 “수익성 중심의 상품 강화, 오프라인 리뉴얼 등 미래를 위한 체질 개선을 이어나가고 있다”면서 “향후 수익을 담보한 지속 성장을 위해 노력할 것”이라고 말했다.
			</div>
			<div class="agreement-text-box-small agreement-text d-flex justify-content-end align-items-center">
				<span>개인정보 수집 및 이용에 동의하십니까?</span>
				<input type="checkbox" id="agree-check2" name="agreeChk" class="ml-1 mr-2"  value="개인정보 수집 및 이용">
			</div>
			<div class="d-flex justify-content-end mt-2">
				<input type="button" id="join-btn" value="회원가입">
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
	
	$('#name').keyup(function(){
		let value = $(this).val();
		
/* 		this.value = this.value.replace(/[^a-zA-Z-_0-9]/g,''); */
		
		if ($(this).val().match(/[^a-zA-Z-_0-9]/g)) {
			value.replace(/[^a-zA-Z-_0-9]/g,'');
			alert("성공");
		}
	});
	
	
	// 아이디 중복 확인
	$("#checkDuplicatedId-btn").on("click",function(){
		// 경고 문구 초기화
		$('#idCheckDuplicated').addClass("d-none");
		$('#idCheckOk').addClass("d-none");
		
		let loginId = $('#loginId').val().trim();
		
		if ( loginId.length < 5){
			alert("아이디를 5자 이상 입력하세요.");
			return;
		}
		$.ajax({
			type: "GET"
			, url: "/member/is_duplicated_id"
			, data: {"loginId" : loginId}
			,success:function(data){
				if(data.result) {		// 아이디 중복(true)
					$("#idCheckDuplicated").removeClass("d-none");
				} else {	// 사용가능한 아이디
					$("#idCheckOk").removeClass("d-none");
				}
			}
			,error:function(request, status, error) {
				alert("아이디 중복확인에 실패했습니다 관리자에게 문의주세요.");
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
			alert("아이디를 입력하세요.");
			document.getElementById("loginId").focus();
			return;
		}
		if ($('.idLengthWarning').hasClass("d-none") == false) {
			alert("아이디를 5자 이상 입력하세요.");
			document.getElementById("loginId").focus();
			return;
		}
		if(!password) {
			alert("비밀번호를 입력하세요.");
			document.getElementById("password").focus();
			return;
		}
		if ($('.passwordNotMatch').hasClass("d-none") == false) {
			alert("비밀번호가 일치하지 않습니다.");
			document.getElementById("passwordCheck").focus();
			return;
		}
		if(!name) {
			alert("이름을 입력하세요.");
			document.getElementById("name").focus();
			return;
		}
		if(!address) {
			alert("주소를 입력하세요.");
			document.getElementById("addressSearchBtn").focus();
			return;
		}
		if(!mobilePhoneNumber) {
			alert('핸드폰번호를 입력하세요.');
			document.getElementById("mobilePhoneNumber").focus();
			return;
		}
		if(!email) {
			alert('이메일을 입력하세요.');
			document.getElementById("email").focus();
			return;
		}
		// validation email 주소 확인
		if (!$('#email').val().endsWith('.com')) {
			alert("정상적인 email주소가 아닙니다.");
			document.getElementById("email").focus();
			return;
		}
		
		// validation 이용약관 체크 항목 2개 
		$('input[name=agreeChk]').each(function(){
			console.log(this);
			if (!$(this).is(':checked')) {
				alert($(this).val()+"에 동의해주세요");
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
				alert("요청에 실패했습니다 관리자에게 문의주세요");
			}
		})
	});
	
	// validation id최소 글자수
	$("#loginId").on("propertychange change paste input", function(){
		// 경고 문구 초기화
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
	
	//validation 암호일치 여부 확인
	$("#passwordCheck").keyup(function(){
		console.log($('#passwordCheck').val());
		console.log($('#password').val());
		if ($('#passwordCheck').val() == $('#password').val()) {
			$('.passwordNotMatch').addClass('d-none');
		} else {
			$('.passwordNotMatch').removeClass('d-none');
		}
	});
	// validation 핸드폰 010시작 확인
	$('#mobilePhoneNumber').keyup(function(){
		let mobilePhoneValidation = $('#mobilePhoneNumber').val();
		if (mobilePhoneValidation.length > 3) {
			if (!mobilePhoneValidation.startsWith('010')){
				alert("핸드폰 번호는 010으로 시작해야합니다.");
			}
		}
	});
	
	// validation 이메일 .com으로 끝나는지 확인
	$('#email').change(function(){
		if (!$('#email').val().endsWith('.com')) {
			alert("정상적인 email주소가 아닙니다.");
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
	/* 이용약관 전체동의 */
	agreeAll = function() {
		var chkList = $("input[name=agreeChk]");
		
		if ($('#agree-all-btn').is(':checked')){
			chkList.prop('checked',true);
		} else {
			chkList.prop('checked',false);
		}
	};

	
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
    };
});

</script>