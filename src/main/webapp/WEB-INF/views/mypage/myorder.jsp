<%@page import="verni.co.kr.util.ProductUtil"%>
<%@page import="verni.co.kr.util.MypageUtil"%>
<%@page import="verni.co.kr.order.OrderDetailDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%
List<OrderDetailDto> list = (List<OrderDetailDto>)request.getAttribute("list");
String date1 = (String)request.getAttribute("smaller");
String date2 = (String)request.getAttribute("bigger");
//System.out.println(list);

// 데이트 피커 안에 숫자 변형
String[] str = new String[2];
str[0] = "";
str[1] = "";
if(date1.length()>2 && date2.length()>2) {
	str = MypageUtil.backDate(date2, date1);
}
 
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- datapicker -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>

<style type="text/css">


.order-table th{
  text-align: left;
  padding: 10px;
  border-top: 1px solid #888;
  border-bottom: 1px solid #ccc;
  height: 20px;
  line-height: 20px;
  font-size: 12px;
  background-color: #E6E2DC;
}

.order-table tr td{
	height: 20px;
	line-height: 20px;
	padding: 10px;
	font-size: 12px;
	border-bottom: 1px solid #ccc;
}
.search-wrap{
	background-color: #E6E2DC;
	padding: 2%;
	width: 70%;
}

.order-btn {
	width: 20%;
	height: 40px;
	font-size: 14px;
	background-color: #8A989A;
	border-color: #8A989A;
	color: white;
	border: 0;
	outline: 0;
	margin-left: -1%;
}
.order-btn:hover{
	background-color: #0F2620;
	border-color: #0F2620;
}

.date-input{
	width: 30%;
	height: 40px;
	font-size: 15px;
}
.confirm-btn {
	width: 80%;
	height: 40px;
	font-size: 14px;
	background-color: #8A989A;
	border-color: #8A989A;
	color: white;
	border: 0;
	outline: 0;
}
.confirm-btn:hover{
	background-color: #0F2620;
	border-color: #0F2620;
}
.status-btn {
	width: 60px;
	height: 30px;
	font-size: 14px;
	background-color: #8A989A;
	border-color: #8A989A;
	color: white;
	border: 0;
	outline: 0;
}
.status-btn:hover {
	background-color: #0F2620;
	border-color: #0F2620;
	border: 0;
	outline: 0;
}
</style>
</head>
<body>


<h1 style="margin-top: 2%">주문/배송 현황</h1>
<hr align="left" style="border: solid #8A989A;" width="70%">

<br><br>

<div class="search-wrap">
<table style="width: 100%">
	<tr>
	<td width="40%" style="padding-left: 0%">
		<input type="button" class="order-btn" id="today" value="오늘">
		<input type="button" class="order-btn" id="1month" value="1개월">
		<input type="button" class="order-btn" id="3month" value="3개월">
		<input type="button" class="order-btn" id="6month" value="6개월">
	</td>
	<td width="50%">
		<input type="text" class="date-input" name="" id="datepicker1">
		<span style="font-size: 20px">~</span>
		<input type="text" class="date-input" name="" id="datepicker2">
	</td>
	<td width="10%">
		<input type="button" class="confirm-btn" id="confirm" value="조회">
	</td>
	</tr>

</table>
</div>

<br><br><br>

<p style="font-size: 17px; font-weight: bold;">주문 상품 정보</p>
<table class="order-table" width="70%">
	<tr>
		<th>주문일자</th>
		<th width="17%">주문번호</th>
        <th width="40%" colspan="2">상품정보</th>
        <th width="13%">구매금액</th>
        <th width="18%">주문처리 상태</th>
	</tr>
	
	<c:if test="${empty list}">
	<tr>
    	<td colspan="7">해당되는 내역이 없습니다.</td>
    </tr>
    </c:if>
    
    <%
	for(int i=0; i < list.size(); i++) {
		OrderDetailDto dto = list.get(i);
	%>
    <tr>
    	<td><%=MypageUtil.formDate3(dto.getO_time()) %></td>
    	<td><%=dto.getO_number() %></td>
    	<td><img alt="" src="./upload/thumbnailImage/<%=dto.getP_newimage1() %>" style="width:100px; padding-left:10px; object-fit: fill;"></td>
    	<td align="left"><a href="productDetail.do?p_no=<%=dto.getP_no()%>">[<%=ProductUtil.brandName(dto.getP_brand())%>]<br><%=MypageUtil.dot3(dto.getP_name())%></a></td>
    	<td><%=dto.getOd_amount() %> 원</td>
    	<input type="hidden" name="od_no" id="od_no" value="<%=dto.getOd_no()%>">
    		<%if(dto.getOd_status().equals("주문확인")) {
    		%>
    		<td>주문확인완료<br>
    		<input type="button" class="status-btn" id="ordercancel" value="주문취소" onclick="ordercancel(<%=dto.getOd_no()%>)">
    		</td>
    		<%
    		}else if(dto.getOd_status().equals("발송완료")) {
    		%>
    		<td>배송중<br>
    		<input type="button" class="status-btn" id="deliveryInfo" value="배송조회" onclick="deliveryInfo()">
    		</td>
    		<%	
    		}else if(dto.getOd_status().equals("배송완료") && dto.getOd_review()!=1) { //리뷰 작성 아직 안했으면~
    		%>
    		<td>배송완료<br>
    		<input type="button" class="status-btn" id="review" onclick="writereview(<%=dto.getOd_no()%>)" value="리뷰쓰기">
    		</td>
    		<%	
    		}else if(dto.getOd_status().equals("배송완료") && dto.getOd_review()==1) {
    		%>
    		<td>배송완료<br>
    		[리뷰작성완료]
    		</td>
    		<%	
    		}else if(dto.getOd_status().equals("주문취소")) {
    		%>	
   			<td>
       		주문취소완료
       		</td>	
        	<%	
    		}else if(dto.getOd_status().equals("취소진행중")) {
   			%>	
   			<td>
       		취소진행중
       		</td>	
           	<%		
    		}else if(dto.getOd_status().equals("회수완료")&& dto.getOd_review()!=1) {
    		%>
    		<td>반납완료<br>
    		<input type="button" class="status-btn" id="review" onclick="writereview(<%=dto.getOd_no()%>)" value="리뷰쓰기">
    		</td>	
    		<%	
    		}else if(dto.getOd_status().equals("회수완료")&& dto.getOd_review()==1) {
    		%>
    		<td>반납완료<br>
    		[리뷰작성완료]
    		</td>	
    		<%	
    		}else if(dto.getOd_status().equals("결제완료")) {
    		%>
    		<td>
       		결제완료<br>
       		<input type="button" class="status-btn" id="ordercancel" value="주문취소" onclick="ordercancel(<%=dto.getOd_no()%>)">
       		</td>	
    		<%	
    		} 
    		%>
    </tr>
    <%} %>
    
    
    
