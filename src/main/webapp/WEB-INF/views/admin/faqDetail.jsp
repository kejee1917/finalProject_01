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

.faqDetail_table{
	border-collapse:collapse;
	width: 100%;
	margin-top: 10px;
	border: 1px solid gray;
}

.faqDetail_table td{
	border-bottom: outset;
	border-bottom-width: thin;
	padding: 10px;
	border: 1px solid gray;	
}

.faqDetail_table td input, .faqDetail_table td textarea{
	border: 0px none;
	outline: none;
	width: 100%
}

.table_list{
	width:20%;
	font-size: 16px;
	padding-left: 10px;
	text-align: center;
}

</style>

<% FaqDto dto = (FaqDto)request.getAttribute("dto"); %>

<table class="top_table">
	<tr>
		<td>
			<img src="./image/admin/FAQ.png"  width='30px' height='30px'>
		</td>
		
		<td style="padding-left: 10px;">
			<b style="font-size: 30px;">FAQ 상세보기</b>
		</td>
	</tr>
</table>

<div style="height: 760px;">
	<form action="faqUpdate.do" method="post" id="_faqUpdate">
		<div align="left" class="div_table">
			<table class="faqDetail_table">
				<tr>
					<td class="table_list">FAQ번호</td>
					<td><input type="text" name="f_no" value="<%=dto.getF_no() %>" readonly></td>
				</tr>
				<tr>
					<td class="table_list">분류</td>
					<td><input type="text" name="f_category" value="<%=dto.getF_category() %>" readonly></td>
				</tr>
				<tr>
					<td class="table_list">제목</td>
					<td><input type="text" name="f_title" value="<%=dto.getF_title() %>" readonly></td>
				</tr>
				<tr>	
					<td class="table_list">내용</td>
					<td><textarea name="f_content" rows="20" readonly><%=dto.getF_content()%></textarea></td>
				</tr>
			</table>
			<br>
			
			<!-- 삭제,등록 버튼 -->
			<div align="center">
				<input type="button" class="btn btn-dark" style="width: 100px;" value="목록" onclick="location.href='faq.do'">
				<input type="submit" class="btn btn-secondary" style="width: 100px;" value="수정">
			</div>
		
		</div>	
	</form>
</div>
<br>

