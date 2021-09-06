<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> 
<script src="http://lab.alexcican.com/set_cookies/cookie.js" type="text/javascript" ></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>


<link rel="stylesheet" href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>

<style type="text/css">

.regiTable{
	border: solid 1px #BE9E81;
}

.lable-name {
  display: inline-block;
  width: 120px;
  vertical-align: middle;
  margin-top: 30px;
  font-size: 14px;
  font-weight: 400;
  color: #666;
  margin-left: 10%;
}

.input-data {
  width: 300px;
  color: grey;
  background-color: white;
	line-height: 40px;
	border-color: grey;
	margin-top: 20px;
	font-size: 14px;
	display: inline-block;
	box-sizing: border-box;
}

.select-data {
	width: 90px;
	height: 40px;
	margin-top: 20px;
	font-size: 14px;
}
input[type="number"]::-webkit-outer-spin-button,
input[type="number"]::-webkit-inner-spin-button {
    -webkit-appearance: none;
    margin: 0;
}

input[type="button"]:nth-child(1) {
	font-size: 13px;
	border: 1px solid #BE9E81;
  	border-color: #BE9E81;
  	background-color: #BE9E81;
  	color: white;
  	height: 45px;
  	text-align: center;
  	margin-top: 16px;
  	margin-left: 3px;
}

#regiBtn {
  display: inline-block;
  box-sizing: border-box;
  border: 1px solid #231f20;
  text-align: center;
  line-height: 40px;
  font-size: 13px;
  border-color: #eee;
  background-color: #454545;
  color: white;
  margin-top: 10px;
  border-color: #454545;
  width: 20%;
  height: 50px;
  line-height: 50px;
  font-size: 17px;
  color: white;
}
#regiBtn:hover{
	background-color: #BE9E81;
	border-color: #BE9E81;
}

</style>

</head>
<body>

<div align="center" style="margin: 100px;">
<div class="contianer" style="width: auto; height:auto; padding-left: 11%;padding-right: 11%;">
<p style="font-size: 40px; font-weight: bold;">JOIN US</p>

<form action="regiAf.do" id="frm" method="post">

<table class="regiTable" >
	<p style="padding-left: 350px; font-size: 17px;">*은 필수 입력 정보입니다</p>
	<!-- <col width="40%"><col width="27%"><col width="30%"> -->
	<col width="160px"><col width="200px"><col width="120px">
	<tr>
		<td class="lable-name">아이디*</td>
		<td><input type="text" class="input-data" name="m_id" id="id" size="30" placeholder="영문과 숫자 조합하여 8~16자" maxlength="16"></td>
		<td><input type="button" id="id_Confirm" value="중복확인"></td>
	</tr>
	<tr>
		<td></td><td class="error-message" style="font-size: 3px" id="idcheck_blank"></td>
	</tr>
	<tr>
		<td class="lable-name">비밀번호*</td>
		<td><input type="password" class="input-data" name="m_password" id="password" size="30" placeholder="영문,숫자,특수문자 조합하여 8자~16자" maxlength="16"></td><td></td>
	</tr>
	<tr>
		<td></td><td class="error-message" colspan="2" style="font-size: 3px" id="pwdcheck_blank1"></td>
	</tr>
	<tr>
		<td class="lable-name">비밀번호 확인*</td>
		<td><input type="password" class="input-data" name="password_check" id="password_check" size="30"></td><td></td>
	</tr>
	<tr>
		<td></td><td class="error-message" colspan="2" style="font-size: 3px" id="pwdcheck_blank2"></td>
	</tr>
	<tr>
		<td class="lable-name">이름*</td>
		<td><input type="text" class="input-data" name="m_name" id="name" size="15"></td><td></td>
	</tr>
	<tr>
		<td class="lable-name">주소*</td>
		<td><input type="text" class="input-data" size="30" name="m_address_postcode" readonly="readonly" placeholder="우편번호"></td>
		<td><input type="button" value="주소검색" onclick="exePost()"></td>
	</tr>
	<tr>
		<td></td><td colspan="2"><input type="text" class="input-data" id="m_address_primary" name="m_address_primary" size="50" readonly="readonly" placeholder="기본주소"></td>
		
	</tr>
	
	<tr>
		<td></td><td colspan="2"><input type="text" class="input-data" size="50" name="m_address_detail" placeholder="나머지 주소(선택 사항)"></td>
	</tr>
	<tr>
		<td class="lable-name">연락처*</td>
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
		<td></td>
	</tr>
	<tr>
		<td class="lable-name">이메일*</td><td><input type="text" class="input-data" name="m_email" id="email" size="30"></td>
		<td><input type="button" value="인증코드 발송" onclick="sendEmail()"></td>
	</tr>
	<tr>
		<td></td><td><input type="text" class="input-data" id="codeInput" size="30" placeholder="인증번호 입력" disabled="disabled"></td><td></td>
	</tr>
	<tr>
		<td></td><td colspan="2" class="error-message" style="font-size: 3px" id="codecheck_blank"></td>
	</tr>
	<tr>
		<td class="lable-name">성별*</td>
		<td>
			<select class="select-data" id="gender" name="m_gender">
				<option value="1" selected="selected">선택안함</option>
				<option value="2">여성</option>
				<option value="3">남성</option>
			</select> 
		</td>
	</tr>
	<tr>
		<td class="lable-name">생일(선택입력)</td>
		<!-- <td>
			<input type="number" size="3"> 년 
			<input type="number" size="2"> 월 
			<input type="number" size="2"> 일 
		</td> -->
		<td><input type="text" class="select-data" name="m_birth" id="datepicker"></td>
		<td></td>
	</tr>

