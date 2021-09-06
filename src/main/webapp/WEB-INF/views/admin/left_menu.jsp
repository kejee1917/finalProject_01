<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href='https://fonts.googleapis.com/css?family=Taviraj' rel='stylesheet'>    
<style>
.left_table{
	width: 100%;
	border-collapse: collapse;
}

.left_table td{
	padding: 10px 10px 10px 10px;	/* 상 우 하 좌 */
}

.font, .image{
	color:white;
	border: none;
	cursor: pointer;
}

/* td 꼭 붙여야함 */
.left_table_row:hover td{
	background-color: white;
	color: black;
}

/* img 꼭 붙여야함 */
.left_table_row:hover img{
	-webkit-filter: opacity(.5) drop-shadow(0 0 0 black);
	filter: opacity(.5) drop-shadow(0 0 0 black);
}

.stop-dragging{
  -ms-user-select: none; 
  -moz-user-select: -moz-none;
  -khtml-user-select: none;
  -webkit-user-select: none;
  user-select: none;
}

</style>

<div class="all" style="margin-top: 12px;">

<table class="left_table">
	<tr>
		<td colspan="2" style="font-family:'Taviraj'; font-size: 25px; font-weight:bold; letter-spacing:2px; border-bottom:1px solid #464646;">
			<font class="stop-dragging">Share Verni</font>
		</td>
	</tr>
 	<tr class="left_table_row">
		<td class="image"><img src="./image/admin/wmain.png" width='20px' height='20px'></td>
		<td class="font" onclick="location.href='chart.do'">매출 통계</td>
	</tr>

	<tr class="left_table_row">
		<td class="image"><img src="./image/admin/wadmin.png" width='20px' height='20px'></td>
		<td class="font" onclick="location.href='adminMain.do'">관리자 계정관리</td>
	</tr>
	
	<tr class="left_table_row">
		<td class="image"><img src="./image/admin/wmember.png" width='20px' height='20px'></td>
		<td class="font" onclick="location.href='member.do'">회원 관리</td>
	</tr>
		
	<tr class="left_table_row">
		<td class="image"><img src="./image/admin/worder.png" width='20px' height='20px'></td>
		<td class="font" onclick="location.href='adminOrder.do'">주문/배송 관리</td>
	</tr>
		
	<tr class="left_table_row">
		<td class="image"><img src="./image/admin/wproduct.png" width='20px' height='20px'></td>
		<td class="font" onclick="location.href='product.do'">상품 관리</td>
	</tr>
		
	<tr class="left_table_row">
		<td class="image"><img src="./image/admin/wqna.png" width='20px' height='20px'></td>
		<td class="font" onclick="location.href='productQna.do'">상품문의 관리</td>
	</tr>
		
	<tr class="left_table_row">
		<td class="image"><img src="./image/admin/wreview.png" width='20px' height='20px'></td>
		<td class="font" onclick="location.href='productReview.do'">리뷰 관리</td>
	</tr>
		
	<tr class="left_table_row">
		<td class="image"><img src="./image/admin/wcoupon.png" width='20px' height='20px'></td>
		<td class="font" onclick="location.href='coupon.do'">쿠폰 관리</td>
	</tr>
		
	<!-- <tr class="left_table_row">
		<td class="image"><img src="./image/admin/wpoint.png" width='20px' height='20px'></td>
		<td class="font" onclick="location.href='#'">포인트 관리</td>
	</tr> -->
		
	<tr class="left_table_row">
		<td class="image"><img src="./image/admin/wonline.png" width='20px' height='20px'></td>
		<td class="font" onclick="location.href='onlineQna.do'">온라인 문의(1:1)</td>
	</tr>
		
	<tr class="left_table_row">
		<td class="image"><img src="./image/admin/wmessage.png" width='20px' height='20px'></td>
		<td class="font" onclick="location.href='messageList.do?sorting=all'">메시지 관리</td>
	</tr>
	
	<tr class="left_table_row">
		<td class="image"><img src="./image/admin/wchat.png" width='20px' height='20px'></td>
		<td class="font" onclick="location.href='adminlist.do'">채팅 목록</td>
	</tr>
		
	<tr class="left_table_row">
		<td class="image"><img src="./image/admin/wFAQ.png" width='20px' height='20px'></td>
		<td class="font" onclick="location.href='faq.do'">FAQ</td>
	</tr>
</table>

</div>