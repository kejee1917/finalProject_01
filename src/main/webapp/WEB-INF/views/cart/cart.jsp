<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./css/productDetail/radio_button.css" type="text/css">

<style type="text/css">

.img-wrap{
	position: relative;
	width: 100px; 
	height: 100px;
	margin: auto;
}

.cart_img{
	width: 100%;
	vertical-align: middle;
}

.img-text{
	text-align: center;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate( -50%, -50% );
	
}

.img-text p{
	color: white;
	font-size: 15px;
}

/*
#cart-body{
	font-size: 13px;
}
*/
#cart-table th{
	font-size: 13px;
}

#cart-table td{
	font-size: 13px;
	padding-top: 10px; 
	padding-bottom: 10px;
} 

</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body id="cart-body">

<!-- 메뉴 아이콘, 이름 -->
<!-- <div style="width: auto;" align="center">
	<div class="contianer" style="padding-left: 11%; padding-right: 11%;"
		align="center">
	<br>
	
		<div class="container" style="width: auto;">
			<nav class="navbar navbar-expand-md" style="border-radius: 0; padding: 0; margin: 0; background-color: white; ">
				<div class="collapse navbar-collapse" id="collapsibleNavbar">
					<span class="material-icons">
						shopping_cart
					</span>
		
					<b style="font-size: 20px;">장바구니</b>
				
				</div>
			</nav>
		</div>
	</div>
</div>		 -->		



<div class="contianer" style="width: auto; height: auto; padding-left: 20%; padding-right: 20%; padding-top: 15px;"><br>
 <h5>
         <strong style="font-size: 20px"><i class="fas fa-shopping-cart"></i>&nbsp;장바구니</strong>&nbsp;&nbsp; 장바구니 상품은 최대 30일간 저장됩니다.
      </h5>
   <br><br>
<c:if test="${empty cartList}">
 <br><br><br><br>
 <div align="center">
    <h2><img src="./image/detail/cart.png" width="47px"><br><br>
      장바구니에 담긴 상품이 없습니다.</h2>
      <h5 align="center" style="color: gray">원하는 상품을 장바구니에 담아보세요!</h5>
      
	<input type="button" class="btnEm sizeS" value="쇼핑 계속하기" style="margin-top:20px; margin-bottom:240px; width:150px; height:30px;" onclick="location.href='main.do'">
 </div>
</c:if>

<c:if test="${not empty cartList}">
<div align="center">
<table id="cart-table">
<!-- 체크박스 이미지 상품명 대여기간 가격 -->
<col width="70px"><col width="150px"><col width="400px"><col width="100px"><col width="120px">
	<tr>
        <th colspan="5"><hr style="background-color: #2E4D58; height: 2px;"></th>
    <tr>
<tr>
<th><input type="checkbox" name="all-check" checked></th><th colspan=2 style="text-align:center; margin-left:30px;">상품정보</th><th style="text-align:left;">대여기간</th><th style="text-align:left; padding-left: 10px;">가격</th>
	<tr>
        <th colspan="5"><hr style="background-color: #2E4D58;"></th>
    <tr>
