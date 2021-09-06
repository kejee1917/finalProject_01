<%@page import="verni.co.kr.qna.Q_ReplyDto"%>
<%@page import="verni.co.kr.qna.QnaDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 서머노트를 위해 추가해야할 부분 -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

<style>
.top_table{
	margin-bottom: 40px;
}

.pdQnaReplyWrite_table{
	width:80%;
	border-collapse:collapse;
}

.pdQnaReplyWrite_table tr{
	text-align: left;
}

.pdQnaReplyWrite_table th{
	padding: 10px;
	border-bottom-color: #EFEFEF;
	border-bottom-style: solid;
}

.pdQnaReplyWrite_table td{
	padding: 5px 0px 5px 5px;			/* 상 우 하 좌 */
	border-bottom-width: thin;
	border-bottom-color: #EFEFEF;
	border-bottom-style: solid;
}

.pdQnaReplyWrite_table td input, .pdQnaReplyWrite_table td textarea{
	border: 0px none;					/* input Box 없애기 */
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

.btn:hover {
	color:white;
}
</style>

<%
	QnaDto dto = (QnaDto)request.getAttribute("dto");
	int ms_no = Integer.parseInt(request.getParameter("ms_no"));
//	System.out.println(dto.toString());
%>
<div>
	<table class="top_table">
		<tr>
			<td>
				<img src="./image/admin/qna.png" width='30px' height='30px'>
			</td>
			
			<td style="padding-left: 10px;">
				<b style="font-size: 30px;">답변작성</b>
			</td>
		</tr>
	</table>
</div>
<div align="center">
	<form action="pdQnaReplyWriteAf.do" method="post" id="_pdQnaReplyWriteAf">
		<table class="pdQnaReplyWrite_table">
		<tr>
			<th colspan="2" style="font-size: 18px"><b>문의내용</b></th>
		</tr>
		<tr>
			<td class="table_list">문의번호</td>
			<td>
				<input type="text" value="<%=dto.getQ_no() %>" id="_q_no" name="q_no" size="88" readonly>
				<input type="hidden" id="_ms_no" name="ms_no" value="<%=ms_no %>">
			</td>
			
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
			<td><input type="text" value="<%=dto.getQ_wdate().substring(0, 16) %>" size="88" readonly></td>
		</tr>
		<tr>		
			<td class="table_list">제목</td>
			<td><input type="text" value="<%=dto.getQ_title() %>" size="88" readonly></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="text" style="margin-bottom: 10px" value="<%=dto.getQ_content() %>"  readonly>
			</td>
		</tr>
		<tr>
			<td></td><td></td>
		</tr>
		<tr>
			<th colspan="2" style="font-size: 18px"><b>답변내용</b></th>
		</tr>
		<% Q_ReplyDto rp = (Q_ReplyDto)request.getAttribute("rp");%>
		<%if(rp == null){%> 			<!-- 답변없음 -->
			<%if(dto.getQ_del()==1){ %>	<!-- 삭제글 -->
			<tr>
				<td colspan="2" style="border: 0px none;">
				<textarea name="qr_content" readonly>삭제된 글입니다.</textarea>
			</td>
			</tr>
			<%}else{ %>				<!-- 삭제글 아님 -->
			<tr>
				<td colspan="2" style="border: 0px none;">
					<textarea style="display:none" id="summernote" class="summernote" name="qr_content" readonly></textarea>
				</td>
			</tr>
			<%} %>
		<%} %>
		</table>
		<%if(dto.getQ_del()==1){ %>
		<input type="button" value="목록" class="btn btn-dark" style="width: 100px;" onclick="location.href='productQna.do'">
		<%}else{ %>
		<input type="button" value="작성" class="btn btn-secondary" style="width: 100px;" onclick="replyWrite()">
		<input type="button" value="목록" class="btn btn-dark" style="width: 100px;" onclick="location.href='productQna.do'">
		<%} %>
	</form>
</div>	

<script>
$(document).ready(function() {
   	$('#summernote').summernote({
   		placeholder: '상품글을 작성해주세요!',
        tabsize: 2,
        width: 1300,
    	height: 200,
   		fontNames : [ '맑은고딕', 'Arial', 'Arial Black', 'Comic Sans MS', 'Courier New', ],
   		fontNamesIgnoreCheck : [ '맑은고딕' ],
   		focus : true,
		callbacks: {
			onImageUpload: function(files, editor, welEditable) {
	            for (var i = files.length - 1; i >= 0; i--) {
	            	sendFile(files[i], this);
	            }
	        }
		}
		
	});

});

function replyWrite() {
//	alert('작성');
	/* var content = $($("#summernote").summernote("code")).text();
	$("#summernote").val(content); 
	var data = $('#_productQnaReplyWrite').serialize(); */
	var q_no = $("#_q_no").val();
	var ms_no = $("#_ms_no").val();
	var qr_content = $("#summernote").summernote("code");
	
//	alert(qr_content);
	
	if(qr_content =="<p><br></p>" || qr_content == ""){
		alert('내용을 입력해주세요.');
	}else{
		$.ajax({
			url:"pdQnaReplyWriteAf.do",
			type:"POST",
			data:{ q_no : q_no, ms_no : ms_no, qr_content : qr_content},
			success:function(data){
			//	alert(data);
 				if(data == "YES"){
					alert('작성이 완료되었습니다.');
					location.href="pdQnaReplyDetail.do?q_no=" + q_no;
				}else{
					alert('다시 입력해주세요.');
					location.href="productQna.do";
				} 
			},error:function(){
				alert('error');
			}
		});
	}

}

</script>