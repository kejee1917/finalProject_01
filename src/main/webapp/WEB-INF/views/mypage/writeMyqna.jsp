<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
#title {
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

/* file 관련 기존형태 숨기기 */
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
	background-color: #8A989A; 
	cursor: pointer; 
	border: 1px solid #8A989A; 
	border-bottom-color: #8A989A; 
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
</style>

</head>
<body>



<div style="background-color: #0F2620; color: white; width: 100%; padding-top: 10px; padding-bottom: 10px; padding-left: 15px; font-size: 18px;">
1:1 문의글 작성하기
</div>

<div align="center" class="container">


<form action="writeMyqnaAf.do" id="frm" name="frm" method="post" enctype="multipart/form-data">
<input type="hidden" name="m_id" value="${login.m_id }">
<table style="align-content: center">
<col style="width: 400px;">
<tr>
	<td>
			<br>
			<select id="category" name="mq_category">
				<option value="">--카테고리--</option>
				<option value="member">회원</option>
				<option value="order">주문/결제</option>
				<option value="delivery">배송</option>
				<option value="as">반품/교환/AS</option>
				<option value="product">상품</option>
				<option value="etc">기타</option>
			</select>
			<input type="text" id="title" name="mq_title" placeholder="ex)회원탈퇴는 어떻게 하나요?" size="30">
	</td>

</tr>

<tr>
	<td><textarea rows="10" cols="50" id="content" name="mq_content" placeholder="문의내용을 입력해주세요"></textarea> </td>
</tr>
<tr align="center">
	<td><!-- <font size="2px">*파일 첨부는 최대 4개까지 가능합니다.</font> -->
	<div class="filebox">
		<input class="upload-name" value="파일선택" disabled="disabled">
		
		<label for="ex_file">사진 업로드</label>
		<input type="file" id="ex_file" name="myqnaImage" class="upload-hidden" multiple="multiple"> 
	</div>
	</td>
</tr>

</table>
</form>
</div>



<div align="center" style="padding-top: 10px;">
<hr style="background-color: #E2E2E2;">
</div>
<div  align="left" style="padding-top: 10px; font-size: 12px; padding-left: 15px; padding-right: 15px; color: gray;">
<i class="fas fa-exclamation-circle"></i>&nbsp;문의하신 내용에 대한 답변은 해당 상품의 상세페이지 또는 '마이페이지 > 온라인 문의(1:1)'에서 확인하실 수 있습니다.
</div>
<br>



<div align="center" style="padding-top: 10px;">
	<input type="button" class="btnSubmit" value="작성" onclick="writeClick()">&nbsp;
	<input type="button" class="btnEm" value="취소" onclick="cancelClick()">
		<br><br>
</div>



<div style="padding-top: 10px; padding-left: 15px;  background: #F8F8F8;">
<div id="content_bt" align="left" style="font-size: 25px; padding-bottom: 15px;">
	<a href="#" onclick="showID('_content');">
	<button type="button" class="wish" style="background: #F8F8F8">
	<b>온라인 문의(1:1) 작성 유의사항</b> <보기> 
	</button></a>
</div>
    
<div id="_content" style="display:none; font-size: 9px; ">
*온라인 문의는 쉐어베르니의 전반적인 질문 사항에 대해 판매자에게 문의하는 게시판입니다.<br>
*게시판의 성격과 관련 없는 비방/욕설/명예훼손성 게시글 및 광고글 등
부적절한 게시글 등록 시 글쓰기 제한 및 게시글이 삭제 조치 될 수 있습니다.<br>
*판매자가 답글은 작성한 경우에는 일방적인 삭제는 어렵다는 점 참고 바랍니다.<br>
*상품에 대한 이용 후기는 리뷰에 남겨 주세요.<br><br>
</div>
</div>



<script type="text/javascript">
function writeClick() {
	
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
			
	 	document.frm.target= 'myqnaPage'; //호출하고자하는 부모창의 이름
		document.frm.submit(); // 폼 전송
		self.close(); //창 닫기 
 
	}	 
}

function cancelClick() {
	window.close();
}

//박스에 파일명 넣기
$(document).ready(function(){
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

//토글 오픈
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