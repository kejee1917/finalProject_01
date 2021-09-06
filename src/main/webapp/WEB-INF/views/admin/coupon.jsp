<%@page import="verni.co.kr.util.ProductUtil"%>
<%@page import="verni.co.kr.benefit.CouponDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String cp_use = request.getParameter("cp_use");%>    
<style>
.tocp_table{
	margin-bottom: 10px;
}

.coupon_table{
	border-collapse:collapse;
	width: 100%;
	margin-top: 10px;
}

.coupon_table th{
	border-top: outset;
	border-bottom: outset;
	background-color: #e9e9e9;
	padding: 10px;
	text-align: center;
}

.coupon_table td{
	border-bottom: outset;
	border-bottom-width: thin;
	padding: 10px;
	text-align: center;
}

#_send{
	display: inline;
}


#afterCate{
	border: 0px none;
	outline: none;
	font-size: 14px;
	float: right;
	cursor: pointer;
	text-align: left;
}

#beforeCate{
	border: 0px none;
	outline: none;
	font-size: 14px;
	float: right;
	/* color: #397BFF; */
	cursor: pointer;
	text-align: right;
	/* font-weight: bold; */
}

#specialCha1{
	font-size: 14px;
	float: right;
}
	
#allCate{
	border: 0px none;
	outline: none;
	font-size: 14px;
	float: right;
	cursor: pointer;
	text-align: right;
}

#specialCha2{
	font-size: 14px;
	float: right;
}

#total_coupon{
	font-size: 14px;
	float: right;
}

/* 전체화면 */
.searchModal{
	display: none;
	position: fixed;					/* 스크롤과 상관없이 항상 문서 최 좌측상단을 기준으로 고정 */
	z-index: 10;						/* 위치지정 */
	left: 0;							/* position과 같이 쓰임 */
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;						/* 넘치는 컨텐츠를 스크롤바 추가할지 말지 자동으로 설정 */
	background-color: rgb(0,0,0);
	background-color: rgba(0,0,0,0.4);	/* 전체 화면 바탕 투명도 */

}

/* 모달창 */
.search_modal_content{
	background-color: #fefefe;
	margin: 15% auto;
	padding: 20px;						/* 안쪽여백 */
	border: 1px solid #888;
	width: 30%;							/* 모달 창 크기 */
	border-radius: 5px;					/* 모서리 둥글게 */
}

#deleteModal{
	font-size: 15px;
	display: inline-block;
	cursor:pointer;
	width: 100px;
	border: 1px solid #888;
	text-align: center;
	padding-bottom: 10px;
	padding-top: 10px;
	background-color: #4682b4;
	color: white;
}

#closeModal{
	font-size: 15px;
	display: inline-block;
	cursor:pointer;
	width: 100px;
	border: 1px solid #888;
	text-align: center;
	padding-bottom: 10px;
	padding-top: 10px;
}

.closeModalBtn, .deleteModalBtn{
	font-size: 15px
}

#_img{
	width: 80px;
	height: 80px;
}

.pagination{
	justify-content: center;		/* 가운데 정렬 */
}

.coupon_ud_btn{
	display: inline;
}

#_coupon_issue{
	padding-right: 10px;
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
</style>

<script type="text/javascript">
// 체크박스
$(function(){
	var oneCheck = document.getElementsByName("cp_no");	
	var rowCnt = oneCheck.length;					// 총 회원 수
	
	
	// 전체선택
	$("input[name='allCheck']").click(function(){
		if($("input[name='allCheck']").prop("checked")){
			for (var i=0; i<rowCnt; i++){
				oneCheck[i].checked = this.checked;
			}
	// 전체해제		
		}else{
			for (var i=0; i<rowCnt; i++){
				oneCheck[i].checked = this.checked;
			}
		}
	});
	
	// 하나씩 선택해서 전체가 될 때
	$("input[name='cp_no']").click(function(){
		if($("input[name='cp_no']:checked").length == rowCnt){	// 전체와 하나씩 선택한 길이의 값이 같으면
			$("input[name='allCheck']")[0].checked = true;
		}else{													// 체크가 2개 이상일 경우
			$("input[name='allCheck']")[0].checked = false;
		}
	});
});

