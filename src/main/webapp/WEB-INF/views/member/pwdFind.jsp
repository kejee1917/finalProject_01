<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> 

<style type="text/css">

.title {
	font-size: 14px;
	padding-left: 20px;
}
td {
	padding-top: 10px;
}
input[type="text"] {
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
  border: solid 1px #ddd;
  width: 100%;
  height: 40px;
  padding: 11px 20px;
  font-size: 12px;
  color: #bbb;
}

input[type="button"] {
  display: inline-block;
  box-sizing: border-box;
  border: 1px solid #454545;
  height: 50px;
  text-align: center;
  line-height: 40px;
  font-size: 13px;
  border-color: #454545;
  background-color: #454545;
  color: white;
  margin-top: 20px;
  margin-left: 65px;
  width: 70%;
}
input[type="button"]:hover{
	background-color: #BE9E81;
	border-color: #BE9E81;
}

</style>
</head>
<body>

<div align="center" style="margin: 100px;">
<p style="font-size: 25px; font-weight: bold;">비밀번호 찾기</p>

<table>
	<col width="120px"><col width="250">
	<tr>
		<td class="title">아이디</td><td><input type="text" id="id" size="30" placeholder="아이디를 입력해주세요"></td>
	</tr>
	<tr>
		<td class="title">이메일</td><td><input type="text" id="email" size="30" placeholder="이메일을 입력해주세요"></td>
	</tr>
	<tr>
		<td colspan="2"><input type="button" value="이메일로 비밀번호 전송하기" onclick="sendEmail()"></td>
	</tr>
</table>
</div>


<script type="text/javascript">




/////////비번 이메일로 보내기/////////
function sendEmail() {
	let emailCheck = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
	let idCheck = /^[a-zA-Z0-9]{8,16}$/;
	
	
	if (!emailCheck.test($("#email").val())) {
		alert("이메일 형식에 맞추어 입력하세요");
	}else if (!idCheck.test($("#id").val())){
		alert("아이디를 형식에 맞추어 입력하세요");
	} else {
		let email = $("#email").val();  //입력한 이메일
		let id = $("#id").val();  //입력한 아이디
		
		$.ajax({
			url: "pwdSender.do",
			type: "get",
			data: {'m_email':email, 'm_id':id},
			success: function(data) {
				//alert(data);
	
				if(data == "YES") {
					alert("기입하신 이메일로 비밀번호를 전송했습니다.");
					location.href = "login.do";
				}else {
					alert("회원정보가 존재하지 않습니다.");
					location.href = "pwdFind.do";
					return;
				}
				
			},
			error: function () {
				alert("f");
			}
		});
		
	}
	
}

</script>



</body>
</html>