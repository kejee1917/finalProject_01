<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<!DOCTYPE html>
<html>
<head>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet" href="./css/productDetail/radio_button.css" type="text/css">

<!-- 결제 api -->
<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<style type="text/css">
.shipping{
float: left;
padding-right: 30px;
}

font{
display: flex;
text-align: left; 
font-size: 20px; 
font-weight: bold; 
margin-bottom: 10px;
}

.shipping table{
align:left; 
border:solid 1px; 
border-top-width:2px; 
border-bottom: none; 
border-left: none; 
border-right: none;
}

.cart_info{
width: 900px;
margin-top: 100px;
}

.discount{
}

.discount th{
text-align: left;

}

.discount table{
align:left; 
border:solid 1px; 
border-top-width:2px; 
border-bottom: none; 
border-left: none; 
border-right: none;
}

.discount font{
text-indent: 20px;
}

.pay th{
text-align: left;
}

.info1{
width: 900px;
height: 400px;
margin-top: 100px;
}

.pay{
float: left;
padding-right: 30px;
}

.pay table{
align:left; 
border:solid 1px; 
border-top-width:2px; 
border-bottom: none; 
border-left: none; 
border-right: none;
}

.result table{
align:left; 
border:solid 1px; 
border-top-width:2px; 
border-bottom: none; 
border-left: none; 
border-right: none;
}

.result th{
align:left; 
}

.result font{
text-indent: 30px;
}

.info2{
width: 900px;
height: 400px;
margin-top: 100px;
}

.cart_info font{
display: flex;
}

#payment-body{
font-size: 14px;
}

#shipinfo-table th{
padding: 10px;
}

#benefit-table th{
padding: 10px;
}

</style>
<meta charset="UTF-8">
<title></title>
</head>
<body id="payment-body">

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
		
					<b style="font-size: 20px;">주문/결제</b>
					
				</div>
			</nav>
		</div>
	</div>
</div>		

<!-- <div class="contianer" style="width: auto; height: auto; padding-left: 20%; padding-right: 20%; padding-top: 15px;"><br>
<h5>
<strong style="font-size: 20px"><i class="fas fa-shopping-cart"></i>&nbsp;주문/결제</strong>&nbsp;&nbsp;
</h5>
<br><br>
</div> -->



<c:set var="ol" value="${orderList}" />
<div align="center" style="margin-bottom: 200px;">
<div class="cart_info">
<font style="text-align: left; font-size: 20px; font-weight: bold; margin-bottom: 10px;">주문 아이템 정보</font>
<table class="pTable" style="text-align: center; border: solid 1px; border-top-width:2px; border-left:none; border-right:none; border-collapse: collapse">
<!-- 체크박스 이미지 상품명 대여기간 가격 -->
<col width="70px"><col width="150px"><col width="400px"><col width="100px"><col width="180px">
<!-- <tr style="border: solid 1px black">
<th></th><th colspan=2>상품정보</th><th>대여기간</th><th>가격</th>
</tr> -->
<c:forEach items="${orderList}" var="order" varStatus="i">
<tr>
<td></td>
<td style="padding-top:20px; padding-bottom:20px;"><img alt="" src="./upload/thumbnailImage/${order.p_newimage1}" style="width:80px; height: 80px; object-fit: fill;"></td>
<%-- <td><img alt="" src="image/${order.p_newimage1}" style="width:80px; height: 80px; object-fit: fill;"></td>
 --%><td style="text-align: left; padding-left: 20px;">

	
	<font style="font-weight: bold; margin-top:10px;">
	<c:set var="p_brand" value="${order.p_brand}" />
	<c:choose>
		<c:when test="${fn:contains(p_brand, '_')}">
			<c:set var="p_brand" value="${fn:replace(p_brand, '_', '&')}" />
		</c:when>
		<c:when test="${fn:contains(p_brand, '-')}">
			<c:set var="p_brand" value="${fn:replace(p_brand, '-', ' ')}" />
		</c:when>
	</c:choose>
	
	${p_brand}</font><br>
	
	<p style="font-size:14px; margin-top:-30px;">${order.p_name}</p>
