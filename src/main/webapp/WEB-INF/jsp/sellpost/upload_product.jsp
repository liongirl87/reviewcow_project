<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div id="upload-product" class="d-flex justify-content-center">
	<div id="side-view-right-Tdiv" class="mt-3">
		<div class="main-title"><i class="xi-angle-left"></i>체험단모집</div>
		
		<!-- 서비스 종류-[공통] -->
		<div class="product-div-line-box">
			<div class="product-semi-title">서비스종류<span class="red-stress-text">*</span></div>
			<div class="line-top">
				<div class="d-flex justify-content-start product-text-wrap-div">
					<select name="order" id ="serviceCategory1" class="custom-select product-select-design ml-3">
					 	<option value="" disabled selected>서비스종류</option>
					    <option value="onlineProduct">온라인상품</option>
					    <option value="offlineStore">오프라인상품</option>
					    <option value="pressCorps">체험단</option>
					</select>
					<select name="order" id ="serviceCategory2-onlineProduct" class="custom-select product-select-design ml-2 d-none">
					 	<option value="" disabled selected>선택</option>
					    <option value="smartstore">스마트스토어</option>
					    <option value="coupang">쿠팡</option>
					    <option value="gmarket">G마켓</option>
					    <option value="auction">옥션</option>
					    <option value="11st">11번가</option>
					    <option value="wemakeprice">위메프</option>
					    <option value="other">그외</option>
					</select>
					<select name="order" id ="serviceCategory2-offlineStore" class="custom-select product-select-design ml-2 d-none">
					 	<option value="" disabled selected>선택</option>
					    <option value="cafe">카페</option>
					    <option value="foodstore">맛집</option>
					    <option value="travel">여행</option>
					    <option value="beauty">뷰티</option>
					</select>
				</div>
			</div>
		</div>
		
		<!-- 상품명(서비스명)-[공통] -->
		<div class="product-div-line-box d-none commonDisplay">
		<div class="product-semi-title">상품명(서비스명)<span class="red-stress-text">*</span></div>
			<div class="line-top">
				<div class="d-flex justify-content-center product-text-wrap-div">
					<input type="text" id="productName" class="form-control produc-input-box text-left" placeholder="최대 50자까지 입력 가능합니다." maxlength='50'>
				</div>
			</div>
		</div>
		<div class="product-div-line-box d-none commonDisplay">
		<div class="product-semi-title">판매상품 URL<span class="red-stress-text">*</span></div>
			<div class="line-top">
				<div class="d-flex justify-content-center product-text-wrap-div">
					<input type="text" id="productUrl" class="form-control produc-input-box text-left" placeholder="판매 할 상품 URL링크를 입력해주세요.">
				</div>
			</div>
		</div>
		
		<!-- 매장주소-[오프라인상품] -->
		<div class="product-div-line-box d-none offlineDisplay">
		<div class="product-semi-title">매장주소<span class="red-stress-text">*</span></div>
			<div class="line-top">
				<div class="d-flex justify-content-start product-text-wrap-div-rows">
					<div class="product-text-margin">
						<span class="input-side-text">매장이름</span>
					</div>
					<div class="input-group product-append-div mb-3 input-location">
						<input type="text" id="storeName" class="form-control">
					</div>
				</div>
				<div class="d-flex justify-content-start">
					<div class="only-line-div line-top"></div>
				</div>
				<div class="d-flex justify-content-start product-text-wrap-div-rows">
					<div class="product-text-margin">
						<span class="input-side-text">매장주소</span>
					</div>
					<div class="d-flex mb-3 input-location">
						<input type="text" id="postcode" class="form-control product-append-div-address1" placeholder="우편번호" readonly/>
						<input type="button" id="searchAddressBtn" class="form-control product-append-div-addressBtn" value="주소검색" onclick="execDaumPostcode()">
					</div>
				</div>
				<div class="d-flex justify-content-start product-text-wrap-div-rows-address">
					<div class="input-group product-append-div-address2 mb-3 input-location">
						<input type="text" id="address" class="form-control" placeholder="기본주소" readonly/>
					</div>
				</div>
				<div class="d-flex justify-content-start product-text-wrap-div-rows-address">
					<div class="input-group product-append-div mb-3 input-location">
						<input type="text" id="detailAddress" class="form-control" placeholder="상세주소">
					</div>
					<div class="input-group product-append-div mb-3 input-location-address">
						<input type="text" id="extraAddress" class="form-control" readonly/>
					</div>
				</div>
			</div>
		</div>
		
		<!-- 모집인원-[공통] -->
		<div class="product-div-line-box d-none commonDisplay">
		<div class="product-semi-title">모집인원<span class="red-stress-text">*</span></div>
			<div class="line-top">
				<div class="d-flex justify-content-start product-text-wrap-div-rows">
					<div class="product-text-margin">
						<span class="input-side-text">모집인원</span>
					</div>
					<div class="input-group product-append-div mb-3 input-location">
						<input type="text" id="numberOfApplicants" class="form-control" placeholder="최대 99명까지 모집가능" maxlength='2' onkeyup="doComma(this);doCalculate()"/>
						<div class="input-group-append">
						   <span class="input-group-text" id="basic-addon2">명</span>
						 </div>
					</div>
				</div>
				<div class="d-flex justify-content-start">
					<div class="only-line-div line-top"></div>
				</div>
				<div class="d-flex justify-content-start product-text-wrap-div">
					<div class="product-text-margin">
						<span class="radio-side-text">모집방식</span>
					</div>
					<div class="sell-type-div">
						<label><input type="radio" name="salesMethod" value="byOrderOfArrival" class="radio-btn" checked="checked"><span class="ml-1">선착순모집</span></label>
						<label><input type="radio" name="salesMethod" value="beChosenBySeller" class="radio-btn ml-2"><span class="ml-1">판매자선정</span></label>
					</div>
				</div>
			</div>
		</div>
		
		<!-- 모집기간-[공통] -->
		<div class="product-div-line-box d-none commonDisplay">
		<div class="product-semi-title">모집기간<span class="red-stress-text">*</span></div>
			<div class="line-top">
				<div class="d-flex justify-content-start product-text-wrap-div-rows">
					<div class="product-text-margin">
						<span class="input-side-text">시작일</span>
					</div>
					<div class="input-group product-append-div mb-3 input-location">
						<input type="text" id="startDate" class="form-control" placeholder="시작일을 선택하세요.">
						<div class="input-group-append">
						   <span class="input-group-text" id="basic-addon2"><i class="xi-caret-down"></i></span>
						 </div>
					</div>
				</div>
				<div class="d-flex justify-content-start">
					<div class="only-line-div line-top"></div>
				</div>
				<div class="d-flex justify-content-start product-text-wrap-div-rows">
					<div class="product-text-margin">
						<span class="input-side-text">종료일</span>
					</div>
					<div class="input-group product-append-div mb-3 input-location">
						<input type="text" id="endDate" class="form-control" placeholder="종료일을 선택하세요.">
						<div class="input-group-append">
						   <span class="input-group-text" id="basic-addon2"><i class="xi-caret-down"></i></span>
						 </div>
					</div>
				</div>
				<div class="d-flex justify-content-start">
					<div class="only-line-div line-top"></div>
				</div>
				<div class="d-flex justify-content-start align-items-end product-text-wrap-div-rows">
					<div class="product-text-margin">
						<span class="start-date-text start-date-text-font d-none">시작일</span>
					</div>
					<div class="product-text-margin">
						<span class="end-center-start d-none">~</span>
					</div>
					<div class="product-text-margin">
						<span class="end-date-text end-date-text-font d-none">종료일</span>
					</div>
					<div class="product-text-margin-date-total date-of-progressed d-none">
						<span class="input-side-text progress-of-period-text">총 <span class="progress-of-period-text-stress"></span>일</span>
					</div>
				</div>
			</div>
		</div>
		
		<!-- 원고료-[기자단] -->
		<div class="product-div-line-box d-none corpsDisplay">
		<div class="product-semi-title">원고료<span class="red-stress-text">*</span></div>
			<div class="line-top">
				<div class="d-flex justify-content-start product-text-wrap-div-rows">
					<div class="product-text-margin">
						<span class="input-side-text">지급원고료</span>
					</div>
					<div class="input-group product-append-div mb-3 input-location">
						<input type="text" id="numberOfApplicants" class="form-control" placeholder="원고료를 입력하세요." maxlength='10' onkeyup="doComma(this)"/>
						<div class="input-group-append">
						   <span class="input-group-text" id="basic-addon2">P</span>
						 </div>
					</div>
				</div>
			</div>
		</div>
		
		<!-- 판매가격-[온라인상품] -->
		<div class="product-div-line-box d-none onlineDisplay">
		<div class="product-semi-title">판매가격<span class="red-stress-text">*</span></div>
			<div class="line-top">
				<div class="d-flex justify-content-start product-text-wrap-div-rows">
					<div class="product-text-margin">
						<span class="input-side-text">판매가격</span>
					</div>
					<div class="input-group product-append-div mb-3 input-location">
						<input type="text" id="sellPrice" class="form-control" placeholder="판매가를 입력하세요." onkeyup="doComma(this)" maxlength='10'> 
						<!-- onkeyup="inputNumberFormat(this);" / -->
						<div class="input-group-append">
						   <span class="input-group-text" id="basic-addon2">원</span>
						 </div>
					</div>
				</div>
				<div class="d-flex justify-content-start">
					<div class="only-line-div line-top"></div>
				</div>
				<div class="d-flex justify-content-start product-text-wrap-div-rows">
					<div class="product-text-margin">
						<span class="input-side-text">할인</span>
					</div>
					<div class="input-group product-append-div mb-3 input-location">
						<input type="text" id="discountRate" class="form-control" placeholder="종료일을 선택하세요." onkeyup="doComma(this);doCalculate()" maxlength='10' />
						<div class="input-group-append">
						   	<select id="price-select-box" name="wonOrPercent">
						   		<option value="won"><i class="xi-caret-down">원</i></option>
						   		<option value="percent"><i class="xi-caret-down">%</i></option>
						   	</select>
						 </div>
					</div>
				</div>
				<div class="d-flex justify-content-start">
					<div class="only-line-div line-top"></div>
				</div>
				<div class="d-flex justify-content-start align-items-end product-text-wrap-div-rows">
					<div class="product-text-margin">
						<span class="input-side-text-salePrice">할인가</span>
					</div>
					<div class="product-text-margin-price-total">
						<span class="input-side-text">총 
						<span id="finalPrice" class="progress-of-period-text-stress">14,400</span>원 <span>(<span class="paidPoint">9,600</span> 포인트 지급)</span></span>
					</div>
				</div>
			</div>
		</div>
		
		<!-- 상품이미지-[공통] -->
		<div class="product-div-line-box2 d-none commonDisplay">
		<div class="product-semi-title">상품이미지<span class="red-stress-text">*</span></div>
			<div class="line-top">
				<div class="d-flex justify-content-start product-text-wrap-div-rows">
					<div class="product-text-margin">
						<span class="input-side-text">대표이미지</span>
					</div>
					<div class="mb-3 input-location d-flex">
						<input type="text" id="fileNameInput" class="form-control product-not-append-div image-input-div" readonly/>
						<div class="input-group-append">
							<input type="button" id="imageUploadBtn" class="product-file-upload text-center" value="파일찾기">
						</div>
						<input type="file" id="file" class="d-none" accept=".gif, .jpg, .png, .jpeg">
					</div>
				</div>
				<div class="product-text-wrap-div-rows">
					<div class="product-text-margin product-file-size">
						<span>권장크기: 520x380</span>
					</div>
				</div>
			</div>
		</div>
		
		<!-- 기자단 양식 첨부-[체험단] -->
		<div class="product-div-line-box2 d-none corpsDisplay">
		<div class="product-semi-title">기자단 양식첨부<span class="red-stress-text">*</span></div>
			<div class="line-top">
				<div class="d-flex justify-content-start product-text-wrap-div-rows">
					<div class="product-text-margin">
						<span class="input-side-text">파일첨부</span>
					</div>
					<div class="mb-3 input-location d-flex">
						<input type="text" id="corpsFileNameInput" class="form-control product-not-append-div image-input-div" readonly/>
						<div class="input-group-append">
							<input type="button" id="corpsUploadBtn" class="product-file-upload text-center" value="파일찾기">
						</div>
						<input type="file" id="corpsFile" class="d-none" accept=".zip, .apk, .rar, .7z, .tar">
					</div>
				</div>
				<div class="product-text-wrap-div-rows">
					<div class="product-text-margin product-corps-file">
						<span>1개의 압축파일로 업로드하세요</span>
					</div>
				</div>
			</div>
		</div>
		
		<!-- 상품설명-[공통] -->
		<div class="product-div-line-box d-none commonDisplay">
		<div class="product-semi-title">상품설명<span class="red-stress-text">*</span></div>
			<div class="line-top">
				<div class="d-flex justify-content-center product-text-wrap-div-rows">
					<div class="mt-2">
						<textarea class="product-detail-textarea" placeholder="내용을 입력하세요." id="editor" name="editor">${data.editor}</textarea>
					</div>
				</div>
			</div>
		</div>
		
		<div class="d-none commonDisplay">
		<!-- 하단 텍스트-[공통] -->
		<div class="d-flex justify-content-end">	
			<div class="product-total-bottom-text">
				<div class="d-flex justify-content-end">
					<span>기간: <span class="start-date-text">시작일</span> ~ <span class="end-date-text">종료일</span></span>
				</div>	
				<div class="d-flex justify-content-end">
					<span>모집인원: <span class="applicants-count-bottom">00</span>명</span>
				</div>	
				<div class="d-flex justify-content-end">	
					<span>지급포인트: <span class="paidPoint">00</span>P</span>
				</div>
				<div class="d-flex justify-content-end">		
					<span>수수료(10%): 10,000P</span>
				</div>	
			</div>
		</div>
		
		<!-- 하단 결제금액-[공통] -->
		<div class="product-total-bottom-text-line"></div>
		<div class="d-flex justify-content-end">	
			<div class="product-total-bottom-charge-text">
				<div class="d-flex justify-content-end">
					<span class="font-weight-bold mr-5">총 결제 금액</span>
					<span class="product-total-bottom-text mr-2">총 <span class="applicants-count-bottom">00</span>명</span>
					<span class="font-weight-bold"><span class="totlaPayment">00</span>P</span>
				</div>	
			</div>
		</div>
		<!-- 체험단모집-[공통] -->
		<div class="d-flex justify-content-end">
			<input type="button" id="productSubmitBtn" class="text-center" value="체험단 모집">
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
   ClassicEditor
   	.create( document.querySelector( '#editor' ),{
   		language: 'ko'	//언어설정
   	})
   		.then(editor => {
   			theEditor =editor;
   		})
   	.catch( error => {
   		console.error(error);
   	});
