<%@page import="verni.co.kr.review.ReviewDto"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String r_status = request.getParameter("r_status");%>  
<style>
.top_table{
	margin-bottom: 10px;
}

.productReview_table{
	border-collapse:collapse;
	width: 100%;
	margin-top: 10px;
}

.productReview_table th{
	border-top: outset;
	border-bottom: outset;
	background-color: #e9e9e9;
	padding: 10px;
	text-align: center;
}

.productReview_table td{
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

#deleteCate{
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
	
#allCate{
	border: 0px none;
	outline: none;
	font-size: 14px;
	float: right;
	cursor: pointer;
	text-align: right;
}

#specialCha3{
	font-size: 14px;
	float: right;
}

#total_productReview{
	font-size: 14px;
	float: right;
	padding-right: 20px;
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

.productReview_ud_btn{
	display: inline;
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
	var oneCheck = document.getElementsByName("r_no");	
	var rowCnt = oneCheck.length;
	
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
	$("input[name='r_no']").click(function(){
		if($("input[name='r_no']:checked").length == rowCnt){	// 전체와 하나씩 선택한 길이의 값이 같으면
			$("input[name='allCheck']")[0].checked = true;
		}else{													// 체크가 2개 이상일 경우
			$("input[name='allCheck']")[0].checked = false;
		}
	});
});


</script>

<%
	Object obj = request.getAttribute("list");
	
	List<HashMap<String,String>> list = null;
	
	if(obj != null){
		list = (List<HashMap<String,String>>)obj;
		System.out.println("리뷰관리 JSP : " + list.toString());
	}
%>

<table class="top_table">
	<tr>
		<td>
			 <img src="./image/admin/review.png" width='30px' height='30px'>
		</td>
		
		<td style="padding-left: 10px;">
			<b style="font-size: 30px;">리뷰 관리</b>
		</td>
	</tr>
</table>

<div align="left">
	<form action="productReview.do" method="get">
		<select id="_choice" name="choice" style="height: 30px">
			<option value="상품명">상품명</option>
			<option value="내용">내용</option>
			<option value="작성자">작성자</option>
			<option value="별점">별점</option>
			<option value="답변여부">답변여부</option>
		</select>
		
		<input type="text" id="_search" name="search" size="30px"><!--  onkeydown="enter()" -->
		<input type="button" value="검색" onclick="send()" id="_send">
	
		<input type="text" id="afterCate" name="qnaStatus" value="답변완료" size="4" onclick="status_after(this)" readonly><a id="specialCha1">｜</a>
		<input type="text" id="beforeCate" name="qnaStatus" value="답변대기" size="4" onclick="status_before(this)" readonly><a id="specialCha2">｜</a>
		<input type="text" id="deleteCate" name="qnaStatus" value="삭제글" size="2" onclick="status_delete(this)" readonly><a id="specialCha3">｜</a>
		<input type="text" id="allCate" name="qnaStatus" value="전체" size="2" onclick="location.href='productReview.do?'" readonly>
		
		<a id="total_productReview">총 리뷰 수 : ${page}</a>
	</form>
</div>

