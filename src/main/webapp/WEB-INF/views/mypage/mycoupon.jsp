<%@page import="verni.co.kr.util.MypageUtil"%>
<%@page import="verni.co.kr.benefit.CouponDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>        
<%
List<CouponDto> list = (List<CouponDto>)request.getAttribute("list");
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
.remainCoupon {
   font-size: 30px;
   padding-left: 30px;
   padding-right: 10px;
}

.tableCoupon th{
  text-align: left;
  padding: 10px;
  border-top: 1px solid #888;
  border-bottom: 1px solid #ccc;
  height: 20px;
  line-height: 20px;
  font-size: 12px;
  background-color: #E6E2DC;
}

.tableCoupon tr td{
	height: 20px;
	line-height: 20px;
	padding: 10px;
	font-size: 12px;
	border-bottom: 1px solid #ccc;
}

.tableCoupon tr:last-childe td{
	border-bottom: 1px solid #888;
}





</style>
</head>
<body>


<h1 style="margin-top: 2%">나의 쿠폰</h1>
<hr align="left" style="border: solid #8A989A;" width="70%">

<div class="remain-wrap" style="padding-left: 25%">
	<p style="font-size: 18px">사용 가능한 쿠폰<span class="remainCoupon">${couponCount}</span>개</p>
</div>

<hr align="left" width="70%">

<br><br>

<table class="tableCoupon" width="70%">
	<tr>
		<th>구분</th>
		<th width="17%">쿠폰명</th>
        <th width="15%">할인(금액/%)</th>
        <th width="15%">적용 가능 금액</th>
        <th width="15%">최대 할인 금액</th>
        <th width="20%">만료 예정일시</th>
        <th width="10%">상태</th>
	</tr>
	
	<c:if test="${empty list}">
	<tr>
    	<td colspan="7">해당되는 쿠폰 내역이 없습니다.</td>
    </tr>
    </c:if>
    
    <%
    for(int i=0; i<list.size(); i++) {
    	CouponDto dto = list.get(i);
    %>
    <tr>
    	<td><%=dto.getCp_category() %></td>
    	<td><%=dto.getCp_name() %></td>
    	<td><%=dto.getCp_amount() %></td>
    	<td><%=dto.getCp_limitmin() %></td>
    	<td><%=dto.getCp_limitmax() %></td>
    	<td><%=MypageUtil.formEndDate(dto.getMc_enddate()) %></td>
    	<td><%=dto.getMc_use() %></td>
    </tr>	
    <%	
    }
    %>    
    
    
</table>    
</body>
</html>