</td>
<td><div class="c_period">
${order.c_period}
</div>
</td>
<fmt:formatNumber type="number" maxFractionDigits="3" var="c_price" value="${order.c_price}" />
<td><div class="c_price">${c_price}</div></td>
<c:set var="amount" value="${amount + order.c_price}" />
</tr>
<tr align="left" style="border: solid 1px black; border-left:none; border-right:none;">
<td colspan=4 style="padding: 15px;">A/S보험<select name="as-choice" class="as-choice" style="width: 300px; height: 40px; margin-left: 20px"><option value=0 value2="0">사용안함</option><option value=10000 value2="50">1회성 전용 50%</option><option value=20000 value2="100">1회성 전용 100%</option></select></td><td class="as-cost" align="center"></td></tr>

</c:forEach>
</table>
</div>




<div class="info1" align="center">
<div class="shipping">
<font>배송지 정보</font>
<table id="shipinfo-table">
<col width="100px"><col width="300px">
<tr style="height: 50px;">
<th align="left">배송지 선택</th><td colspan=2><input style="margin-right:10px;" type="radio" name="shipping" value="basic" checked>기본배송지<input style="margin-left:20px; margin-right:10px;" type="radio" name="shipping" value="new-ad">신규배송지</td>
</tr>
<tr>
<th align="left">이름*</th><td><input type="text" id="name" name="name" style="width:300px; height: 30px" value="${memInfo.m_name}"></td>
</tr>
<tr>
<th align="left">연락처*</th><td><input type="text" id="phone" name="phone" style="width:300px; height: 30px" value="${memInfo.m_phoneNum}" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"></td>
</tr>
<tr>
<th align="left">주소*</th><td><input type="text" id="postCode" name="postCode" style="font-size:14px; width:200px; height: 30px;" placeholder="우편번호" value="${memInfo.m_address_postcode}" readonly><input type="button" class="btnEm sizeS" style="border:solid 1px; width:105px; height: 35px; margin-left:-5px; margin-bottom:2px; font-size:14px;" value="주소" onclick="post()"></td>
</tr>
<tr>
<th>&nbsp;</th><td><input type="text" id="address" name="address" style="width:300px; height: 30px;" placeholder="주소" value="${memInfo.m_address_primary}"></td>
</tr>
<tr>
<th>&nbsp;</th><td><input type="text" id="detail-ad" name="detail-ad" style="width:300px; height: 30px;" placeholder="상세주소" value="${memInfo.m_address_detail}"></td>
</tr>
<tr>
<th colspan=2 align="left">배송요청사항</th>
</tr>
<tr>
<td colspan=2><textarea id="request" style="width:400px; resize: none;" cols=50 rows=5 style="resize: none;"></textarea></td>
</tr>
</table>
</div> <!-- end of shipping -->

<div class="discount">
<font style="margin-left:30px;">할인 및 포인트</font>

<table id="benefit-table">
<col width="100px"><col width="300px">
<tr>
<th colspan=2 style="padding-top:10px;">쿠폰 할인</th>
</tr>
<tr><th>쿠폰</th>
<td><select id="couponChoice" style="width: 300px; height: 40px;">
<option>쿠폰을 선택해 주세요.</option>
<c:forEach items="${couponList}" var="cp" varStatus="i">
<c:set var="sale" value="${cp.cp_amount}" />
<c:set var="c_name" value="${cp.cp_name}" />


<c:if test="${cp.cp_limitmin le amount}">
<c:choose>
	<c:when test="${fn:contains(c_name, '배송비')}">
		<c:if test="${amount lt 50000}">
			<option value="${sale}" value2="${cp.cp_limitmax}" value3="${cp.mc_no}">${cp.cp_name}&nbsp;&nbsp;${cp.cp_amount}원&nbsp;[${cp.cp_limitmin}원 이상 구매시 / 최대 ${cp.cp_limitmax}원 할인]
		</c:if>
	</c:when>
	
	<c:when test="${fn:contains(sale, '%')}">
	<option value="${sale}" value2="${cp.cp_limitmax}" value3="${cp.mc_no}">${cp.cp_name}&nbsp;&nbsp;${cp.cp_amount}&nbsp;[${cp.cp_limitmin}원 이상 구매시 / 최대 ${cp.cp_limitmax}원 할인]
	</option>
	</c:when>
	<c:otherwise>
	<option value="${sale}" value2="${cp.cp_limitmax}" value3="${cp.mc_no}">${cp.cp_name}&nbsp;&nbsp;${cp.cp_amount}원&nbsp;[${cp.cp_limitmin}원 이상 구매시 / 최대 ${cp.cp_limitmax}원 할인]
	</option>
	</c:otherwise>
