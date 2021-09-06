<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="verni.co.kr.qna.QnaDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<style>
.top_table{
	margin-bottom: 10px;
}

.productQna_table{
	border-collapse:collapse;
	width: 100%;
	margin-top: 10px;
}

.productQna_table th{
	border-top: outset;
	border-bottom: outset;
	background-color: #e9e9e9;
	padding: 10px;
	text-align: center;
}

.productQna_table td{
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
	text-align: right;
	font-weight: bold;
}

#beforeCate{
	border: 0px none;
	outline: none;
	font-size: 14px;
	float: right;
	color: #397BFF;
	cursor: pointer;
	text-align: right;
	font-weight: bold;
}

#specialCha1{
	font-size: 14px;
	float: right;
	font-weight: bold;
}
	
#allCate{
	border: 0px none;
	outline: none;
	font-size: 14px;
	float: right;
	color: red;
	cursor: pointer;
	text-align: right;
	font-weight: bold;
}

#specialCha2{
	font-size: 14px;
	float: right;
	font-weight: bold;
}

#total_productQna{
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
	width: 100%;
	border: 1px solid #888;
	text-align: center;
	padding-bottom: 10px;
	padding-top: 10px;
}

#_update, #_del{
	background-color: #4682b4; 
	color: white; 
	width:100px;
}
.closeModalBtn, .deleteModalBtn{
	font-size: 15px
}

#_img{
	width: 80px;
	height: 80px;
}

#pTag{
	display: inline;
}

#_pdName{
	display: inline;
}

.pagination{
	justify-content: center;		/* 가운데 정렬 */
}

.productQna_ud_btn{
	display: inline;
}

#status_before{
	text-decoration: underline;
}

</style>

<script type="text/javascript">
// 체크박스
$(function(){
	var oneCheck = document.getElementsByName("Q_no");	
	var rowCnt = oneCheck.length;
	
	
	// 전체선택
	$("input[name='allCheck']").click(function(){
		if($("input[name='allCheck']").prop("checked")){
			for (var i=0; i<rowCnt; i++){
				oneCheck[i].checked = this.checked;
			//	alert('전체선택');
				$("#_update").hide();
			}
	// 전체해제		
		}else{
			for (var i=0; i<rowCnt; i++){
				oneCheck[i].checked = this.checked;
			//	alert('전체해제');
				$("#_update").show();
			}
		}
	});
	
	// 하나씩 선택해서 전체가 될 때
	$("input[name='Q_no']").click(function(){
		if($("input[name='Q_no']:checked").length == rowCnt){	// 전체와 하나씩 선택한 길이의 값이 같으면
			$("input[name='allCheck']")[0].checked = true;
			alert('한개씩 전체');
			$("#_update").hide();
		}else if($("input[name='Q_no']:checked").length < 2){	// 체크가 1개일 경우
			$("#_update").show();
		}else{													// 체크가 2개 이상일 경우
			$("input[name='allCheck']")[0].checked = false;
			alert('한개체크');
			$("#_update").hide();
		}
	});
});


</script>

<%
	Object obj = request.getAttribute("list");
	/* String choice = (String)request.getAttribute("choice");
	String search = (String)request.getAttribute("search");
	String q_status = (String)request.getAttribute("q_status"); */


	List<HashMap<String,String>> list = null;
	
	if(obj != null){
		list = (List<HashMap<String,String>>)obj;
		System.out.println("상품문의 JSP : " + list.toString());
	}
	
%>

<table class="top_table">
	<tr>
		<td>
			<img src="./image/admin/qna.png" width='30px' height='30px'>
		</td>
		
		<td style="padding-left: 10px;">
			<b style="font-size: 20px;">상품문의 관리</b>
		</td>
	</tr>
</table>

<div align="left">
	<form action="productQna.do" method="get">
		<select id="_choice" name="choice">
			<option value="문의유형">문의유형</option>
			<option value="상품명">상품명</option>
			<option value="제목">제목</option>
			<option value="내용">내용</option>
			<option value="작성자">작성자</option>
			<option value="답변여부">답변여부</option>
		</select>
		
		<input type="text" id="_search" name="search" size="30px"><!--  onkeydown="enter()" -->
		<input type="button" value="검색" onclick="send()" id="_send">
	
		<input type="text" id="afterCate" name="qnaStatus" value="답변완료" size="4" onclick="status_after(this)" readonly><a id="specialCha1">｜</a>
		<input type="text" id="beforeCate" name="qnaStatus" value="답변대기" size="4" onclick="status_before(this)" readonly><a id="specialCha2">｜</a>
		<input type="text" id="allCate" name="qnaStatus" value="전체" size="2" onclick="location.href='productQna.do?'" readonly>
		
		<!-- 
		<a id="afterCate" onclick="location.href='productQna.do?'"><b>답변완료</b></a><a id="specialCha1">｜</a>
		<a id="beforeCate" onclick="status_before(this)"><b>답변대기</b></a><a id="specialCha2">｜</a>
		<a id="allCate" onclick="location.href='productQna.do'"><b>전체</b></a>
		 -->
		<a id="total_productQna">총 상품문의 수 : <%=list.size() %></a>
	</form>
</div>

