<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<div class="admin-side-div">
	<div class="subject-text-div">
		<ul class="top-ul-box">
			<li><a href="" class="subject-text number py-3" data-application-id="1" >1. ȸ������ <i class="xi-angle-right-min"></i></a>
				<ul class="number-sub-li number1-sub">
					<!-- onclick="event.cancelBubble = true;"  -->
					<li><a href="/admin/business_member_list" class="subject-text-sub"> �����ȸ��(�����)</a></li>
					<li><a href="/admin/member_list" class="subject-text-sub">ȸ�����</a></li>
				</ul>
			</li>
			<li><a href="" class="subject-text number mt-3" data-application-id="2" >2. ü��� ���� <i class="xi-angle-right-min"></i></a>
				<ul class="number-sub-li number2-sub">
					<li><a href="/admin/before_sellpost_list" class="subject-text-sub">ü���(�����)</a></li>
					<li><a href="/admin/sellpost_list" class="subject-text-sub">ü��ܸ��</a></li>
				</ul>
			</li>
			<li><a href="" class="subject-text number" data-application-id="3" >3. ����Ʈ ���� <i class="xi-angle-right-min"></i></a>
				<ul class="number-sub-li number3-sub">
					<li><a href="/admin/charge_points" class="subject-text-sub">����Ʈ ����</a></li>
					<li><a href="/admin/withdraw_points" class="subject-text-sub">����Ʈ ����</a></li>
					<li><a href="/admin/manage_points" class="subject-text-sub">����Ʈ ����</a></li>
				</ul>
			</li>
			<li><a href="" class="subject-text number" data-application-id="4" >4. 1:1���� <i class="xi-angle-right-min"></i></a>
				<ul class="number-sub-li number4-sub">
					<li><a href="/admin/helpdesk" class="subject-text-sub">���� ���</a></li>
				</ul>
			</li>
			<li><a href="" class="subject-text number" data-application-id="5" >5. �������� <i class="xi-angle-right-min"></i></a>
				<ul class="number-sub-li number5-sub">
					<li><a href="/admin/write_notice_view" class="subject-text-sub">���� �ۼ�</a></li>
					<li><a href="/admin/notice_list" class="subject-text-sub">���� ���</a></li>
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