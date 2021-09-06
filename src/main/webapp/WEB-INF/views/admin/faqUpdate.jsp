<%@page import="verni.co.kr.faq.FaqDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
.div_table{
	width: 60%;
}

.top_table{
	margin-bottom: 20px;
}

.faqUpdate_table{
	border-collapse:collapse;
	width: 100%;
	margin-top: 10px;
	border: 1px solid gray;
}

.faqUpdate_table td{
	border: 1px solid gray;
	padding: 10px;
	border-bottom-style: outset;
	border-bottom-width: thin;
}

.faqUpdate_table .table_list{
	width:20%;
	font-size: 16px;
	text-align: center;
} 

.faqUpdate_table td input, .faqUpdate_table td textarea{
	width: 100%;
	border: 0px none;
	outline: none;
}

.faqUpdate_table td select{
	/* border: 0px none;
	border-bottom:solid;
	border-bottom-width:thin;
	border-bottom-color:gray; */
	width: 40%;
 }

</style>

<%
	FaqDto dto = (FaqDto)request.getAttribute("dto");
	System.out.println("FAQ 수정 jsp : " + dto.toString());
%>

<div>
	<table class="top_table">
		<tr>
			<td>
				<img src="./image/admin/FAQ.png" width='30px' height='30px'>
			</td>
			
			<td style="padding-left: 10px;">
				<b style="font-size: 30px;">FAQ 수정</b>
			</td>
		</tr>
	</table>
</div>

<div style="height: 760px;">
	<form action="faqUpdateAf.do" method="post" id="frm">
		<div align="left" class="div_table">
			<table class="faqUpdate_table">
				<col width="80px"><col width="auto">
				<tr>
					<td class="table_list">FAQ번호</td>
					<td><input type="text" name="f_no" value="<%=dto.getF_no() %>" readonly></td>
				</tr>
				<tr>
					<td class="table_list">분류</td>
					<td>
						<input type="hidden" id="_f_category" value="<%=dto.getF_category() %>">
						<select name="f_category">
							<option value="">- [필수] 분류를 선택하세요. -</option>
							<option value="회원가입/탈퇴">회원가입/탈퇴</option>
							<option value="회원정보">회원정보</option>
							<option value="로그인">로그인</option>
							<option value="주문/결제">주문/결제</option>
							<option value="상품관련">상품관련</option>
							<option value="배송">배송</option>
							<option value="반납">반납</option>
						</select>
					</td>
				</tr>
				<tr>
					<td class="table_list">제목</td>
					<td><input type="text" name="f_title" value="<%=dto.getF_title() %>" autofocus required></td>
				</tr>
				<tr>
					<td class="table_list">내용</td>
					<td><textarea name="f_content" required rows="20"><%=dto.getF_content() %></textarea></td>
				</tr>
			</table>
			<br>
			<div align="center">
				<input type="button" class="btn btn-secondary" style="width: 100px;" id="faqUpdate" value="수정">
				<input type="button" class="btn btn-dark" style="width: 100px;" value="취소" onclick="window.history.back()">
			</div>
		</div>
	</form>
</div>


<script type="text/javascript">
$(document).ready(function () {
	// select value 넣어주기
	var f_category = $("#_f_category").val();
	$("select[name=f_category]").val(f_category).prop("selected", true);
});
	
		
$("#faqUpdate").click(function(){
	if($('select[name=f_category]').val() == ""){
		alert('분류를 선택해주세요');
		return;
	}else if($('input[name=f_title]').val() == ""){
		alert('제목을 작성해주세요');
		return;
	}else if($('textarea[name=f_content]').val() == ""){
		alert('내용을 작성해주세요');
		return;
	}else{
		$("#frm").submit(); 
	}
});

</script>