<c:set var="total" value="0" />
	<c:forEach items="${cartList}" var="cart" varStatus="i">
	 
        
		<tr>
		<th><input type="hidden" class="c_no" value="${cart.c_no}">
		<input type="hidden" class="p_status" value="${cart.p_status}">
		<input type="checkbox" name="checkbox" class="cart-checkbox" value="${cart.c_price}"></th>

	<c:choose>
		<c:when test="${cart.p_status eq '대여중'}">
			<td onclick="location.href='productDetail.do?p_no=${cart.c_no}'" style="cursor:pointer;"><div class="img-wrap"><div class="cart-img"><img alt="" src="./upload/thumbnailImage/${cart.p_newimage1}" style="position: relative; width:100px; height: 100px; object-fit: fill; -webkit-filter: grayscale(100%); filter: gray;">
			</div><div class="img-text"><p>대여중</p></div>
			</div>
			</td>
	
		<td onclick="location.href='productDetail.do?p_no=${cart.c_no}'" style="cursor:pointer; color: gray; text-align: left; padding-left: 20px;">
		<h3>
		<c:set var="p_brand" value="${cart.p_brand}" />
			<c:choose>
				<c:when test="${fn:contains(p_brand, '_')}">
					<c:set var="p_brand" value="${fn:replace(p_brand, '_', '&')}" />
				</c:when>
				<c:when test="${fn:contains(p_brand, '-')}">
					<c:set var="p_brand" value="${fn:replace(p_brand, '-', ' ')}" />
				</c:when>
			</c:choose>
			
			[${p_brand}]</h3><br><font style="margin-top:-20px;">${cart.p_name}</font></td>
		<td>
	
	<select style="color:gray;" name="period" class="period">
	    <option value="3일" ${cart.c_period eq '3일' ? 'selected="selected"' : ''}>3일</option>
	    <option value="5일" ${cart.c_period eq '5일' ? 'selected="selected"' : ''}>5일</option>
	</select>
	</td>
	
	<fmt:formatNumber type="number" maxFractionDigits="3" var="p_price" value="${cart.c_price}" />
	<td><div class="p_price" style="color:gray;">${p_price}</div></td>
	</c:when>



	<c:otherwise> 
	<td onclick="location.href='productDetail.do?p_no=${cart.c_no}'" style="cursor:pointer;"><div class="img-wrap"><img alt="" src="./upload/thumbnailImage/${cart.p_newimage1}" style="width:100px; height: 100px; object-fit: fill;"></div></td>
	<%-- <td><div class="img-wrap"><img alt="" src="image/${cart.p_newimage1}" style="width:80px; height: 80px; object-fit: fill;"></div></td>
	 --%>
	<td style="text-align: left; padding-left: 20px; cursor:pointer;" onclick="location.href='productDetail.do?p_no=${cart.c_no}'">
	
	<h3>
	<c:set var="p_brand" value="${cart.p_brand}" />
		<c:choose>
			<c:when test="${fn:contains(p_brand, '_')}">
				<c:set var="p_brand" value="${fn:replace(p_brand, '_', '&')}" />
			</c:when>
			<c:when test="${fn:contains(p_brand, '-')}">
				<c:set var="p_brand" value="${fn:replace(p_brand, '-', ' ')}" />
			</c:when>
		</c:choose>
		
		[${p_brand}]</h3><br>${cart.p_name}</td>
	<td>
	<select name="period" class="period">
	    <option value="3일" ${cart.c_period eq '3일' ? 'selected="selected"' : ''}>3일</option>
	    <option value="5일" ${cart.c_period eq '5일' ? 'selected="selected"' : ''}>5일</option>
	</select>
	</td>
	
	<fmt:formatNumber type="number" maxFractionDigits="3" var="p_price" value="${cart.c_price}" />
	<td><div class="p_price">${p_price}</div></td>
	
	</c:otherwise>
	</c:choose>



</tr>
<input type="hidden" value="${cart.p_price}" name="originPrice" class="originPrice"/>
<c:set var="total" value="${total + cart.c_price}" />
	<tr>
        <td colspan="5"><hr style="background-color: #2E4D58;"></td>
    <tr>
</c:forEach>

<tr>
<td colspan=5 align="right" style="padding-bottom: 10px;"><font id="point"></font><input type=button class="btnEm sizeS" style="margin-left:10px; width:110px; height:30px;" id="deleteBtn" value="선택상품 삭제"></td>
</tr>

</table>
</div>




<div align="center">

