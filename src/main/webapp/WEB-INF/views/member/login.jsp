<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
 String url = request.getParameter("url"); 
//System.out.println("요청온 주소 jsp : " + url);
%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>  

<!-- 네이버아이디로 로그인 -->
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<!-- cookie -->
<script src="http://lab.alexcican.com/set_cookies/cookie.js" type="text/javascript" ></script>

<style type="text/css">
.id-input {
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
  border: solid 1px #ddd;
  width: 100%;
  height: 40px;
  padding: 11px 20px;
  font-size: 12px;
  color: #bbb;
  margin-top: 10px;
}
.pwd-input {
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
  border: solid 1px #ddd;
  width: 100%;
  height: 40px;
  padding: 11px 20px;
  font-size: 12px;
  color: #bbb;
  margin-top: 10px;
}
.login-btn {
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
  margin-top: 10px;
  width: 100%;
  line-height: 50px;
  font-size: 16px;
}
.login-btn:hover{
	background-color: #BE9E81;
	border-color: #BE9E81;
}
#id_save{
	width: 15px;
	height: 15px;
	margin-top: 10px;
}

.regi-btn {
  display: inline-block;
  box-sizing: border-box;
  border: 1px solid #231f20;
  border-color: black;
  text-align: center;
  line-height: 40px;
  color: #231f20;
  background-color: #fff;
  margin-top: 10px;
  width: 100%;
  height: 50px;
  line-height: 50px;
  font-size: 16px;

}

input[type="checkbox"] {
  padding-left: 22px;
  height: 16px;
  line-height: 16px;
  font-size: 12px;
  color: #999;
}
.idpwd-find {
  display: inline-block;
  box-sizing: border-box;
  border: 1px solid #eee;
  text-align: center;
  color: #231f20;
  background-color: #fff;
  margin-top: 10px;
  width: 130px;
  height: 47px;
  font-size: 16px;
}

</style>
</head>
<body>

<div align="center" style="margin: 100px;">
<div class="contianer" style="width: auto; height:auto; padding-left: 11%;padding-right: 11%;">
<p style="font-size: 30px; font-weight: bold;">MEMBER LOGIN</p>
<form action="loginAf.do" id="frm" method="post">
<table>
<col width="200px"><col width="200px">
<tr>
   <td colspan="2"><input type="text" class="id-input" id="id" name="m_id" placeholder="아이디를 입력해주세요"></td>
</tr>
<tr>
   <td colspan="2"><input type="password" class="pwd-input" id="password" name="m_password" placeholder="비밀번호를 입력해주세요"></td>
</tr>
<tr>
   <td colspan="2"><input type="checkbox" id="id_save">
   <label for="id_save"><span style="font-size: 11px; vertical-align: 3px;" >아이디 저장</span></label>
   </td>
</tr>
<tr>
	
   <td colspan="2"><input type="button" class="login-btn" id="loginBtn" value="로그인"></td>
   
</tr>
<tr>
   <td align="center" colspan="2"><input type="button" class="regi-btn" id="regiBtn" value="회원가입" onclick="location.href='regi.do'"></td>
   
   <!-- <td align="center"><input type="button" id="pwdSearchBtn" value="비밀번호 찾기" onclick="location.href='pwdFind.do'"></td> -->
</tr>

</table>
<br>


<!-- <p style="font-size: 12px">비밀번호가 기억이 안나세요?&nbsp;&nbsp;<a href="pwdFind.do" class="password-find" id="pwdSearchBtn">비밀번호 찾기</a></p>
 -->

 
 

<input type="button" class="idpwd-find" id="idSearchBtn" onclick="location.href='idFind.do'" value="아이디 찾기"> 
<input type="button" class="idpwd-find" id="pwdSearchBtn" onclick="location.href='pwdFind.do'" value="비밀번호 찾기">


<!-- 네아로 -->
<span id="naver_id_login" style="text-align:center; vertical-align: 3px;" ><a href="${naverurl}">
<img width="130" src="image/mypage/naverlogin2.png"/></a></span>


</form>
</div>
</div>
<script type="text/javascript">
let user_id = $.cookie("user_id");
if(user_id != null) {
   //alert("쿠키있음");
   $("#id").val(user_id);
   $("#id_save").prop("checked", true);
}

$("#id_save").click(function () {
//   alert('click');

   if( $("#id_save").is(":checked") ){   //체크되었을때   
      if( $("#id").val().trim() == "" ){
         alert('id를 입력해 주세요');
         $("#id_save").prop("checked", false);
      }else{
         // id를 쿠키에 저장
         $.cookie("user_id", $("#id").val().trim(), { expires:7, path:'/' });
      }
   }
   else{
      $.removeCookie("user_id", { path:'/' });
   }   
});


$("#regiBtn").click(function() {
   location.href = "regi.do";
});

$("#loginBtn").click(function() {
   
   if($("#id").val().trim() == "") {
      alert("아이디를 입력해주세요");
      $("#id").focus();
   }else if($("#password").val().trim() == "") {
      alert("비밀번호를 입력해주세요");
      $("#password").focus();
   }else{
      //$("#frm").submit();
      
      $.ajax({
         url: "loginAf.do",
         type: "post",
         data: {'m_id':$("#id").val(), 'm_password':$("#password").val(), 'url':'<%=url%>'},
         success: function(data) {
            //alert(data);
            if(data.indexOf('MEM') == 0) {
            	let url = data.substr(3);
               alert("성공적으로 로그인되었습니다!");
               if(url == 'null'){
            	   location.href = 'main.do';
               }else{
            	   location.href = url;
               }
               
            }else if(data == 'ADMIN') {
               alert("관리자님 환영합니다!");
               location.href = "admin.do";
            }else if(data == 'WITHDRAW'){
               alert("탈퇴한 회원입니다");
               location.href = "logout.do";
         	}else {
               alert("아이디와 비밀번호를 다시 확인해주세요");
               location.href = "login.do";
            } 
         },
         error: function() {
            alert("ej 로그인 에러");
         }
      });
   }
});




</script>


</body>
</html>