</table>  

<script type="text/javascript">
/////////datepicker 설정//////////
$.datepicker.setDefaults({
    dateFormat: 'yy-mm-dd',
    showOn: 'button', // 우측에 달력 icon 을 보인다.
    buttonImage: 'image/mypage/datepick.png', // 우측 달력 icon 의 이미지 패스 
    buttonImageOnly: true, //  inputbox 뒤에 달력icon만 표시한다. ('...' 표시생략)
    changeMonth: true,
    changeYear: true,
    yearRange: '1955:2021',
    prevText: '이전 달',
    nextText: '다음 달',
    monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
    monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
    dayNames: ['일', '월', '화', '수', '목', '금', '토'],
    dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
    showMonthAfterYear: true,
    yearSuffix: '년'
});

$(document).ready(function() {
	let date1 = '<%=str[0]%>';
	let date2 = '<%=str[1]%>';
	//console.log(date1);
	//console.log(date2);
	if(date1 == '' && date2 == '') {
		//alert("y");
		//제일 먼저 datepicker호출 후 한달치 호출
		$("#datepicker1").datepicker();
		$("#datepicker1").datepicker('setDate', '-30');
		
		//오늘날짜로 설정
		$("#datepicker2").datepicker();
		$("#datepicker2").datepicker('setDate', '+0');	
	}else {
		//alert("n");
		$("#datepicker1").datepicker();
		$("#datepicker1").datepicker('setDate', date1);
		
		$("#datepicker2").datepicker();
		$("#datepicker2").datepicker('setDate', date2);	
	} 
});

			

$("#today").click(function() {
	
	$("#datepicker1").datepicker();
	$("#datepicker1").datepicker('setDate', '+0');

	$("#datepicker2").datepicker();
	$("#datepicker2").datepicker('setDate', '+0');
});

$("#1month").click(function() {
	
	$("#datepicker1").datepicker();
	$("#datepicker1").datepicker('setDate', '-30');

	$("#datepicker2").datepicker();
	$("#datepicker2").datepicker('setDate', '+0');
});

$("#3month").click(function() {
	
	$("#datepicker1").datepicker();
	$("#datepicker1").datepicker('setDate', '-91');

	$("#datepicker2").datepicker();
	$("#datepicker2").datepicker('setDate', '+0');
});

$("#6month").click(function() {
	
	$("#datepicker1").datepicker();
	$("#datepicker1").datepicker('setDate', '-180');

	$("#datepicker2").datepicker();
	$("#datepicker2").datepicker('setDate', '+0');
});

$("#confirm").click(function() {
	let bigger = $("#datepicker2").val();
	let smaller = $("#datepicker1").val();
	
	location.href = "myorder.do?menu=myorder&bigger=" + bigger + "&smaller=" + smaller;  
});


//주문취소 클릭 시
function ordercancel(no) {
	let m_id = '${login.m_id}';
	let od_no = no;
	console.log(od_no);
	if(confirm("정말 주문을 취소하시겠습니까?") == true) { //alert창으로 한번 더 확인 절차
		$.ajax({
			url: "myorderCancel.do",
			type: "get",
			data: {'m_id': m_id, 'od_no':od_no},
			success: function(data){
				//alert(data);
				
				if(data == true) {
					alert("주문 취소를 요청하셨습니다. 수일 내에 처리됩니다.");
				}
			},
			error: function(){
				alert("f");
			}
		});
	}else {
		return;
	}
}

//배송조회 클릭 시 -> 배송 조회 사이트 팝업
function deliveryInfo() {
	window.open("https://www.hanjin.co.kr/kor/CMS/DeliveryMgr/WaybillSch.do?mCode=MN038", "PopupWin", "width=500,height=600");
}

//리뷰쓰기 버튼 클릭
function writereview(odno) {
   let od_no = odno;
   window.open('reviewWrite.do?od_no='+od_no, 'popup02','width=500,height=720,location=no,status=no,scrollbars=yes');
}

</script>
</body>
</html>