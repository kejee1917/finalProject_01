
<%@page import="verni.co.kr.member.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<%
MemberDto mem = (MemberDto)session.getAttribute("login");
String menu = (String)request.getAttribute("menu");
%>       
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
.mymenu-wrap{
   padding-bottom: 13%;
}

.mymenu-table{
   border: 1px solid #E2E2E2;
   font-size: 14px;
   margin-left: 43%;
}

.top-name{
	background-color: #8A989A;
	color: white;
}
tr:nth-child(6) {
     
}

.mymenu-name{
   font-size: 16px;
   font-weight: bold;
   padding-top: 20px;
   padding-bottom: 15px;
   padding-left: 10%;
}

.mymenu-sub{
   padding-top: 2%;
   padding-bottom: 10%;
   padding-left: 10%;
}

.mymenu-name-wrap {
   border-top: 1px thin 2E4D58;
}

.subname-click {
   cursor: pointer;
}

.subname-click:hover {
   text-decoration: underline;
}
</style>



<script type="text/javascript">

let menu = "<%=menu %>";
$(document).ready(function() {
   if(menu == 'mycal') {
      $("#mycal").css("text-decoration", "underline");
      $("#mycal").css("font-weight", "bold");
   }else if(menu == 'mypoint') {
      $("#mypoint").css("text-decoration", "underline");
      $("#mypoint").css("font-weight", "bold");
   }else if(menu == 'myorder') {
      $("#myorder").css("text-decoration", "underline");
      $("#myorder").css("font-weight", "bold");
   }else if(menu == 'mycoupon') {
      $("#mycoupon").css("text-decoration", "underline");
      $("#mycoupon").css("font-weight", "bold");
   }else if(menu == 'myreview') {
      $("#myreview").css("text-decoration", "underline");
      $("#myreview").css("font-weight", "bold");
   }else if(menu == 'myproductqna') {
      $("#myproductqna").css("text-decoration", "underline");
      $("#myproductqna").css("font-weight", "bold");
   }else if(menu == 'myqna') {
      $("#myqna").css("text-decoration", "underline");
      $("#myqna").css("font-weight", "bold");
   }else if(menu == 'mypage') {
      $("#myinfo").css("text-decoration", "underline");
      $("#myinfo").css("font-weight", "bold");
   }else if(menu == 'withdraw') {
      $("#withdraw").css("text-decoration", "underline");
      $("#withdraw").css("font-weight", "bold");
   }
});


</script>


</head>
<body>

