<%@page import="verni.co.kr.myqna.MyqnaReplyDto"%>
<%@page import="verni.co.kr.util.MypageUtil"%>
<%@page import="verni.co.kr.myqna.MyqnaDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 


<%
MyqnaDto qdto = (MyqnaDto)request.getAttribute("qdto");
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
.cancel {
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
  cursor: pointer
}

.update {
  display: inline-block;
  box-sizing: border-box;
  border: 1px solid #231f20;
  height: 40px;
  width: 60px;
  text-align: center;
  line-height: 30px;
  font-size: 13px;
  border-color: #0F2620;
  background-color: #0F2620;
  color: white;
  cursor: pointer
}

/* 기존형태 숨기기 */
.filebox input[type="file"] { 
	position: absolute; 
	width: 1px; 
	height: 1px; 
	padding: 0; 
	margin: -1px; 
	overflow: hidden; 
	clip:rect(0,0,0,0); 
	border: 0; 
}
 
.filebox label { 
	display: inline-block; 
	padding: .5em .75em; 
	color: white; 
	font-size: inherit; 
	line-height: normal; 
	vertical-align: middle; 
	background-color: #BE9E81; 
	cursor: pointer; 
	border: 1px solid #BE9E81; 
	border-bottom-color: #BE9E81; 
	border-radius: .25em; 
} 

/* named upload */ 
.filebox .upload-name { 
	display: inline-block; 
	padding: .5em .75em; /* label의 패딩값과 일치 */ 
	font-size: inherit; 
	font-family: inherit; 
	line-height: normal; 
	vertical-align: middle; 
	background-color: #f5f5f5; 
	border: 1px solid #ebebeb; 
	border-bottom-color: #e2e2e2; 
	border-radius: .25em; 
	-webkit-appearance: none; /* 네이티브 외형 감추기 */ 
	-moz-appearance: none; 
	appearance: none; 
}
.x_btn{
	border: 0;
	outline: 0;
	color: white;
	background-color: #2F5D62;
}

#content {
	resize: none;
}

</style>
</head>
<body>

<h1 style="margin-top: 2%">온라인 문의(1:1) > 수정하기</h1>
<hr align="left" style="border: solid #8A989A;" width="70%">
<br><br>

<form action="myqnaUpdateAf.do" id="frm" name="frm" method="post" enctype="multipart/form-data">
<input type="hidden" name="m_id" value="${login.m_id }">
<input type="hidden" name="mq_no" value="${qdto.mq_no }">
<table class="readMyqna-table" width="50%">

<col width="20%"><col width="20%"><col width="20%"><col width="20%"><col width="20%">


<tr>
	<td>분류</td>
	<td>
		<select id="category" name="mq_category">
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
	<td colspan="4"><input type="text" id="title" name="mq_title" value="${qdto.mq_title}" size="58"></td>
</tr>
<tr>
	<td>문의내용</td>
	<td colspan="4"><textarea id="content" name="mq_content" cols="60" rows="10">${qdto.mq_content}</textarea></td>
</tr>

<tr>
	<td>파일첨부</td>
	<td colspan="4">
	<div class="filebox">
		<input class="upload-name" value="파일선택" disabled="disabled">
		
		<label for="ex_file">사진 업로드</label>
		<input type="file" id="ex_file" name="myqnaImage" class="upload-hidden" multiple="multiple"> 
		<input type="hidden" id="oldimage" name="oldimage" value="<%=qdto.getMq_newfilename()%>">
	</div>
	</td>
</tr>

		<%
		if(qdto.getMq_newfilename() == null) {  //사진 없으면~
		%>
			
		<%	
		}else { //사진이 있다면~
		%>
		<tr>
			<td></td>
		<%	
			String image[] =  qdto.getMq_newfilename().split(",");
	
			for(int i=0; i<image.length; i++){
				if(! (image[i].equals("") || image.length == 0)){
				System.out.println(image[i]);
		%>
			
			<td id="imgbox<%=i%>" >
			<input type="hidden" id="images<%=i%>" value="<%=image[i]%>">
			<img src="./upload/myqnaImage/<%=image[i]%>" width="70px" height="70px"/>
			<input type="button" id="x<%=i%>" class="x_btn" onclick="x_btn(<%=i%>)" value="X">
			</td>

	    <%}
	    }
		%>	
		</tr>
		<%	
	   }
	    %>


<tr>
<td colspan="5" style="padding-left: 65%">
<input type="button" class="cancel" value="취소하기" onclick="cancelClick(<%=qdto.getMq_no()%>)">
<input type="button" class="update" value="수정하기" onclick="updateClick()">
</td>
</tr>

</table>
</form>

<script type="text/javascript">
$(document).ready(function() {
	$('#category').val('${qdto.mq_category}').prop("selected",true); 

	
	//파일첨부 이름 넣기
	var fileTarget = $('.filebox .upload-hidden'); 
	
	fileTarget.on('change', function(){ // 값이 변경되면 
		
		if(window.FileReader){ // modern browser 
			var filename = $(this)[0].files[0].name;
		} else { // old IE 
			var filename = $(this).val().split('/').pop().split('\\').pop(); // 파일명만 추출 
			} // 추출한 파일명 삽입 
			
			$(this).siblings('.upload-name').val(filename); 
		}); 
});
	
function x_btn(i) {
	//alert(i);
	$("#imgbox"+i).hide();
	$("#images"+i).val("");
	return;
}


function updateClick() {
	let oldimage = "";

	let imageNum = $("#oldimage").val().split(",");
	//alert("imageNum "+imageNum);
	//alert("imageNum "+imageNum.length);
	for(i=0; i < imageNum.length; i++){
		if($("#images"+i).val() != "" || $("#images"+i).val() != 'undefined' ){
			oldimage += ($("#images"+i).val()+",");
		}
		
	}
	
	if(oldimage.substr(0,1) == ','){
		oldimage = oldimage.substr(1);
	}

	//alert(oldimage);
	$("#oldimage").val(oldimage);

  	if($("#category").val() == "") {
		alert("카테고리를 선택해주세요");
		return;
	}else if($("#title").val() == "") {
		alert("제목을 작성해주세요");
		return;
	}else if($("#content").val() == "") {
		alert("문의 내용을 작성해주세요");
		return;
	}else {
		
		document.frm.submit(); // 폼 전송
		
 	
	}	 
}		
	
function cancelClick(mqno) {
	location.href = "readMyqna.do?mq_no=" + mqno;
}	


</script>

</body>
</html>