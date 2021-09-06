<%@page import="verni.co.kr.util.MypageUtil"%>
<%@page import="verni.co.kr.util.ProductUtil"%>
<%@page import="verni.co.kr.order.OrderDetailDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>        
<%
List<OrderDetailDto> list = (List<OrderDetailDto>)request.getAttribute("list");
//System.out.println(list);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.reviewTable th{
  text-align: left;
  padding: 10px;
  border-top: 1px solid #888;
  border-bottom: 1px solid #ccc;
  height: 20px;
  line-height: 20px;
  font-size: 12px;
  background-color: #E6E2DC;
}

.reviewTable tr td{
   height: 20px;
   line-height: 20px;
   padding: 10px;
   font-size: 12px;
   border-bottom: 1px solid #ccc;
}

.reviewTable tr:last-childe td{
   border-bottom: 1px solid #888;
}

a {
   font-size: 14px;
     color: black;
}
.box {
   width: 35%;
   height: 40px;
   border-color: #0F2620;
   background-color: #0F2620;
   font-size: 15px;
   color: white;
   	border: 0;
	outline: 0;
}

.box:hover{
   background-color: #8A989A;
   border-color: #8A989A;
   	border: 0;
	outline: 0;
}
.box-clicked {
   background-color: #8A989A;
   border-color: #8A989A;
   border: 0;
   outline: 0;
   font-size: 15px;
   color: white;
   border: 0;
   outline: 0;
   width: 35%;
   height: 40px;
}

.review-btn {
	width: 60px;
	height: 30px;
	font-size: 14px;
	background-color: #8A989A;
	border-color: #8A989A;
	color: white;
	border: 0;
	outline: 0;
}
.review-btn:hover {
	background-color: #0F2620;
	border-color: #0F2620;
	border: 0;
	outline: 0;
}

</style>

</head>
<body>

<h1 style="margin-top: 2%">나의 리뷰</h1>
<hr align="left" style="border: solid #8A989A;" width="70%">

<input type="button" class="box-clicked" onclick="location.href='valid.do?menu=myreview'" value="작성 가능한 리뷰">
&nbsp;
<input type="button" class="box" onclick="location.href='myreview.do?menu=myreview'" value="작성한 리뷰"> 

<br><br><br>


<table class="reviewTable" width="70%">
<col width="100px"><col width="200px"><col width="200px"><col width="200px"><col width="100px">  
<tr>
   <th colspan="2">상품명</th><th>수령일</th><th>반납일</th><th>상태</th>
</tr>

<c:if test="${empty list}">
   <tr>
       <td colspan="5">작성 가능한 리뷰가 없습니다.</td>
    </tr>
</c:if>
   <%
   for(int i=0; i < list.size(); i++) {
      OrderDetailDto dto = list.get(i);
   %> 
   <tr>
      <td><img alt="" src="./upload/thumbnailImage/<%=dto.getP_newimage1() %>" style="width:100px; padding-left:10px; object-fit: fill;"></td>
      <td align="left"><a href="productDetail.do?p_no=<%=dto.getP_no()%>">[<%=ProductUtil.brandName(dto.getP_brand())%>]<br><%=MypageUtil.dot3(dto.getP_name())%></a></td>
      <td><%=MypageUtil.formDate3(dto.getOd_startdate())%></td>
      <td><%=MypageUtil.formDate3(dto.getOd_enddate())%></td>
      <td><input type="button" class="review-btn" id="review" onclick="writereview(<%=dto.getOd_no()%>)" value="리뷰쓰기"></td>
   </tr>   
    
    <%} %>
</table>

 

</body>




<script type="text/javascript">
//리뷰쓰기 버튼 클릭
function writereview(odno) {
   let od_no = odno;
   window.open('reviewWrite.do?od_no='+od_no, 'popup02','width=500,height=720,location=no,status=no,scrollbars=yes');
}


</script>
</html>