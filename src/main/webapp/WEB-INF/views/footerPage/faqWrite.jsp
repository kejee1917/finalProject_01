<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="contianer" style="padding-left: 11%; padding-right: 11%; height: auto;">
<h5> FAQ 작성</h5><br>
<form action="faqWriteAf.do" id="frm" method="GET">
<table>
<col width="80px"><col width="auto">
	<tr>
		<th>카테고리</th>
		<td>
			<select name="f_category">
				<option value="">--카테고리 선택--</option>
				<option value="회원가입/탈퇴">회원가입/탈퇴</option>
				<option value="회원정보">회원정보</option>
				<option value="로그인">로그인</option>
				<option value="주문/결제">주문/결제</option>
				<option value="제품관련">제품관련</option>
				<option value="배송">배송</option>
				<option value="반납">반납</option>
			</select>
		</td>
	</tr>
	<tr>
		<th>제목</th>
		<td><input type="text" name="f_title"></td>
	</tr>
	<tr>
		<th>내용</th>
		<td><textarea rows="7" cols="102" name="f_content"></textarea></td>
	</tr>
	<tr>
		<td colspan="2"><input type="button" id="faqWrite" value="작성하기"></td>
	</tr>
</table>
</form>
</div>

<script type="text/javascript">
$("#faqWrite").click(function(){
	if($('select[name=f_category]').val() == ""){
		alert('카테고리를 선택해주세요');
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


</body>
</html>