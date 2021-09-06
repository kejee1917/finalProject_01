<%@page import="verni.co.kr.util.MypageUtil"%>
<%@page import="verni.co.kr.myqna.MyqnaDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<%
List<MyqnaDto> list = (List<MyqnaDto>)request.getAttribute("list");
//System.out.println("리스트확인: "+list);
String search = (String)request.getAttribute("search");
int pageNumber = (int)request.getAttribute("pageNumber");

//글의 총수
int len = (int)request.getAttribute("countAll");
//System.out.println("리스트확인: "+len);

//page 수
int clickPage = len / 5;   // 21/5 = 4
if((len%5) > 0) {   //나머지는 다음페이지로
	clickPage += 1;
}

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


<style type="text/css">
.myqnaTable th{
  text-align: center;
  padding: 10px;
  border-top: 1px solid #888;
  border-bottom: 1px solid #ccc;
  height: 20px;
  line-height: 20px;
  font-size: 12px;
  background-color: #E6E2DC;
}

.myqnaTable tr td{
	height: 20px;
	line-height: 20px;
	padding: 10px;
	font-size: 12px;
	border-bottom: 1px solid #ccc;
}

.myqnaTable tr:last-childe td{
	border-bottom: 1px solid #888;
}

#writeBtn{
  display: inline-block;
  box-sizing: border-box;
  border: 1px solid #231f20;
  height: 40px;
  text-align: center;
  line-height: 20px;
  font-size: 13px;
  background-color: #454545;
  color: white;
  margin-left: 52%; 
  border-color: #2E4D58;
}

#writeBtn:hover{
   background-color: #BE9E81;
   border-color: #BE9E81;
}
.myqna-select {
	height: 25px;
	font-size: 12px;
}
</style>

<script type="text/javascript">
$(document).ready(function() {
	var choice = "${search}";  //model로 짐쌀 때 이름
	//alert(choice);
	
	if(choice != "") {  //검색어 부분 유지하기
		$("#search").val( choice );
		
	}
});
</script>



</head>
<body>

<h1 style="margin-top: 2%">온라인 문의(1:1)</h1>
<hr align="left" style="border: solid #8A989A;" width="70%">
<br>



<div style="padding-left: 1%">


<select id="search" class="myqna-select" >
	<option value="all">전체</option>
	<option value="waiting">답변대기</option>
	<option value="complete">답변완료</option>
</select>


<input type="button" id="writeBtn" value="1:1문의글 작성하기" onclick="writeFunc()">

</div>
<br>

<table class="myqnaTable" width="70%">
<col width="20%"><col width="40%"><col width="20%"><col width="20%">  

<tr align="center">
	<th>분류</th><th>제목</th><th>작성일</th><th>답변상태</th>
</tr>


<c:if test="${empty list}">
<tr>
	<td colspan="4">작성된 문의 글이 없습니다</td>
</tr>
</c:if>

<%
for(int i=0; i < list.size(); i++) {
	MyqnaDto dto = list.get(i);
%>
	<tr align="center">
		
		<%
		switch(dto.getMq_category()) {
		case "member":%>
		<td>회원</td>	<%break;
		case "order":%>
		<td>주문/결제</td><%break;
		case "delivery":%>
		<td>배송</td><%break;
		case "as":%>
		<td>반품/교환</td><%break;
		case "product":%>
		<td>상품</td><%break;
		case "etc":%>
		<td>기타</td><%break;
		}
		%>
		
		<td align="left"><a href="#" onclick="readFunc(<%=dto.getMq_no()%>)"><%=dto.getMq_title() %></a></td>
		<td><%=MypageUtil.formDate2(dto.getMq_wdate()) %></td>
		
		<%if(dto.getMq_status() == 1){
		%>
			<td>답변대기</td>
			
		<%
		}else { //status == 2면 관리자가 답글 달은것.
		%>
			<td><a href="readMyqna.do?mq_no=<%=dto.getMq_no()%>">답변완료</a></td>
		<%	
		}
		%>
	</tr>
<%	
}
%>

</table>




<br><br>
<div style="margin-left: 35%">
<% 
for(int i=0; i< clickPage; i++){
	if(pageNumber == i){
	%>
	<span style="font-size: 15px; color: black; font-weight: bold; text-decoration: underline;">
		<%=i+1 %>
	</span>&nbsp;	
 <%}else{ %>
	<a href="#none"	title="<%=i+1 %>페이지" onclick="goPage(<%=i %>)"
		style="font-size: 15px; color: gray; font-weight: bold; text-decoration:none;">
		<%=i+1 %>
		</a>&nbsp;
<% }	
} %>	
</div>

<script type="text/javascript">

window.name = 'myqnaPage';


//문의글쓰기 팝업창
function writeFunc() {
	window.open('writeMyqna.do', '문의글 작성', 'width=500px,height=500px,scrollbars=yes');
}

//자신의 글 눌렀을 때 
function readFunc( no ) {
	
	location.href = 'readMyqna.do?mq_no=' + no + "&menu=myqna";
}

//검색했을 때
$("#search").change(function() {
	
	var choice = $("#search").val();
	//alert(choice);
	location.href = "myqna.do?search=" + choice + "&menu=myqna";
});


//page
function goPage(pageNumber) {
	
	var choice = $("#search").val();
	location.href = "myqna.do?pageNumber=" + pageNumber + "&search=" + choice + "&menu=myqna";
}
</script>

</body>
</html>