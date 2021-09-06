<%@page import="verni.co.kr.member.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
.top_table{
	margin: 100px 0px 50px 0px;
}

.main_table{
	width: 70%;
	border-collapse: collapse;				/* collapse : 상쇄, separated : 분리 */
	border-top: outset;
	border-bottom: outset;
	font-size: 14px;
}

.main_table tr{
	border-bottom: outset;
	border-bottom-width: thin;
}

.main_table th{
 	text-align: center;
	background-color: #e9ecef;
	padding: 10px 10px 10px 20px;
	border-bottom: outset;
	font-size: 18px;
}

.main_table td{
	padding: 10px;
	border-right: outset;
	border-right-width: thin;
}

.man_table_title{
	width:20%;
	text-align: center;
}

#pwdUpdate, #infUpdate{
	text-decoration: underline;
	color: blue;
	cursor: pointer;
}

/* 이름이랑 변경이 한 줄에 나오도록 */
#infUpdate{
	display: inline;
}

/* 전체화면 */
.searchModal{
	display: none;
	position: fixed;					/* 스크롤과 상관없이 항상 문서 최 좌측상단을 기준으로 고정 */
	z-index: 10;						/* 위치지정 */
	left: 0;							/* position과 같이 쓰임 */
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;						/* 넘치는 컨텐츠를 스크롤바 추가할지 말지 자동으로 설정 */
	background-color: rgb(0,0,0);
	background-color: rgba(0,0,0,0.4);	/* 전체 화면 바탕 투명도 */

}

/* 모달창 */
.search_modal_content{
	background-color: #fefefe;
	margin: 15% auto;
	padding: 20px;						/* 안쪽여백 */
	border: 1px solid #888;
	width: 500px;						/* 모달 창 크기 */
	border-radius: 5px;					/* 모서리 둥글게 */
}

#_pwd, #_pwdCheck, #_name, #_email, #_domain{
	border: 0px none;					/* input Box 없애기 */
	outline: none;						/* 클릭 시 테두리 없애기 */
	border-bottom: outset;
}

</style>

<%
	MemberDto mem = (MemberDto)session.getAttribute("login");
%>

<%
//이메일 도메인 분리
String email = mem.getM_email();
System.out.println("Email:"+email);

int s = email.indexOf("@");
String email_id = email.substring(0, s);			// 아이디만 가져오기
String email_domain = email.substring(s + 1);		// 도메인만 가져오기

%>
<div align="center">
	<table class="top_table">
		<tr>
			<td>
				<img src="./image/admin/admin.png"  width='30px' height='30px'>
			</td>
			
			<td style="padding-left: 10px;">
				<b style="font-size: 30px;">관리자 계정관리</b>
			</td>
		</tr>
	</table>
</div>
<div align="center" style="height: 660px;">
	<table class="main_table">
		<tr>
			<th colspan="2">기본정보</th>
		</tr>
		<tr>
			<td class="man_table_title">아이디</td>
			<td><%=mem.getM_id() %></td>
		</tr>
		<tr>
			<td class="man_table_title">비밀번호</td>
			<td>
				<a id="pwdUpdate">변경</a>
			</td>
		</tr>
		<tr>
			<td class="man_table_title">이름</td>
			<td>
				<a id="infUpdate"><%=mem.getM_name() %></a>
			</td>
		</tr>
		<tr>
			<td class="man_table_title">이메일</td>
			<td><%=mem.getM_email() %></td>
		</tr>
	</table>
</div>


<!-- 비밀번호 변경 모달창 -->
<form action="pwdUpdate.do" method="post" id="pwdForm">
	<div id="pwdModal" class="searchModal">
		<div class="search_modal_content">
			<div class="page_header" align="center">
				<h3>비밀번호 변경</h3>
			</div>
			
			<hr>
			
			<div class="row">
				<div class="col-sm-12">
					<table>
					<col width="150"><col width="350">
					<tr>
						<td style="padding-left: 15px;">
							<h6 style="color: gray">비밀번호</h6>
						</td>
						<td style="padding-left: 10px;">
							<input type="hidden" name="m_id" value="<%=mem.getM_id()%>">
							<input type="password" id="_pwd" name="m_password" size="35px" maxlength="16">
						</td>
					</tr>
					<tr>
						<td style="padding-left: 15px; padding-top: 20px;">
							<h6 style="color: gray">비밀번호 확인</h6>
						</td>
						<td style="padding-left: 10px;">
							<input type="password" id="_pwdCheck" size="35px" maxlength="16">
						</td>
					</tr>
					</table>
				</div>
			</div>
			
			<hr>
			
			<div align="center" >
				<!-- 닫기버튼 -->
				<div id="closeModal" style="display: inline-block;">
					<span class="btn btn-dark" style="font-size: 15px">
						닫기
					</span>
				</div>
				
				<!-- 저장버튼 -->
				<div id="saveModal" style="display: inline-block;">
					<span class="btn btn-secondary" style="font-size: 15px">
						저장
					</span>
				</div>
			</div>
		</div>
	</div>