<div class="mymenu-wrap">
<table class="mymenu-table" style="width: 50%;">
   <col width="100%">
   
   <tr align="center" style="border-bottom: 1px solid 2E4D58">
      <td class="top-name" style="padding: 10% 0% 10% 0%; font-size: 16px">my share verni</td>
   </tr>
   
   <tr align="center">

      <td style="padding-top: 30px">
      	  	<c:if test="${dto.m_level == '2'}">
            <img alt="" src="image/mypage/newmem.png" width="80px">
           </c:if> 
           <c:if test="${dto.m_level == '3'}">
            <img alt="" src="image/mypage/silver.png" width="80px">
           </c:if>
           <c:if test="${dto.m_level == '4'}">
            <img alt="" src="image/mypage/gold.png" width="80px">
           </c:if>
           <c:if test="${dto.m_level == '5'}">
            <img alt="" src="image/mypage/dia.png" width="80px">
           </c:if>   
      <br><br>안녕하세요!<br>
      <%=mem.getM_id() %>님
      </td>
   </tr>
   
   <tr><td>&nbsp;</td></tr>
   <tr align="center" style="border-bottom: 1px solid #E2E2E2;">
      <td>
      등급 : <c:if test="${dto.m_level == '2'}">
            [일반 회원]
           </c:if> 
           <c:if test="${dto.m_level == '3'}">
            [실버 회원]
           </c:if>
           <c:if test="${dto.m_level == '4'}">
            [골드 회원]
           </c:if>
           <c:if test="${dto.m_level == '5'}">
            [다이아 회원]
           </c:if>   
      </td>
   </tr>
   <tr><td>&nbsp;</td></tr>
   
   <tr class="mymenu-name-wrap">
      <td class="mymenu-name">구매정보</td>
   </tr>
   <tr class="mymenu-sub-wrap">
      <td class="mymenu-sub"><span class="subname-click" id="mycal" onclick="moveFunc(1)">나의 대여 관리</span></td> <!-- onclick="location.href='mypageCal.do'" -->
   </tr>
   <tr class="mymenu-sub-wrap">
      <td class="mymenu-sub"><span class="subname-click" id="myorder" onclick="moveFunc(2)">주문/배송 현황</span></td>
   </tr>
   <tr class="mymenu-name-wrap">
      <td class="mymenu-name">혜택 관리</td>
   </tr>
   <tr class="mymenu-sub-wrap">
      <td class="mymenu-sub"><span class="subname-click" id="mypoint" onclick="moveFunc(3)">나의 포인트</span></td>
   </tr>
   <tr class="mymenu-sub-wrap">
      <td class="mymenu-sub"><span class="subname-click" id="mycoupon" onclick="moveFunc(4)">나의 쿠폰</span></td>
   </tr>
   
   <tr class="mymenu-name-wrap">
      <td class="mymenu-name">작성글 관리</td>
   </tr>
   <tr class="mymenu-sub-wrap">
      <td class="mymenu-sub"><span class="subname-click" id="myreview" onclick="moveFunc(5)">나의 리뷰</span></td>
   </tr>
   <tr class="mymenu-sub-wrap">
      <td class="mymenu-sub"><span class="subname-click" id="myproductqna" onclick="moveFunc(6)">상품 Q&A</span></td>
   </tr>
   <tr class="mymenu-sub-wrap">
      <td class="mymenu-sub"><span class="subname-click" id="myqna" onclick="moveFunc(7)">온라인 문의(1:1)</span></td>
   </tr>
   
   <tr class="mymenu-name-wrap">
      <td class="mymenu-name">내 정보 관리</td>
   </tr>
   <tr class="mymenu-sub-wrap">
      <td class="mymenu-sub"><span class="subname-click" id="myinfo" onclick="moveFunc(8)">내 정보 수정</span></td>
   </tr>
   <tr class="mymenu-sub-wrap">
      <td class="mymenu-sub"><span class="subname-click" id="withdraw" onclick="moveFunc(9)">회원 탈퇴</span></td>
   </tr>
   <tr><td>&nbsp;</td></tr>
   <tr align="center" style="border-top: 1px solid #E2E2E2;">
      <td style="padding-top:10px; font-size: 17px; font-weight: bold;">고객센터</td>
   </tr>
      <tr align="center">
      <td style="padding-top: 10px; font-size: 24px; text-decoration: underline;">777-7777</td>
   </tr>
      <tr align="center">
      <td>평일 10:00~18:00</td>
   </tr>
</table>
</div>


<script type="text/javascript">
function moveFunc( n ) {
   if(n == 1) {
      location.href='mypageCal.do?menu=mycal';
   }else if(n == 2) {
      location.href='myorder.do?menu=myorder';
   }else if(n == 3) {
      location.href='mypoint.do?menu=mypoint';
   }else if(n == 4) {
      location.href='mycoupon.do?menu=mycoupon';
   }else if(n == 5) {
      location.href='myreview.do?menu=myreview';
   }else if(n == 6) {
      location.href='myproductqna.do?menu=myproductqna';
   }else if(n == 7) {
      location.href='myqna.do?menu=myqna';
   }else if(n == 8) {
      location.href='mypage.do?menu=mypage';
   }else if(n == 9) {
      location.href='withdraw.do?menu=withdraw';
   }
}

/* $("#mycal").click(function() {
   location.href='mypageCal.do?menu=mycal';
   
}); */


</script>

</body>
</html>