<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./css/productDetail/radio_button.css" type="text/css">

<meta charset="UTF-8">
<title>Share Verni</title>

</head>
<body>

<!-- 메뉴 아이콘, 이름 -->
<div style="width: auto;" align="center">
	<div class="contianer" style="padding-left: 11%; padding-right: 11%;"
		align="center">
	<br>
	
		<div class="container" style="width: auto;">
			<nav class="navbar navbar-expand-md" style="border-radius: 0; padding: 0; margin: 0; background-color: white; ">
				<div class="collapse navbar-collapse" id="collapsibleNavbar">
					<span class="material-icons">
					payment
					</span>
		
					<b style="font-size: 20px;">주문/결제완료</b>
					
				</div>
			</nav>
		</div>
	</div>
</div>		


<div align="center" style="margin: 100px;">
	<table id="complete-table" style="border-collapse: collapse;">
	<col width="250px"><col width="250px">
	
		<tr align="center" style="height: 100px;">
			<td colspan="2">
			<p style="font-size: 23px; font-weight:bold;">
			주문이 성공적으로 완료되었습니다.</p>
			주문하신 내역은 마이페이지 > 주문내역에서 확인하실 수 있습니다.
			</td>
		</tr>
		
		<tr><td colspan="2" style="border-bottom:1px solid gray;"></td></tr>
		<tr style="background-color: #F7F7F7;" align="center">
			<th style="border-left:none; height:30px; border-right:none;"><p style="margin-top:10px; font-size: 17px;">주문번호</p></th>
			<th><p style="margin-top:10px; font-size: 17px;">결제금액</p></th>
		</tr>
		<tr align="center" style="background-color: #FFF;">
			<td><p style="font-size: 20px;">${completeInfo.o_number}</p></td>
			<td>
			<fmt:formatNumber type="number" maxFractionDigits="3" var="t_price" value="${completeInfo.o_total}" />
			<p style="font-size: 25px; font-weight: bold;">${t_price}</p></td>
		</tr>
		<!-- <tr style="height: 50px;"><th align="left">주문번호</th><td>2417892732431</td></tr>
		<tr style="height: 70px;"><th align="left">배송지정보</th><td>이대장<br>01034078234<br>서울특별시 백범로 25길 64 3057동 1109</td></tr>
		<tr style="height: 70px;"><th align="left">결제정보</th><td>신용카드<br>일시불<br>승인일시 2021-08-11 14:23:11</td></tr>
		-->
		<tr><td colspan="2" style="border-top:1px solid gray;"></td></tr>
		<tr style="height: 50px;"></tr>
	
	</table>
	<input type="button" class="btnEm sizeS" value="쇼핑 계속하기" style="width:200px; height:30px; margin-right:15px" onclick="location.href='main.do'">
	<input type="button" class="btnSubmit sizeS" value="주문내역 확인" style="width:200px; height:30px;" onclick="location.href='myorder.do'">
	<div style="height: 100px"></div>
</div>


</body>
</html>