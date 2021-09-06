<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- 나중에 지우기 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script type="text/javascript" src="./jquery/jquery.twbsPagination.min.js"></script>    
<style>


.top_table{
	margin-bottom: 10px;
}

.order_table{
	border-collapse:collapse;
	width: 100%;
	margin-top: 10px;
}

.order_table th{
	border-top: outset;
	border-bottom: outset;
	background-color: #e9e9e9;
	padding: 10px;
	text-align: center;
}

.order_table td{
	border-bottom: outset;
	border-bottom-width: thin;
	padding: 10px;
	text-align: center;
	font-size: 13px;
}





/* 모달!! */
.modal-table-content{
   border-bottom: 1px solid #ccc;
   padding-top: 10px;
   padding-bottom: 10px;
   font-size: 15px;
}

.modal-table-title{
   border-bottom: 1px solid #ccc;
   padding-top: 10px;
   padding-bottom: 10px;
   text-align: center;
   font-size: 15px;
}


/* The Modal (background) */
.searchModal {
display: none; /* Hidden by default */
position: fixed; /* Stay in place */
z-index: 10; /* Sit on top */
left: 0;
top: 0;
width: 100%; /* Full width */
height: 100%; /* Full height */
overflow: auto; /* Enable scroll if needed */
background-color: rgb(0,0,0); /* Fallback color */
background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}
/* Modal Content/Box */
.search-modal-content {
background-color: #fefefe;
margin: 15% auto; /* 15% from the top and centered */
padding: 20px;
border: 1px solid #888;
width: 30%; /* Could be more or less, depending on screen size */
}

.pagination{
	justify-content: center;		/* 가운데 정렬 */
}

.page-item.active .page-link {
  z-index: 1;
  color: white;
  background-color: black;
  border-color: black;
}

.page-item .page-link {
	color: black;
}

#status{
	height: 37px;
	width:130px;
	font-size: 16px;
	display: inline;
}
</style>
<script type="text/javascript">
var search = '${search}';
var choice = '${choice}';

$(document).ready(function() {
	if(search != ""){
		$("#_choice").val(choice);
		$("#_search").val(search);
	}
});
</script>


<table class="top_table">
	<tr>
		<td>
			<img src="./image/admin/order.png" width='30px' height='30px'>
		</td>
		
		<td style="padding-left: 10px;">
			<b style="font-size: 30px;">주문/배송 관리</b>
		</td>
	</tr>
</table>

<div align="left">
	<form action="adminOrder.do" method="get">
		<select id="_choice" name="choice" style="height: 30px">
			<option value="" selected="selected">분류</option>
			<option value="주문번호">주문번호</option>
			<option value="아이디">아이디</option>
			<option value="상품명">상품명</option>
			<option value="현재현황">현재현황</option>
			<option value="NO">NO</option>
		</select>
		<input type="text" id="_search"	name="search"  size="30px"><!--  onkeydown="enter()" -->
		<input type="button" id="btnSearch" value="검색">
	</form>
</div>