</c:choose>
</c:if>
</c:forEach>
</select></td></tr>
<tr>
<th>&nbsp;</th>
</tr>
<tr>
<th colspan=2>포인트 결제</th>
</tr>
<tr><th>보유</th><td><input type="text" id="myPoint" value="${memInfo.m_point}" style="text-align:right; width: 280px; height: 30px; margin-right: 10px;" readonly>P</td></tr>
<tr><th>사용</th><td><input type="text" id="usePoint" onchange="usePoint()" value="0" style="text-align:right; width: 280px; height: 30px; margin-right: 10px;" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">P</td></tr>
</table>
</div> <!-- end of discount -->
</div>

<div class="info2">

<div class="pay">
<font>결제수단</font>
	<table>
	<col width="100px"><col width="300">
		<tr>
			<th colspan="2" style="padding-top:10px;"><input style="margin-right:10px;" type="radio" name="payment-option" value="실시간 계좌이체" checked>실시간 계좌이체</th>
		</tr>
		<tr>
			<th colspan="2"><input style="margin-right:10px;" type="radio" name="payment-option" value="카드결제" checked>카드결제</th>
		</tr>
		<tr>
			<th colspan="2"><input style="margin-right:10px;" type="radio" name="payment-option" value="카카오페이">카카오페이</th>
		</tr>
		<tr>
			<th colspan="2"><input style="margin-right:10px;" type="radio" name="payment-option" value="네이버페이">네이버페이</th>
		</tr>
	</table>
</div>

<div class="result">
<font>결제금액</font>
	<table>
	<col width="100px"><col width="300">
		<tr><th style="padding-top:10px;" align="left">주문금액</th><td align="right" id="amount"></td></tr>
		<tr><th align="left">A/S보험</th><td align="right" id="as-amount">0원</td></tr>
		
		<tr><th align="left">배송비</th><td align="right" id="shipping-cost"></td></tr>
		<tr><th align="left">쿠폰</th><td align="right" id="sale-cost">0원</td></tr>
		<tr><th align="left">포인트</th><td align="right" id="point-cost">0원</td></tr>
		<tr><td colspan="2"><hr></td></tr>
		<tr><th align="left">총 결제금액</th><td align="right" id="total-sum">0원</td></tr>
		<tr><td colspan="2"><p style="font-size: 15px;"><input id="agree" type="checkbox">
		위 상품의 주문정보 확인 및 결제진행에 동의합니다. (필수)</p>
		</td></tr>
		
		<tr><td colspan="2"><input type="button" class="btnSubmit sizeS" value="주문하기" style="width:400px; height:50px;" onclick="iamport()">
		</td></tr>
	</table>
</div>

</div>
</div>

<script type="text/javascript">
/* 초기값 세팅 */
// 총 상품금액
let total_amount = ${amount};
console.log(total_amount);
$("#amount").html(makeComma(total_amount) + "원");
console.log($("#amount").html(makeComma(total_amount) + "원"));
// 배송비
if(total_amount >= 50000){
	$("#shipping-cost").html("0원");
	<c:set var="shipCost" value="0" />
	//alert(${shipCost});
} else {
	$("#shipping-cost").html("2,500원");
	<c:set var="shipCost" value="2500" />
	//alert(${shipCost});
}

totalSum();

// A/S보험 선택시 처리
$(".as-choice").change(function(){
	
    let idx = $(".as-choice").index(this);
	let val = $(".as-choice option:selected").eq(idx).val();
	
	$(".as-cost").eq(idx).html(makeComma(val));
	

	let amount = 0;
	
	// 결제금액 -- A/S보험료 변경하기
	$("select[name=as-choice] option:selected").each(function(i, selected){
		amount += parseInt($(selected).val());
	});
	
	$("#as-amount").html(makeComma(amount) + "원");
	
	totalSum();
	
});


