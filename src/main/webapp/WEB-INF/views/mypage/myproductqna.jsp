<%@page import="verni.co.kr.util.ProductUtil"%>
<%@page import="verni.co.kr.qna.QnaDto"%>
<%@page import="verni.co.kr.util.MypageUtil"%>
<%@page import="verni.co.kr.myqna.MyqnaDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<%
List<QnaDto> list = (List<QnaDto>)request.getAttribute("list");
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

<h1 style="margin-top: 2%">상품 Q&A</h1>
<hr align="left" style="border: solid #8A989A;" width="70%">
<br>



<div style="padding-left: 63%">
<select id="search" class="myqna-select" >
	<option value="all">전체</option>
	<option value="waiting">답변대기</option>
	<option value="complete">답변완료</option>
</select>
</div>
<br>

<table class="myqnaTable" width="70%">
<col width="10%"><col width="10%"><col width=""><col width="30%"><col width="15%"><col width="10%">  

<tr align="center">
	<th>분류</th><th colspan="2">상품정보</th><th>제목</th><th>작성일</th><th>답변상태</th>
</tr>


<c:if test="${empty list}">
<tr>
	<td colspan="6">작성된 문의 글이 없습니다</td>
</tr>
</c:if>

<%
for(int i=0; i < list.size(); i++) {
	QnaDto dto = list.get(i);
%>
	<tr align="center">
		
		<%
		switch(dto.getQ_cate()) {
		case "상품관련":%>
		<td>상품관련</td>	<%break;
		case "배송관련":%>
		<td>배송관련</td><%break;
		case "기타문의":%>
		<td>기타문의</td><%break;
		}
		%>
		
		<td><img alt="" src="./upload/thumbnailImage/<%=dto.getP_newimage1() %>" style="width:100px; padding-left:10px; object-fit: fill;"></td>
    	<td align="left"><a href="productDetail.do?p_no=<%=dto.getP_no()%>">[<%=ProductUtil.brandName(dto.getP_brand())%>]<br><%=MypageUtil.dot3(dto.getP_name())%></a></td>
		
		<td align="left"><a href="#" onclick="readFunc(<%=dto.getQ_no()%>)"><%=dto.getQ_title() %></a></td>
		<td><%=MypageUtil.formDate2(dto.getQ_wdate()) %></td>
		
		<%if(dto.getQ_status().equals("답변대기")){
		%>
			<td>답변대기</td>
			
		<%
		}else { //관리자가 답글 달은것.
		%>
			<td><a href="#" onclick="readFunc(<%=dto.getQ_no()%>)">답변완료</a></td>
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

//자신의 글 눌렀을 때 
function readFunc( no ) {
	window.open('myproductqnaRead.do?q_no='+no, 'myproductqnaRead','width=500,height=720,location=no,status=no,scrollbars=yes');
}

//검색했을 때
$("#search").change(function() {
	
	var choice = $("#search").val();
	//alert(choice);
	location.href = "myproductqna.do?search=" + choice + "&menu=myproductqna";
});


//page
function goPage(pageNumber) {
	
	var choice = $("#search").val();
	location.href = "myproductqna.do?pageNumber=" + pageNumber + "&search=" + choice + "&menu=myproductqna";
}
</script>

</body>
</html>