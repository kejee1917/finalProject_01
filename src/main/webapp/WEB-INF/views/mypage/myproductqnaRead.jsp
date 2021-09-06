<%@page import="verni.co.kr.qna.QnaDto"%>
<%@page import="verni.co.kr.util.MypageUtil"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>       
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  

<%

QnaDto updto = (QnaDto)request.getAttribute("updto");
QnaDto downdto = (QnaDto)request.getAttribute("downdto");
//System.out.println(updto.toString());
%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" integrity="sha512-+4zCK9k+qNFUR5X+cKL9EIR+ZOhtIloNl9GIKS57V1MyNsYpYcUrUeQc9vNfzsWfV28IaLL3i96P9sdNyeRssA==" crossorigin="anonymous" /> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="./css/popup/radio_button.css"
   type="text/css">


<style type="text/css">
body {
	font-family: 'Pretendard-Regular';
}

* {

	font-family: Pretendard-Regular;
	margin: 0px;
}

.wish {
	background-color: white;
	border: none;
	outline: none;
}


select {
	width: 98px;
	height: 29px;
	font-size: 13px;
	color: #224037;
	border: 1px solid #8A989A;
	background-color: #f8f8f8;
}	

/* text */
 .input1 {
	width: 292px;
	height: 27px;
	background-color: #f8f8f8;
	border: 1px solid black;
	border-color: #8A989A;
	font-size: 13px;
	margin: 0;
	padding: 0;
} 

/* texta*/
textarea {
	width: 100%;
	height: 150px;
	box-sizing: border-box;
	border: 1px solid #8A989A;
	background-color: #f8f8f8;
	font-size: 13px;
	resize: none;
}
.ec-base-box {
   padding: 20px;
   margin-left: auto;
   margin-right: auto;
   border: 5px solid #e8e8e8;
   color: #404040;
   background-color: #f8f8f8;
}

.ec-base-box.typeThin {
   border-width: 1px;
   border-color: #d7d5d5;
   background-color: #f8f8f8;
}
</style>
</head>
<body>



<div style="background-color: #0F2620; color: white; width: 100%; padding-top: 10px; padding-bottom: 10px; padding-left: 15px; font-size: 18px;">
작성한 상품 문의글
</div>
	

		<!-- 상품 땡겨오기 -->
	<div align="center" style="padding-top: 10px;" class="container">
		<table>
			<col width="50px">
			<col width="300px">
			<tr>
				<td><img alt=""
					src="./upload/thumbnailImage/${updto.p_newimage1}" width="100px" /></td>
				<td style="padding-left: 10px;"><c:set var="p_brand"
						value="${updto.p_brand}" /> <c:choose>
						<c:when test="${fn:contains(p_brand, '_')}">
							<c:set var="p_brand" value="${fn:replace(p_brand, '_', '&')}" />
						</c:when>
						<c:when test="${fn:contains(p_brand, '-')}">
							<c:set var="p_brand" value="${fn:replace(p_brand, '-', ' ')}" />
						</c:when>
					</c:choose>
					<h3>[${p_brand}]</h3>
					<h5>${updto.p_name}</h5>
				</td>
			</tr>
		</table>
	</div>
		

   
<div align="center" class="container">
<table style="align-content: center">
<col style="width: 400px;">
<tr>
	<td>
			<br>
			<select id="q_cate" disabled="disabled">
				<option value="">--- 선택 ---</option>
				<option value="상품관련">상품관련</option>
				<option value="배송관련">배송관련</option>
				<option value="기타문의">기타문의</option>
			</select>
			<input id="q_title" class="input1" type="text" maxlength="40" value="${updto.q_title}" readonly/>
	</td>

</tr>

<tr>
	<td>
		<textarea rows="8px" id="q_content" style="width:100%;" readonly>${updto.q_content }</textarea>
	</td>
</tr>

</table>
</div>
<div align="center" style="padding-top: 10px;">
<hr style="background-color: #E2E2E2;">
</div>
<div  align="left" style="padding-top: 10px; font-size: 12px; padding-left: 15px; padding-right: 15px; color: gray;">
<i class="fas fa-exclamation-circle"></i>&nbsp;판매자가 답글을 작성하면 원글의 수정이 어렵다는 점 참고바랍니다.
</div>
<br>
		

<%if(updto.getQ_status().equals("답변완료")) {
%>

<div style="background-color: #0F2620; color: white; width: 100%; padding-top: 10px; padding-bottom: 10px; padding-left: 15px; font-size: 18px;">
판매자 답글
</div>

<div class="ec-base-box typeThin" style="clear: both; margin-top: 15px;">
	<div style="font-weight: bold;" align="right"><%=MypageUtil.formDate2(downdto.getQr_wdate()) %> </div>
	<div>${downdto.qr_content}</div>
</div>

<br><br>
<div align="center">
<input type="button" class="btnEm" value="삭제" onclick="deleteClick()">
</div>
<%	
}else {
%>
<div align="center">
<input type="button" class="btnSubmit" value="수정" onclick="updateClick()">&nbsp;
<input type="button" class="btnEm" value="삭제" onclick="deleteClick()">
</div>
<%	
}
%>


</body>


<script type="text/javascript">
$(document).ready(function() {
	$('#q_cate').val('${updto.q_cate}').prop("selected",true); 
});



function updateClick() {
	location.href = "myproductqnaUpdate.do?q_no=" + ${updto.q_no};
	
}

function deleteClick() {
	if(confirm("정말 삭제하시겠습니까?") == true) { //alert창으로 한번 더 확인 절차
		location.href = "myproductqnaDelete.do?q_no=" + ${updto.q_no};
	}else {
		return;
	}	
}



</script>


</html>