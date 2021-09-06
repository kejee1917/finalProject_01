<%@page import="verni.co.kr.member.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
int p_no = Integer.parseInt(request.getParameter("p_no"));
MemberDto mem = (MemberDto)session.getAttribute("login");

%>
<!-- 폰트 어썸 -->
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
</style>

</head>
<body>
<div style="background-color: #0F2620; color: white; width: 100%; padding-top: 10px; padding-bottom: 10px; padding-left: 15px; font-size: 18px;">
상품Q&A작성하기
</div>

<div align="center" class="container">
<table style="align-content: center">
<col style="width: 400px;">
<tr>
	<td>
			<br>
			<select id="q_cate">
				<option value="">--- 선택 ---</option>
				<option value="상품관련">상품관련</option>
				<option value="배송관련">배송관련</option>
				<option value="기타문의">기타문의</option>
			</select>
			<input id="q_title" class="input1" type="text" placeholder="제목을 입력해주세요! (40자 내)" maxlength="40"/>
	</td>

</tr>

<tr>
	<td>
		<textarea rows="8px" id="q_content" style="width:100%;"  placeholder="문의하실 내용을 입력하세요"></textarea>
	</td>
</tr>
<tr>
	<td style="font-size: 13px;">
		<input type="checkbox" id="secrit">&nbsp;비밀글
		<input type="hidden" id="q_secrit">
	</td>
</tr>
</table>
</div>
<div align="center" style="padding-top: 10px;">
<hr style="background-color: #E2E2E2;">
</div>
<div  align="left" style="padding-top: 10px; font-size: 12px; padding-left: 15px; padding-right: 15px; color: gray;">
<i class="fas fa-exclamation-circle"></i>&nbsp;문의하신 내용에 대한 답변은 해당 상품의 상세페이지 또는 '마이페이지 > 상품Q&A'에서 확인하실 수 있습니다.
</div>
<br>



<div align="center" style="padding-top: 10px;">
	<button type="button" id="write" class="btnSubmit">작성</button>&nbsp;
	<button type="button" id="back" class="btnEm">취소</button>

		<!--  <input type="button" id="write" value="작성"> &nbsp;&nbsp;
		<input type="button" id="back" value="취소">  -->
		<br><br>
</div>


<div style="padding-top: 10px; padding-left: 15px;  background: #F8F8F8;">
<div id="content_bt" align="left" style="font-size: 25px; padding-bottom: 15px;">
	<a href="#" onclick="showID('content');">
	<button type="button" class="wish" style="background: #F8F8F8">
	<b>상품Q&A 작성 유의사항</b> <보기> 
	</button></a>
<%-- 	<input type="button" class="wish" value="상품Q&A 작성 유의사항 <클릭>" > --%>
</div>
    
<div id="content" style="display:none; font-size: 9px; ">
*상품 Q&A는 상품 및 상품 구매 과정(배송, 반품/취소, 교환/변경)에 대해 판매자에게 문의하는 게시판입니다.<br>
*상품 및 상품 구매 과정과 관련 없는 비방/욕설/명예훼손성 게시글 및 상품과 관련 없는 광고글 등
부적절한 게시글 등록 시 글쓰기 제한 및 게시글이 삭제 조치 될 수 있습니다.<br>
*전화번호, 이메일 등 개인 정보가 포함된 글 작성이 필요한 경우 판매자만 볼 수 있도록 
비밀글로 문의해 주시기 바랍니다.<br>
*상품에 대한 이용 후기는 리뷰에 남겨 주세요.<br><br>
</div>
</div>


<script type="text/javascript">
$("#write").click(function() {
	
	if($("#q_cate").val() == "") {
		alert('카테고리를 선택해주세요');
		return;
	}else if($("#q_title").val() == "") {
		alert('제목을 입력해주세요');
		return;
	}else if($("#q_content").val() == "") {
		alert('내용을 입력해주세요');
		return;
	}
	
	if( $("#secrit").is(":checked") ) {
		$("#q_secrit").val(1);
	}else {
		$("#q_secrit").val(0);
	}
	
	let qdate = {
			"m_id":'<%=mem.getM_id() %>',
			"p_no": <%=p_no%>,
			"q_title" : $("#q_title").val(),
			"q_cate" : $("#q_cate").val(),
			"q_content" : $("#q_content").val(),
			"q_secrit" : $("#q_secrit").val()
	}
	
	$.ajax({
		url: "qnaWriteAf.do",
		type: "post",
		data: qdate,
		success:function(data) {
			
			if(data == true) {
				alert('문의 글 작성이 완료되었습니다.');
				window.close();
			//	location.href="productDetail.do";
			} 
		},
		error:function() {
			alert('er');
		}
	});
	
});

$("#back").click(function() {
	window.close();
});



function showID(id){
obj=document.getElementById(id);

if(obj.style.display == "none") 
  obj.style.display="inline";
else
  obj.style.display="none";
}



</script>

</body>
</html>