<tr><td>&nbsp;</td></tr>

<tr>
<td colspan="3" style="padding-left: 24%;">
<input type="checkbox" id="agree1"><span style="font-size: 14px"> [필수] 보험/이용약관에 동의 </span> 
<a style="color: grey; font-size: 14px" onclick="agree_1()">보기></a>
</td>
</tr>

<tr><td>&nbsp;</td></tr>

<tr>
<td colspan="3" style="padding-left: 24%;">
<input type="checkbox" id="agree2"><span style="font-size: 14px"> [필수] 개인정보수집/이용에 동의 </span> 
<a style="color: grey; font-size: 14px" onclick="agree_2()">보기></a>
</td>
</tr>
<tr><td>&nbsp;</td></tr>
</table>
<br><br>


<input type="button" id="regiBtn" value="가입하기">

</form>
</div>
</div>
<script type="text/javascript">

let code = "";     //이메일 인증 저장위한 코드

let id = false;
let id_check = false;
let password = false;
let password_check = false;
let name = false;
let address = false;
let phone = false;
let email = false;
let agree1 = false;
let agree2 = false;

$(document).ready(function() {
	$("#id_Confirm").hide();
	

	
	 /////////////아이디//////////////
	 
	 $("#id").blur(function() {
	 	let idCheck = /^[a-zA-Z0-9]{8,16}$/;
	 	
	 	if ($("#id").val() == "") {
	         $("#idcheck_blank").css("color", "red");
	         $("#idcheck_blank").text("아이디는 필수 입력");
	         id = false;
	 	}else if(!idCheck.test($("#id").val())) {
	         $("#idcheck_blank").css("color", "red");
	         $("#idcheck_blank").text("영문과 숫자 조합하여 8~16자만 가능");
	         id = false;
	    }else {
	    	$("#idcheck_blank").css("color", "blue");
	    	$("#idcheck_blank").text("괜찮은 아이디입니다. 중복확인을 해보세요");
	    	id = true;
	    }
	 	
	 	if(id == true) {
	 		$("#id_Confirm").show();
	 	}else {
	 		$("#id_Confirm").hide();
	 	}
	 });
	 
	 //////아이디 중복 검사////////
	 $("#id_Confirm").click(function() {
	 	if( $("#id").val() == "" ) {
	 		alert("아이디를 입력해주세요.");
	 	}else {
	 		$.ajax({
	 			url: "idcheck.do",
	 			type: "post",
	 			data: {'m_id':$("#id").val()},
	 			success: function(data) {
					//alert(data);
					if(data.trim() == "YES") {
						$("#idcheck_blank").css("color", "blue");
				    	$("#idcheck_blank").text("사용가능한 아이디입니다.");
				    	id_check = true;
					}else if(data.trim() == "NO"){
						$("#idcheck_blank").css("color", "red");
				    	$("#idcheck_blank").text("중복된 아이디입니다.");
				    	id_check = false;
				    	$("#id").val("");
					}
				},
				error: function() {
					alert("e");
				}
	 		});
	 	}
	 });
	 
	 
	 ////////비밀번호/////////
	 $("#password").blur(function() {
	 	let pwdCheck= /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/;
	 	
	 	if ($("#password").val() == "") {
	         $("#pwdcheck_blank1").css("color", "red");
	         $("#pwdcheck_blank1").text("필수정보예요.");
	         password = false;
	      }	
	      else if (!pwdCheck.test($("#password").val())) {
		  	 $("#pwdcheck_blank1").css("color", "red");
		     $("#pwdcheck_blank1").text("비밀번호는 영문+숫자+특수문자 조합하여 8~16자리를 사용해야 합니다");
		     password = false;
	      }else {
	    	  $("#pwdcheck_blank1").css("color", "blue");
			  $("#pwdcheck_blank1").text("안전한 비밀번호 입니다. 아래에 한번 더 입력하세요");
			  password = true;
	      }
	 	
	 
	 });
	
	/////비밀번호 확인//////
	$("#password_check").blur(function() {
		if($("#password_check").val() == "") {
			$("#pwdcheck_blank2").css("color", "red");
	        $("#pwdcheck_blank2").text("필수정보예요.");
	        password_check = false;
		}
		else if(password == true && $("#password").val() == $("#password_check").val()) {
			$("#pwdcheck_blank2").css("color", "blue");
			$("#pwdcheck_blank2").text("비밀번호가 일치합니다!");
			password_check = true;
		}else {
			$("#pwdcheck_blank2").css("color", "red");
			$("#pwdcheck_blank2").text("비밀번호를 다시 확인해주세요");
			$("#password_check").val("");
			password_check = false;
		}
	});
	
	
	
	/////이름///////
	$("#name").blur(function() {
		if( $("#name").val == "" ) {
			name = false;
		}else {
			name = true;
		}	
	});
	
});