<div>
	<form action="pdQnaReplyDetail.do" method="post" id="_pdQnaReplyDetail">
		<table class="productQna_table">
		<tr>
			<th><input type="checkbox" id="_allCheck" name="allCheck"></th>
			<th>No.</th>
			<th>문의유형</th>
			<th>상품명</th>
			<th>제목</th>
			<th>내용</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>답변여부</th>
		</tr>
		
		<tr>
		<%if(list.size() == 0){
			%>
		<tr class="productQna_list_row">
			<td colspan="8">조회된 글이 없습니다.</td>
		</tr>
		<%}else{
			for(int i=0; i<list.size(); i++){
				/* HashMap<Object,Object> dto = list.get(i);
				System.out.println(dto.toString());	 */	
				%>	
		<tr <%if(String.valueOf(list.get(i).get("Q_DEL")).equals("1")){ %> style="color: #D3D3D3"<% }%>>
				<td>
					<input type="checkbox" id="_q_no" name="q_no" value='<%=String.valueOf(list.get(i).get("Q_NO"))%>'>
				</td>
				<td><%=i+1 %></td>
				<td><%=list.get(i).get("Q_CATE")%></td>
				<td>
					<%=list.get(i).get("P_NAME")%>
				</td>
				<td>
					<%=list.get(i).get("Q_TITLE")%>
				</td>
				<td><%=list.get(i).get("Q_CONTENT")%></td>
				<td><%=list.get(i).get("M_ID")%></td>
				<td><%=list.get(i).get("Q_WDATE")%></td>
				<td style="cursor: pointer;" onclick="reply()" class="replyStatus">
					<%=list.get(i).get("Q_STATUS") %>
				</td>
			<%} %>
		</tr>
		<%	}
		%>
		</table>
	</form>
</div>
<br>

<!-- 삭제 버튼 -->
<div align="left" class="productQna_ud_btn">
	<button type="button" id="_del" onclick="del()">선택삭제</button>
</div>
	

<!-- pagination -->
<div>
    <nav aria-label="Page navigation">
        <ul class="pagination" id="pagination"></ul>
    </nav>
</div>

<!-- 삭제 모달창 -->
<div id="_delete" class="searchModal">
	<div class="search_modal_content">
		<div class="page_header" align="center">
			<h2>문의글 삭제</h2>
		</div>
		<hr>
		<p style="text-align: center; color: gray" id="pTag"><p id="_pdName"></p> 문의글을 삭제하시겠습니까?</p>
		<hr>
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



<script type="text/javascript">
$(document).ready(function () {

});

// 전역변수
var q_status;

//검색버튼
function send() {
	
	var src = $("input:text[name='search']").val();
	var sel = $("select").val();
	
	/* location.href="productQna.do?q_status=" + q_status + "&choice=" + sel + "&search=" + src; */
	location.href="productQna.do?choice=" + sel + "&search=" + src;
}

function status_before(ths) {
//	alert('대기');
	/* var qnaStatus = document.getElementsByName('qnaStatus').value; */
	q_status = $("#beforeCate").val();
//	alert(q_status);
	location.href="productQna.do?q_status=" + q_status + "&choice=" + sel + "&search=" + src;
};

function status_after() {
//	alert('완료');
	q_status = $("#afterCate").val();
//	alert(q_status);
	location.href="productQna.do?q_status=" + q_status + "&choice=" + sel + "&search=" + src;
};

// 삭제버튼
function del() {
//	alert('삭제');
	
	var q_no = new Array();
	var list = $("input[name='q_no']");
	for(var i = 0; i<list.length; i++){
		// 선택되어 있으면 배열에 값을 저장
		if(list[i].checked){
			q_no.push(list[i].value);
		//	alert(valueArr);
		}
	}if(q_no.length==0){
	//	alert(valueArr);
		alert('선택된 글이 없습니다.');
	}else{
		// 문자 -> 숫자로 변환해줘야함(10진법으로 리턴)
		var q_no = parseInt(q_no, 10);
		//	alert(q_no);
	
		// @ResponseBody 꼭 추가...!
		$.ajax({
			url:"getProductQna.do",
			type:"post",
			data:{ q_no : q_no },
			success:function(data){
			//	alert('success');
				var p_name = JSON.stringify(data.p_name);
			//	alert(p_name);
				$("#_pdName").html(p_name);		// pTag는 html
				$("#_delete").show();
				
				$("#deleteModal").click(function () {
				//	alert('클릭');
					$.ajax({
						url:"pdQnaDelete.do",
						type:"POST",
						data:{ q_no : q_no},
						success:function(data){
						//	alert('success');
							if(data == 'YES'){
								alert('성공적으로 삭제되었습니다.');
								location.href="productQna.do";
							}else if(data == 'NO'){
								alert('다시 시도해주시기 바랍니다.');
							}
						},error:function(){
							alert('error');
						}
					});
				});
				
				$("#closeModal").click(function () {
				//	alert('닫기');
					$(".searchModal").hide();
				});
			},error:function(){
				alert('error');
			}
		});
	}
}

function reply() {
	var status = ($(".replyStatus").text().replace(/(\s*)/g, ""));
	alert(status);
	var q_no = $("#_q_no").val();
	if(status == "답변대기"){
	//	alert(q_no);
		location.href='pdQnaReplyWrite.do?q_no='+q_no;
	}else if(status == "답변완료"){
		location.href='pdQnaReplyDetail.do?q_no='+q_no;
	}

};

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
		location.href="productQna.do?choice=" + $("#_choice").val() + "&search=" + $("#_search").val() + "&pageNumber=" + (page-1);
	}
});
</script>

