<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<div id="writeReview"class="d-flex justify-content-center">
	<div id="side-view-right-Tdiv" class="mt-3">
		<div class="main-title"><i class="xi-angle-left"></i>리뷰목록</div>
		<div class="d-flex justify-content-between helpdesk-button-parentDiv semi-title-margin">
		</div>
		<div class="top-subject-div">
			<div class="top-header-div d-flex align-items-center">
				<div class="product-name ml-3">[좋은상품]두루마리 휴지 3set</div>
			</div>
		</div>
		<div class="d-flex align-items-center writeReview-content-div">
			<div class="text-margin">리뷰 사진첨부</div>
			<div class="input-location d-flex">
				<input type="text" id="fileNameInput" class="form-control product-not-append-div image-input-div review-file-input-box" readonly/>
					<div class="input-group-append">
						<input type="button" id="imageUploadBtn" class="product-file-upload text-center" value="파일찾기">
					</div>
				<input type="file" id="file" class="d-none" accept=".gif, .jpg, .png, .jpeg">
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
	reviewPoint = function(int) {
		$('.rating-pointText').text(int)
	}
});

</script>
