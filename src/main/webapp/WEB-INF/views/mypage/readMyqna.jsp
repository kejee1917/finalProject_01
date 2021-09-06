<%@page import="verni.co.kr.myqna.MyqnaReplyDto"%>
<%@page import="verni.co.kr.util.MypageUtil"%>
<%@page import="verni.co.kr.myqna.MyqnaDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
MyqnaDto qdto = (MyqnaDto)request.getAttribute("qdto");
MyqnaReplyDto replydto = (MyqnaReplyDto)request.getAttribute("replydto");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


<style type="text/css">
.readMyqna-table td {
	border-bottom: 1px solid white;
	padding-top: 10px;
	padding-bottom: 10px;
	font-size: 12px;
}

#list {
  display: inline-block;
  box-sizing: border-box;
  border: 1px solid #231f20;
  height: 40px;
  text-align: center;
  line-height: 30px;
  font-size: 13px;
  background-color: #454545;
  color: white;
  margin-left: 0.2%;
  border-color: #2E4D58;
  cursor: pointer;
}
.btn1 {
  display: inline-block;
  box-sizing: border-box;
  border: 1px solid #231f20;
  height: 40px;
  width: 60px;
  text-align: center;
  line-height: 30px;
  font-size: 13px;
  border-color: #eee;
  background-color: white;
  color: #2E4D58;
  cursor: pointer;
  margin-left: 0.2%;
}
</style>
</head>
<body>

<h1 style="margin-top: 2%">온라인 문의(1:1) > 상세보기</h1>
<hr align="left" style="border: solid #8A989A;" width="70%">
<br><br>

<img alt="" src="image/mypage/qna_q.png" width="40px">


<table class="readMyqna-table">
<col width="100px"><col width="400px">




<tr>
	<td>분류</td>
	<td>
		<select id="category" disabled="disabled">
			<option value="">--카테고리 선택--</option>
			<option value="member">회원</option>
			<option value="order">주문/결제</option>
			<option value="delivery">배송</option>
			<option value="as">반품/교환/AS</option>
			<option value="product">상품</option>
			<option value="etc">기타</option>
		</select>
	</td>

</tr>
<tr>
	<td>제목</td>
	<td>${qdto.mq_title }</td>
</tr>
<tr>
	<td>문의내용</td>
	<td>
		${qdto.mq_content}<br><br>
		<%
		if(qdto.getMq_newfilename() == null) {  //사진 없으면~
		%>
			
		<%	
		}else {
		%>
		
		<%	System.out.println(qdto.getMq_newfilename());
			String image[] =  qdto.getMq_newfilename().split(",");
			for(int i=0; i<image.length; i++){
				if(! (image[i].equals("") || image.length == 0)){
					System.out.println(image[i]);
				//System.out.println(image[i]);
		%>
	    	
	      <img src="./upload/myqnaImage/<%=image[i]%>" width="100px"/>
	    
	    <%}
	    } 
	   }
	    %>
</tr>

<tr>
<td>작성일</td>
<td><%=MypageUtil.formDate(qdto.getMq_wdate()) %></td>
</tr>

</table>

<br><br><br>
<hr align="left" style="border: 1px thin #ccc;" width="40%">
<%if(replydto != null) {
%>

<img alt="" src="image/mypage/qna_a.png" width="40px">


<table class="readMyqna-table">
<col width="100px"><col width="400px">


<tr>
	<td>답글내용</td>
	<td>
		${replydto.mqr_content}<br><br>
	</td>	
</tr>

<tr>
	<td>작성일</td>
	<td><%=MypageUtil.formDate(replydto.getMqr_wdate()) %></td>
</tr>

</table>

<br>
<div style="padding-left: 20%">
<input type="button" class="btn1" id="delete" value="삭제">
<input type="button" id="list" value="1:1문의 목록">
</div>
<%	
}else {
%>
<br>
<div style="padding-left: 20%">
<input type="button" class="btn1" id="update" value="수정">
<input type="button" class="btn1" id="delete" value="삭제">
<input type="button" id="list" value="1:1문의 목록">
</div>
<%	
}
%>



<script type="text/javascript">
$(document).ready(function() {
	$('#category').val('${qdto.mq_category}').prop("selected",true); 
});


$("#list").click(function() {
	location.href = "myqna.do?menu=myqna";
});

$("#update").click(function() {
	location.href = "myqnaUpdate.do?menu=myqna&mq_no=<%=qdto.getMq_no()%>";
});

$("#delete").click(function() {
	if(confirm("정말 삭제하시겠습니까?") == true) { //alert창으로 한번 더 확인 절차
		location.href = "myqnaDelete.do?mq_no=" + ${qdto.mq_no};
	}else {
		return;
	}	
});


</script>

</body>
</html>