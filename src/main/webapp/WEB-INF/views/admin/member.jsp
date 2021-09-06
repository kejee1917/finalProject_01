<%@page import="verni.co.kr.util.ProductUtil"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="verni.co.kr.member.MemberDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
.top_table{
	margin-bottom: 10px;
}

.mem_table{
	width: 100%;
	height:90%;
	border-collapse: collapse;
	margin-top: 10px;
}

.mem_table th{
	padding: 10px;
	border-top: outset;
	border-bottom: outset;
	background-color: #e9e9e9;
	text-align: center;
}

.mem_table td{
	padding: 10px;
	border-bottom: outset;
	border-bottom-width: thin;
	text-align: center;
}

#_send{
	display: inline;
}

#total_mb{
	font-size: 14px;
	float: right;
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
	width: 30%;							/* 모달 창 크기 */
	border-radius: 5px;					/* 모서리 둥글게 */
}

.closeModalBtn, .withdrawModalBtn{
	font-size: 15px
}

#detail, #w_btn{
	width: 100px;
}

.pagination{
	justify-content: center;		/* 가운데 정렬 */
}

.point{
	cursor: pointer;
}

.page-item.active .page-link {
  z-index: 1;
  color: white;
  background-color: black;
  border-color: black;
}

.page-item .page-link {
	color: black;
}
 
</style>

<%
	List<MemberDto> list = (List<MemberDto>)request.getAttribute("list");
	System.out.println("회원관리 : " + list.toString());
	ProductUtil util = new ProductUtil();
	
	// 등급
	String general = "일반 회원";
	String silver = "실버 회원";
	String gold = "골드 회원";
	String dia = "다이아 회원";
	String w_mem = "탈퇴 회원";
	
%>

<script type="text/javascript">
// 체크박스
$(function(){
	var oneCheck = document.getElementsByName("m_no");	
	var rowCnt = oneCheck.length;					// 총 회원 수
	
	
	// 전체선택
	$("input[name='allCheck']").click(function(){
		if($("input[name='allCheck']").prop("checked")){
			for (var i=0; i<rowCnt; i++){
				oneCheck[i].checked = this.checked;
			//	alert('전체선택');
				$("#detail").hide();
			}
	// 전체해제		
		}else{
			for (var i=0; i<rowCnt; i++){
				oneCheck[i].checked = this.checked;
			//	alert('전체해제');
				$("#detail").show();
			}
		}
	});
	
	// 하나씩 선택해서 전체가 될 때
	$("input[name='m_no']").click(function(){
		if($("input[name='m_no']:checked").length == rowCnt){	// 전체와 하나씩 선택한 길이의 값이 같으면
			$("input[name='allCheck']")[0].checked = true;
		//	alert('한개씩 전체');
			$("#detail").hide();
		}else if($("input[name='m_no']:checked").length < 2){	// 체크가 1개일 경우
			$("#detail").show();
		}else{													// 체크가 2개 이상일 경우
			$("input[name='allCheck']")[0].checked = false;
		//	alert('한개체크');
			$("#detail").hide();
		}
	});
	
});


</script>

<table class="top_table">
	<tr>
		<td>
			<img src="./image/admin/member.png" width='30px' height='30px'>
		</td>
		
		<td style="padding-left: 10px;">
			<b style="font-size: 30px;">회원 관리</b>
		</td>
	</tr>
</table>

<div align="left">
	<form action="member.do" method="get">
		<select id="_choice" name="choice" style="height: 30px">
			<option value="이름">이름</option>
			<option value="아이디">아이디</option>
			<option value="등급">등급</option>
		</select>
		
		<input type="text" id="_search" name="search" size="30px"><!--  onkeydown="keyEnter()" -->
		<input type="button" value="검색" onclick="send()" id="_send">
								
		<a id="total_mb">총 회원 수 : ${page}</a>
	</form>
</div>

