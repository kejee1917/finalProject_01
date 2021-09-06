<%@page import="verni.co.kr.product.ProductDto"%>
<%@page import="verni.co.kr.review.ReviewDto"%>
<%@page import="verni.co.kr.member.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
int p_no = Integer.parseInt(request.getParameter("p_no"));
MemberDto mem = (MemberDto)session.getAttribute("login");
System.out.println(mem.toString());
ProductDto pd = (ProductDto)request.getAttribute("pd");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style type="text/css">
.star_rating {font-size:0; letter-spacing:-4px;}
.star_rating a {
    font-size:50px;
    letter-spacing:0;
    display:inline-block;
    margin-left:5px;
    color:#ccc;
    text-decoration:none;
}
.star_rating a:first-child {margin-left:0;}
.star_rating a.on {color:red;}

</style>

</head>
<body>

<div align="center">
<h2>리뷰 작성</h2><hr>
<form action="reviewWriteAf.do" id="frm_review" method="post" enctype="multipart/form-data">

<!-- 상품 땡겨오기 -->

<div align="center">
<table>
<col width="50px"><col width="300px">
<tr>
	<td>
		<img alt="" src="./upload/thumbnailImage/${pd.p_newimage1}" width="100px"/>
	</td>
	<td style="font-size: 10px">[${pd.p_brand}] ${pd.p_name}</td>
</tr>


</table>
</div>

<hr><br>

상품은 만족 하셨나요?

<p class="star_rating"  >
     <a href="javascript:void(0)" onclick="scope(1);">★</a>
     <a href="javascript:void(0)" onclick="scope(2);">★</a>
     <a href="javascript:void(0)" onclick="scope(3);">★</a>
     <a href="javascript:void(0)" onclick="scope(4);">★</a>
     <a href="javascript:void(0)" onclick="scope(5);">★</a>
</p>
<br>





<p>리뷰를 작성해주세요</p>
<input type="hidden" name="p_no" value="<%=p_no%>">
<input type="hidden" name="m_id" value="<%=mem.getM_id()%>">
<input type="hidden" name="r_scope" id="r_scope">
<textarea rows="15" cols="50" id="r_content" name="r_content" placeholder="리뷰를 작성해주세요"></textarea><br><br>
<!-- 파일 -->
<input type="file" name="filename" multiple="multiple" >


<br><br>

<button type="button" id="revWr">리뷰등록</button>
<button type="button" id="revBack">취소</button>
</form>
</div>

<!-- test -->
<button id="btn_toggle">토글</button>
<div id="Toggle" style="display:none">보였다가 안보였다가</div>


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
		$("#frm_review").submit();
		
	} 
	
});
 




$(function () {
	$("#btn_toggle").click(function () {
		$("#Toggle").toggle();
	});
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





</script>


</body>
</html>