</script>
<script>
	$(document).ready(function(){
		$('#serviceCategory1').on('change' ,function(){
			$('.commonDisplay').removeClass('d-none');
			
			if($('#serviceCategory1 option:checked').val() == 'onlineProduct') {
				$('#serviceCategory2-onlineProduct').removeClass('d-none');
				$('#serviceCategory2-offlineStore').addClass('d-none');
				
				$('.onlineDisplay').removeClass('d-none');
				$('.offlineDisplay').addClass('d-none');
				$('.corpsDisplay').addClass('d-none');
				return;
			} else if ($('#serviceCategory1 option:checked').val() == 'offlineStore') {
				$('#serviceCategory2-offlineStore').removeClass('d-none');
				$('#serviceCategory2-onlineProduct').addClass('d-none');
				
				$('.offlineDisplay').removeClass('d-none');
				$('.onlineDisplay').addClass('d-none');
				$('.corpsDisplay').addClass('d-none');
				return;
			} else if($('#serviceCategory1 option:checked').val() == 'pressCorps') {
				$('#serviceCategory2-onlineProduct').addClass('d-none');
				$('#serviceCategory2-offlineStore').addClass('d-none');
				
				$('.corpsDisplay').removeClass('d-none');
				$('.onlineDisplay').addClass('d-none');
				$('.offlineDisplay').addClass('d-none');
				return;
			}
		});
		
		$("#imageUploadBtn").on('click', function(){
			// id="file" 클릭 호출
			$('#file').click()
		});
		
		$("#corpsUploadBtn").on('click', function(){
			// id="file" 클릭 호출
			$('#corpsFile').click()
		});
		
		$('#numberOfApplicants').on('change', function(){
			$('.applicants-count-bottom').text($(this).val());
		});
		
		$('#corpsFile').on('change', function(){
			let fileName = this.files[0].name;
			console.log(fileName);
			$('#corpsFileNameInput').val(fileName)
		});
		
		$('#file').on('change', function(){
			let fileName = this.files[0].name;
			console.log(fileName);
			$('#fileNameInput').val(fileName)
		});
		$('#startDate').on('change', function(){
			let startDate = $('#startDate').val();
			let endDate = $('#endDate').val();
			
			$('.start-date-text').text($(this).val());
			$('.start-date-text').removeClass('d-none');
			$('.end-center-start').removeClass('d-none');
			
			if (!$('.end-date-text').hasClass('d-none')) {
				$.ajax({
					url:"/sellpost/caldate"
					,data:{"startDate":startDate ,"endDate":endDate}
					,success:function(data) {
						/* location.reload(); */
						$('.date-of-progressed').removeClass('d-none');
						alert(data.code);
						$('.progress-of-period-text-stress').text(data.code);
					}
				})
			}
		});
		
		$('#endDate').on('change', function(){
			let startDate = $('#startDate').val();
			let endDate = $('#endDate').val();
			
			$('.end-date-text').text($(this).val());
			$('.end-date-text').removeClass('d-none');
			
			$.ajax({
				url:"/sellpost/caldate"
				,data:{"startDate":startDate ,"endDate":endDate}
				,success:function(data) {
					/* location.reload(); */
					$('.date-of-progressed').removeClass('d-none');
					alert(data.code);
					$('.progress-of-period-text-stress').text(data.code);
				}
			})
		});
		
		$('#productSubmitBtn').on('click', function(){
			alert("ddd");
			
			let serviceCategory1 = $('#serviceCategory1 option:checked').val();
			let serviceCategory2 = $('#serviceCategory2 option:checked').val();
			let serviceCategory3 = $('#serviceCategory3 option:checked').val();
			
			let productName = $('#productName').val();
			let productUrl = $('#productUrl').val();
			let numberOfApplicants = $('#numberOfApplicants').val();
			
			let salesMethod =$('input[name=salesMethod]:checked').val();
			
			let startDate = $('#startDate').val();
			let endDate = $('#endDate').val();
			
			let discountRate = $('#discountRate').val();
			let productDescriptions = theEditor.getData();
			console.log(productDescriptions);
			let thumbnailImgPath = $('#file').val();
			
			console.log(serviceCategory1);
			console.log(salesMethod);
			console.log(thumbnailImgPath);
			
			let formData = new FormData();
			formData.append("let serviceCategory1", serviceCategory1);
			formData.append("let serviceCategory2", serviceCategory2);
			formData.append("let serviceCategory3", serviceCategory3);
			formData.append("productName", productName);
			formData.append("productUrl", productUrl);
			formData.append("numberOfApplicants", numberOfApplicants);
			formData.append("salesMethod", salesMethod);
			formData.append("startDate", startDate);
			formData.append("endDate", endDate);
			formData.append("discountRate", discountRate);
			formData.append("productDescriptions", productDescriptions);
			formData.append("thumbnailImgPath", thumbnailImgPath);
			formData.append("discountRate", serviceCategory3);
		});
		
		$.datepicker.setDefaults({
			dateFormat:"yy-mm-dd"
            ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
			,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
            ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
            ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
            ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
            ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
            ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
		});
		
		$('#startDate').datepicker({
			minDate: 0 //오늘 이후부터 선택
			,onClose: function( selectedDate ) {    
	          $("#endDate").datepicker( "option", "minDate", selectedDate );
	          /* $("#endDate").datepicker( "option", "maxDate", ${selectedDate + 30} ); */
	          
			}
		});
		
		$('#endDate').datepicker({
			onClose: function( selectedDate ) {
               $("#startDate").datepicker( "option", "maxDate", selectedDate );
			}
		});
		
		doComma = function(str) {
			/* alert(str); */
	        if (str != null && str != '') {
		        /* 문자를 숫자로 변환 => 숫자외 문자입력시 빈공간으로 교체 false시 0 */
		        var tmps = parseInt(str.value.replace(/[^0-9]/g, '')) || '0';
		        /* 콤마찍기 정규식*/
		        var tmps2 = tmps.toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, '$1,');
		        str.value = tmps2;
		    }
		}
		
		doCalculate = function() {
			let sellPrice = parseInt($('#sellPrice').val().replaceAll(",", ""));
			let applicants = parseInt($('#numberOfApplicants').val().replaceAll(",", ""));
			let discountPrice = parseInt($('#discountRate').val().replaceAll(",", ""));
			
			if ($('#numberOfApplicants').val() != ""){
				alert("조건1");
			}
			/* 인원  * 포인트 */
			/* (인원 * 포인트) * 0.1 */
			if ($('select[name=wonOrPercent] option:checked').val() == "percent"){
				let paidPoint = (sellPrice - Math.ceil(sellPrice * ( 1 - (discountPrice / 100))));
				$('.totlaPayment').text((applicants * paidPoint).toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, '$1,'))
				return;
			} else if ($('select[name=wonOrPercent] option:checked').val() == "won") {
				$('.totlaPayment').text((applicants * discountPrice).toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, '$1,'))
			}
		}
		
		$('#price-select-box').change(function(){
			$('#discountRate').change()
		});
		
		$('#discountRate').change(function(){
			let sellPrice = parseInt($('#sellPrice').val().replaceAll(",", ""));
			let discountPrice = parseInt($(this).val().replaceAll(",", ""));
			
			if ($('select[name=wonOrPercent] option:checked').val() == "won") {
				/* 할인가격(원)이 판매가격보다 높을경우 */
				if (discountPrice >= sellPrice) {
					alert("할인가격이 판매가격보다 높을 수 없습니다.");
					$(this).val("");
					return;
				}
				$('#finalPrice').text((sellPrice - discountPrice).toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, '$1,'));
				$('.paidPoint').text(discountPrice.toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, '$1,'));
				return;
			}
			if ($('select[name=wonOrPercent] option:checked').val() == "percent"){
				if (discountPrice >= 100) {
					alert("할인율은 100%를 넘을 수 없습니다.");
					$(this).val("");;
					return;
				} (sellPrice - Math.ceil(sellPrice * ( 1 - (discountPrice / 100))))
				$('#finalPrice').text(Math.ceil(sellPrice * ( 1 - (discountPrice / 100))).toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, '$1,'));
				/* $('#finalPrice').text((sellPrice * (1 - (discountPrice / 100)) ).toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, '$1,')); */
				
				$('.paidPoint').text((sellPrice - Math.ceil(sellPrice * ( 1 - (discountPrice / 100)))).toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, '$1,'));
				/* $('.paidPoint').text(discountPrice.toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, '$1,')); */
				return;
			}
		});
		
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
					console.log(addr);	               
	                $('#address').val(addr);
	                document.getElementById('address').value = addr;
	                
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("detailAddress").focus();
	            }
	        }).open();
	    };
	});

</script>