<div style="height: 700px;">
	<form action="memDetail.do" method="post" id="_memDetail">
		<table class="mem_table">
		<tr>
			<th><input type="checkbox" id="_allCheck" name="allCheck"></th>
			<th>No.</th>
			<th>이름</th>
			<th>아이디</th>
			<th>이메일</th>
			<th>가입일</th>
			<th>등급</th>
			<th>생년월일</th>
			<th>총구매액</th>
		</tr>
		<%if(list.size() == 0){%>
			<tr class="mem_list_row">
				<td colspan="9">조회된 회원이 없습니다.</td>
			</tr>
		<%}else{
			for(int i=0; i<list.size(); i++){
				MemberDto dto = list.get(i);%>
						<!-- 탈퇴회원은 폰트색 바꿔주기 -->
				<tr <% if(dto.getM_level() == 9){ %> style="color: #D3D3D3"<% }%>>
					<td>
						<input type="checkbox" id="_m_no" name="m_no" value="<%=dto.getM_no() %>">
					</td>
					<td class="point" onclick="memDetail(<%=dto.getM_no()%>)">
						<input type="hidden" class="no" value="<%=dto.getM_no() %>"><%=i+1 %>
					</td>
					<td class="point" onclick="memDetail(<%=dto.getM_no()%>)">
						<%=dto.getM_name() %>
					</td>
					<td class="point" onclick="memDetail(<%=dto.getM_no()%>)">
						<%=dto.getM_id() %>
					</td>
					<td class="point" onclick="memDetail(<%=dto.getM_no()%>)">
						<%=dto.getM_email() %>
					</td>
					<td class="point" onclick="memDetail(<%=dto.getM_no()%>)">
						<%=dto.getM_joindate().substring(0, 10) %>
					</td>
					
					<%if(dto.getM_level()==2){%>
						<td id="level" class="point" onclick="memDetail(<%=dto.getM_no()%>)">
							<%=general %>
						</td>
					<%}else if(dto.getM_level()==3){%>
						<td id="level" class="point" onclick="memDetail(<%=dto.getM_no()%>)">
							<%=silver %>
						</td>
					<%}else if(dto.getM_level()==4){%>
						<td id="level" class="point" onclick="memDetail(<%=dto.getM_no()%>)">
							<%=gold %>
						</td>
					<%}else if(dto.getM_level()==5){%>
						<td id="level" class="point" onclick="memDetail(<%=dto.getM_no()%>)">
							<%=dia %>
						</td>
					<%}else if(dto.getM_level()==9){%>
						<td id="level" class="point" onclick="memDetail(<%=dto.getM_no()%>)">
							<%=w_mem %>
						</td>
					<%}%>
					
					<td class="point" onclick="memDetail(<%=dto.getM_no()%>)">
						<%=dto.getM_birth() %>
					</td>
					<td id="_price" class="point" onclick="memDetail(<%=dto.getM_no()%>)">
						<%=util.change(dto.getM_total()) %>원
					</td>
				</tr>
				<%}
			}%>
		</table>
	</form>
	<br>
		
	<!-- 회원보기, 탈퇴 버튼 -->
	<div align="left">
		<input type="button" class="btn btn-secondary" value="회원보기" id="detail" onclick="detail()">
		<input type="button" class="btn btn-dark" value="탈퇴" id="w_btn" onclick="withdraw()">
	</div>
</div>

<!-- pagination -->
<div>
    <nav aria-label="Demo of active current page number">
         <ul class="page-item" id="pagination"></ul>
   </nav>
</div>

<!-- 탈퇴 모달창 -->
<div id="withdraw" class="searchModal">
	<div class="search_modal_content">
		<div class="page_header" align="center">
			<h1>회원 탈퇴</h1>
		</div>
		<hr>
		<div align="center">
			<a style="color: gray" id="mem"></a>
		</div>
		<hr>
		
		<!-- 닫기버튼 -->
		<div align="center">
			<div id="closeModal" style="display: inline-block;">
				<span class="btn btn-dark" style="font-size: 15px">
					닫기
				</span>
			</div>
			
			<!-- 탈퇴버튼 -->
			<div id="withdrawModal" style="display: inline-block;">
				<span class="btn btn-secondary" style="font-size: 15px">
					탈퇴
				</span> 
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
// 전역변수
var choice = "${choice}";
var search = "${search}";

