<%@page import="verni.co.kr.util.ProductUtil"%>
<%@page import="verni.co.kr.member.MemberDto"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
.div_table{
	width: 60%;
}

.top_table{
	margin-bottom: 10px;
}

.memUpdate_table{
	width:100%;
	border-collapse:collapse;
}

.memUpdate_table tr{
	text-align: left;
}

.memUpdate_table td{
	padding: 5px 0px 5px 5px;			/* 상 우 하 좌 */
	padding-bottom: 5px;
	border-bottom-style: outset;
	border-bottom-width: thin;
}

.memUpdate_table td input{
	padding: 0px 0px 5px 5px;		/* 상 우 하 좌 */
	border: 0px none;				/* input Box 없애기 */
	outline: none;					/* 클릭 시 테두리 없애기 */
	width: 100%;
}

.table_list{
	width:20%;
	color: gray;
	font-size: 14px;
	padding: 0px;
	padding-left: 10px;
}

/* 입력란에 마우스 갖다대면 배경색 나오게끔 */
.memUpdate_table_row:hover td, .memUpdate_table_row:hover input[type="text"], .memUpdate_table_row:hover input[type="password"]{
	background-color: #F3F3F3;	
	outline: none;
}

.postcode{
	cursor: pointer;
	width: 100px;
}


#phone1, #phone2, #phone3{
	border: 1px solid black;
	text-align-last: center;
}

#phone2, #phone3{
	margin-bottom: 5px;
}

#phone1{
	margin-top: 5px;
}

</style>

<%
	MemberDto dto = (MemberDto)request.getAttribute("dto");
	ProductUtil util = new ProductUtil();

	// 등급
	String general = "일반 회원";
	String silver = "실버 회원";
	String gold = "골드 회원";
	String dia = "다이아 회원";
	String w_mem = "탈퇴 회원";
	
	// 성별
	String none = "선택안함";
	String woman = "여자";
	String man = "남자";
%>

<script>
function lastCheck() {
//	alert('ㅎㅇ');
	var pwd = $("#_m_password").val();
	var pwd2 = $("#_m_passwordCheck").val();
	var pwdCheck= /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/;

	if(pwd != pwd2){
		alert('비밀번호가 일치하지 않습니다.');
		return false;		// 이동하지 않음.
	}else if(!pwdCheck.test(pwd)){
		alert("영문, 숫자, 특수문자 조합하여 8-16자리로 입력해주십시오.");
		return false;
	}else{
		// 핸드폰 번호
		var phone = $("#phone1").val() + "-" + $("#phone2").val() + "-" + $("#phone3").val();
		$("#_m_phoneNum").val(phone);
		return true;
	}
	
}

</script>

<table class="top_table">
	<tr>
		<td>
			<img src="./image/admin/member.png" width='30px' height='30px'>
		</td>
		
		<td style="padding-left: 10px;">
			<b style="font-size: 30px;">회원정보수정</b>
		</td>
	</tr>
</table>