$("input:radio[name=shipping]").click(function() {
	
	if($("input:radio[name=shipping]:checked").val() == "new-ad"){ // 신규배송지 선택시
		
		$("#name").val("");
		$("#phone").val("");
		$("#postCode").val("");
		$("#address").val("");
		$("#detail-ad").val("");
		
	} else if($("input:radio[name=shipping]:checked").val() == "basic"){ // 기본배송지 선택시
		
		$("#name").val("${memInfo.m_name}");
	    $("#phone").val("${memInfo.m_phoneNum}");
		$("#postCode").val("${memInfo.m_address_postcode}");
		$("#address").val("${memInfo.m_address_primary}");
		$("#detail-ad").val("${memInfo.m_address_detail}");
	} 
});

// 쿠폰 선택시 이벤트
$("#couponChoice").change(function(){
	
	let sale = $("#couponChoice option:selected").val();
	let max = $("#couponChoice > option:selected").attr("value2");
	
	let amount = ${amount}; // 상품금액 
	let result = 0; // 할인액
	/* alert(sale);
	alert(amount);
	alert(result); */
	
	if(sale.includes('%')){
		//alert('contain');
		sale = sale.replace("%", "");
		result = amount * parseInt(sale) / 100;
		if(result > max){ // 할인액이 최대할인금액보다 클 경우 제한 
			result = max;
		}
		$("#sale-cost").html("-" + makeComma(result) + "원");
	} else {
		//alert('not contain');
		sale = parseInt(sale);
		$("#sale-cost").html("-" + makeComma(sale) + "원");
	}
	
	totalSum();
	
});



function usePoint(){
	
	let my_point = parseInt($("#myPoint").val());
	let use_point = $("#usePoint").val();
	
	// 입력 포인트가 보유 포인트보다 클 때
	if(use_point > my_point){
		use_point = my_point;
		$("#usePoint").val(use_point);
		$("#point-cost").html("-" + makeComma(use_point) + "원");
		totalSum();

	}
	
	// 입력 포인트가 0으로 시작할때 0제거   // 앞에 00000 일때 0전체 제거로 수정하기
	if(use_point.startsWith(0) && use_point != 0){
		
		use_point = use_point.substr(1);
		$("#usePoint").val(use_point);
		
	}
	
	$("#point-cost").html("-" + makeComma(use_point) + "원");
	
	totalSum();
	
}



function totalSum() { // 총 합계 구하기
	
	let t_total = $("#amount").html();
	
	t_total = parseInt(remove(t_total));
	//alert("t_total: " + t_total);
	
	let t_as = $("#as-amount").html();
	t_as = parseInt(remove(t_as));
	//alert("t_as: " + t_as);
	

	let t_ship = $("#shipping-cost").html();
	t_ship = parseInt(remove(t_ship));
	
	
	let t_sale = $("#sale-cost").html();
	t_sale = parseInt(remove(t_sale));
	//alert("t_sale: " + t_sale);
	
	
	let t_point = $("#point-cost").html();
	t_point = parseInt(remove(t_point));
	//alert("t_point: " + t_point);
	
	
	let t_sum = t_total + t_as + t_ship - t_sale - t_point;
	
	
	$("#total-sum").html(makeComma(t_sum) + "원"); // 총 주문금액
	
}

function remove(str){
	// - , 원 없애기
	
	let s = str;
	
	if(s.includes(",")){
		s = s.replace(/,/gi, "");
	} 
	
	if(s.includes("-")){
		s = s.replace(/-/gi, "");
	}
	
	s = s.replace("원", "");
	
	return s;
}


