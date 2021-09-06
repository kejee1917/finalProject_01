<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.title2{
	font-size: 18px;
}
#ok {
  display: inline-block;
  box-sizing: border-box;
  border: 1px solid #231f20;
  height: 40px;
  width: 70px;
  text-align: center;
  line-height: 20px;
  font-size: 13px;
  border-color: #eee;
  background-color: #454545;
  color: white;
  border-color: #2E4D58;
  margin-left: 40%
}
#ok:hover {
   background-color: #BE9E81;
   border-color: #BE9E81;
}
.radioBtn{
	vertical-align: -3px;
	margin-top: 5px;
	width: 13px;
	height: 13px;
}

.reason{
	font-size: 13px;
}

#agree{
	vertical-align: -3px;
}

.withdraw-af{
	font-size: 15px;
}

</style>
</head>
<body>

<h1 style="margin-top: 2%">회원 탈퇴</h1>
<hr align="left" style="border: solid #8A989A;" width="70%">


<div style="float: left; width: 30%" >
	<img alt="" src="image/mypage/back2.png" width="100%">
</div>


<div style="float: left; margin-left:2%; width: 40%">
	<br>
	<h2>share verni를 <font style="text-decoration: underline; color: red" >탈퇴</font>하시겠습니까?</h2>
	<br>
	
	<h3>계정을 삭제하시는 이유를 말씀해주세요.</h3>
	<div class="title2">share verni 개선에 소중한 자료로 사용하겠습니다.</div><br><br>
	
	
	<input type="radio" class="radioBtn" name="radioBtn" value="service" checked="checked"><span class="reason">쇼핑몰 서비스에 불만이 있어요</span>
	<br><br>
	<input type="radio" class="radioBtn" name="radioBtn" value="uncomfortable" ><span class="reason">이용이 불편하고 장애가 많아요</span>
	<br><br>
	<input type="radio" class="radioBtn" name="radioBtn" value="notprefer" ><span class="reason">다른 사이트가 더 좋아요</span>
	<br><br>
	<input type="radio" class="radioBtn" name="radioBtn" value="rarely" ><span class="reason">자주 사용하지 않아요</span>
	<br><br>
	<input type="radio" class="radioBtn" name="radioBtn" value="etc" ><span class="reason">기타</span><br><br>
	
	<br>
	
	<hr align="left" width="100%">
	<br>
	<div class="withdraw-af">
	회원 탈퇴 이후
	<br><br>
	
	▶ 동일 계정과 휴대폰 번호로 30일간 회원가입을 할 수 없습니다.<br>
	▶ 동일 번호로 재가입시 회원가입 쿠폰이 발급되지 않습니다.<br>
	▶ 탈퇴 이후 데이터 삭제로 인해 고객센터 대응이 어려울 수 있습니다.<br>
	<br>
	
	<input type="checkbox" id="agree"><label for="agree"> &nbsp; 안내사항을 모두 확인하였으며 동의합니다.</label>
	</div>
	<br><br>

<input type="button" id="ok" value="탈퇴하기">
</div>

</body>


<script type="text/javascript" >
$("#cancel").click(function() {
	location.href = "mypage.do";
});

$("#ok").click(function() {
	
	let radioval = $("input[name='radioBtn']:checked").val();
	let check = $("#agree").is(":checked");
	
	if(check == false) {
		alert("안내사항에 동의해주셔야 탈퇴가 가능합니다");
		return;
	}else {
		if(confirm("정말 탈퇴하시겠습니까?") == true) { //alert창으로 한번 더 확인 절차
			location.href = "withdrawAf.do?m_reason=" + radioval + "&m_id=" + '${login.m_id}';
		}else {
			return;
		}
		
	}
	
});


</script>

</html>