<div style="height: 800px;">
	<form action="memUpdateAf.do" method="post" id="_memUpdate" onsubmit="return lastCheck()">
		<div align="left" class="div_table">
			<table class="memUpdate_table" style="border-collapse:collapse;">
			<col width="150"><col width="300">
				<tr class="memUpdate_table_row">
					<td class="table_list">No.</td>
					<td><input type="text" name="m_no" value="<%=dto.getM_no() %>" readonly></td>
				</tr>
				<tr class="memUpdate_table_row">
					<td class="table_list">아이디</td>
					<td><input type="text" name="m_id" value="<%=dto.getM_id() %>" readonly></td>
				</tr>
				<tr class="memUpdate_table_row">
					<td class="table_list">이름</td>
					<td><input type="text" name="m_name" value="<%=dto.getM_name() %>" readonly></td>
				</tr>
				<tr class="memUpdate_table_row">
					<td class="table_list">비밀번호</td>																								<!-- Not Null, 최대값, 포커스 -->
					<td><input type="password" id="_m_password" name="m_password" value="<%=dto.getM_password() %>" required maxlength="16" autofocus style="cursor: pointer;"></td>
				</tr>
				<tr class="memUpdate_table_row">
					<td class="table_list">비밀번호확인</td>
					<td><input type="password" id="_m_passwordCheck" value="<%=dto.getM_password() %>" maxlength="16" style="cursor: pointer;"></td>
				</tr>
				<tr class="memUpdate_table_row">
					<td class="table_list">성별</td>
					<td>
						<select id="_m_gender" name="m_gender" style="cursor: pointer;">
							<option value="1" <%if(dto.getM_gender() == 1){%> selected <%} %>><%=none %></option>
							<option value="2" <%if(dto.getM_gender() == 2){%> selected <%} %>><%=woman %></option>
							<option value="3" <%if(dto.getM_gender() == 3){%> selected <%} %>><%=man %></option>
						</select>
					</td>
				</tr>
				<tr class="memUpdate_table_row">		
					<td class="table_list">생년월일</td>
					<td><input type="text" name="m_birth" value="<%=dto.getM_birth() %>" readonly></td>
				</tr>
				<tr class="memUpdate_table_row">	
					<td class="table_list">이메일</td>
					<td><input type="text" name="m_email" value="<%=dto.getM_email() %>" readonly></td>
				</tr>
				<tr class="memUpdate_table_row">	
					<td class="table_list">주소</td>
					<td>
						<input type="text" id="_m_address_postcode" name="m_address_postcode" value="<%=dto.getM_address_postcode() %>" style="width: 150px;" readonly>
						<input type="button" id="_address" name="address" value="주소검색" onclick="daumPostcode()" style="width: 100px;" class="postcode btn btn-dark"><br>
						<input type="text" id="_m_address_primary" name="m_address_primary" value="<%=dto.getM_address_primary() %>" readonly><br>
						<input type="text" id="_m_address_detail" name="m_address_detail" value="<%=dto.getM_address_detail() %>"  readonly placeholder="(상세주소)">
					</td>
				</tr>
				<tr class="memUpdate_table_row">
					<td class="table_list">연락처</td>
					<td>
						<input type="hidden" id="_m_phoneNum" name="m_phoneNum" value="<%=dto.getM_phoneNum() %>">
						<select id="phone1" style="cursor: pointer; height: 30px;">
								<option value="010">010</option>
								<option value="011">011</option>
								<option value="016">016</option>
								<option value="017">017</option>
								<option value="018">018</option>
								<option value="019">019</option>
						</select>
						-<input type="text" id="phone2" value="<%=dto.getM_phoneNum().substring(4, 8) %>" maxlength="4" height="1" style="cursor: pointer; width: 50px;">
						-<input type="text" id="phone3" value="<%=dto.getM_phoneNum().substring(9, 13) %>" maxlength="4" style="cursor: pointer; width: 50px;">
					</td>
				</tr>
				<tr class="memUpdate_table_row">	
					<td class="table_list">가입일</td>
					<td><input type="text" name="m_joindate" value="<%=dto.getM_joindate().substring(0, 10) %>" readonly></td>
				</tr>
				<tr class="memUpdate_table_row">
					<td class="table_list">등급</td>
					<td>
						<select id="_m_level" name="m_level" style="cursor: pointer;">
							<option value="2" <%if(dto.getM_level() == 2){%> selected <%} %>><%=general %></option>
							<option value="3" <%if(dto.getM_level() == 3){%> selected <%} %>><%=silver %></option>
							<option value="4" <%if(dto.getM_level() == 4){%> selected <%} %>><%=gold %></option>
							<option value="5" <%if(dto.getM_level() == 5){%> selected <%} %>><%=dia %></option>
						</select>
					</td>
				</tr>
				<tr class="memUpdate_table_row">
					<td class="table_list">포인트</td>
					<td><input type="text" name="m_point" value="<%=dto.getM_point() %>" style="cursor: pointer;"></td>
				</tr>
				<tr class="memUpdate_table_row">
					<td class="table_list">총구매액</td>
					<td><input type="text" name="m_total" value="<%=dto.getM_total() %>" readonly></td>
				</tr>
			</table>
			<br>
			<div align="center">
				<input type="submit" class="btn btn-secondary" value="저장" style="width: 100px;">
																<!-- 이전페이지로 이동(window 생략 가능) -->
				<input type="button" class="btn btn-dark" value="취소" onclick="window.history.back()" style="width: 100px;">
			</div>
		</div>	
	</form>
</div>

<script>
$('#testSpan').hover(function() {
	$("#testSpan").text("Hover 적용");
        }, function(){
            $("#testSpan").text("마우스를 올려주세요.");
        });


<!-- 주소 API -->
   function daumPostcode() {
       new daum.Postcode({
           oncomplete: function(data) {
           	 // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

               // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
               // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
               var roadAddr = data.roadAddress; // 도로명 주소 변수
               var extraRoadAddr = ''; // 참고 항목 변수

               // 법정동명이 있을 경우 추가한다. (법정리는 제외)
               // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
               if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                   extraRoadAddr += data.bname;
                   document.getElementById('_m_address_detail').value = '';
                   $("#_m_address_detail").attr('readonly', false);
               }
               // 건물명이 있고, 공동주택일 경우 추가한다.
               if(data.buildingName !== '' && data.apartment === 'Y'){
                  extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                  document.getElementById('_m_address_detail').value = '';
                  $("#_m_address_detail").attr('readonly', false);
               }

               // 우편번호와 주소 정보를 해당 필드에 넣는다.
               document.getElementById('_m_address_postcode').value = data.zonecode;
               document.getElementById("_m_address_primary").value = roadAddr;
           }
       }).open();
   }
</script>