<table style="margin: 40px; font-size: 13px;">
	
	<col width="50px"><col width="130px"><col width="70px"><col width="100px"><col width="230px"><col width="230px">

	<tr>
        <td colspan="6"><hr style="background-color: #F2F2F2;"></td>
    <tr>
    <tr>
		<td><br><br></td>
	</tr>
	<tr align="center">
		<th>&nbsp;</th><th>총 상품금액</th><th>&nbsp;</th><th>배송비</th>
		
		<c:set var="totalPrice" value="${total + shipCost}" />
		<fmt:formatNumber type="number" maxFractionDigits="3" var="t_price" value="${totalPrice}" />
		
		<td colspan=2 rowspan=2 >총 주문금액 <font id="total-sum" style="font-weight: bold; font-size: 30px; margin-left: 20px">${t_price}원</font></td>
		
	</tr>

	<tr align="center">
		<td>&nbsp;</td>
		<fmt:formatNumber type="number" maxFractionDigits="3" var="tp_price" value="${total}" />
		<td><font id="amount">${tp_price}원</font></td><td>+</td>
		<%-- <c:if test="${total ge 50000?'0원':'2500원'}" var="shipCost"/> --%>
		<c:choose>
		<c:when test="${total ge 50000}">
			<c:set var="ship-cost" value="0" />
			<td><div id="shipping-cost">0원</div></td>
		</c:when>
		<c:when test="${total lt 50000}">
			<c:set var="ship-cost" value="2500" />
			<fmt:formatNumber type="number" maxFractionDigits="3" var="s_cost" value="2500" />
			<td><div id="shipping-cost">${s_cost}원</div></td>
		</c:when>
		</c:choose>
	</tr>
	<tr>
		<td><br><br></td>
	</tr>
	<tr>
        <td colspan="6"><hr style="background-color: #F2F2F2;"></td>
    <tr>
</table>


</div>


<div align="center" style="margin-top: 30px; margin-bottom: 100px;">
	<input type="button" class="btnEm sizeS" value="쇼핑 계속하기" style="width: 200px; height: 30px; margin-right:15px" onclick="location.href='main.do'">
	<input type="button" class="btnSubmit sizeS" style="width: 200px; height: 30px;" id="orderBtn" value="주문하기">
</div>
</c:if>
</div>

<script type="text/javascript">

/* 체크박스 초기값 세팅 */
if($("input:checkbox[name='all-check']").is(":checked") == true){
	let level = ${login.m_level};
	let sum = ${total};
	
	if(level == 2){ // 일반회원
		point = sum * 0.01;
		//point = Math.round(point/10) * 10;
	} else if(level == 3){ // 실버회원
		point = sum * 0.03;
	} else if(level == 4){ // 골드회원
		point = sum * 0.05;
	} else if(level == 5){ // 다이아회원
		point = sum * 0.07;
	}
	
	point = Math.round(point);
	$("#point").html(point + "P 적립 예정 ");
	
	$("input:checkbox[name='checkbox']").prop("checked", true);
	
} else {
	
	$("input:checkbox[name='checkbox']").prop("checked", false);
}

/* 전체 체크박스 클릭이벤트 */
$("input:checkbox[name='all-check']").on("click", function() {
	if($("input:checkbox[name='all-check']").is(":checked") == true){ // 전체 체크박스 선택시 
		
		$("input:checkbox[name='checkbox']").prop("checked", true);
		amountSum();
		
	} else { // 전체 체크박스 해제
		
		$("input:checkbox[name='checkbox']").prop("checked", false);
	
		$("#shipping-cost").html("0원"); // 배송비
		$("#total-sum").html("0원"); // 총 주문금액
		$("#amount").html("0원"); // 총 상품금액 
		$("#point").html("0P 적립 예정 "); // 적립 예정 포인트
	}

});



/* 개별 체크박스 클릭이벤트 */
$("input:checkbox[name='checkbox']").on("click", function() {
	
	if($(this).is(":checked") == false){ // 체크박스가 하나라도 체크가 안되어있을 경우
		
		$("input:checkbox[name='all-check']").prop("checked", false); // 전체선택 체크 해제
		amountSum();
		
	} else {
		amountSum();
	}
	
	let all = $("input:checkbox[name='checkbox']").length;
	let count = $("input:checkbox[name='checkbox']:checked").length;

	// 개별 체크박스 체크된 개수가 전체 개별 체크박스 수와 같을 때 
	if(all == count){
		// 전체 체크박스 체크표시
		$("input:checkbox[name='all-check']").prop("checked", true);
	}
	
	if(count == 0){
		$("#shipping-cost").html("0원");
		$("#total-sum").html("0원");
	}
	
	
});

