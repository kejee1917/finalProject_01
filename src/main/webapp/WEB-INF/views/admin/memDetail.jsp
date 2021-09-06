<%@page import="verni.co.kr.util.ProductUtil"%>
<%@page import="verni.co.kr.member.MemberDto"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
.div_table{
	width: 60%;
	height: 100%;
}

.top_table{
	margin-bottom: 10px;
}

.memDetail_table{
	width:100%;
	border-collapse:collapse;
}

.memDetail_table tr{
	text-align: left;
}

.memDetail_table td{
	padding: 5px 0px 5px 5px;			/* 상 우 하 좌 */
	border-bottom-style: outset;
	border-bottom-width: thin;
}

.memDetail_table td input{
	padding: 0px 0px 5px 5px;			/* 상 우 하 좌 */
	border: 0px none;					/* input Box 없애기 */
	outline: none;						/* 클릭 시 테두리 없애기 */
	width: 100%;
}

.table_list{
	width:20%;
	color: gray;
	font-size: 14px;
	padding: 0px;
	padding-left: 10px;
}

</style>
<%
	MemberDto dto = (MemberDto)request.getAttribute("dto");
	System.out.println("회원상세보기 : " + dto.toString());
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

<table class="top_table">
	<tr>
		<td>
			<img src="./image/admin/member.png" width='30px' height='30px'>
		</td>
		
		<td style="padding-left: 10px;">
			<b style="font-size: 30px;">회원상세보기</b>
		</td>
	</tr>
</table>

<div style="height: 800px;">
	<form action="memUpdate.do" method="post" id="_memUpdate">
		<div align="left" class="div_table">
			<table class="memDetail_table" style="border-collapse:collapse;">
			<col width="130"><col width="300">
				<tr>
					<td class="table_list">회원번호</td>
					<td><input type="text" name="m_no" value="<%=dto.getM_no() %>" readonly></td>
				</tr>
				<tr>
					<td class="table_list">아이디</td>
					<td><input type="text" name="m_id" value="<%=dto.getM_id() %>" readonly></td>
				</tr>
				<tr>
					<td class="table_list">이름</td>
					<td><input type="text" name="m_name" value="<%=dto.getM_name() %>" readonly></td>
				</tr>
				<tr>
					<td class="table_list">비밀번호</td>
					<td><input type="text" name="m_password" value="<%=dto.getM_password() %>" readonly></td>
				</tr>
				<tr>
					<td class="table_list">성별</td>
					<% if(dto.getM_gender() == 1) {
						%>
						<td><input type="text" name="m_gender" value="<%=none%>" readonly></td>
						<%
					}else if(dto.getM_gender() == 2){
						%>
						<td><input type="text" name="m_gender" value="<%=woman%>" readonly></td>
						<%
					}else if(dto.getM_gender() == 3){
						%>
						<td><input type="text" name="m_gender" value="<%=man%>" readonly></td>
						<%
					}
					%>
				</tr>
				<tr>
					<td class="table_list">생년월일</td>
					<td><input type="text" name="m_birth" value="<%=dto.getM_birth() %>" readonly></td>
				</tr>
				<tr>	
					<td class="table_list">이메일</td>
					<td><input type="text" name="m_email" value="<%=dto.getM_email() %>" readonly></td>
				</tr>
				<tr>	
					<td class="table_list">주소</td>
					<td>
						<input type="text" id="_postcode" name="m_address_postcode" value="<%=dto.getM_address_postcode() %>" readonly><br>
						<input type="text" name="m_address_primary" value="<%=dto.getM_address_primary() %>" readonly><br>
						<input type="text" name="m_address_detail" value="<%=dto.getM_address_detail() %>" readonly>
					</td>
				</tr>
				<tr>	
					<td class="table_list">연락처</td>
					<td><input type="text" name="m_phoneNum" value="<%=dto.getM_phoneNum() %>" readonly></td>
				</tr>
				<tr>	
					<td class="table_list">가입일</td>
					<td><input type="text" name="m_joindate" value="<%=dto.getM_joindate().substring(0, 10) %>" readonly></td>
				</tr>
				<tr>		
					<td class="table_list">등급</td>
					
						<%if(dto.getM_level()==2){%>
							<td><input type="text" name="m_level" value="<%=general %>" readonly></td>
						<%}else if(dto.getM_level()==3){%>
							<td><input type="text" name="m_level" value="<%=silver %>" readonly></td>
						<%}else if(dto.getM_level()==4){%>
							<td><input type="text" name="m_level" value="<%=gold %>" readonly></td>
						<%}else if(dto.getM_level()==5){%>
							<td><input type="text" name="m_level" value="<%=dia %>" readonly></td>
						<%}else if(dto.getM_level()==9){%>
							<td><input type="text" name="m_level" value="<%=w_mem %>" readonly></td>
							<tr>
								<td class="table_list">탈퇴사유</td>
								<%if(dto.getM_reason().equals("service")){ %>
									<td><input type="text" name="m_reason" value="쇼핑몰 서비스에 불만이 있어요" readonly></td>
								<%}else if(dto.getM_reason().equals("uncomfortable")){ %>
									<td><input type="text" name="m_reason" value="이용이 불편하고 장애가 많아요" readonly></td>
								<%}else if(dto.getM_reason().equals("notprefer")){ %>
									<td><input type="text" name="m_reason" value="다른 사이트가 더 좋아요" readonly></td>
								<%}else if(dto.getM_reason().equals("rarely")){ %>
									<td><input type="text" name="m_reason" value="자주 사용하지 않아요" readonly></td>
								<%}else if(dto.getM_reason().equals("etc")){ %>
									<td><input type="text" name="m_reason" value="기타" readonly></td>
								<%}else if(dto.getM_reason().equals("admin")){ %>
									<td><input type="text" name="m_reason" value="관리자에 의해 탈퇴된 회원" readonly></td>
								<%}%>
							</tr>
						<%}%>
				</tr>
				<tr>
					<td class="table_list">포인트</td>
					<td><input type="text" name="m_point" value="<%=dto.getM_point() %>" readonly></td>
				</tr>
				<tr>		
					<td class="table_list">총구매액</td>
					<td><input type="text" name="m_total" value="<%=util.change(dto.getM_total()) %>" readonly></td>
				</tr>
			</table>
			<br>
			
			<div align="center">
				<%if(dto.getM_level()==9){%>
					<input type="button" class="btn btn-dark" value="목록" onclick="location.href='member.do'" style="width: 100px;">
				<%}else{%>
					<input type="submit" class="btn btn-secondary" value="수정" style="width: 100px;">
					<input type="button" class="btn btn-dark" value="목록" onclick="location.href='member.do'" style="width: 100px;">
				<%}%>
			</div>
		</div>	
	</form>
</div>
