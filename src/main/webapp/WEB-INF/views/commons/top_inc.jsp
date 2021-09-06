
<%@page import="verni.co.kr.member.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
MemberDto mem = (MemberDto)session.getAttribute("login");

if(mem != null){
System.out.println("멤버레벨:"+mem.getM_level());
}
%>

<div style="height: 20px;"></div>
<div class="contianer" style="padding-left: 11%; padding-right: 11%;"
		align="center">
		
<div align="left" style="float: left; height: 50px; width: 50%; padding-left: 5%;">
   <a href="main.do">
   <img alt="" src="./image/main/verni.png" width="300px" ></a>
</div>		
		
		
<div align="right" class="container"  style="float: left; height: 50px; width: 50%;" >
	
	<%if(mem == null){ %>
	<button type="button" class="wish" style="font-size: 11px; padding-left: 1px; padding-right: 6px;" onclick="location.href='login.do'"><i class="fas fa-heart"></i>&nbsp;찜</button>&nbsp;&nbsp;
	<button type="button" class="wish" style="font-size: 11px; padding-left: 1px; padding-right: 6px;" onclick="location.href='login.do'"><i class="fas fa-shopping-cart"></i>&nbsp;장바구니</button>&nbsp;&nbsp;
	<button type="button" class="wish"  style="font-size: 11px; padding-left: 1px; padding-right: 6px;" onclick="location.href='login.do'"><i class="fas fa-sign-in-alt"></i>&nbsp;로그인</button>&nbsp;&nbsp; <!-- 0728은지수정 -->
	<button type="button" class="wish"  style="font-size: 11px; padding-left: 1px; padding-right: 6px;" onclick="location.href='regi.do'"><i class="fas fa-user-plus"></i>&nbsp;회원가입</button>&nbsp;&nbsp; <!-- 0728은지수정 -->	
	<%}else {
		if(mem.getM_level() == 1) { %>
		<button type="button" class="wish" style="font-size: 11px; padding-left: 1px; padding-right: 6px;" onclick="location.href='wishList.do'"><i class="fas fa-heart"></i>&nbsp;찜</button>&nbsp;&nbsp;
		<button type="button" class="wish" style="font-size: 11px; padding-left: 1px; padding-right: 6px;" onclick="location.href='cartList.do'"><i class="fas fa-shopping-cart"></i>&nbsp;장바구니</button>&nbsp;&nbsp;
		<button type="button" class="wish"  style="font-size: 11px; padding-left: 1px; padding-right: 6px;" onclick="location.href='admin.do'"><i class="fas fa-user-cog"></i>&nbsp;관리자페이지</button>&nbsp;&nbsp;
		<button type="button" class="wish"  style="font-size: 11px; padding-left: 1px; padding-right: 6px;" onclick="location.href='logout.do'"><i class="fas fa-sign-out-alt"></i>&nbsp;로그아웃</button>&nbsp;&nbsp;
		<%}else{ %>
		<button type="button" class="wish" style="font-size: 11px; padding-left: 1px; padding-right: 6px;" onclick="location.href='wishList.do'"><i class="fas fa-heart"></i>&nbsp;찜</button>&nbsp;&nbsp;
		<button type="button" class="wish" style="font-size: 11px; padding-left: 1px; padding-right: 6px;" onclick="location.href='cartList.do'"><i class="fas fa-shopping-cart"></i>&nbsp;장바구니</button>&nbsp;&nbsp;
		<button type="button" class="wish"  style="font-size: 11px; padding-left: 1px; padding-right: 6px;" onclick="location.href='mypageHome.do'"><i class="fas fa-user"></i>&nbsp;마이페이지</button>&nbsp;&nbsp; 
		<button type="button" class="wish"  style="font-size: 11px; padding-left: 1px; padding-right: 6px;" onclick="location.href='logout.do'"><i class="fas fa-sign-out-alt"></i>&nbsp;로그아웃</button>&nbsp;&nbsp; 
	<%}
	}	%>
</div>
<br>


</div>

<div align="center" style="clear: both; padding-left: 11%; padding-right: 11%; height: 30px;">

  <!--  <a href="main.do">
   <img alt="" src="./image/main/verni.png" width="300px" height="auto"></a> -->
</div>


















