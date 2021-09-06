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

.select-data {
	width: 74px;
	height: 36px;
	font-size: 14px;
}

input[type="number"]::-webkit-outer-spin-button,
input[type="number"]::-webkit-inner-spin-button {
    -webkit-appearance: none;
    margin: 0;
}

</style>
</head>
<body>

<div align="center" style="margin: 100px;">
<p style="font-size: 25px; font-weight: bold;">아이디 찾기</p>
<br>
<p style="font-size: 16px ">등록된 회원 정보로 아이디를 찾으실 수 있습니다.</p>
<table>
	<col width="120px"><col width="250">
	<tr>
		<td class="title">이름</td>
		<td><input type="text" id="_name" size="30" placeholder="이름을 입력해주세요"></td>
	</tr>
	<tr>
		<td class="title">연락처</td>
		<td>
			<input type="hidden" id="m_phoneNum" name="m_phoneNum" >
			<select id="phoneNum1" class="select-data">
				<option value="010">010</option>
				<option value="011">011</option>
				<option value="016">016</option>
				<option value="017">017</option>
				<option value="018">018</option>
				<option value="019">019</option>
			</select> 
			- <input type="number" class="select-data" id="phoneNum2" maxlength="4" oninput="maxLengthCheck(this)">
		    - <input type="number" class="select-data" id="phoneNum3" maxlength="4" oninput="maxLengthCheck(this)">
		</td>
	</tr>
	<tr>
		<td colspan="2"><input type="button" id="idFind" value="아이디 찾기" onclick="idFind()"></td>
	</tr>
</table>
</div>


<script type="text/javascript">

let name = false;
let phone = false;

//////////연락처//////////
function maxLengthCheck(object){
	
	if (object.value.length > object.maxLength) {
		object.value = object.value.slice(0, object.maxLength);
    }
}
 
$("#idFind").click(function(){
	//이름 쓰여있는지
	if($("#_name").val() == "") {
		alert("이름을 입력해주세요");
		return;
	}else {
		name = true;
	}
	
	if($("#phoneNum2").val() == "" || $("#phoneNum3").val() == "") {
		alert("연락처를 입력해주세요");
		return;
	}
	
	//연락처 결합
	let totalnum = $("#phoneNum1").val() + "-" + $("#phoneNum2").val() + "-" + $("#phoneNum3").val(); 
	$("#m_phoneNum").val(totalnum);
	if( $("#m_phoneNum").val().length > 11 ) {
		phone = true;
	}else {
		alert("연락처를 정확히 입력해주세요");
		phone = false;
		$("#phoneNum2").val("");
		$("#phoneNum3").val("");
		return;
	}	
	
	console.log(name);
	console.log(phone);
	if(name == true && phone == true) {
		location.href = "idFindAf.do?m_name=" + $('#_name').val() + "&m_phoneNum=" + totalnum;
	}
	
});


 

</script>



</body>
</html>