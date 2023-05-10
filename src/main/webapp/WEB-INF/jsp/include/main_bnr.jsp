<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<div class="d-flex justify-content-center">   
	<div class="main-bnr">
		<div class="mySlides">
		  <div class="numbertext numbertext-bg">1 / 6</div>
		  <img src="/static/img/main_bnr01.png" class="slide-image-size">
		</div>
		
		<div class="mySlides">
		  <div class="numbertext numbertext-bg">2 / 6</div>
		  <img src="/static/img/main_bnr02.png" class="slide-image-size">
		</div>
		
		<div class="mySlides">
		  <div class="numbertext numbertext-bg">3 / 6</div>
		  <img src="/static/img/main_bnr03.png" class="slide-image-size">
		</div>
		    
		<div class="mySlides">
		  <div class="numbertext numbertext-bg">4 / 6</div>
		  <img src="/static/img/main_bnr04.png" class="slide-image-size">
		</div>
		
		<div class="mySlides">
		  <div class="numbertext numbertext-bg">5 / 6</div>
		  <img src="/static/img/main_bnr05.png" class="slide-image-size">
		</div>
		    
		<div class="mySlides">
		  <div class="numbertext numbertext-bg">6 / 6</div>
		  <img src="/static/img/main_bnr06.png" class="slide-image-size">
		</div>
		<div class="d-flex justify-content-between">
			<a class="prev" onclick="plusSlides(-1)"><</a>
			<a class="next" onclick="plusSlides(1)">></a>
		</div>
		<div class="caption-container">
	    <p id="caption"></p>
		</div>
	<div class="d-flex justify-content-center">
		<div class="row">
		  <div class="column column-box cursor demo" onclick="currentSlide(1)">
		   <span style="display:none;">1번 이미지</span>
		  </div>
		  <div class="column column-box demo cursor" onclick="currentSlide(2)">
		  2번 이미지
		  </div>
		  <div class="column column-box demo cursor" onclick="currentSlide(3)">
		  3번 이미지
		  </div>
		  <div class="column column-box demo cursor" onclick="currentSlide(4)">
		  4번 이미지
		  </div>
		  <div class="column column-box demo cursor" onclick="currentSlide(5)">
		  5번 이미지
		  </div>    
		  <div class="column column-box demo cursor" onclick="currentSlide(6)">
		  6번 이미지
		  </div>
		</div>
	</div>	
	</div>
</div> 
<script>
	
	$(document).ready(function(){
	   	var slideIndex = 1;
	 	showSlides(slideIndex);

	 	plusSlides = function(n) {	// <> 버튼으로 호출 onclick
	 		showSlides(slideIndex += n);
	 	}
	 	currentSlide = function(n) {	// 하단 이미지 버튼으로 특정 베너이미지 호출 onclick
	 		 showSlides(slideIndex = n);
	 	}

	 	function showSlides(n) {	//n번의 슬라이드 이미지를 출력
	 		 var i;
	 		 let slides = document.getElementsByClassName("mySlides");
	 		 var dots = document.getElementsByClassName("demo");
	 		 var captionText = document.getElementById("caption");
	 		 
	 		 if (n > slides.length) {slideIndex = 1}	//총 베너이미지 갯수보다 n이 크면 슬라이드는 다시 첫번째 이미지(1)로 이동
	 		 if (n < 1) {slideIndex = slides.length}	//n이 1보다 작으면 0부터, 슬라이드 이미지는 맨끝 이미지로(slides.length) 돌아간다
	 		 
	 		 for (i = 0; i < slides.length; i++) {	// 페이지 표시 "1/6, 2/5.." display:none 으로 처리
	 		      slides[i].style.display = "none";
	 		 }
	 		 for (i = 0; i < dots.length; i++) {	// 베너이미지 하단의 인덱스 버튼의 class(active)를 없앤다
	 		     dots[i].className = dots[i].className.replace(" active", "");
	 		 }
	 		 slides[slideIndex-1].style.display = "block";	// 슬라이드이미지 배열[n-1] 현재슬라이드의 display속성을 block으로 설정
	 		 dots[slideIndex-1].className += " active";	// 인덱스버튼 배열[n-1] 현재 인덱스 버튼클래스에 active를 추가한다.
	 		 captionText.innerHTML = dots[slideIndex-1].textContent;	// 현재 인덱스버튼의 alt=""를 #caption에 표시한다.
	 		 console.log(slides.length)
	 	}
	 	
	 	setInterval(function(){
	 		slideIndex++;
	 		showSlides(slideIndex);
	 	}, 3000);	// 3초에 한번씩 함수 실행(3초마다 이미지 자동 변환)
	});
</script>
