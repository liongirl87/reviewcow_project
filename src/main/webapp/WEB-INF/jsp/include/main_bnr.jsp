<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<div id="main-bn" class="d-flex justify-content-center">   
	<div class="main-bnr">
		<div class="mySlides">
		  <div class="numbertext numbertext-bg">1 / 6</div>
		  <img src="/static/img/main_bnr01.jpg" class="slide-image-size">
		</div>
		
		<div class="mySlides">
		  <div class="numbertext numbertext-bg">2 / 6</div>
		  <img src="/static/img/main_bnr02.jpg" class="slide-image-size">
		</div>
		
		<div class="mySlides">
		  <div class="numbertext numbertext-bg">3 / 6</div>
		  <img src="/static/img/main_bnr03.jpg" class="slide-image-size">
		</div>
		    
		<div class="mySlides">
		  <div class="numbertext numbertext-bg">4 / 6</div>
		  <img src="/static/img/main_bnr04.jpg" class="slide-image-size">
		</div>
		
		<div class="mySlides">
		  <div class="numbertext numbertext-bg">5 / 6</div>
		  <img src="/static/img/main_bnr05.jpg" class="slide-image-size">
		</div>
		    
		<div class="mySlides">
		  <div class="numbertext numbertext-bg">6 / 6</div>
		  <img src="/static/img/main_bnr06.jpg" class="slide-image-size">
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
		   REVIEWCOW
		  </div>
		  <div class="column column-box demo cursor" onclick="currentSlide(2)">
		  23 S/S ������� ��ü����
		  </div>
		  <div class="column column-box demo cursor" onclick="currentSlide(3)">
		  23���� �� �÷��� ��Ī
		  </div>
		  <div class="column column-box demo cursor" onclick="currentSlide(4)">
		  2023 ������ �ÿ��� ������
		  </div>
		  <div class="column column-box demo cursor" onclick="currentSlide(5)">
		  ����ī�� �����Ͽ콺
		  </div>    
		  <div class="column column-box demo cursor" onclick="currentSlide(6)">
		  ������ ������ ��Ư������
		  </div>
		</div>
	</div>	
	</div>
</div> 
<script>
	$(document).ready(function(){
	   	var slideIndex = 1;
	 	showSlides(slideIndex);

	 	plusSlides = function(n) {	// <> ��ư���� ȣ�� onclick
	 		showSlides(slideIndex += n);
	 	}
	 	currentSlide = function(n) {	// �ϴ� �̹��� ��ư���� Ư�� �����̹��� ȣ�� onclick
	 		 showSlides(slideIndex = n);
	 	}

	 	function showSlides(n) {	//n���� �����̵� �̹����� ���
	 		 var i;
	 		 let slides = document.getElementsByClassName("mySlides");
	 		 var dots = document.getElementsByClassName("demo");
	 		 var captionText = document.getElementById("caption");
	 		 
	 		 if (n > slides.length) {slideIndex = 1}	//�� �����̹��� �������� n�� ũ�� �����̵�� �ٽ� ù��° �̹���(1)�� �̵�
	 		 if (n < 1) {slideIndex = slides.length}	//n�� 1���� ������ 0����, �����̵� �̹����� �ǳ� �̹�����(slides.length) ���ư���
	 		 
	 		 for (i = 0; i < slides.length; i++) {	// ������ ǥ�� "1/6, 2/5.." display:none ���� ó��
	 		      slides[i].style.display = "none";
	 		 }
	 		 for (i = 0; i < dots.length; i++) {	// �����̹��� �ϴ��� �ε��� ��ư�� class(active)�� ���ش�
	 		     dots[i].className = dots[i].className.replace(" active", "");
	 		 }
	 		 slides[slideIndex-1].style.display = "block";	// �����̵��̹��� �迭[n-1] ���罽���̵��� display�Ӽ��� block���� ����
	 		 dots[slideIndex-1].className += " active";	// �ε�����ư �迭[n-1] ���� �ε��� ��ưŬ������ active�� �߰��Ѵ�.
	 		 captionText.innerHTML = dots[slideIndex-1].textContent;	// ���� �ε�����ư�� alt=""�� #caption�� ǥ���Ѵ�.
	 		 console.log(slides.length)
	 	}
	 	
	 	setInterval(function(){
	 		slideIndex++;
	 		showSlides(slideIndex);
	 	}, 3000);	// 3�ʿ� �ѹ��� �Լ� ����(3�ʸ��� �̹��� �ڵ� ��ȯ)
	});
</script>