</script>


<%
	List<CouponDto> list = (List<CouponDto>)request.getAttribute("list");
	ProductUtil util = new ProductUtil();
%>
<table class="tocp_table">
	<tr>
		<td>
			<img src="./image/admin/coupon.png"  width='30px' height='30px'>
		</td>
		
		<td style="padding-left: 10px;">
			<b style="font-size: 30px;">쿠폰 관리</b>
		</td>
	</tr>
</table>

<div align="left">
	<form action="coupon.do" method="get">
		<select id="_choice" name="choice" style="height: 30px">
			<option value="분류">분류</option>
			<option value="쿠폰명">쿠폰명</option>
			<option value="사용여부">사용여부</option>
		</select>
		
		<input type="text" id="_search" name="search" size="30px"><!--  onkeydown="enter()" -->
		<input type="button" value="검색" onclick="send()" id="_send">
		
		<span>
			<input type="text" id="afterCate" name="couponuse" value="활성" size="2" onclick="use_after(this)" readonly>
			<a id="specialCha1">｜</a>
			<input type="text" id="beforeCate" name="couponuse" value="비활성" size="2" onclick="use_before(this)" readonly>
			<a id="specialCha2">｜</a>
			<input type="text" id="allCate" name="couponuse" value="전체" size="2" onclick="location.href='coupon.do?'" readonly>
		</span>
		
		<a id="total_coupon">총 쿠폰 수 : ${page}</a>
	</form>
</div>

<div style="height: 700px;">
	<form>
		<table class="coupon_table">
		<tr>
			<th><input type="checkbox" id="_allCheck" name="allCheck"></th>
			<th>No.</th>
			<th>분류</th>
			<th>쿠폰명</th>
			<th>쿠폰금액</th>
			<th>사용제한금액</th>
			<th>최대할인금액</th>
			<th>사용여부</th>
		</tr>
		
		<tr>
		<%if(list.size() == 0){
		%>
		<tr class="coupon_list_row">
			<td colspan="8">조회된 쿠폰이 없습니다.</td>
		</tr>
		<%}else{
			for(int i=0; i<list.size(); i++){
				CouponDto dto = list.get(i);%>
		<tr>
			<td><input type="checkbox" id="_cp_no" name="cp_no" value="<%=dto.getCp_no() %>"></td>
			<td><input type="hidden" class="no" value="<%=dto.getCp_no() %>"><%=i+1 %></td>
			<td><%=dto.getCp_category() %></td>
			<td><%=dto.getCp_name() %></td>
			<td><%=dto.getCp_amount() %></td>
		    <td><%=util.change(dto.getCp_limitmin()) %></td>
		    <td><%=util.change(dto.getCp_limitmax()) %></td>
		    <td><%=dto.getCp_use() %></td>
		</tr>
		<%	}
		}	%>
		
		</table>
	</form>

	<br>
	
	<!-- 삭제,등록 버튼 -->
	<div align="left" class="coupon_ud_btn">
		<button type="button" class="btn btn-dark" id="_del" onclick="del()">선택삭제</button>
		<!-- <input type="button" style="float:right;" value="발급" id="_coupon_issue" onclick="location.href='#'"> -->
		<input type="button" class="btn btn-secondary" style="float:right;" value="쿠폰 등록" id="_coupon_add" onclick="location.href='addCoupon.do'">
	</div>
	
</div>
<!-- pagination -->
<div>
    <nav aria-label="Demo of active current page number">
         <ul class="page-item" id="pagination"></ul>
   </nav>
</div>

