<%@page import="verni.co.kr.faq.FaqDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<style>
.top_table{
	margin-bottom: 10px;
}

.faq_table{
	border-collapse:collapse;
	width: 100%;
	margin-top: 10px;
}

.faq_table th{
	border-top: outset;
	border-bottom: outset;
	background-color: #e9e9e9;
	padding: 10px;
	text-align: center;
}

.faq_table td{
	border-bottom: outset;
	border-bottom-width: thin;
	padding: 10px;
	text-align: center;
}

#_send{
	display: inline;
}

#total_faq{
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

.pagination{
	justify-content: center;		/* 가운데 정렬 */
}

.col three{
	display: inline;
}

.point{
	cursor: pointer;
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
	var oneCheck = document.getElementsByName("f_no");	
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
	$("input[name='f_no']").click(function(){
		if($("input[name='f_no']:checked").length == rowCnt){	// 전체와 하나씩 선택한 길이의 값이 같으면
			$("input[name='allCheck']")[0].checked = true;
		}else{													// 체크가 2개 이상일 경우
			$("input[name='allCheck']")[0].checked = false;
		}
	});
});

</script>

<%
	List<FaqDto> list = (List<FaqDto>)request.getAttribute("list");
%>
<table class="top_table">
	<tr>
		<td>
			<img src="./image/admin/FAQ.png"  width='30px' height='30px'>
		</td>
		
		<td style="padding-left: 10px;">
			<b style="font-size: 30px;">FAQ</b>
		</td>
	</tr>
</table>

<div align="left">
	<form action="faq.do" method="get">
		<select id="_choice" name="choice">
			<option value="분류">분류</option>
			<option value="제목">제목</option>
			<option value="내용">내용</option>
		</select>
		
		<input type="text" id="_search" name="search" size="30px"><!--  onkeydown="enter()" -->
		<input type="button" value="검색" onclick="send()" id="_send">
		
		<a id="total_faq">총 FAQ 수 : ${page}</a>
	</form>
</div>

<div style="height: 700px;">
	<form action="faqDetail.do" method="post" id="_faqDetail">
		<table class="faq_table">
		<col width="5%"><col width="5%"><col width="10%"><col width="30%"><col width="50%">
		<tr>
			<th><input type="checkbox" id="_allCheck" name="allCheck"></th>
			<th>No.</th>
			<th>분류</th>
			<th>제목</th>
			<th>내용</th>
		</tr>
		
		<tr>
		<%if(list.size() == 0){
		%>
		<tr class="faq_list_row">
			<td colspan="5">조회된 글이 없습니다.</td>
		</tr>
		<%}else{
			for(int i=0; i<list.size(); i++){
				FaqDto dto = list.get(i);%>
		<tr>
			<td><input type="checkbox" id="_f_no" name="f_no" value="<%=dto.getF_no() %>"></td>
			<td onclick="faqDetail(<%=dto.getF_no()%>)" class="point">
				<input type="hidden" class="no" value="<%=dto.getF_no() %>"><%=i+1 %>
			</td>
			<td onclick="faqDetail(<%=dto.getF_no()%>)" class="point"><%=dto.getF_category() %></td>
			<td onclick="faqDetail(<%=dto.getF_no()%>)" class="point"><%=dto.getF_title() %></td>
			<td onclick="faqDetail(<%=dto.getF_no()%>)" class="point"><%=dto.getF_content()%></td>
		</tr>
		<%	}
		}	%>
		</table>
	</form>

	<br>
	
	<!-- 삭제,등록 버튼 -->
	<div align="left">
		<button type="button" class="btn btn-dark" id="_del" onclick="del()">선택삭제</button>
		<input type="button" class="btn btn-secondary" style="float:right;" value="FAQ 등록" id="_faq_add" onclick="location.href='faqWrite.do'">
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
			<h1>FAQ 삭제</h1>
		</div>
		<hr>
		<p style="text-align: center; color: gray">정말 삭제하시겠습니까?</p>
		<hr>
		
		<div align="center">
			<!-- 닫기버튼 -->
			<div align="center" id="closeModal">
				<span class="closeModalBtn">
					닫기
				</span>
			</div>
			
			<!-- 삭제버튼 -->
			<div align="center" id="deleteModal">
				<span class="deleteModalBtn">
					삭제
				</span> 
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
//전역변수
var f_status;
var choice = "${choice}";
var search = "${search}";

$(document).ready(function () {
	
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
	
//	alert(dia.indexOf(src));
	
	location.href="faq.do?choice=" + sel + "&search=" + src;
}

// 삭제버튼
function del() {
	var f_no = 0;
	var no = "";
	var count = $("input[name='f_no']:checked").length;
	var list = $("input[name='f_no']");
	for(var i = 0; i<list.length; i++){
		// 선택되어 있으면 배열에 값을 저장
		if(list[i].checked){
		//	f_no.push(list[i].value);
			f_no = $(".no").eq(i).val();
			no += f_no + ",";
		}
	}
	
	if(count==0){
	//	alert(valueArr);
		alert('선택된 질문이 없습니다.');
	}else{
		no = no.substring(0, no.lastIndexOf(","));
		alert(no);
	
		// @ResponseBody 꼭 추가...!
		$.ajax({
			url:"getFaq.do",
			type:"post",
			data:{ no : no },
			success:function(data){
				
				$("#_delete").show();
				
				$("#deleteModal").click(function () {
					alert(no);
					$.ajax({
						url:"faqDelete.do",
						type:"POST",
						data:{ no : no},
						success:function(data){
							if(data == 'YES'){
								alert('성공적으로 삭제되었습니다.');
								location.href="faq.do";
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

function faqDetail(no) {
	location.href="faqDetail.do?f_no=" + no;
}

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
	//	alert(page);
		location.href="faq.do?choice=" + $("#_choice").val() + "&search=" + $("#_search").val() + "&pageNumber=" + (page-1);
	}
});

</script>

