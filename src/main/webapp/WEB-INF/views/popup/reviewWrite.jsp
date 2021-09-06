<%@page import="verni.co.kr.product.ProductDto"%>
<%@page import="verni.co.kr.review.ReviewDto"%>
<%@page import="verni.co.kr.member.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
//int p_no = Integer.parseInt(request.getParameter("p_no"));
MemberDto mem = (MemberDto)session.getAttribute("login");
ProductDto pd = (ProductDto)request.getAttribute("pd");
System.out.println("뷰:" + pd.toString());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 폰트 어썸 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" integrity="sha512-+4zCK9k+qNFUR5X+cKL9EIR+ZOhtIloNl9GIKS57V1MyNsYpYcUrUeQc9vNfzsWfV28IaLL3i96P9sdNyeRssA==" crossorigin="anonymous" /> 
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="./css/popup/radio_button.css"
   type="text/css">
<style type="text/css">
.star_rating {font-size:0; letter-spacing:-4px;}
.star_rating a {
    font-size:35px;
    letter-spacing:0;
    display:inline-block;
    margin-left:5px;
    color:#ccc;
    text-decoration:none;
}
.star_rating a:first-child {margin-left:0;}
.star_rating a.on {color:#DAA520;}
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


/* texta*/
#r_content {
	width: 100%;
	height: 150px;
	box-sizing: border-box;
	border: 1px solid #8A989A;
	background-color: #f8f8f8;
	font-size: 13px;
	resize: none;
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
	font-size: 15px; 
	line-height: normal; 
	vertical-align: middle; 
	background-color: #8A989A; 
	cursor: pointer; 
	border: 1px solid #8A989A; 
	border-bottom-color: #8A989A; 
} 

/* named upload */ 
.filebox .upload-name { 
	display: inline-block; 
	padding: .5em .75em; /* label의 패딩값과 일치 */ 
	font-size: 15px; 
	font-family: inherit; 
	line-height: normal; 
	vertical-align: middle; 
	background-color: #f5f5f5; 
	border: 1px solid #ebebeb; 
	border-bottom-color: #e2e2e2; 
	-webkit-appearance: none; /* 네이티브 외형 감추기 */ 
	-moz-appearance: none; 
	appearance: none; 
}
</style>

</head>
<body>

<div style="background-color: #0F2620; color: white; width: 100%; padding-top: 10px; padding-bottom: 10px; padding-left: 15px; font-size: 18px;">
상품 리뷰 작성하기
</div>
	<form action="reviewWriteAf.do" id="frm_review" name="frm"
		method="post" enctype="multipart/form-data">

		<!-- 상품 땡겨오기 -->

		<div align="center" style="padding-top: 10px;" class="container">
			<table>
				<col width="50px">
				<col width="300px">
				<tr>
					<td><img alt=""
						src="./upload/thumbnailImage/${pd.p_newimage1}" width="100px" /></td>
					<td style="padding-left: 10px;"><c:set var="p_brand"
							value="${pd.p_brand}" /> <c:choose>
							<c:when test="${fn:contains(p_brand, '_')}">
								<c:set var="p_brand" value="${fn:replace(p_brand, '_', '&')}" />
							</c:when>
							<c:when test="${fn:contains(p_brand, '-')}">
								<c:set var="p_brand" value="${fn:replace(p_brand, '-', ' ')}" />
							</c:when>
						</c:choose>
						<h3>[${p_brand}]</h3>
						<h5>${pd.p_name}</h5>
					</td>
				</tr>
			</table>
		</div>

		<hr style="background-color: #E2E2E2;">
		<br>
		
		<div align="center" style="padding-top: 15px; padding-left: 15px;">
			상품은 만족 하셨나요?

			<p class="star_rating">
				<a href="javascript:void(0)" onclick="scope(1);">★</a> <a
					href="javascript:void(0)" onclick="scope(2);">★</a> <a
					href="javascript:void(0)" onclick="scope(3);">★</a> <a
					href="javascript:void(0)" onclick="scope(4);">★</a> <a
					href="javascript:void(0)" onclick="scope(5);">★</a>
			</p>
			<br>

			<p>리뷰를 작성해주세요</p>
			<br> <input type="hidden" name="p_no" value="<%=pd.getP_no()%>">
			<input type="hidden" name="m_id" value="<%=mem.getM_id()%>">
			<input type="hidden" name="od_point" value="<%=pd.getOd_point()%>">
			<input type="hidden" name="o_number" value="<%=pd.getO_number()%>">
			<input type="hidden" name="od_no" value="${od_no}"> <input
				type="hidden" name="r_scope" id="r_scope">
		
		
		<div align="center" style="padding-left: 10px; padding-right: 25px;">	
			<textarea rows="6px" style="width: 100%;" id="r_content"
				name="r_content" placeholder="리뷰를 작성해주세요"></textarea>
			<br>
			<br>
		</div>		
		</div>

		<div align="center" class="filebox">
			<input class="upload-name" value="파일선택" disabled="disabled">
			<label for="ex_file">사진 업로드</label> 
			<input type="file" id="ex_file" name="filename" class="upload-hidden" multiple="multiple">
		</div>


		<br>
		<br>
		<div align="center" style="padding-top: 10px;">
			<hr style="background-color: #E2E2E2;">
		</div>
		<div align="left"
			style="padding-top: 10px; font-size: 12px; padding-left: 15px; padding-right: 15px; color: gray;">
			<i class="fas fa-exclamation-circle"></i>&nbsp;작성하신 내용은 해당 상품의 상세페이지
			또는 '마이페이지 > 나의 리뷰'에서 확인하실 수 있습니다.
		</div>
		<br>
		<div align="center">
		<button type="button" id="revWr" class="btnSubmit">리뷰등록</button>
		&nbsp;
		<button type="button" id="revBack" class="btnEm">취소</button>
		</div>
	</form>




<script type="text/javascript">

//리뷰 글쓰기
$("#revWr").click(function() {
   if($("#r_scope").val() == "") {
      alert('별점을 선택해주세요');
      return;
   }else if($("#r_content").val() == "") {
      alert('리뷰내용을 입력해주세요');
      return;
   }else if($("#r_scope").val() != "" &&  $("#r_content").val() != "") {
      alert('리뷰가 작성되었습니다');
      //$("#frm_review").submit();
      
      //0818 은지 수정
      document.frm.target= 'writtenPage'; //호출하고자하는 부모창의 이름
      document.frm.submit(); // 폼 전송
      self.close(); //창 닫기 
      
   } 
   
});
 





//별점
$(".star_rating a").click(function() {
    $(this).parent().children("a").removeClass("on");
    $(this).addClass("on").prevAll("a").addClass("on");
    return false;
});

 function scope(num) {
   $("#r_scope").val(num);
}




// 리뷰 작성 취소
$("#revBack").click(function() {
   window.close();
});


//파일박스에 파일명 넣기
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



</script>


</body>
</html>