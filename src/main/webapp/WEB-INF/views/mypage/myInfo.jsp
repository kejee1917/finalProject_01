<%@page import="verni.co.kr.member.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%   
MemberDto mem = (MemberDto)session.getAttribute("login");    
//System.out.println(mem.toString());

MemberDto dto = (MemberDto)request.getAttribute("dto");  
//System.out.println("확인:" + dto.toString());
String str = dto.getM_phoneNum();
String[] arr = str.split("-");
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<link rel="stylesheet" href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>


<style type="text/css">

.lable-name {
  display: inline-block;
  width: 140px;
  vertical-align: middle;
  margin-top: 30px;
  font-size: 14px;
  font-weight: 400;
  color: #666;
  margin-left: 20%;
}

.input-data {
  width: 300px;
  color: grey;
  background-color: white;
	line-height: 40px;
	border-color: grey;
	margin-top: 10px;
	font-size: 14px;
	display: inline-block;
	box-sizing: border-box;
}

.select-data {
	width: 100px;
	height: 40px;
	margin-top: 10px;
	font-size: 14px;
}

input[type="button"] {
	font-size: 13px;
	border: 1px solid;
  	border-color: #BE9E81;
  	background-color: #BE9E81;
  	color: white;
  	height: 45px;
  	width: 70px;
  	text-align: center;
  	margin-top: 10px;
  	margin-left: 1px;
}
input[type="number"]::-webkit-outer-spin-button,
input[type="number"]::-webkit-inner-spin-button {
    -webkit-appearance: none;
    margin: 0;
}

input[type="number"]{
	width: 4em;
	height: 3em;
}

#cancelBtn{
  display: inline-block;
  box-sizing: border-box;
  border: 1px solid;
  text-align: center;
  border-color: black;
  background-color: white;
  color: black;
  margin-top: 10px;
  width: 150px;
  height: 50px;
  line-height: 50px;
  font-size: 17px;
}

#saveBtn{
  display: inline-block;
  box-sizing: border-box;
  text-align: center;
  background-color: #454545;
  color: white;
  margin-top: 10px;
  border-color: #454545;
  width: 150px;
  height: 50px;
  line-height: 50px;
  font-size: 17px;
}

#saveBtn:hover{
   background-color: #BE9E81;
   border-color: #BE9E81;
}

#m_address_postcode {
  	width: 100px;
  	color: grey;
  	background-color: white;
	line-height: 40px;
	border-color: grey;
	margin-top: 20px;
	font-size: 14px;
	display: inline-block;
	box-sizing: border-box;
}


</style>

</head>
<body>
<h1 style="margin-top: 2%">내 정보 수정</h1>
<hr align="left" style="border: solid #8A989A;" width="70%">

