<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<div id="writeReview"class="d-flex justify-content-center">
	<div id="side-view-right-Tdiv" class="mt-3">
		<div class="main-title"><i class="xi-angle-left"></i>리뷰목록</div>
		<div class="top-review-div">
			<div class="d-flex justify-content-between helpdesk-button-parentDiv semi-title-margin">
			</div>
			<div class="top-subject-div">
				<div class="top-header-div d-flex align-items-center">
					<div class="product-name ml-3">${sellPost.productName}</div>
				</div>	
			</div>
			<div class="d-flex align-items-center writeReview-content-div">
				<div class="text-margin">리뷰 사진첨부</div>
				<div class="input-location d-flex">
					<input type="text" id="fileNameInput" class="form-control product-not-append-div image-input-div review-file-input-box" readonly/>
						<div class="input-group-append">
							<input type="button" id="reviewImageUploadBtn" class="product-file-upload text-center" value="파일찾기">
						</div>
					<input type="file" id="reviewImageFile" class="d-none" accept=".gif, .jpg, .png, .jpeg">
				</div>
			</div>
			<div class="d-flex align-items-center writeReview-content-div">
				<div class="text-margin">한줄 리뷰</div>
				<div class="input-location d-flex">
					<input type="text" id="reviewComment" class="form-control review-file-input-box">
				</div>
			</div>
			<div class="d-flex align-items-center writeReview-content-div">
				<div class="text-margin">평점등록</div>
				<div class="rating-text"><span class="rating-pointText">0</span>.0</div>
				<div class="text-center star-div">
					<div id="star-rating" class="rating-box">
						<div class="stars">
							<i class="fa-solid fa-star" onclick="reviewPoint(1)"></i>
							<i class="fa-solid fa-star" onclick="reviewPoint(2)"></i>
							<i class="fa-solid fa-star" onclick="reviewPoint(3)"></i>
							<i class="fa-solid fa-star" onclick="reviewPoint(4)"></i>
							<i class="fa-solid fa-star" onclick="reviewPoint(5)"></i>
						</div>
			  		</div>
			  	</div>
			</div>
			<div class="d-flex justify-content-end">
				<input type="button" class="mt-2" value="저장하기" id="reviewSaveBtn" data-post-id="${sellPost.id}">
			</div>
		</div>
	</div>
</div>
<script>
// Select all elements with the "i" tag and store them in a NodeList called "stars"
const stars = document.querySelectorAll(".stars i");

// Loop through the "stars" NodeList
stars.forEach((star, index1) => {
  // Add an event listener that runs a function when the "click" event is triggered
  star.addEventListener("click", () => {
    // Loop through the "stars" NodeList Again
    stars.forEach((star, index2) => {
      // Add the "active" class to the clicked star and any stars with a lower index
      // and remove the "active" class from any stars with a higher index
      index1 >= index2 ? star.classList.add("active") : star.classList.remove("active");
    });
  });
});
</script>
<script>

$(document).ready(function(){
	reviewPoint = function(n) {
		$('.rating-pointText').text(n)
	}
	$("#reviewImageUploadBtn").on('click', function(){
		// id="file" 클릭 호출
		$('#reviewImageFile').click()
	});
	
	$('#reviewImageFile').on('change', function(){
		let fileName = this.files[0].name;
		let check = $('#reviewImageFile')[0].files[0];
		
		console.log(fileName);
		console.log(check);
		$('#fileNameInput').val(fileName)
	});
	
	$('#reviewSaveBtn').on('click', function(){
		let point = $('.rating-pointText').text();
		let reviewImgPath = $('#reviewImageFile')[0].files[0];
		let comment = $('#reviewComment').val();
		let sellPostId = $(this).data("post-id");
		
		
		if (!reviewImgPath) {
			alert("리뷰 사진을 첨부해주세요");
			return;
		}
		if (!point) {
			alert("평점을 눌러주세요");
			return;
		} else if (point == 0) {
			alert("평점을 눌러주세요");
			return;
		}
		
		if (!comment) {
			alert("한줄리뷰를 작성해주세요");
			return;
		} 
		
		
		console.log(sellPostId);
		let formData = new FormData();
		formData.append("point", point);
		formData.append("reviewImgPath", reviewImgPath);
		formData.append("comment", comment);
		formData.append("sellPostId", sellPostId);
		
		$.ajax({
			type:"POST"
			,url:"/review/write_review"
			,data:formData
			,enctype:"multipart/form-data"
			,processData:false
			,contentType:false
			
			//response
			,success:function(data){
				if(data.code == 1) {
					alert("리뷰를 작성하였습니다");
					location.href = "/review/myreview_list_view"
				} else {
					alert("리뷰 등록에 실패하였습니다.");
				}
			}
			,error:function(request, status, error) {
				alert("리뷰 등록 실패, 관리자에게 문의주세요");
			}
		});
	});

});

</script>
