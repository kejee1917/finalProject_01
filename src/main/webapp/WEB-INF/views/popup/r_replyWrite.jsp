<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>   
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!-- 폰트 어썸 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" integrity="sha512-+4zCK9k+qNFUR5X+cKL9EIR+ZOhtIloNl9GIKS57V1MyNsYpYcUrUeQc9vNfzsWfV28IaLL3i96P9sdNyeRssA==" crossorigin="anonymous" />     
<%
int r_no = Integer.parseInt(request.getParameter("r_no"));
int ms_no = Integer.parseInt(request.getParameter("ms_no"));
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>리뷰 리플</title>
<style type="text/css">
.ec-base-box {
	padding: 20px;
	margin-left: auto;
	margin-right: auto;
	border: 5px solid #e8e8e8;
	color: #404040;
}

.ec-base-box.typeThin {
	border-width: 1px;
	border-color: #d7d5d5;
}
</style>
</head>
<body>

<h4>리뷰 내용</h4>
<div class="ec-base-box typeThin" style="clear: both; margin-top: 15px;">
	<div style="float: left;">
		<c:choose>
		    <c:when test="${rlist.r_filename eq null || rlist.r_filename eq  ''}">
		        <img alt="..."  src="./upload/thumbnailImage/${rlist.p_newimage1}"  style="width:60px; height:60px; border-color: lightgrey; border-style: solid; border-width: 1px;">
		    </c:when>
		    <c:when test="${fn:contains(rlist.r_newfilename, ',')}">
		        <c:forTokens items="${rlist.r_newfilename}" delims="," var="item">
    				<img alt="..."   src="./upload/reviewImage/${item}" style="height:60px;border-color: lightgrey; border-style: solid; border-width: 1px;">
				</c:forTokens>
		    </c:when>
		    <c:otherwise>
		       <img alt="..."   src="./upload/reviewImage/${rlist.r_newfilename}" style="height:60px;border-color: lightgrey; border-style: solid; border-width: 1px;">
		    </c:otherwise>
		</c:choose>
	</div>
	
	<div style="float: left; padding-top: 25px; padding-left: 10px;">
	<c:choose>
		 <c:when test="${fn:length(rlist.p_name) > 20}">
		     ${fn:substring(rlist.p_name,0,20)}
		 </c:when>
		<c:otherwise>
		     ${rlist.p_name}
		</c:otherwise>
	</c:choose>
	</div>
	
	<div style="clear: both;">
	
		<hr align="center" style="width: 99%">
		<div align="center">
		<h3>상품은 만족하셨나요?</h3>
		</div>
		<div align="center" style="font-size: 25px;">
		<c:choose>
			    <c:when test="${rlist.r_scope eq 1 }">
			        <i class="fas fa-star" style="color: #DAA520"></i>
					<i class="fas fa-star" style="color: lightgrey"></i>
					<i class="fas fa-star" style="color: lightgrey"></i>
					<i class="fas fa-star" style="color: lightgrey"></i>
					<i class="fas fa-star" style="color: lightgrey"></i>
			    </c:when>
			    
			    <c:when test="${rlist.r_scope eq 2 }">
			        <i class="fas fa-star" style="color: #DAA520"></i>
					<i class="fas fa-star" style="color: #DAA520"></i>
					<i class="fas fa-star" style="color: lightgrey"></i>
					<i class="fas fa-star" style="color: lightgrey"></i>
					<i class="fas fa-star" style="color: lightgrey"></i>
			    </c:when>
			    
			    <c:when test="${rlist.r_scope eq 3 }">
			        <i class="fas fa-star" style="color: #DAA520"></i>
					<i class="fas fa-star" style="color: #DAA520"></i>
					<i class="fas fa-star" style="color: #DAA520"></i>
					<i class="fas fa-star" style="color: lightgrey"></i>
					<i class="fas fa-star" style="color: lightgrey"></i>
			    </c:when>
			    
			    <c:when test="${rlist.r_scope eq 4 }">
			        <i class="fas fa-star" style="color: #DAA520"></i>
					<i class="fas fa-star" style="color: #DAA520"></i>
					<i class="fas fa-star" style="color: #DAA520"></i>
					<i class="fas fa-star" style="color: #DAA520"></i>
					<i class="fas fa-star" style="color: lightgrey"></i>
			    </c:when>
			    
			    <c:when test="${rlist.r_scope eq 5 }">
			        <i class="fas fa-star" style="color: #DAA520"></i>
					<i class="fas fa-star" style="color: #DAA520"></i>
					<i class="fas fa-star" style="color: #DAA520"></i>
					<i class="fas fa-star" style="color: #DAA520"></i>
					<i class="fas fa-star" style="color: #DAA520"></i>
			    </c:when>
			    
			</c:choose>
		</div>
		<div align="center" style="padding-top: 1px;">
			<h3>어떤점이 좋았나요??</h3>
		</div>
		<div class="ec-base-box typeThin" style="clear: both; ">${rlist.r_content}</div>
	</div>
</div>



<form id="frm" action="r_replyWriteAf.do" method="post">
	<input type="hidden" name="r_no" value="<%=r_no%>">
	<input type="hidden" name="ms_no" value="<%=ms_no%>">
	<h4>답변 작성</h4>
	<div class="ec-base-box typeThin" style="clear: both; ">
		<textarea rows="7" cols="61" name="rp_content" id="rp_content"></textarea>
		<div align="center">
			<input type="button" onclick="r_replyWriteAf()" value="저장">
			<input type="button" onclick="window.close()" value="취소">
		</div>
	</div>
</form>


<script type="text/javascript">
function r_replyWriteAf() {
	alert($("#rp_content").val());
	if($("#rp_content").val() == ""){
		alert('답변을 작성해 주세요.');
		return;
	}else{
		$("#frm").submit();
	}
	
	
}
</script>



</body>
</html>