function makeComma(price) {
    return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

function post() {
	 new daum.Postcode({
        oncomplete: function(data) {
           // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

           // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
           // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
           var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
           var extraRoadAddr = ''; // 도로명 조합형 주소 변수

           // 법정동명이 있을 경우 추가한다. (법정리는 제외)
           // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
           if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
               extraRoadAddr += data.bname;
           }
           // 건물명이 있고, 공동주택일 경우 추가한다.
           if(data.buildingName !== '' && data.apartment === 'Y'){
              extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
           }
           // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
           if(extraRoadAddr !== ''){
               extraRoadAddr = ' (' + extraRoadAddr + ')';
           }
           // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
           if(fullRoadAddr !== ''){
               fullRoadAddr += extraRoadAddr;
           }

           // 우편번호와 주소 정보를 해당 필드에 넣는다.
           console.log(data.zonecode);
           console.log(fullRoadAddr);
           
           
           $("#postCode").val(data.zonecode);
           $("#address").val(fullRoadAddr);
           $("#detail-ad").val("");
           
       }
    }).open();
}



function iamport(){
	if($("#agree").is(":checked") == false){
		alert('주문정보 확인 및 결제진행에 동의가 필요합니다.');
		return;
	} else {
	
	// 회원 정보
	let m_no = ${memInfo.m_no};
	let m_level = ${memInfo.m_level};
	let percent = 0;
	if(m_level == 2){ // 일반회원
		percent = 0.01;
	} else if(m_level == 3){ // 실버회원
		percent = 0.03;
	} else if(m_level == 4){ // 골드회원
		percent = 0.05;
	} else if(m_level == 5){ // 다이아회원
		percent = 0.07;
	}
	// 주문번호 생성
	let currentTimeMillis = new Date().getTime();
	let order_num = currentTimeMillis +""+ m_no;
	
	// 사용 쿠폰 번호
	let mc_no = $("#couponChoice > option:selected").attr("value3");
	
	// 사용 포인트
	let use_point = $("#usePoint").val();
	
	// 합계 금액
	let order_sum = $("#total-sum").html();
	order_sum = parseInt(remove(order_sum));
	
	// 멤버 총 구매액
	let m_total = ${memInfo.m_total};
	m_total = m_total + order_sum;
	
	// 결제창에 넣을 주문상품명 구하기 OOO외 O건
	let ol_size = ${fn:length(orderList)};
	//alert(ol_size);
	let p_name = "${orderList[0].p_name}";
	//alert(p_name);
	if (ol_size > 1){
		p_name = p_name + " 외 " + (ol_size-1) + "건";
	} 
	//alert(p_name);
	
	
	let orderList = new Array();    
	<c:forEach items="${orderList}" var="od" varStatus="i">
		
	orderList.push({p_no : ${od.p_no},
    					od_period : "${od.c_period}",
    					od_amount : ${od.c_price},
    					c_no : ${od.c_no}
			       });
	</c:forEach>
	


	
	//가맹점 식별코드
	
	IMP.init('imp26380681');
	IMP.request_pay({
	    pg : 'html5_inicis',
	    pay_method : 'card',
	    merchant_uid : 'merchant_' + new Date().getTime(),
	    name : p_name, //결제창에서 보여질 이름
	    amount : 100,
	    //amount : order_sum * 0.01, //실제 결제되는 가격 (order_sum)
	    buyer_email : '${memInfo.m_email}',
	    buyer_name : '${memInfo.m_name}',
	    buyer_tel : '${memInfo.m_phoneNum}'
	   /*  buyer_addr : '서울 강남구 도곡동',
	    buyer_postcode : '123-456'  */
	}, function(rsp) {
		
	    if ( rsp.success ) { // 결제 성공 DB 저장 시작
	    	
	    	// Orders Table 저장
	    	$.ajax({
	    	    url:"ordered.do",
	    	    type:"GET",
	    	    data: { 
	    	    		o_number : order_num,
	    	    		m_id : "${login.m_id}", 
	    	    	    s_name : $("#name").val(),
	    	    	    s_post : $("#postCode").val(),
	    	    	    s_address : $("#address").val(),
	    	    	    s_address2 : $("#detail-ad").val(),
	    	    	    s_phone : $("#phone").val(),
	    	    	    s_request : $("#request").val(),
	    	    	    o_payment : $("input:radio[name=payment-option]:checked").val(),
	    	    	    mc_no : mc_no,
	    	    	    o_point : use_point,
	    	    	    o_total : order_sum
	    	    	  },
	    	    async: false,
	     	    success:function(data){
	    	    //alert('order success');
	    	    
	    		
	    	    // order_detail Table Insert
	    	    for(var i=0; i<orderList.length; i++){
	    	 	// A/S여부
	    		let as = $(".as-choice").eq(i).val();
	    	 		 		        		
	    		$.ajax({
	    	        url:"orderDetail.do",
	    	        type:"GET",
	    	        async: false,
	    	        data: { 
	    	        		o_number : order_num,
	    	        		p_no : orderList[i].p_no,
	    	        		od_period : orderList[i].od_period,
	    	        		od_amount : orderList[i].od_amount,
	    	        		od_as : as,
	    	        		od_point : Math.round(orderList[i].od_amount * percent),
	    	        		od_status : '결제완료'
	    	        	
	    	        	  },
	    	        success:function(data){
	    	        //alert('order-detail success'); 
	    	        
	    	        },
	    	        error:function(){
	    	          alert('error');
	    	        } 
	    	    }); // end of order_detail
	    		
	    	    } // end of loop
	    	    
	    	    
	    	    
	    	 // 포인트 처리
	        	let pointList = new Array();
	        	let point_no = 0;
	        	let use_point = $("#usePoint").val(); // 사용 포인트 
	        	let comp_point = 0; // 비교 포인트
	        	let remain_point = 0; // 계산용 잔여 포인트
	        	
	        	if(use_point != 0){
	        	<c:forEach items="${pointList}" var="point" varStatus="i">
	        	
	        	pointList.push({p_no:${point.p_no},
	        					p_point:${point.p_point}});
	        	</c:forEach>
	        	
	        	for(var i=0; i<pointList.length; i++){
	        		//alert(pointList[i].p_no);
	        		//alert(pointList[i].p_point);
	        		point_no = pointList[i].p_no;
	        		
	        		
	        		if(use_point >= 0){ // 잔여 포인트 0 이상일 때
	        			
	        	    comp_point = pointList[i].p_point;
	        	    use_point = use_point - comp_point; // 1300-1000 = 300 > 0
	        	    
	        	    if(use_point >= 0){ 
	        	    	$.ajax({
	        	    	    url:"pointUpdate.do",
	        	    	    type:"GET",
	        	    	    data: { m_id : "${login.m_id}", 
	        	    	    		p_point : 0,
	        	    	    		p_no : point_no },
	        	    	    async: false,
	        	    	    success:function(data){
	        	    	    //alert('point success'); 
	        	    	    
	        	    	    
	        	    	    $.ajax({
	        		    	    url:"usePoint.do",
	        		    	    type:"GET",
	        		    	    async: false,
	        		    	    data: {  
	        		    	    		p_no : point_no,
	        		    	    		o_number : order_num,
	        		    	    		pu_amount : comp_point
	        		    	    	  },
	        		    	    success:function(data){
	        		    	    //alert('point-use success');  
	        		    	    },
	        		    	    error:function(){
	        		    	       alert('error');
	        		    	    } 
	        		    	 });
	        	    	    
	        	    	    
	        	    	    },
	        	    	    error:function(){
	        	    	       alert('error');
	        	    	    } 
	        	    	 });
	        	    } else { // 잔여포인트 -일 때 (사용포인트가 더 작을 때)
	        	    	// 800 - 2000 = -1200    2000 + (-1200) = 800
	        	    	$.ajax({
	        	    	    url:"pointUpdate.do",
	        	    	    type:"GET",
	        	    	    async: false,
	        	    	    data: { m_id : "${login.m_id}", 
	        	    	    		p_point : -(use_point) , // 잔여 포인트
	        	    	    		p_no : point_no },
	        	    	    success:function(data){
	        	    	    //alert('point success'); 
	        	    	    
	        	    	     
	        	    	    $.ajax({
	        		    	    url:"usePoint.do",
	        		    	    type:"GET",
	        		    	    async: false,
	        		    	    data: {  
	        		    	    		p_no : point_no,
	        		    	    		o_number : order_num,
	        		    	    		pu_amount : comp_point + use_point, // 사용 포인트
	        		    	    	  },
	        		    	    success:function(data){
	        		    	    //alert('point-use success');  
	        		    	    },
	        		    	    error:function(){
	        		    	       alert('error');
	        		    	    } 
	        		    	 });
	        	    	    
	        	    	    
	        	    	    },
	        	    	    error:function(){
	        	    	       alert('error');
	        	    	    } 
	        	    	 });
	        	    
	        	    } // end of else
	        	    	
	        	    
	        	    } // end of if(use>=0)
	        	    else {
	        	    	break;
	        	    }
	        		
	        	 
	        		
	        	} // end of pointList loop
	    	    
	        	} // if(use_point !=0) // 포인트 끝
	        	
	        	
	        	
	        	
	        	// MEMBER TABLE 총 포인트, 총 구매액 업데이트 
	        	$.ajax({
	        	    url:"memberUpdate.do",
	        	    type:"GET",
	        	    async: false,
	        	    data: { m_id : "${login.m_id}", 
	        	    		m_point : ${memInfo.m_point} - $("#usePoint").val(),
	        	    		m_total : m_total },
	        	    success:function(data){
	        	    //alert('member success');  
	        	    },
	        	    error:function(){
	        	       alert('error');
	        	    } 
	        	 });    
	        	
	        	
	        	
	        	// COUPON TABLE 사용쿠폰 업데이트
	        	if(mc_no != null){ // 쿠폰 사용시에만
	        	
	        	$.ajax({
	        	    url:"couponUpdate.do",
	        	    type:"GET",
	        	    async: false,
	        	    data: { m_id : "${login.m_id}", 
	        	    		mc_no : mc_no },
	        	    success:function(data){
	        	    //alert('coupon success');  
	        	    },
	        	    error:function(){
	        	       alert('error');
	        	    } 
	        	 });  
	        	
	        	 } // end of coupon if	
	        	
	        	

	        	for(var i=0; i<orderList.length; i++){
	        	
	        	// PRODUCT TABLE 상품 대여중 업데이트
	        	$.ajax({
	        	    url:"updateStatus.do",
	        	    type:"GET",
	        	    async: false,
	        	    data: { p_no : orderList[i].p_no },
	        	    success:function(data){
	        	    //alert('updateStatus success');  
	        	    },
	        	    error:function(){
	        	       alert('error');
	        	    } 
	        	 }); 
	        	
	        	// CART TABLE 완료된 상품 삭제
	        	$.ajax({
	        	    url:"cartDelete.do",
	        	    type:"GET",
	        	    async: false,
	        	    data: { c_no : orderList[i].c_no },
	        	    success:function(data){
	        	    //alert('cartDelete success');  
	        	    
	        	    },
	        	    error:function(){
	        	       alert('error');
	        	    } 
	        	 });    
	        	
	        	} // end of loop
	        	
	        	
	        			
	        		
	    	    },
	    	    error:function(){
	    	       alert('error');
	    	    } // order Table error
	    	  

	    	 }); // end of order ajax
	    	
	    	// 결제완료페이지로 이동
    	    /* $.ajax({
        	    url:"orderSuccess.do",
        	    type:"GET",
        	    async: false,
        	    data: { o_number : order_num,
        	    		o_total : order_sum
        	    	  },
        	    success:function(data){
        	    //alert('complete success');  
        	    location.href="complete.do";
        	    },
        	    error:function(){
        	       alert('error');
        	    } 
        	 });     */
	    	 
	    	 location.href="complete.do?o_number=" + order_num + "&o_total=" + order_sum;
	    	
	    	
	    } else {
	    	 var msg = '결제에 실패하였습니다.';
	         msg += '에러내용 : ' + rsp.error_msg;
	         alert(msg);
	    }
	    
	});
	
	
	
	
	
	
	
	
	
	
	
	
	
	} // end of check agree
} // end of pay func 결제메소드 끝



//let length = ${fn:length(orderList)};
//alert(length);

    		/* od_period : "${orderList[i].c_period}",
    		od_amount : ${orderList[i].c_price}, */

    		


/* for(var i=0; i< 3; i++){
alert($(".c_period").eq(i).html());
alert($(".c_price").eq(i).text());
} */
</script>



</body>
</html>