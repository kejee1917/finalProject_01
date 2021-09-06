<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
.div_table{
	width: 60%;
}

.top_table{
	margin-bottom: 20px;
}

.faqWrite_table{
	border-collapse:collapse;
	width: 100%;
	margin-top: 10px;
	border: 1px solid gray;
}

.faqWrite_table th{
	border: 1px solid gray;
	background-color:#e9e9e9;
	padding: 10px 0px 10px 0px;
	font-size: 20px;
	text-align: center;
}

.faqWrite_table td{
	border: 1px solid gray;
	padding: 10px;
}

.faqWrite_table .table_list{
	width:20%;
	font-size: 18px;
	text-align: center;
} 

#name{
	border: 0px none;
	outline: none;
}

.faqWrite_table td input, .faqWrite_table td textarea{
	width: 100%;
	border: 0px none;
	outline: none;
}

.faqWrite_table td select{
	/* border: 0px none;
	border-bottom:solid;
	border-bottom-width:thin;
	border-bottom-color:gray; */
	width: 40%;
 }

</style>
<div align="center">
	<table class="top_table">
		<tr>
			<td>
				<img src="./image/admin/FAQ.png" width='30px' height='30px'>
			</td>
			<td style="padding-left: 10px;">
				<b style="font-size: 30px;">FAQ 등록</b>
			</td>
		</tr>
	</table>
</div>

<div align="center">
	<form action="faqWriteAf.do" id="frm" method="GET">
		<div align="left" class="div_table">
			<table class="faqWrite_table">
				<col width="80px"><col width="auto">
				<tr>
					<th colspan="2" style="text-align: center;">FAQ 정보</th>
				</tr>
				<tr>
					<td class="table_list">분류</td>
					<td>
						<select name="f_category">
							<option value="" selected>- [필수] 분류를 선택하세요. -</option>
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
					<td><input type="text" name="f_title" maxlength="25" autofocus required></td>
				</tr>
				<tr> 
					<td class="table_list">내용</td>
					<td><textarea name="f_content" required rows="20"></textarea></td>
				</tr>
			</table>
			<br>
			<div align="center">
				<input type="button" class="btn btn-secondary" style="width: 100px;" id="faqWrite" value="등록">
				<input type="button" class="btn btn-dark" style="width: 100px;" value="취소" onclick="location.href='faq.do'">
			</div>
		</div>
	</form>
</div>


<script type="text/javascript">
$("#faqWrite").click(function(){
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
