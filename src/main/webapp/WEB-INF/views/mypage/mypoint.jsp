<%@page import="verni.co.kr.util.MypageUtil"%>
<%@page import="java.util.List"%>
<%@page import="verni.co.kr.benefit.PointUseDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<%
List<PointUseDto> list = (List<PointUseDto>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
.remain-wrap{
	width: 70%;
	padding: 2%;
	font-size: 12px;
	background-color: #E6E2DC;
}
.remainCash {
   font-size: 30px;
   padding-left: 30px;
   padding-right: 10px;
   
}

.tableForm th{
  text-align: left;
  padding: 10px;
  border-top: 1px solid #888;
  border-bottom: 1px solid #ccc;
  height: 20px;
  line-height: 20px;
  font-size: 12px;
  background-color: #E6E2DC;
  
}

.tableForm tr td{
   height: 20px;
   line-height: 20px;
   padding: 10px;
   font-size: 12px;
   border-bottom: 1px solid #ccc;
}

.tableForm tr:last-childe td{
   border-bottom: 1px solid #888;
}




</style>
</head>
<body>

<h1 style="margin-top: 2%">나의 포인트</h1>
<hr align="left" style="border: solid #8A989A;" width="70%">

<div class="remain-wrap" style="padding-left: 23%">
   <p style="font-size: 18px">사용 가능한 포인트<span class="remainCash">${pointCount}</span>point</p>
</div>

<hr align="left" width="70%">

<br><br>

<table class="tableForm" width="70%">
   <tr>
      <th width="200">적립/사용 일시</th>
      <th>내용</th>
      <th width="120">금액</th>
      <th width="120">구분</th>
      <th width="200">만료 예정일시</th>
   </tr>
   
   <c:if test="${empty list}">
   <tr>
       <td colspan="5">포인트 내역이 없습니다.</td>
    </tr>
    </c:if>
    
    <%
    for(int i=0; i<list.size(); i++) {
       PointUseDto dto = list.get(i);
    %>
    <tr>
		<%
		if(dto.getPu_category().equals("만료")) {
		%>	
		<td><%=MypageUtil.formStartDate(dto.getP_startdate()) %></td>	
		<%
		}else {
		%>
		<td><%=MypageUtil.formStartDate(dto.getPu_usedate()) %></td>	
		<%	
		}
		%>
       
       
       <%
       if(dto.getPu_category().equals("적립")) {
       %>
       <td><%=dto.getP_name() %></td>
       <%   
       }else {
       %>
       <td><%=dto.getPu_name() %></td>	   
      <%
      }
      %> 
       
      <%if(dto.getPu_category().equals("적립")) {
         %>
         <td><%="+ " + dto.getPu_amount() %></td>
         <%   
      }else if(dto.getPu_category().equals("취소")){
         %>
         <td><%="+ " + dto.getPu_amount() %></td>
         <%
      }else if(dto.getPu_category().equals("사용")){
         %>
         <td><%="- " + dto.getPu_amount() %></td>
         <%
      }else if(dto.getPu_category().equals("만료")){
         %>
         <td><%="- " + dto.getPu_amount() %></td>
         <%
      }
      %>
       
       <td><%=dto.getPu_category() %></td>
       
       <%if(dto.getPu_category().equals("사용") || dto.getPu_category().equals("만료")) {
    	   %>
    	   <td>-</td>
    	<%    
       }else {
    	   %>
    	   <td><%=MypageUtil.formEndDate(dto.getP_enddate()) %></td>
    	   <%
       }
       %>
    </tr>   
    <%   
    }
    %>
</table>

<table>

</table>

</body>
</html>