<table class="tableForm" width="70%">
	
	<col width="50%"><col width="20%"><col width="30%">
	
	<tr>
		<td rowspan="13"> <img alt="" src="image/mypage/back1.png" width="100%"> </td>
	</tr>
	
	<tr>
		<td class="lable-name">아이디</td>
		<td><input type="text" class="input-data" name="m_id" id="id" size="17" value="${login.m_id }" readonly="readonly"></td>
	</tr>
	
	<tr class="pwdTr">
		<td class="lable-name">비밀번호</td>
		<td><input type="button" class="input-data" value="변 경" id="pwdChangeBtn" onclick="changeBtn()"></td>
	</tr>
	<tr class="pwdChangeTr">
		<td class="lable-name">변경할 비밀번호</td>
		<td><input type="password" class="input-data" id="pwdChange1" placeholder="영문,숫자,특수문자 조합" ></td>
	</tr>
	<tr class="pwdChangeTr">
		<td></td><td colspan="2" style="font-size: 3px" id="pwdcheck_blank1"></td>
	</tr>
	<tr class="pwdChangeTr">
		<td class="lable-name">변경할 비밀번호 확인</td>
		<td><input type="password" class="input-data" id="pwdChange2" placeholder="한번 더 입력해주세요" size="17"></td>
		<td><input type="button" value="취소" onclick="changeCancel()">  </td>
	</tr>
	
	<tr class="pwdChangeTr">
		<td></td><td colspan="2" style="font-size: 3px" id="pwdcheck_blank2"></td>
	</tr>
	<tr>
		<td class="lable-name">이름</td>
		<td><input type="text" class="input-data" name="m_name" id="name" size="15" readonly="readonly" value="${dto.m_name }"></td><td></td>
	</tr>
	<tr>
		<td class="lable-name">주소</td>
		<td>
		<input type="text" size="15" class="input-data" id="m_address_postcode" readonly="readonly" value="${dto.m_address_postcode}">
		<input type="button" value="주소검색" onclick="exePost()">
		</td>
	</tr>
	<tr>
		<td></td>
		<td colspan="2">
		<input type="text" class="input-data" id="m_address_primary" id="m_address_primary" size="40" readonly="readonly" value="${dto.m_address_primary}">
		</td>	
	</tr>
	<tr>
		<td></td>
		<td colspan="2">
		<input type="text" class="input-data" size="40" id="m_address_detail" placeholder="나머지 주소(선택 사항)" value="${dto.m_address_detail}">
		</td>
	</tr>
	<tr>
		<td class="lable-name">연락처</td>
		<td>
			<input type="hidden"  id="m_phoneNum" name="m_phoneNum" >
			<select class="select-data" id="phoneNum1">
				<option value="010">010</option>
				<option value="011">011</option>
				<option value="016">016</option>
				<option value="017">017</option>
				<option value="018">018</option>
				<option value="019">019</option>
			</select> 
			- <input type="number" class="input-data" id="phoneNum2" maxlength="4" oninput="maxLengthCheck(this)" value="<%=arr[1] %>">
		    - <input type="number" class="input-data" id="phoneNum3" maxlength="4" oninput="maxLengthCheck(this)" value="<%=arr[2] %>">
		</td>
		<td></td>
	</tr>
		<tr>
		<td class="lable-name">성별</td>
		<td>
			<select class="select-data" id="gender" name="m_gender">
				<option value="1">선택안함</option>
				<option value="2">여성</option>
				<option value="3">남성</option>
			</select> 
		</td>
	</tr>
	

	
</table>

<br><br>

<div style="padding-left: 25%; margin-top: 5%">
<input type="button" id="cancelBtn" value="취소하기">
<input type="button" id="saveBtn" value="저장하기">
</div>	

<br>
<!-- 
<div style="padding-left: 400px">
<a href="withdraw.do?menu=withdraw" class="withdrawBtn">회원탈퇴</a>
</div>	

 -->
<script type="text/javascript">

let password = false;
let password_check = false;
let phone = false;


$(document).ready(function() {
	
	$(".pwdChangeTr").hide();
	
	
	$('#phoneNum1').val('<%=arr[0]%>').prop("selected",true); 
	$('#gender').val('<%=dto.getM_gender()%>').prop("selected",true); 
	
});

//////비밀번호 변경 클릭////////
function changeBtn() {
	$(".pwdChangeTr").show();
	$(".pwdTr").hide();
}

//////비밀번호 변경 취소 클릭///////
function changeCancel() {
	$(".pwdChangeTr").hide();
	$(".pwdTr").show();
	$("#pwdChange1").val("");
	$("#pwdChange2").val("");
	$("#pwdcheck_blank1").text("");
	$("#pwdcheck_blank2").text("");
}

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
            
            
            $("[id=m_address_postcode]").val(data.zonecode);
            $("[id=m_address_primary]").val(fullRoadAddr);
            $("[id=m_address_detail]").val("");   //상세 주소 초기화
            
            /* document.getElementById('signUpUserPostNo').value = data.zonecode; //5자리 새우편번호 사용
            document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
            document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */
        }
     }).open();
}

////////비밀번호/////////
$("#pwdChange1").blur(function() {
	let pwdCheck= /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/;
	
	if ($("#pwdChange1").val() == "") {
        $("#pwdcheck_blank1").css("color", "red");
        $("#pwdcheck_blank1").text("필수정보예요.");
        password = false;
     }	
     else if (!pwdCheck.test($("#pwdChange1").val())) {
	  	 $("#pwdcheck_blank1").css("color", "red");
	     $("#pwdcheck_blank1").text("비밀번호는 영문+숫자+특수문자 조합하여 8~16자리를 사용해야 합니다");
	     password = false;
     }else if($("#pwdChange1").val() == '${dto.m_password}') {
    	 $("#pwdcheck_blank1").css("color", "red");
	     $("#pwdcheck_blank1").text("기존의 비밀번호와 다르게 입력해주세요");
     }else {
   	  $("#pwdcheck_blank1").css("color", "blue");
		  $("#pwdcheck_blank1").text("안전한 비밀번호 입니다. 아래에 한번 더 입력하세요");
		  password = true;
     }
	

});

