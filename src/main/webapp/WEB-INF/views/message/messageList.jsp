<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script type="text/javascript" src="./jquery/jquery.twbsPagination.min.js"></script>

<style>
.sorting-radio-input input[type="radio"]{
  display:none;
}

.sorting-radio-input input[type="radio"] + span{
  display:inline-block;
  background:none;
  text-align:right;
  line-height:25px;
  font-weight:500;
  cursor:pointer;
}

.sorting-radio-input input[type="radio"]:checked + span{
  color:red;
}

.top_table{
	margin-bottom: 10px;
}

.message_table{
	border-collapse:collapse;
	width: 100%;
}

.message_table th{
	border-top: outset;
	border-bottom: outset;
	background-color: #e9e9e9;
	padding: 10px;
	text-align: center;
}

.message_table td{
	border-bottom: outset;
	border-bottom-width: thin;
	padding: 10px;
	text-align: center;
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
</style>



<script type="text/javascript">


var search = '${search}';
var choice = '${choice}';
var sorting = '${sorting}';


$(document).ready(function() {
	if(search != ""){
		$("#_choice").val(choice);
		$("#_search").val(search);
	}
	if(sorting != ""){
		$("#"+sorting).prop("checked", true);
	}
});


</script>


<table class="top_table">
	<tr>
		<td>
			<img src="./image/admin/message.png" width='30px' height='30px' >
		</td>
		
		<td style="padding-left: 10px;">
			<b style="font-size: 30px;">메시지 관리</b>
		</td>
	</tr>
</table>


<div>
	<form action="messageList.do" id="frm">
		<div align="left" style="width: 50%; float: left;">
		
			<table>
				<tr>
					<td><select id="_choice"
						name="choice" style="height: 30px">
							<option value="주문"  selected="selected">주문</option>
							<option value="온라인문의">온라인문의</option>
							<option value="리뷰">리뷰</option>
							<option value="상품문의">상품문의</option>
					</select></td>
					<td style="padding-left: 5px"><input type="text" id="_search"
						name="search" size="30px"></td>
					<td style="padding-left: 5px"><span class="button blue">
							<input type="button" id="btnSearch" value="검색">
					</span></td>
				</tr>
			</table>
		</div>

	
		<div align="right" style="width: 50%; float: left;">
			<table style="font-size: 11px;">
				<col width="50px">
				<col width="60px">
				<col width="50px">
				<tr>
					<th><label class="sorting-radio-input"> <input
							type="radio" name="sorting" id="all" value="all"> <span
							id="span_wishcount"><strong>전체</strong></span>
					</label>&nbsp;｜</th>
					<th><label class="sorting-radio-input"> <input
							type="radio" name="sorting" id="미처리" value="미처리"> <span
							id="span_regdate"><strong>미처리</strong></span>
					</label>&nbsp;｜</th>
					<th><label class="sorting-radio-input"> <input
							type="radio" name="sorting" id="처리완료" value="처리완료"> <span
							id="span_pricedown"><strong>처리완료</strong></span>
					</label></th>
				</tr>
			</table>
		</div>
	</form>
</div>

	<div style="height: 680px;">
		<table class="message_table">
			<col width="200px">
			<c:if test="${empty mlist}">
				<tr>
					<th>분류</th><th>메시지</th><th>날짜</th><th>처리여부</th>
				</tr>
				<tr>	
					<td colspan="4">등록된 메시지가 없습니다.</td>
				</tr>
			</c:if>
				<tr>
					<th>분류</th><th>메시지</th><th>날짜</th><th>처리여부</th>
				</tr>
			<c:forEach items="${mlist}" var="mlist" varStatus="i">
				<c:if test="${mlist.ms_status eq '미처리'}">
				<tr>
				</c:if>
				<c:if test="${mlist.ms_status eq '처리완료'}">
				<tr style="color: gray;">
				</c:if>
					<td>[${mlist.ms_category}]</td>
					<td>
						<c:if test="${mlist.ms_status eq '미처리'}">
							<c:if test="${mlist.ms_category eq '리뷰'}">
							<font type="button" onclick="location.href='pdReviewReplyWrite.do?r_no=${mlist.ms_nos}&ms_no=${mlist.ms_no}'">
								${mlist.ms_content}
							</font>
							</c:if>
							<c:if test="${mlist.ms_category eq '상품문의'}">
							<font type="button" onclick="location.href='pdQnaReplyWrite.do?q_no=${mlist.ms_nos}&ms_no=${mlist.ms_no}'">
							${mlist.ms_content}
							</font>
							</c:if>
							<c:if test="${mlist.ms_category eq '온라인문의'}">
							<font type="button" onclick="location.href='onlineQnaReplyWrite.do?mq_no=${mlist.ms_nos}&ms_no=${mlist.ms_no}'">
							${mlist.ms_content}
							</font>
							</c:if>
							<c:if test="${mlist.ms_category eq '주문'}">
							<font type="button" onclick="location.href='adminOrder.do?choice=NO&search=${mlist.ms_nos}&ms_no=${mlist.ms_no}'">
							${mlist.ms_content}
							</font>
							</c:if>
						</c:if>
						<c:if test="${mlist.ms_status eq '처리완료'}">
							${mlist.ms_content}
						</c:if>	
					</td>
					<td>${fn:substring(mlist.ms_ragdate,0,11)}</td>
					<td>${mlist.ms_status}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	
	<br>
	<!-- 실제 페이지가 뿌려지는 부분 -->
	<!-- pagination -->
	<div>
	    <nav aria-label="Demo of active current page number">
	         <ul class="page-item" id="pagination"></ul>
	   </nav>
	</div>
	


<script type="text/javascript">
let totalCount = ${page}		// DB에서 받아온 글의 총 수
let pageSize = 13;				// 페이지의 크기 1 ~ 10
let pageNumber = ${pageNumber};


if(totalCount == 0){
	totalCount = 1;
}

let _totalPages = Math.floor(totalCount / pageSize);

if(totalCount%pageSize > 0){
	_totalPages += 1;
}


$("#pagination").twbsPagination({
	startPage : pageNumber,						// 시작페이지
	totalPages : _totalPages,					// 총 페이지 번호 수
	visiblePages : 10,							// 하단에 한번에 보여지는 페이지 번호 수
	first:'<span sris-hidden="true">«</span>',	// 첫 버튼에 쓰여있는 텍스트
	prev:"이전",									// 이전 페이지 버튼에 쓰여지는 텍스트
	next:"다음",									// 다음 페이지 버튼에 쓰여지는 텍스트
	last:'<span sris-hidden="true">»</span>',	// 마지막 버튼에 쓰여있는 텍스트
	initiateStartPageClick:false,				// 무한루트 방지
	onPageClick:function(event, page){
		location.href = "messageList.do?search=" + $("#_search").val() + "&choice=" + $("#_choice").val() + "&sorting=" + sorting + "&pageNumber=" + (page-1);
	}
});


$("#btnSearch").click(function () {
	location.href = "messageList.do?search=" + $("#_search").val() + "&choice=" + $("#_choice").val() + "&sorting=" + sorting;	
});
$(".sorting-radio-input").click(function() {
	$("#frm").submit();
});


</script>