<%@page import="verni.co.kr.qna.Q_ReplyDto"%>
<%@page import="verni.co.kr.qna.QnaDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 서머노트를 위해 추가해야할 부분 -->
<!-- 사이드바 이상하게 나옴 -->
<!-- <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet"> -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

<style>
.top_table{
	margin-bottom: 40px;
}

.pdQnaReplyDetail_table{
	width:80%;
	border-collapse:collapse;
}

.pdQnaReplyDetail_table tr{
	text-align: left;
}

.pdQnaReplyDetail_table th{
	padding: 10px;
	border-bottom-color: #EFEFEF;
	border-bottom-style: solid;
}

.pdQnaReplyDetail_table td{
	padding: 5px 0px 5px 5px;			/* 상 우 하 좌 */
	border-bottom-width: thin;
	border-bottom-color: #EFEFEF;
	border-bottom-style: solid;
}

.pdQnaReplyDetail_table td input, .pdQnaReplyDetail_table td textarea{
	border: 0px none; 					/* input Box 없애기 */
	outline: none;						/* 클릭 시 테두리 없애기 */
	width: 100%;
	height: auto;
}

.table_list{
	width:20%;
	color: gray;
	font-size: 16px;
	padding-left: 10px;
}

#_p_newimage1, #_p_newimage2{
	width: 200px;
	height: 200px;
}

/* 버튼 */
.update_btn{
	background-color: #4682b4; 
	color: white; 
	width:100px; 
	height: 30px;
}

.close_btn{
	width:100px; 
}

</style>

<%
	QnaDto dto = (QnaDto)request.getAttribute("dto");

%>
<div>
	<table class="top_table">
		<tr>
			<td>
				<img src="./image/admin/qna.png" width='30px' height='30px'>
			</td>
			
			<td style="padding-left: 10px;">
				<b style="font-size: 30px;">답변상세보기</b>
			</td>
		</tr>
	</table>
</div>
<div align="center">
	<form action="pdQnaReplyUpdate.do" method="post" id="_pdQnaReplyUpdate">
		<table class="pdQnaReplyDetail_table">
		<tr>
			<th colspan="2" style="font-size: 18px"><b>문의내용</b></th>
		</tr>
		<tr>
			<td class="table_list">문의번호</td>
			<td><input type="text" value="<%=dto.getQ_no() %>" name="q_no" size="88" readonly></td>
		</tr>
		<tr>
			<td class="table_list">문의유형</td>
			<td><input type="text" value="<%=dto.getQ_cate() %>" size="88" readonly></td>
		</tr>
		<tr>
			<td class="table_list">상품명</td>
			<td><input type="text" value="<%=dto.getP_name()%>" size="88" readonly></td>
		</tr>
		<tr>
			<td class="table_list">작성자</td>
			<td><input type="text" value="<%=dto.getM_id() %>" size="88" readonly></td>
		</tr>
		<tr>
			<td class="table_list">작성일</td>
			<td><input type="text" value="<%=dto.getQ_wdate() %>" size="88" readonly></td>
		</tr>
		<tr>		
			<td class="table_list">제목</td>
			<td><input type="text" value="<%=dto.getQ_title() %>" size="88" readonly></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="text" style="margin-bottom: 20px" value="<%=dto.getQ_content() %>"  readonly>
			</td>
		</tr>
		<tr>
			<td></td><td></td>
		</tr>
		<tr>
			<th colspan="2" style="font-size: 18px"><b>답변내용</b></th>
		</tr>
		<% 	Q_ReplyDto rp = (Q_ReplyDto)request.getAttribute("rp");%>
		<% if(rp == null){ %>				<!-- 답변없음 : 삭제글 -->
		<tr>
			<td colspan="2">
				삭제된 글입니다.
			</td>
		</tr>
		<%}else if(rp != null){ %>							<!-- 답변있음 : 삭제글, 삭제되지않은글 -->
		<tr>							<!-- 삭제되지않은글 -->
			<td colspan="2">
				${rp.qr_content}
			</td>
		</tr>
		<%} %>
		</table>
		<br>
		<%if(dto.getQ_del()==1){ %>
		<input type="button" value="목록" class="btn btn-dark" style="width: 100px;" onclick="location.href='productQna.do'">
		<%}else{ %>
		<input type="submit" value="수정" class="btn btn-secondary" style="width: 100px;">
		<input type="button" value="목록" class="btn btn-dark" style="width: 100px;" onclick="location.href='productQna.do'">
		<%} %>
	</form>
</div>	


<script>
$(document).ready(function() {
 	var qr_content = $("textarea[name=qr_content]").val();
	var content = qr_content.replace(/<br\/>/ig, "\n");
	content = content.replace(/<(\/)?([a-zA-Z]*)(\s[a-zA-Z]*=[^>]*)?(\s)*(\/)?>/ig, "");
	content = $("<p>" + content+ "</p>").text();
//	alert(text);
	
	$("textarea[name=qr_content]").val();
	
});

</script>