<div style="height: 647px;">
	<table class="order_table">
		<thead>
			<tr>
				<th><input type="checkbox" name="allCheck" ></th>
				<th>No.</th>
				<th>주문번호</th>
				<th>상품명</th>
				<th>아이디</th>
				<th>배송지정보</th>
				<th>대여기간</th>
				<th>주문일</th>
				<th>현재현황</th>
				<th>현황처리</th>
				<th>상태</th>
			</tr>
		</thead>
			<c:if test="${empty olist}">
				<tr>
					<td colspan='11'>조회된 주문 정보가 없습니다.</td>
				</tr>
			</c:if>
			<c:forEach items="${olist}" var="i" varStatus="index">
				<tr>
					<td>
						<input type='checkbox' id='o_no' name='checkbox' class="checkbox" value="${i.o_no}">
						<input type="hidden" id='p_no${i.o_number}' name="p_no" class="p_no" value="${i.p_no}">
						<input type="hidden" id='ms_no${i.o_number}' class="ms_no" value="${i.ms_no}">
						<input type="hidden" class="o_number" value="${i.o_number}">
						<input type="hidden" id='od_no${i.o_number}' name="od_no" class="od_no" value="${i.od_no}">
					</td>
					<td>${index.count}</td>
					<td><font onClick="func(${i.od_no})" style="cursor: pointer; ">${i.o_number}</font></td>
					<td>${i.p_name}</td>
					<td><font id='m_id${i.o_number}' class="m_id" style=''>${i.m_id}</font></td>
					<c:if test="${empty i.s_address2}">
						<td>${i.s_address}</td>
					</c:if>
					<c:if test="${not empty i.s_address2}">
						<td>${i.s_address}&nbsp;&nbsp;${i.s_address2}</td>
					</c:if>
					<td><font id='od_period${i.o_number}' class="od_period" style=''>${i.od_period}</font></td>
					
					
					
					
					<td>${fn:replace(i.o_time,'/','-')}</td>
					<c:choose>
						<c:when test="${i.od_status eq '주문취소' || i.od_status eq '회수완료'}">
							<td colspan="3">${i.od_status}</td>
						</c:when>
						
						<c:when test="${i.od_status eq '결제완료'}">
							<td>${i.od_status}</td>
							<td>
								<select id='od_status${i.o_number}'>
									<option value='주문확인'>주문확인</option>
								</select>
							</td>
							<td><input type='button' onclick='orderUpdate(${i.o_number})' value='업데이트'></td>	
						</c:when>
						
						<c:when test="${i.od_status eq '주문확인'}">
							<td>${i.od_status}</td>
							<td>
								<select id='od_status${i.o_number}'>
								    <option value='발송완료'>발송완료</option>
								</select>
							</td>
							<td><input type='button' onclick='orderUpdate(${i.o_number})' value='업데이트'></td>	
						</c:when>
						
						<c:when test="${i.od_status eq '발송완료'}">
							<td>${i.od_status}</td>
							<td>
								<select id='od_status${i.o_number}'>
								    <option value='배송완료'>배송완료</option>
								</select>
							</td>
							<td><input type='button' onclick='orderUpdate(${i.o_number})' value='업데이트'></td>	
						</c:when>
						
						<c:when test="${i.od_status eq '배송완료'}">
							<td>${i.od_status}</td>
							<td>
								<select id='od_status${i.o_number}'>
								    <option value='회수완료'>회수완료</option>
								</select>
							</td>
							<td><input type='button' onclick='orderUpdate(${i.o_number})' value='업데이트'></td>	
						</c:when>
						
						<c:when test="${i.od_status eq '취소진행중'}">
							<td>${i.od_status}</td>
							<td>
								<select id='od_status${i.o_number}'>
								    <option value='주문취소'>주문취소</option>
								</select>
							</td>
							<td><input type='button' onclick='orderUpdate(${i.o_number})' value='업데이트'></td>	
						</c:when>
					</c:choose>
					
				</tr>	
			</c:forEach>
	</table>
	
	<c:forEach items="${olist}" var="i" varStatus="index">
		<div id="modal${i.od_no}" class="searchModal">
	      <div class="search-modal-content">
	         <div class="page-header">
	            <h1>대여 세부 사항</h1>
	         </div>
	            <div class="row">
	               <div class="col-sm-12">
	                  <div class="row">
	                     <div class="col-sm-12">
	                     <table class="modal-table">
	                     <col width="230px"><col width="140px"><col width="160px">
	                     <tr>
	                        <th class="modal-table-title">주문번호</th>
	                        <td class="modal-table-content" colspan="2">${i.o_number}</td>
	                     </tr>
	                     <tr>
	                        <th class="modal-table-title">상품정보</th>
	                        <td class="modal-table-content">
	                        <img alt="" src="./upload/thumbnailImage/${i.p_newimage1}" style="width:130px; height: 130px; object-fit: fill;">
	                         </td>
	                         <td class="modal-table-content"><a href="productDetail.do?p_no=${i.p_no}">[${i.p_brand}] <br> ${i.p_name}</a></td>
	                     </tr>
	                     <tr>
	                        <th class="modal-table-title">구매금액</th>
	                        <td class="modal-table-content" colspan="2">${i.od_amount} 원</td>
	                     </tr>
	                     <tr>
	                        <th class="modal-table-title">대여시작일</th>
	                        <td class="modal-table-content" colspan="2">${i.od_startdate}</td>
	                     </tr>
	                     <tr>
	                        <th class="modal-table-title">대여종료일</th>
	                        <td class="modal-table-content" colspan="2">${i.od_enddate}</td>
	                     </tr>
	                     <tr>
	                        <th class="modal-table-title">현재상태</th>
	                        <td class="modal-table-content" colspan="2">${i.od_status}</td>
	                     </tr>
	                     <tr>
	                        <th class="modal-table-title">보험가입</th>
	                        
	                        <c:if test="${i.od_as eq '0'}">
								<td class="modal-table-content" colspan="2">가입안함</td>
							</c:if>
	                        <c:if test="${i.od_as eq '10000'}">
								<td class="modal-table-content" colspan="2">1회성 전용 50%</td>
							</c:if>
	                        <c:if test="${i.od_as eq '20000'}">
								<td class="modal-table-content" colspan="2">1회성 전용 100%</td>
							</c:if>
	                     </tr>
	                     </table>
	                     </div>
	                  </div>
	               </div>
	            </div>
	            <div style="cursor:pointer;background-color:#DDDDDD;text-align: center;padding-bottom: 10px;padding-top: 10px;" onClick="closeModal();">
	            <span class="pop_bt modalCloseBtn" style="font-size: 13pt;">닫기</span>
	         </div>
	      </div>
	   </div>
	</c:forEach>
	
	
	

