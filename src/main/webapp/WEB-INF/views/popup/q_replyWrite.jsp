<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    
<%
int q_no = Integer.parseInt(request.getParameter("q_no"));
int ms_no = Integer.parseInt(request.getParameter("ms_no"));
%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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




<title>QNA </title>
</head>
<body>
<h4>문의내용</h4>
<div class="ec-base-box typeThin" style="clear: both; margin-top: 15px;">
	<div style="float: left;">
		<img alt="..."  src="./upload/thumbnailImage/${qna.p_newimage1}"  style="width:60px; height:60px; border-color: lightgrey; border-style: solid; border-width: 1px;">
	</div>
	<div style="float: left; padding-top: 25px; padding-left: 10px;">
	<c:choose>
		 <c:when test="${fn:length(qna.p_name) > 20}">
		     ${fn:substring(qna.p_name,0,20)}
		 </c:when>
		<c:otherwise>
		     ${qna.p_name}
		</c:otherwise>
	</c:choose>
	</div>
	<div class="ec-base-box typeThin" style="clear: both; ">
	${qna.q_title}
	<hr width="99%" style="margin-top: 4px;">
	${qna.q_content}
	</div>
</div>



<form id="frm" action="q_replyWriteAf.do" method="post">
<input type="hidden" name="q_no" value="<%=q_no%>">
<input type="hidden" name="ms_no" value="<%=ms_no%>">

<h4>답변 작성</h4>
	<div class="ec-base-box typeThin" style="clear: both; ">
		<textarea rows="7" cols="61" name="qr_content" id="qr_content"></textarea>
		<div align="center">
			<input type="button" onclick="q_replyWriteAf()" value="저장">
			<input type="button" onclick="window.close()" value="취소">
		</div>
	</div>
</form>



<script type="text/javascript">
// 리플래쉬 생각 해봐야함..
function q_replyWriteAf() {
	if($("#qr_content").val() == ""){
		alert('답변을 작성해 주세요.');
		return;
	}else{
		
		$.ajax({
			url:"q_replyWriteAf.do",
			type: "post",
			data: $("#frm").serialize(),
			success:function(data){
				if(data == true){
					window.close();
					// location.href="messageList.do?sorting=all";
				}else{
					return;
				}
			},
			error:function(){
				alert('q_replyWriteAf error');
			}
			
		});
		
		
		
	//	$("#frm").submit();
	}
	
	
}
</script>

</html>