<div style="height: 700px;">
	<form action="pdReviewReplyDetail.do" method="post" id="_pdReviewReplyDetail">
		<table class="productReview_table">
		<tr>
			<th><input type="checkbox" id="_allCheck" name="allCheck"></th>
			<th>No.</th>
			<th>상품명</th>
			<th>내용</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>별점</th>
			<th>답변여부</th>
		</tr>
		
		<tr>
		<%if(list.size() == 0){
			%>
		<tr class="productReview_list_row">
			<td colspan="8">조회된 글이 없습니다.</td>
		</tr>
		<%}else{
			for(int i=0; i<list.size(); i++){%>
		<tr <%if(String.valueOf(list.get(i).get("R_DEL")).equals("1")){ %> style="color: #D3D3D3"<% }%>>
				<td>
					<input type="checkbox" id="_r_no" name="r_no" value='<%=String.valueOf(list.get(i).get("R_NO"))%>'>
					<input type="hidden" id="_ms_no" name="ms_no" value='<%=String.valueOf(list.get(i).get("MS_NO"))%>'>
				</td>
				<td>
					<input type="hidden" class="no" value="<%=String.valueOf(list.get(i).get("R_NO"))%>"><%=i+1 %>
				</td>
				<td>
					<%=list.get(i).get("P_NAME")%>
				</td>
				<%if(list.get(i).get("R_STATUS").equals("답변대기")){%>
					<td style="cursor: pointer;" onclick="location.href='pdReviewReplyWrite.do?r_no=<%=String.valueOf(list.get(i).get("R_NO"))%>&ms_no=<%=String.valueOf(list.get(i).get("MS_NO"))%>'">
						<%=list.get(i).get("R_CONTENT")%>
					</td>
					<td><%=list.get(i).get("M_ID")%></td>
					<td><%=list.get(i).get("R_WDATE")%></td>
					<td><%=String.valueOf(list.get(i).get("R_SCOPE"))%></td>
					<%if(String.valueOf(list.get(i).get("R_DEL")).equals("1")){ %> 
					<td style="cursor: pointer; color: #D3D3D3;" onclick="location.href='pdReviewReplyWrite.do?r_no=<%=String.valueOf(list.get(i).get("R_NO"))%>&ms_no=<%=String.valueOf(list.get(i).get("MS_NO"))%>'">
						<%=list.get(i).get("R_STATUS") %>
					</td>
					<%}else{ %>
					<td style="cursor: pointer; color: #397BFF" onclick="location.href='pdReviewReplyWrite.do?r_no=<%=String.valueOf(list.get(i).get("R_NO"))%>&ms_no=<%=String.valueOf(list.get(i).get("MS_NO"))%>'">
						<%=list.get(i).get("R_STATUS") %>
					</td>
					<%} %>
				<%}else if(list.get(i).get("R_STATUS").equals("답변완료")){%>
					<td style="cursor: pointer;" onclick="location.href='pdReviewReplyDetail.do?r_no=<%=String.valueOf(list.get(i).get("R_NO"))%>'">
						<%=list.get(i).get("R_CONTENT")%>
					</td>
					<td><%=list.get(i).get("M_ID")%></td>
					<td><%=list.get(i).get("R_WDATE")%></td>
					<td><%=String.valueOf(list.get(i).get("R_SCOPE"))%></td>
					<%if(String.valueOf(list.get(i).get("R_DEL")).equals("1")){ %> 
					<td style="cursor: pointer; color: #D3D3D3;" onclick="location.href='pdReviewReplyDetail.do?r_no=<%=String.valueOf(list.get(i).get("R_NO"))%>'">
						<%=list.get(i).get("R_STATUS") %>
					</td>
					<%}else{ %>
					<td style="cursor: pointer;" onclick="location.href='pdReviewReplyDetail.do?r_no=<%=String.valueOf(list.get(i).get("R_NO"))%>'">
						<%=list.get(i).get("R_STATUS") %>
					</td>
					<%} %>
				<%}%>
			<%} %>
		</tr>
		<%} %>
		</table>
	</form>
	
	<br>
	
	<!-- 삭제 버튼 -->
	<div align="left" class="productReview_ud_btn">
		<button type="button" class="btn btn-dark" id="_del"  onclick="del()">선택삭제</button>
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
			<h2>리뷰 삭제</h2>
		</div>
		<hr>
		<p style="text-align: center; color: gray" id="pTag">리뷰를 삭제하시겠습니까?</p>
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
var r_status;
var choice = "${choice}";
var search = "${search}";

$(document).ready(function () {
	var status = '<%=r_status%>';
	
	if(status == '답변대기'){
	//	$("#beforeCate").css('color', '#007bff');
		$("#beforeCate").css('font-weight', 'bold');
	}else if(status == '답변완료'){
	//	$("#afterCate").css('color', 'red');
		$("#afterCate").css('font-weight', 'bold');
	}else if(status == '삭제글'){
	//	$("#deleteCate").css('color', '#D3D3D3');
		$("#deleteCate").css('font-weight', 'bold');
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

//검색버튼
function send() {
	var src = $("input:text[name='search']").val();
	var sel = $("select").val();
	
	/* location.href="productReview.do?r_status=" + r_status + "&choice=" + sel + "&search=" + src; */
	location.href="productReview.do?choice=" + sel + "&search=" + src;
	
}

function status_before(ths) {
//	alert('대기');
	r_status = $("#beforeCate").val();
//	alert(r_status);
	location.href="productReview.do?r_status=" + r_status + "&choice=" + sel + "&search=" + src;
};

function status_after(ths) {
//	alert('완료');
	r_status = $("#afterCate").val();
//	alert(r_status);
	location.href="productReview.do?r_status=" + r_status + "&choice=" + sel + "&search=" + src;
};

function status_delete(ths) {
//	alert('대기');
	r_status = $("#deleteCate").val();
//	alert(r_status);
	location.href="productReview.do?r_status=" + r_status + "&choice=" + sel + "&search=" + src;
};

// 삭제버튼
function del() {
	var r_no = new Array();
	var no = "";
	var count = $("input[name='r_no']:checked").length;
	var list = $("input[name='r_no']");
	for(var i = 0; i<list.length; i++){
		// 선택되어 있으면 배열에 값을 저장
		if(list[i].checked){
			r_no = $(".no").eq(i).val();
			no += r_no + ",";
		}
	}
	
	if(count==0){
		alert('선택된 글이 없습니다.');
	}else{
		no = no.substring(0, no.lastIndexOf(","));
	
		$.ajax({
			url:"getProductReview.do",
			type:"post",
			data:{ no : no },
			success:function(data){
			//	alert('success');
				if(data.r_del == 1){
					alert('이미 삭제된 글입니다.');
					return;
				}
				$("#_delete").show();
				
				$("#deleteModal").click(function () {
				//	alert('클릭');
					$.ajax({
						url:"pdReviewDelete.do",
						type:"POST",
						data:{ no : no},
						success:function(data){
							if(data == 'YES'){
								alert('성공적으로 삭제되었습니다.');
								location.href="productReview.do";
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


let totalCount = ${page}		// DB에서 받아온 글의 총 수
let pageSize = 10;				// 페이지의 크기 1 ~ 10
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
		alert(page);
		location.href="productReview.do?choice=" + $("#_choice").val() + "&search=" + $("#_search").val() + "&pageNumber=" + (page-1);
	}
});
</script>