<br>
<select id='status'>
	<option value=''>=== 선택 ===</option>
	<option value='주문확인'>주문확인</option>
	<option value='발송완료'>발송완료</option>
	<option value='배송완료'>배송완료</option>
	<option value='회수완료'>회수완료</option>
	<option value='주문취소'>주문취소</option>
</select>	

<button type="button" onclick="orderMultyUpdate()" class="btn btn-dark" style="font-size: 16px; margin-bottom: 6px;">업데이트</button>


	
</div>
<br><br>

<!-- pagination -->
<div>
    <nav aria-label="Demo of active current page number">
         <ul class="page-item" id="pagination"></ul>
   </nav>
</div>

<script type="text/javascript">
let totalCount = ${page}		// DB에서 받아온 글의 총 수
let pageSize = 10;			// 페이지의 크기 1 ~ 10
let pageNumber = ${pageNumber};
if(${page} == 0){
	totalCount = 1;
}
let _totalPages = totalCount / pageSize;
if(totalCount%pageSize > 0){
	_totalPages++;
}

//$("#pagination").twbsPagination('destroy');	// 페이지 갱신 : 페이징을 갱신해 줘야 번호가 재설정된다.

$("#pagination").twbsPagination({
	startPage : pageNumber,
	totalPages : _totalPages,
	visiblePages : 10,
	first : '<span sria-hidden="true">«</span>',
	prev : "이전",
	next : "다음",
	last : '<span sria-hidden="true">»</span>',
	initiateStartPageClick:false,				// onPageClick 자동 실행되지 않도록 한다
	onPageClick:function(event, page){
		location.href="adminOrder.do?choice=" + $("#_choice").val() + "&search=" + $("#_search").val() + "&pageNumber=" + (page-1);
	}
});


//검색버튼 클릭
$("#btnSearch").click(function () {	
	var src = $("input:text[name='search']").val();	
	var sel = $("select").val();	
	
	location.href="adminOrder.do?choice=" + sel + "&search=" + src;
});

//업데이트 함수
function orderUpdate(o_number) {
//	alert($("#ms_no"+o_number).val());
	$.ajax({
		url:"orderUpdate.do",
		type: "GET",
		data:{"o_number":o_number, 
			  "od_status": $("#od_status"+o_number).val(), 
			  "od_period":$("#od_period"+o_number).html(),
			  "p_no":$("#p_no"+o_number).val(),
			  "od_no":$("#od_no"+o_number).val(),
			  "m_id":$("#m_id"+o_number).html(),
			  "ms_no":$("#ms_no"+o_number).val()
		},
		success:function(data){
			if(data > 0){
				location.href="adminOrder.do?choice=" + $("#_choice").val() + "&search=" + $("#_search").val();
			}else{
				alert('업데이트 안됨..');
			}
		},
		error:function(){
			alert('주문 1개 업데이트 아작 에러');
		}
	});
}