// 대여기간 클릭시 체크박스 선택처리
$(".period").on("click", function() {
	
	let idx = $(".period").index(this);
	$(".cart-checkbox").eq(idx).prop("checked",true);

});
	

//대여 기간변경시 DB업데이트 및 가격 처리 
$(".period").change(function() {

	let idx = $(".period").index(this);
	let cart_no = $(".c_no").eq(idx).val();
	let period = $(this).val();
	
	let price = $(".originPrice").eq(idx).val(); // 상품원가
	
	if(period == '5일'){
       price = price * 1.5;
     } 

	//alert(cart_no);
	//alert(price);
	
	$.ajax({
    url:"changePeriod.do",
    type:"GET",
    data: { c_no : cart_no, 
    		c_period : period,
    		c_price : price },
    success:function(data){
    	
    	   $(".p_price").eq(idx).html(makeComma(price));
    	   $(".cart-checkbox")[idx].value = price;
    	   
       	   amountSum();
      
    },
    error:function(){
       alert('error');
    } 
 });   
	
});


// 주문하기 버튼 클릭시
$("#orderBtn").click(function() {
	
    let check_idx = "";
    let count = $(".cart-checkbox").length;
    
	for (var i = 0; i < count; i++) {  
		if ($(".cart-checkbox")[i].checked == true) {
			if($(".p_status").eq(i).val() == '대여중'){
				alert("대여불가한 상품이 있습니다.");
				return;
			} 
			check_idx += i + ",";
			
		}
	}
	
	if(check_idx == ""){ // 전체 체크박스 해제시
		alert("선택된 상품이 없습니다.");
		return;
	}
	
	check_idx = check_idx.substring(0, check_idx.lastIndexOf(","));
	
	//alert(check_idx);
	
	location.href="payment.do?index=" + check_idx;
	
});

// 선택 삭제 버튼 클릭시 
$("#deleteBtn").click(function() {
	let cart_no = 0;
	let no = "";
	let count = $(".cart-checkbox").length;
	
	// 선택된 체크박스 확인하여 해당 c_no 구하기 
	for (var i = 0; i < count; i++) {  
		if ($(".cart-checkbox")[i].checked == true) {
			cart_no = $(".c_no").eq(i).val();
			
			no += cart_no + ",";
		}
	}
	
	no = no.substring(0, no.lastIndexOf(","));
	
	location.href="deleteCart.do?no=" + no;
});



function amountSum() {
	
	let level = ${login.m_level};
	
	let sum = 0;
	let shipCost = 0;
	let point = 0;
	let count = $(".cart-checkbox").length;
	for (var i = 0; i < count; i++) {  
		if ($(".cart-checkbox")[i].checked == true) {
			sum += parseInt($(".cart-checkbox")[i].value);
		}
	} 
	
	if(sum < 50000){ // 배송비
		shipCost = 2500;
	} else {
		shipCost = 0;
	}
	
	if(level == 2){ // 일반회원
		point = sum * 0.01;
	} else if(level == 3){ // 실버회원
		point = sum * 0.03;
	} else if(level == 4){ // 골드회원
		point = sum * 0.05;
	} else if(level == 5){ // 다이아회원
		point = sum * 0.07;
	}
	
	$("#point").html(point + "P 적립 예정 ");
	$("#shipping-cost").html(makeComma(shipCost) + "원"); // 배송비
	$("#total-sum").html(makeComma(sum + shipCost) + "원"); // 총 주문금액
	$("#amount").html(makeComma(sum) + "원"); // 총 상품금액 
}


function makeComma(price) { // 금액 , 표시
    return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

</script>


</body>
</html>