$(document).ready(function () {
	// 페이징 넘겼을 때 검색값 고정
	if(search != ""){
		$("#_choice").val(choice);
		
		document.getElementById("_search").value = search;
	}
});

// 디테일
function memDetail(no) {
	location.href="memDetail.do?m_no=" + no;
}

//검색버튼
function send() {
	var src = $("input:text[name='search']").val();
	var sel = $("select").val();
	
//	alert(dia.indexOf(src));
	
	location.href="member.do?choice=" + sel + "&search=" + src;
	
} 

// 회원보기버튼
function detail() {
//	alert('상세보기');
	var m_no = new Array();
	var list = $("input[name='m_no']");
	for(var i = 0; i<list.length; i++){
		// 선택되어 있으면 배열에 값을 저장
		if(list[i].checked){
			m_no.push(list[i].value);
		//	alert(valueArr);
		}
	}if(m_no.length==0){
	//	alert(valueArr);
		alert('선택된 회원이 없습니다.');
	}else{
		// 문자 -> 숫자로 변환해줘야함(10진법으로 리턴)
		var m_no = parseInt(m_no, 10);
		$("#_memDetail").submit();
	}
};

// 탈퇴버튼
function withdraw() {
	var m_no = 0;
	var no = "";
	var count = $("input[name='m_no']:checked").length;
	var list = $("input[name='m_no']");
	for(var i = 0; i<list.length; i++){
		// 선택되어 있으면 배열에 값을 저장
		if(list[i].checked){
			m_no = $(".no").eq(i).val();
			no += m_no + ",";
		}
	}
	
	if(count==0){
		alert('선택된 회원이 없습니다.');
	}else{
		no = no.substring(0, no.lastIndexOf(","));
		// @ResponseBody 꼭 추가...!
		$.ajax({
			url:"getMember.do",
			type:"post",
			data:{ no : no },
			success:function(data){
				// 이미 탈퇴한 회원일 경우
				if(data.m_level == 9){
					alert('이미 탈퇴된 회원입니다.');
					return;
				}
				
				var m_id = JSON.stringify(data.m_id);
				if(count > 1){
					$("#mem").html(m_id + "외 " + (count-1) + "명의 회원을 탈퇴시키겠습니까?");		// pTag는 html
					$("#withdraw").show();
				}else if(count == 1){
					$("#mem").html(m_id + " 회원을 탈퇴시키겠습니까?");	
					$("#withdraw").show();
				}
				
				$("#withdrawModal").click(function () {
					$.ajax({
						url:"memDelete.do",
						type:"POST",
						data:{ no : no},
						success:function(data){
							if(data == 'YES'){
								alert('성공적으로 탈퇴되었습니다.');
								location.href="member.do";
							}else if(data == 'NO'){
								alert('다시 시도해주시기 바랍니다.');
							}
						},error:function(){
							alert('error');
						}
					});
				});
				
				$("#closeModal").click(function () {
					$(".searchModal").hide();
				});
			},error:function(){
				alert('error');
			}
		});
			
	}
	
}

let totalCount = ${page}		// DB에서 받아온 글의 총 수
let pageSize = 10;			// 페이지의 크기 1 ~ 10
let pageNumber = ${pageNumber};

let _totalPages = totalCount / pageSize;
if(totalCount%pageSize > 0){
	_totalPages++;
}

//$("#pagination").twbsPagination('destroy');	// 페이지 갱신 : 페이징을 갱신해 줘야 번호가 재설정된다.

$("#pagination").twbsPagination({
	startPage : pageNumber,
	totalPages : _totalPages,
	visiblePages : 10,
	first : '<span sria-hidden="true">«</span>',
	prev : "이전",
	next : "다음",
	last : '<span sria-hidden="true">»</span>',
	initiateStartPageClick:false,				// onPageClick 자동 실행되지 않도록 한다
	onPageClick:function(event, page){
	//	alert(page);
		location.href="member.do?choice=" + $("#_choice").val() + "&search=" + $("#_search").val() + "&pageNumber=" + (page-1);
	}
});

/* function keyEnter() {
	alert('엔터');
	if(window.event.keyCode == 13){
		alert('1');
		send();
	}
} */


</script>