function orderMultyUpdate(){
	let od_status = $("#status").val();
	let o_number = "";
	let od_period = "";
	let p_no = "";
	let m_id = "";
	let ms_no = "";
	let od_no = "";
	
	if(od_status == ""){
		alert('현황처리를 선택하여 주십시오.');
		return;
	}
	
	var count = document.getElementsByName("checkbox").length;
	
	// 선택된 체크박스 확인하여 해당 c_no 구하기 
	for (var i = 0; i < count; i++) {  
		if ($(".checkbox")[i].checked == true) {
//			p_no = document.getElementsByName("p_no")[i].value;
			p_no += $(".p_no").eq(i).val()+",";
			od_no += $(".od_no").eq(i).val()+",";
			o_number += $(".o_number").eq(i).val()+",";
			od_period += $(".od_period").eq(i).html()+",";
			m_id += $(".m_id").eq(i).html()+",";
			ms_no += $(".ms_no").eq(i).val()+",";
		}
	}
	
	if(o_number.length == 0){
		alert('업데이트 할 번호를 체크하여 주십시오.');
		return;
	}
	
	o_number  = o_number.substring(0, o_number.lastIndexOf(","));
	od_period = od_period.substring(0, od_period.lastIndexOf(",")); 
	p_no 	  = p_no.substring(0, p_no.lastIndexOf(",")); 
	od_no 	  = od_no.substring(0, od_no.lastIndexOf(",")); 
	m_id 	  = m_id.substring(0, m_id.lastIndexOf(",")); 
	ms_no 	  = ms_no.substring(0, ms_no.lastIndexOf(",")); 
	console.log("o_number : "+o_number);
	console.log("od_period : "+od_period);
	console.log("p_no : "+p_no);
	console.log("m_id : "+m_id);
	console.log("ms_no : "+ms_no);
	console.log("od_status : "+od_status);
	console.log("od_no : "+od_no);
	let data = {
			'o_numberStr'  : o_number,
			'od_periodStr' : od_period,
			'p_noStr' 		: p_no,
			'od_noStr' 		: od_no,
			'm_idStr' 		: m_id,
			'ms_noStr'		: ms_no,
			'od_status' : od_status
	}
	
	$.ajax({
		url:"orderMultyUpdate.do",
		type: "GET",
		data:data,
		success:function(data){
			if(data > 0){
				location.href="adminOrder.do?choice=" + $("#_choice").val() + "&search=" + $("#_search").val();
			}else{
				alert('업데이트 안됨..');
			}
		},
		error:function(){
			alert('주문 다중 업데이트 아작 에러');
		}
	});
	
	
	
	
	
	
}






/* 전체 체크박스 클릭이벤트 */
$("input:checkbox[name='allCheck']").on("click", function() {
	if($("input:checkbox[name='allCheck']").is(":checked") == true){ // 전체 체크박스 선택시 
		
		$("input:checkbox[name='checkbox']").prop("checked", true);
		
	} else { // 전체 체크박스 해제
		
		$("input:checkbox[name='checkbox']").prop("checked", false);
	
	}

});

/* 개별 체크박스 클릭이벤트 */
$("input:checkbox[name='checkbox']").on("click", function() {
	
	if($(this).is(":checked") == false){ // 체크박스가 하나라도 체크가 안되어있을 경우
		
		$("input:checkbox[name='allCheck']").prop("checked", false); // 전체선택 체크 해제
		
	}
	
	let all = $("input:checkbox[name='checkbox']").length;
	let count = $("input:checkbox[name='checkbox']:checked").length;

	// 개별 체크박스 체크된 개수가 전체 개별 체크박스 수와 같을 때 
	if(all == count){
		// 전체 체크박스 체크표시
		$("input:checkbox[name='allCheck']").prop("checked", true);
	}
});


function func(odno) {
	   $("#modal"+ odno).show();
	}
	function funcimage() {
		$("#modal2").show();	
	}

	function closeModal() {
	   $('.searchModal').hide();
	};

	function mouseOver(n) {
	   $(".startdate"+ n).css("background-color", "#9E7777");
	   $(".enddate"+ n).css("background-color", "#9E7777");
	}
	function mouseOut(n) {
	   $(".startdate"+ n).css("background-color", "#FCF2E9");
	   $(".enddate"+ n).css("background-color", "#FCF2E9");
	   //$(".today").css("background-color", "#8A989A");
	}







</script>		