<%@page import="verni.co.kr.myqna.MyqnaDto"%>
<%@page import="verni.co.kr.myqna.MQ_ReplyDto"%>
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

.onlineQnaReplyDetail_table{
	width:80%;
	border-collapse:collapse;
}

.onlineQnaReplyDetail_table tr{
	text-align: left;
}

.onlineQnaReplyDetail_table th{
	padding: 10px;
	border-bottom-color: #EFEFEF;
	border-bottom-style: solid;
}

.onlineQnaReplyDetail_table td{
	padding: 5px 0px 5px 5px;			/* 상 우 하 좌 */
	border-bottom-width: thin;
	border-bottom-color: #EFEFEF;
	border-bottom-style: solid;
}

.onlineQnaReplyDetail_table td input, .onlineQnaReplyDetail_table td textarea{
	border: 0px none; 					/* input Box 없애기 */
	outline: none;						/* 클릭 시 테두리 없애기 */
	width: 100%;
	height: auto;
}

.table_list{
	width:20%;
	color: gray;
	font-size: 14px;
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

.summernote{
    width: 300px;
    height: 200px;
    border: 1px solid #dcdcdc;
    overflow-y: auto;
}

#_img{
	width: 200px;
	height: 200px;
	
}
</style>

<%
	MyqnaDto dto = (MyqnaDto)request.getAttribute("dto");
%>
<div>
	<table class="top_table">
		<tr>
			<td>
				<img src="./image/admin/online.png" width='30px' height='30px'>
			</td>
			
			<td style="padding-left: 10px;">
				<b style="font-size: 30px;">답변상세보기</b>
			</td>
		</tr>
	</table>
</div>
<div align="center">
	<form action="onlineQnaReplyUpdate.do" method="post" id="_onlineQnaReplyUpdate">
		<table class="onlineQnaReplyDetail_table">
		<tr>
			<th colspan="2" style="font-size: 18px"><b>문의내용</b></th>
		</tr>
		<tr>
			<td class="table_list">문의번호</td>
			<td><input type="text" value="<%=dto.getMq_no() %>" name="mq_no" size="88" readonly></td>
		</tr>
		<tr>
			<td class="table_list">문의유형</td>
			<%
				switch(dto.getMq_category()) {
					case "member":%>
					<td>회원</td>	<%break;
					case "order":%>
					<td>주문/결제</td><%break;
					case "delivery":%>
					<td>배송</td><%break;
					case "as":%>
					<td>반품/교환</td><%break;
					case "product":%>
					<td>상품</td><%break;
					case "etc":%>
					<td>기타</td><%break;
				}
			%>
			<%-- <td><input type="text" value="<%=dto.getMq_category() %>" size="88" readonly></td> --%>
		</tr>
		<tr>
			<td class="table_list">작성자</td>
			<td><input type="text" value="<%=dto.getM_id() %>" size="88" readonly></td>
		</tr>
		<tr>
			<td class="table_list">작성일</td>
			<td><input type="text" value="<%=dto.getMq_wdate().substring(0, 16) %>" size="88" readonly></td>
		</tr>
		<tr>
			<td class="table_list">제목</td>
			<td><input type="text" value="<%=dto.getMq_title() %>" size="88" readonly></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="text" style="margin-bottom: 10px" value="<%=dto.getMq_content() %>"  readonly><br>
				<%if(dto.getMq_filename()!=null) {
					String image[] = dto.getMq_newfilename().split(",");
					for (int i = 0; i < image.length; i++) { %>
						<img src="./upload/myqnaImage/<%=image[i]%>" width="400px" style="margin: auto;" id="_img"/>
					<%}%>
				<%} %>
			</td>
		</tr>
		<tr>
			<td></td><td></td>
		</tr>
		<tr>
			<th colspan="2" style="font-size: 18px"><b>답변내용</b></th>
		</tr>
		<% MQ_ReplyDto rp = (MQ_ReplyDto)request.getAttribute("rp");%>
		<% if(rp == null){ %>				<!-- 답변없음 : 삭제글 -->
		<tr>
			<td colspan="2">
				삭제된 글입니다.
			</td>
		</tr>
		<%}else if(rp != null){ %>							<!-- 답변있음 : 삭제글, 삭제되지않은글 -->
		<tr>							<!-- 삭제되지않은글 -->
			<td colspan="2">
				${rp.mqr_content}
			</td>
		</tr>
		<%} %>
		</table>
		<br>
		<%if(dto.getMq_del()==1){ %>
		<input type="button" value="목록" class="btn btn-dark" style="width: 100px;" onclick="location.href='onlineQna.do'">
		<%}else{ %>
		<input type="submit" value="수정" class="btn btn-secondary" style="width: 100px;">
		<input type="button" value="목록" class="btn btn-dark" style="width: 100px;" onclick="location.href='onlineQna.do'">
		<%} %>
	</form>
</div>	


<script>
$(document).ready(function() {
 	var mqr_content = $("textarea[name=mqr_content]").val();
	var content = mqr_content.replace(/<br\/>/ig, "\n");
	content = content.replace(/<(\/)?([a-zA-Z]*)(\s[a-zA-Z]*=[^>]*)?(\s)*(\/)?>/ig, "");
	content = $("<p>" + content+ "</p>").text();
//	alert(text);
	
	$("textarea[name=mqr_content]").val();

});

</script>