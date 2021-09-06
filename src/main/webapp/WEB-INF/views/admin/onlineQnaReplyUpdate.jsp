<%@page import="verni.co.kr.myqna.MQ_ReplyDto"%>
<%@page import="verni.co.kr.myqna.MyqnaDto"%>
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

.onlineQnaReplyUpdate_table{
	width:80%;
	border-collapse:collapse;
}

.onlineQnaReplyUpdate_table tr{
	text-align: left;
}

.onlineQnaReplyUpdate_table th{
	padding: 10px;
	border-bottom-color: #EFEFEF;
	border-bottom-style: solid;
}

.onlineQnaReplyUpdate_table td{
	padding: 5px 0px 5px 5px;			/* 상 우 하 좌 */
	border-bottom-width: thin;
	border-bottom-color: #EFEFEF;
	border-bottom-style: solid;
}

.onlineQnaReplyUpdate_table td input, .onlineQnaReplyUpdate_table td textarea{
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

#_img{
	width: 200px;
	height: 200px;
	
}

.btn:hover{
	color: white;
}
</style>

<%
	MyqnaDto dto = (MyqnaDto)request.getAttribute("dto");
	MQ_ReplyDto rp = (MQ_ReplyDto)request.getAttribute("rp");
//	System.out.println(dto.toString());
%>
<div>
	<table class="top_table">
		<tr>
			<td>
				<img src="./image/admin/online.png" width='30px' height='30px'>
			</td>
			
			<td style="padding-left: 10px;">
				<b style="font-size: 30px;">답변작성</b>
			</td>
		</tr>
	</table>
</div>
<div align="center">
	<form action="onlineQnaReplyUpdateAf.do" method="post" id="_onlineQnaReplyUpdateAf">
		<table class="onlineQnaReplyUpdate_table">
		<tr>
			<th colspan="2" style="font-size: 18px"><b>리뷰내용</b></th>
		</tr>
		<tr>
			<td class="table_list">문의번호</td>
			<td><input type="text" value="<%=dto.getMq_no() %>" id="_mq_no" name="mq_no" size="88" readonly></td>
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
		<tr>
			<td colspan="2" style="border: 0px none;">
				<textarea id="summernote" class="summernote" name="mqr_content" readonly><%=rp.getMqr_content() %></textarea>
			</td>
		</tr>
		</table>
		
		<input type="button" value="저장" class="btn btn-secondary" style="width: 100px;" onclick="replyUpdate()">
		<input type="button" value="취소" class="btn btn-dark" style="width: 100px;" onclick="window.history.back()">
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

function replyUpdate() {
//	alert('작성');
	/* var content = $($("#summernote").summernote("code")).text();
	$("#summernote").val(content); 
	var data = $('#_productQnaReplyWrite').serialize(); */
	var mq_no = $("#_mq_no").val();
	var mqr_content = $("#summernote").summernote("code");
	
//	alert(mqr_content);
	
	if(mqr_content =="<p><br></p>" || mqr_content == ""){
		alert('내용을 입력해주세요.');
	}else{
		$.ajax({
			url:"onlineQnaReplyUpdateAf.do",
			type:"POST",
			data:{ mq_no : mq_no, mqr_content : mqr_content},
			success:function(data){
			//	alert(data);
 				if(data == "YES"){
 					alert('수정이 완료되었습니다.');
 					location.href="onlineQnaReplyDetail.do?mq_no="+mq_no;
				}else{
					alert('다시 입력해주세요.');
					location.href="#";
				} 
			},error:function(){
				alert('error');
			}
		});
	}

}

</script>