/////비밀번호 확인//////
$("#pwdChange2").blur(function() {
	if($("#pwdChange2").val() == "") {
	   $("#pwdcheck_blank2").css("color", "red");
       $("#pwdcheck_blank2").text("필수정보예요.");
       password_check = false;
	}
	else if(password == true && $("#pwdChange1").val() == $("#pwdChange2").val()) {
		$("#pwdcheck_blank2").css("color", "blue");
		$("#pwdcheck_blank2").text("비밀번호가 일치합니다!");
		password_check = true;
	}else {
		$("#pwdcheck_blank2").css("color", "red");
		$("#pwdcheck_blank2").text("비밀번호를 다시 확인해주세요");
		$("#pwdChange2").val("");
		password_check = false;
	}
});


//////////연락처 4자리 숫자만 입력//////////
function maxLengthCheck(object){
	if (object.value.length > object.maxLength) {
		object.value = object.value.slice(0, object.maxLength);
    }
 }
 


$("#saveBtn").click(function() {
	
	//연락처 결합
	let totalnum = $("#phoneNum1").val() + "-" + $("#phoneNum2").val() + "-" + $("#phoneNum3").val(); 
	$("#m_phoneNum").val(totalnum);
	if( $("#m_phoneNum").val().length > 11 ) {
		phone = true;
	}else if( (3 < $("#m_phoneNum").val().length) && ($("#m_phoneNum").val().length < 11)  ){
		phone = false;
		alert("전화번호 형식에 맞게 입력하세요");
		$("#phoneNum2").val("");
		$("#phoneNum3").val("");
		return; 
	}else if( ($("#phoneNum2").val() == "") && ($("#phoneNum3").val() == "") ) {  //아무것도 입력안하면 기존 전화번호로
		phone = false;
	}
	
	
	//비밀번호 유효성 검사
	if(password_check==false && $("#pwdChange1").val() != "") {
		alert("비밀번호 형식에 맞게 입력하세요");
		return;	
	}
	
	
	let no = ${login.m_no};
	let id = '${login.m_id}';
	let pwd = password_check==true?$("#pwdChange2").val():'${dto.m_password}';
	let name = '${login.m_name}';
	let address1 = $("#m_address_postcode").val();
	let address2 = $("#m_address_primary").val();
	let address3 = $("#m_address_detail").val();
	let phoneNum = phone==true?totalnum:'${dto.m_phoneNum}';
	let email = '${login.m_email}';
	let joindate = '${login.m_joindate}';
	let level = ${login.m_level};
	let point =  ${login.m_point};
	let total =  ${login.m_total};
	let birth =  '${login.m_birth}';
	let gender = $('#gender').val();

	
 	if((password_check == true || pwd.length>8) && (totalnum.length > 9 || phoneNum.length > 9)) { //비밀번호 형식, 전화번호 형식 통과하면
 		$.ajax({
 			url: "myInfoAf.do",
 			type: "post",
 			data: {'m_no':no, 'm_id':id, 'm_password':pwd, 'm_name':name, 
	 				'm_address_postcode':address1, 'm_address_primary':address2, 'm_address_detail':address3, 
	 				'm_email':email, 'm_phoneNum':phoneNum, 'm_joindate':joindate, 
	 				'm_level':level, 'm_point':point, 'm_total':total, 'm_birth': birth, 'm_gender':gender },
 			success: function(str) {
 				//alert("s");
 				
 				if(str == "YES") {
 					alert("성공적으로 수정되었습니다");
 					location.href = "mypageAf.do";  //수정완료 후 마이페이지
 				}else {
 					alert("수정 정보를 다시 확인하세요");
 					return;
 				}
 			},
 			error: function() {
 				alert("e");
 			}
 		});
 	}else {
 		alert("수정 정보를 다시 입력하세요");
 		return;
 	}
	
});
 
$("#cancelBtn").click(function() {
	
	location.href = "mypage.do";
});
 
 
</script>







</body>
</html>