<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<div class="admin-side-div">
	<div class="subject-text-div">
		<ul class="top-ul-box">
			<li><a href="" class="subject-text number py-3" data-application-id="1" >1. 회원관리 <i class="xi-angle-right-min"></i></a>
				<ul class="number-sub-li number1-sub">
					<!-- onclick="event.cancelBubble = true;"  -->
					<li><a href="/admin/business_member_list" class="subject-text-sub"> 사업자회원(대기중)</a></li>
					<li><a href="/admin/member_list" class="subject-text-sub">회원목록</a></li>
				</ul>
			</li>
			<li><a href="" class="subject-text number mt-3" data-application-id="2" >2. 체험단 관리 <i class="xi-angle-right-min"></i></a>
				<ul class="number-sub-li number2-sub">
					<li><a href="/admin/before_sellpost_list" class="subject-text-sub">체험단(대기중)</a></li>
					<li><a href="/admin/sellpost_list" class="subject-text-sub">체험단목록</a></li>
				</ul>
			</li>
			<li><a href="" class="subject-text number" data-application-id="3" >3. 포인트 관리 <i class="xi-angle-right-min"></i></a>
				<ul class="number-sub-li number3-sub">
					<li><a href="/admin/charge_points" class="subject-text-sub">포인트 충전</a></li>
					<li><a href="/admin/withdraw_points" class="subject-text-sub">포인트 인출</a></li>
					<li><a href="/admin/manage_points" class="subject-text-sub">포인트 관리</a></li>
				</ul>
			</li>
			<li><a href="" class="subject-text number" data-application-id="4" >4. 1:1문의 <i class="xi-angle-right-min"></i></a>
				<ul class="number-sub-li number4-sub">
					<li><a href="/admin/helpdesk" class="subject-text-sub">문의 목록</a></li>
				</ul>
			</li>
			<li><a href="" class="subject-text number" data-application-id="5" >5. 공지사항 <i class="xi-angle-right-min"></i></a>
				<ul class="number-sub-li number5-sub">
					<li><a href="/admin/write_notice_view" class="subject-text-sub">공지 작성</a></li>
					<li><a href="/admin/notice_list" class="subject-text-sub">공지 목록</a></li>
				</ul>
			</li>
		</ul>
	</div>
</div>

<script>
	$(document).ready(function(){
		$(".number").click('on', function(e){
			e.preventDefault();
			var number = $(this).data("application-id");
 			if($('.number'+ number +'-sub').is(":visible")) {
				$('.number'+ number +'-sub').slideUp();
			} else {
				$('.number'+ number +'-sub').slideDown();
			} 
		});
		
		moveBusinessMember = function(){
			alert("ttt");
			$('.admin-manage-div').load("/admin/business_member_list")
		}
	});

</script>