///////주소 API //////////
function exePost() {
	 new daum.Postcode({
         oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 도로명 조합형 주소 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }
            // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
            if(fullRoadAddr !== ''){
                fullRoadAddr += extraRoadAddr;
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            console.log(data.zonecode);
            console.log(fullRoadAddr);
            
            
            $("[name=m_address_postcode]").val(data.zonecode);
            $("[name=m_address_primary]").val(fullRoadAddr);
            
            /* document.getElementById('signUpUserPostNo').value = data.zonecode; //5자리 새우편번호 사용
            document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
            document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */
        }
     }).open();
}

//////////연락처//////////
function maxLengthCheck(object){
	if (object.value.length > object.maxLength) {
		object.value = object.value.slice(0, object.maxLength);
    }
 }


//////////이메일 보내기/////////
function sendEmail() {
	let emailCheck = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
	
	if (!emailCheck.test($("#email").val())) {
		alert("이메일 형식에 맞추어 작성하세요");
	} else {
		let email = $("#email").val();  //입력한 이메일
		
		$.ajax({
			url: "mailSender.do",
			type: "get",
			data: {'m_email':email},
			success: function(rnum) {
				//alert("s");
				alert("기입하신 이메일로 인증번호를 전송했습니다.");
				
				$("#codeInput").attr("disabled", false); //입력칸 활성화
				code = rnum;
				
				
			},
			error: function () {
				alert("f");
			}
		});
		
	}
	
}

$("#codeInput").blur(function() {
	
	console.log(code);
	if(code == $("#codeInput").val()) { //인증번호 같다면
		$("#codecheck_blank").css("color", "blue");
		$("#codecheck_blank").text("인증되었습니다.");
		email = true;
	}else {
		$("#codecheck_blank").css("color", "red");
		$("#codecheck_blank").text("인증번호를 다시 입력해주세요.");
		email = false;
	}
}); 



/////////생일 datepicker 설정//////////
$.datepicker.setDefaults({
    dateFormat: 'yy-mm-dd',
    changeMonth: true,
    changeYear: true,
    yearRange: '1955:2021',
    prevText: '이전 달',
    nextText: '다음 달',
    monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
    monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
    dayNames: ['일', '월', '화', '수', '목', '금', '토'],
    dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
    showMonthAfterYear: true,
    yearSuffix: '년'
});

$("#datepicker").datepicker();







////////약관 동의 팝업창/////////
function agree_1() {
	window. open('agree1.do', '약관1', 'width=700px,height=500px,scrollbars=yes');
}
function agree_2() {
	window. open('agree2.do', '약관2', 'width=700px,height=500px,scrollbars=yes');
}




////////약관 동의 여부 체크////////
$("#agree1").click(function() {
	if( $("#agree1").is(":checked") ) {
		agree1 = true;
	}else {
		agree1 = false;
	}
});

$("#agree2").click(function() {
	if( $("#agree2").is(":checked") ) {
		agree2 = true;
	}else {
		agree2 = false;
	}
});



$("#regiBtn").click(function(){
	
	//연락처 결합
	let totalnum = $("#phoneNum1").val() + "-" + $("#phoneNum2").val() + "-" + $("#phoneNum3").val(); 
	$("#m_phoneNum").val(totalnum);
	if( $("#m_phoneNum").val().length > 11 ) {
		phone = true;
	}else {
		phone = false;
	}
	
	//주소 입력 여부 확인
	if( !$("#m_address_primary").val() == "" ) {
		address = true;
	}else {
		address = false;
	}
	
	
	/* 
	console.log(id_check);
	console.log(password_check);
	console.log(name);
	console.log(address);
	console.log(phone);
	console.log(email);
	console.log(agree1);
	console.log(agree2); */
 	
 	if(id_check == true 
 			&& password_check == true 
 			&& name == true 
 			&& address == true 
 			&& phone == true 
 			&& email == true 
 			&& agree1 == true 
 			&& agree2 == true ){
		$("#frm").submit();
	}else{
		alert("필수입력을 잘 확인해주세요.");
		return;
	}  
}); 




</script>

</body>
</html>