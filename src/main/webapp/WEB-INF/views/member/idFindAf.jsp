<%@page import="verni.co.kr.member.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
MemberDto dto = (MemberDto)request.getAttribute("dto");
//System.out.println(dto.toString());
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> 

<style type="text/css">

.title {
	font-size: 14px;
	padding-left: 20px;
	padding-top: 20px;
}
.content {
	font-size: 14px;
	padding-top: 20px;
}
.findAfbtn:hover{
	background-color: #BE9E81;
	border-color: #BE9E81;
}
.findAfbtn {
  display: inline-block;
  box-sizing: border-box;
  border: 1px solid #231f20;
  text-align: center;
  border-color: #eee;
  background-color: #454545;
  color: white;
  margin-top: 30px;
  margin-left: 40px;
  border-color: #454545;
  width: 130px;
  height: 40px;
  font-size: 14px;
  color: white;
}

</style>
</head>
<body>

<div align="center" style="margin: 100px;">
<p style="font-size: 25px; font-weight: bold;">아이디 찾기</p>
<br>

<%if(dto == null || dto.getM_id() == null) {
%>
<table>
	<tr>
		<td align="center"><p style="font-size: 16px ">회원님의 가입된 정보가 존재하지 않습니다.</p></td>
	</tr>
	<tr>
		<td align="center"><p style="font-size: 16px ">share verni의 회원이 되시면 많은 혜택을 누리실 수 있습니다.</p></td>
	</tr>
	<tr>
		<td align="center"><input type="button" id="regiBtn" value="회원가입" onclick="location.href='regi.do'"></td>	
	</tr>
</table>
<% 	
}else {
%>
	<p style="font-size: 16px ">회원님의 아이디 찾기가 완료 되었습니다.</p>
	<table>
		<col width="200px"><col width="200">
		<tr>
			<td class="title">아이디</td>
			<td class="content"><%=dto.getM_id() %></td>
		</tr>
		<tr>
			<td class="title">이름</td>
			<td class="content"><%=dto.getM_name() %></td>
		</tr>
		<tr>
			<td class="title">가입일</td>
			<td class="content"><%=dto.getM_joindate() %></td>
		</tr>
		<tr>
			<td colspan="2">
			<input type="button" class="findAfbtn" id="login" value="로그인" onclick="location.href='login.do'">
			<input type="button" class="findAfbtn" id="pwdFind" value="비밀번호 찾기" onclick="location.href='pwdFind.do'">
			</td>
		</tr>
	</table>
<%	
}
%>

</div>

</body>
</html>