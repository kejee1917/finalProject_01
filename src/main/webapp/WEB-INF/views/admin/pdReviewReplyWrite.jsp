<%@page import="verni.co.kr.review.R_ReplyDto"%>
<%@page import="verni.co.kr.review.ReviewDto"%>
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

.pdReviewReplyWrite_table{
	width:80%;
	border-collapse:collapse;
}

.pdReviewReplyWrite_table tr{
	text-align: left;
}

.pdReviewReplyWrite_table th{
	padding: 10px;
	border-bottom-color: #EFEFEF;
	border-bottom-style: solid;
}

.pdReviewReplyWrite_table td{
	padding: 5px 0px 5px 5px;			/* 상 우 하 좌 */
	border-bottom-width: thin;
	border-bottom-color: #EFEFEF;
	border-bottom-style: solid;
}

.pdReviewReplyWrite_table td input, .pdReviewReplyWrite_table td textarea{
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
	ReviewDto dto = (ReviewDto)request.getAttribute("dto");
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
	<form action="pdReviewReplyWriteAf.do" method="post" id="_pdReviewReplyWriteAf">
		<table class="pdReviewReplyWrite_table">
		<tr>
			<th colspan="2" style="font-size: 18px"><b>리뷰내용</b></th>
		</tr>
		<tr>
			<td class="table_list">리뷰번호</td>
			<td>
				<input type="text" value="<%=dto.getR_no() %>" id="_r_no" name="r_no" size="88" readonly>
				<input type="hidden" id="_ms_no" name="ms_no" value="<%=ms_no %>">
			</td>
		</tr>
		<tr>
			<td class="table_list">상품명</td>
			<td><input type="text" value="<%=dto.getP_name() %>" size="88" readonly></td>
		</tr>
		<tr>
			<td class="table_list">작성자</td>
			<td><input type="text" value="<%=dto.getM_id() %>" size="88" readonly></td>
		</tr>
		<tr>
			<td class="table_list">작성일</td>
			<td><input type="text" value="<%=dto.getR_wdate().substring(0, 16) %>" size="88" readonly></td>
		</tr>
		<tr>
			<td class="table_list">별점</td>
			<td><input type="text" value="<%=dto.getR_scope() %>" size="88" readonly></td>
		</tr>
		<tr>
			<td class="table_list">좋아요 수</td>
			<td><input type="text" value="<%=dto.getR_likecount() %>" size="88" readonly></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="text" style="margin-bottom: 10px" value="<%=dto.getR_content() %>"  readonly><br>
				<%if(dto.getR_filename()!=null) {
					String image[] = dto.getR_newfilename().split(",");
					for (int i = 0; i < image.length; i++) { %>
						<img src="./upload/reviewImage/<%=image[i]%>" width="400px" style="margin: auto;" id="_img"/>
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
		<% R_ReplyDto rp = (R_ReplyDto)request.getAttribute("rp"); %>
		<%if(rp == null){%> 			<!-- 답변없음 -->
			<%if(dto.getR_del()==1){%>	<!-- 삭제글 -->
			<tr>
				<td colspan="2" style="border: 0px none;">
				<textarea name="rp_content" readonly>삭제된 글입니다.</textarea>
			</td>
			</tr>
			<%}else{ %>				<!-- 삭제글 아님 -->
			<tr>
				<td colspan="2" style="border: 0px none;">
					<textarea style="display:none" id="summernote" class="summernote" name="rp_content" readonly></textarea>
				</td>
			</tr>
			<%} %>
		<%} %>
		</table>
		<%if(dto.getR_del()==1) { %>
		<input type="button" value="목록" class="btn btn-dark" style="width: 100px;" onclick="location.href='productReview.do'">
		<%}else{ %>
		<input type="button" value="작성" class="btn btn-secondary" style="width: 100px;" onclick="replyWrite()">
		<input type="button" value="목록" class="btn btn-dark" style="width: 100px;" onclick="location.href='productReview.do'">
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
	var data = $('#_prdocutReviewReplyWrite').serialize(); */
	var r_no = $("#_r_no").val();
	var ms_no = $("#_ms_no").val();
	var rp_content = $("#summernote").summernote("code");
	
//	alert(rp_content);
	
	if(rp_content =="<p><br></p>" || rp_content == ""){
		alert('내용을 입력해주세요.');
	}else{
		$.ajax({
			url:"pdReviewReplyWriteAf.do",
			type:"POST",
			data:{ r_no : r_no, ms_no : ms_no, rp_content : rp_content},
			success:function(data){
			//	alert(data);
 				if(data == "YES"){
					alert('작성이 완료되었습니다.');
					location.href="pdReviewReplyDetail.do?r_no=" + r_no;
				}else{
					alert('다시 입력해주세요.');
					location.href="productReview.do";
				} 
			},error:function(){
				alert('error');
			}
		});
	}
}

</script>