</form>

<!-- 관리자정보 변경 모달창 -->
<form action="inforUpdate.do" method="post" id="inforForm">
	<div id="inforModal" class="searchModal">
		<div class="search_modal_content">
			<div class="page_header" align="center">
				<h3>관리자 정보변경</h3>
			</div>
			
			<hr>
			<div class="row">
				<div class="col-sm-12">
					<table>
					<col width="100"><col width="400">
					<tr>
						<td style="padding-left: 10px;">
							<h6 style="color: gray">이름</h6>
						</td>
						<td>
							<input type="hidden" name="m_id" value="<%=mem.getM_id()%>">									
							<input type="text" id="_name" name="m_name" value="<%=mem.getM_name() %>" size="15px">
						</td>
					</tr>
					<tr>
						<td style="padding-left: 10px; padding-top: 25px;">
							<h6 style="color: gray">이메일</h6>
						</td>
						<td>
							<input type="text" id="_email" value="<%=email_id %>" size="10px">@
							<input type="text" id="_domain" size="10px">
							<input type="hidden" id="_m_email" name="m_email">
							<select id="selectDomain">
								<option value="선택">선택</option>
								<option value="naver.com">naver.com</option>
								<option value="daum.net">daum.net</option>
								<option value="gmail.com">gmail.com</option>
								<option value="yahoo.com">yahoo.com</option>
         							<option value="hotmail.com">hotmail.com</option>
         							<option value="verni.com">verni.com</option>
								<option value="직접입력">직접입력</option>
							</select>
						</td>
					</tr>
					</table>
				</div>
			</div>
			
			<hr>
			
			<div align="center" >
				<!-- 닫기버튼 -->
				<div id="closeModal2" style="display: inline-block;">
					<span class="btn btn-dark" style="font-size: 15px">
						닫기
					</span>
				</div>
				
				<!-- 저장버튼 -->
				<div id="saveModal2" style="display: inline-block;">
					<span class="btn btn-secondary" style="font-size: 15px">
						저장
					</span>
				</div>
			</div>
		</div>
	</div>
</form>

<script type="text/javascript">
$(document).ready(function () {

});
</script>
	
<script type="text/javascript">	
	/* 비밀번호 변경 */
	$("#pwdUpdate").click(function () {
		$("#pwdModal").show();
		
	});
	
	$("#closeModal").click(function () {
	//	alert('ㅎㅇ');
	//	초기화
		$("#_pwd").val("");
		$("#_pwdCheck").val("");
		$(".searchModal").hide();
	});

	$("#saveModal").click(function () {
	//	alert('ㅎㅇ');
		let pwdCheck= /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/;
		
		if($("#_pwd").val() == $("#_pwdCheck").val()){
			if(pwdCheck.test($("#_pwd").val())){
			//	alert($("#_pwd").val());
				$("#pwdForm").submit();
			}else{
				alert("영문, 숫자, 특수문자 조합하여 8-16자리로 입력해주십시오.");
			}
		}else{
			alert('비밀번호가 일치하지 않습니다.');
		}
		// alert('저장되었습니다.');
		
		
	});	
	
	// 받아온 select값 default값으로 넣어주기
	$("#selectDomain").val("<%=email_domain %>").prop("selected", true);	
	$("#_domain").val($("#selectDomain option:selected").text());
	
	/* 회원정보 변경 */
	$("#infUpdate").click(function () {
	//	alert('변경');
		$("#inforModal").show();	 
	});
	
	$("#closeModal2").click(function () {
	//	alert('ㅎㅇ');
	// 	초기화
		$("#_name").val("");
		$("#_name").val("<%=mem.getM_name()%>");
		$("#_email").val("");
		$("#_email").val("<%=email_id%>");
		$("#selectDomain").val("");
		$("#selectDomain").val("<%=email_domain%>").prop("selected", true);
		$("#_domain").val($("#selectDomain option:selected").text());
		$(".searchModal").hide();
	});         

	$("#saveModal2").click(function () {
	//	alert('ㅎㅇ');
	//	alert($("#_name").val());
	// alert('저장되었습니다.');
		let email = $("#_email").val();
		let domain = $("#_domain").val();
		$("#_m_email").val(email+'@'+domain);
		$("#inforForm").submit();
	});	
		

// 도메인 넣어주기
$("#selectDomain").change(function () {
//	let domain = $("#selectDomain").val();
//	alert(domain);
	$("#selectDomain option:selected").each(function () {		// 도메인을 선택할때마다
		if($("#selectDomain option:selected").val() == "직접입력"){	
			$("#_domain").attr("disabled", false);		// input 활성화
			$("#_domain").val("");
		}else{
			$("#_domain").val($(this).text());
			$("#_domain").attr("disabled", true);		// input 비활성화
		}
	});
});


</script>