<!-- 삭제 모달창 -->
<div id="_delete" class="searchModal">
	<div class="search_modal_content">
		<div class="page_header" align="center">
			<h1>쿠폰 삭제</h1>
		</div>
		<hr>
		<p align="center" style="color: gray" id="pTag"> 쿠폰을 삭제하시겠습니까?</p>
		<hr>
		
		<!-- 닫기버튼 -->
		<div align="center">
			<div id="closeModal">
				<span class="closeModalBtn">
					닫기
				</span>
			</div>
			
			<!-- 삭제버튼 -->
			<div id="deleteModal">
				<span class="deleteModalBtn">
					삭제
				</span> 
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
//전역변수
var cp_use;
var choice = "${choice}";
var search = "${search}";

$(document).ready(function () {
	var use = '<%=cp_use%>';
	
	if(use == '비활성'){
	//	$("#beforeCate").css('color', '#007bff');
		$("#beforeCate").css('font-weight', 'bold');
	}else if(use == '활성'){
	//	$("#afterCate").css('color', 'red');
		$("#afterCate").css('font-weight', 'bold');
	}else{
	//	$("#allCate").css('color', 'red');
		$("#allCate").css('font-weight', 'bold');
	}
	
	// 페이징 넘겼을 때 검색값 고정
	if(search != ""){
		$("#_choice").val(choice);
		
		document.getElementById("_search").value = search;
	}
});

// 페이징

let totalCount = ${page}		// DB에서 받아온 글의 총 수
let pageSize = 10;			// 페이지의 크기 1 ~ 10
let pageNumber = ${pageNumber};

let _totalPages = totalCount / pageSize;
if(totalCount%pageSize > 0){
	_totalPages++;
}

var src = $("input:text[name='search']").val();
var sel = $("select").val();

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
		location.href="coupon.do?choice=" + $("#_choice").val() + "&search=" + $("#_search").val() + "&pageNumber=" + (page-1);
	}
});


//검색버튼
function send() {
	var src = $("input:text[name='search']").val();
	var sel = $("select").val();
	
	location.href="coupon.do?choice=" + sel + "&search=" + src;
}

function use_before(ths) {
	cp_use = $("#beforeCate").val();
	location.href="coupon.do?cp_use=" + cp_use + "&choice=" + sel + "&search=" + src;
};

function use_after() {
	cp_use = $("#afterCate").val();

	location.href="coupon.do?cp_use=" + cp_use + "&choice=" + sel + "&search=" + src;
};

// 삭제버튼
function del() {
	var cp_no = 0;
	var no = "";
	var count = $("input[name='cp_no']:checked").length;
	var list = $("input[name='cp_no']");
	for(var i = 0; i<list.length; i++){
		// 선택되어 있으면 배열에 값을 저장
		if(list[i].checked){
		//	cp_no.push(list[i].value);
			cp_no = $(".no").eq(i).val();
			no += cp_no + ",";
		}
	}
	
	if(count==0){
		alert('선택된 쿠폰이 없습니다.');
	}else{
		no = no.substring(0, no.lastIndexOf(","));
		
		// @ResponseBody 꼭 추가...!
		$.ajax({
			url:"getCoupon.do",
			type:"post",
			data:{ no : no },
			success:function(data){
				alert(JSON.stringify(data.cp_name));
				$("#_delete").show();
				
				$("#deleteModal").click(function () {
					 $.ajax({
						url:"couponDelete.do",
						type:"POST",
						data:{ no : no},
						success:function(data){
							if(data == 'YES'){
								alert('성공적으로 삭제되었습니다.');
								location.href="coupon.do";
							}else if(data == 'NO'){
								alert('다시 시도해주시기 바랍니다.');
							}
						},error:function(){
							alert('error');
						}
					});
				});
				
				$("#closeModal").click(function () {
					$(".searchModal").hide();
				});
			},error:function(){
				alert('error');
			}
		});
	}
}

</script>

