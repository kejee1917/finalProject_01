<%@page import="verni.co.kr.util.ProductUtil"%>
<%@page import="verni.co.kr.product.ProductDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%String p_status = request.getParameter("p_status");%>    
<style>
.top_table{
	margin-bottom: 10px;
}

.pd_table{
	border-collapse:collapse;
	width: 100%;
	margin-top: 10px;
}

.pd_table th{
	border-top: outset;
	border-bottom: outset;
	background-color: #e9e9e9;
	padding: 10px;
	text-align: center;
}

.pd_table td{
	border-bottom: outset;
	border-bottom-width: thin;
	padding: 10px;
	text-align: center;
}

#_send{
	display: inline;
}


#afterCate{
	border: 0px none;
	outline: none;
	font-size: 14px;
	float: right;
	cursor: pointer;
	text-align: left;
}

#beforeCate{
	border: 0px none;
	outline: none;
	font-size: 14px;
	float: right;
	/* color: #397BFF; */
	cursor: pointer;
	text-align: right;
	/* font-weight: bold; */
}

#specialCha1{
	font-size: 14px;
	float: right;
}

#deleteCate{
	border: 0px none;
	outline: none;
	font-size: 14px;
	float: right;
	cursor: pointer;
	text-align: center;
}

#specialCha2{
	font-size: 14px;
	float: right;
}
	
#allCate{
	border: 0px none;
	outline: none;
	font-size: 14px;
	float: right;
	cursor: pointer;
	text-align: right;
}

#specialCha3{
	font-size: 14px;
	float: right;
}

#total_pd{
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

#deleteModal{
	font-size: 15px;
	display: inline-block;
	cursor:pointer;
	width: 100px;
	border: 1px solid #888;
	text-align: center;
	padding-bottom: 10px;
	padding-top: 10px;
	background-color: #4682b4;
	color: white;
}

#closeModal{
	font-size: 15px;
	display: inline-block;
	cursor:pointer;
	width: 100px;
	border: 1px solid #888;
	text-align: center;
	padding-bottom: 10px;
	padding-top: 10px;
}

.closeModalBtn, .deleteModalBtn{
	font-size: 15px
}

#_img{
	width: 80px;
	height: 80px;
}

.pagination{
	justify-content: center;		/* 가운데 정렬 */
}

.pd_ud_btn{
	display: inline;
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

<script type="text/javascript">
// 체크박스
$(function(){
	var oneCheck = document.getElementsByName("p_no");	
	var rowCnt = oneCheck.length;					// 총 회원 수
	
	
	// 전체선택
	$("input[name='allCheck']").click(function(){
		if($("input[name='allCheck']").prop("checked")){
			for (var i=0; i<rowCnt; i++){
				oneCheck[i].checked = this.checked;
			}
	// 전체해제		
		}else{
			for (var i=0; i<rowCnt; i++){
				oneCheck[i].checked = this.checked;
			}
		}
	});
	
	// 하나씩 선택해서 전체가 될 때
	$("input[name='p_no']").click(function(){
		if($("input[name='p_no']:checked").length == rowCnt){	// 전체와 하나씩 선택한 길이의 값이 같으면
			$("input[name='allCheck']")[0].checked = true;
		}else{													// 체크가 2개 이상일 경우
			$("input[name='allCheck']")[0].checked = false;
		}
	});
});

</script>


<%
	List<ProductDto> list = (List<ProductDto>)request.getAttribute("list");
	ProductUtil util = new ProductUtil();
%>
<table class="top_table">
	<tr>
		<td>
			<img src="./image/admin/product.png"  width='30px' height='30px'>
		</td>
		
		<td style="padding-left: 10px;">
			<b style="font-size: 30px;">상품 관리</b>
		</td>
	</tr>
</table>

<div align="left">
	<form action="product.do" method="get">
		<select id="_choice" name="choice" style="height: 30px">
			<option value="성별">성별</option>
			<option value="상품명">상품명</option>
			<option value="브랜드">브랜드</option>
			<option value="상황">상황</option>
			<option value="종류">종류</option>
			<option value="대여현황">대여현황</option>
		</select>
		
		<input type="text" id="_search" name="search" size="30px"><!--  onkeydown="enter()" -->
		<input type="button" value="검색" onclick="send()" id="_send">
		
		<span>
			<input type="text" id="afterCate" name="productStatus" value="대여중" size="2" onclick="status_after(this)" readonly>
			<a id="specialCha1">｜</a>
			<input type="text" id="beforeCate" name="productStatus" value="대여가능" size="4" onclick="status_before(this)" readonly>
			<a id="specialCha2">｜</a>
			<input type="text" id="deleteCate" name="productStatus" value="삭제" size="1" onclick="status_delete(this)" readonly>
			<a id="specialCha3">｜</a>
			<input type="text" id="allCate" name="productStatus" value="전체" size="2" onclick="location.href='product.do?'" readonly>
		</span>
		
		<a id="total_pd">총 상품 수 : ${page}</a>
	</form>
</div>

<div style="height: 700px;">
	<form action="pdDetail.do" method="post" id="_pdDetail">
		<table class="pd_table">
		<tr>
			<th><input type="checkbox" id="_allCheck" name="allCheck"></th>
			<th>No.</th>
			<th>성별</th>
			<th>이미지</th>
			<th>상품명</th>
			<th>브랜드</th>
			<th>상황</th>
			<th>종류</th>
			<th>가격</th>
			<th>대여현황</th>
		</tr>
		
		<tr>
		<%if(list.size() == 0){
		%>
		<tr class="pd_list_row">
			<td colspan="10">조회된 상품이 없습니다.</td>
		</tr>
		<%}else{
			for(int i=0; i<list.size(); i++){
				ProductDto dto = list.get(i);%>
		<tr <%if(dto.getP_del() == 1){%>style="color: #D3D3D3"<% }%>>
			<td><input type="checkbox" id="_p_no" name="p_no" value="<%=dto.getP_no() %>"></td>
			<td>
				<input type="hidden" class="no" value="<%=dto.getP_no() %>"><%=i+1 %>
			</td>
			<td style="cursor: pointer;" onclick="location.href='pdDetail.do?p_no=<%=dto.getP_no()%>'">
				<%=dto.getP_gender() %>
			</td>
			<td style="cursor: pointer;" onclick="location.href='pdDetail.do?p_no=<%=dto.getP_no()%>'">
				<img id="_img" src="./upload/thumbnailImage/<%=dto.getP_newimage1()%>" >
			</td>
		    <td style="cursor: pointer;" onclick="location.href='pdDetail.do?p_no=<%=dto.getP_no()%>'">
		    	<%=dto.getP_name()%>
		    </td>
			<td><%=dto.getP_brand() %></td>
			<td><%=dto.getP_case() %></td>
			<td><%=dto.getP_type1() %></td>
			<td><%=util.change(dto.getP_price()) %></td>
			<td><%=dto.getP_status() %></td>
		</tr>
		<%	}
		}	%>
		
		</table>
	</form>
	<br>
	
	<!-- 삭제,등록 버튼 -->
	<div align="left" class="pd_ud_btn">
		<button type="button" class="btn btn-dark" id="_del" onclick="del()">선택삭제</button>
		<input type="button" class="btn btn-secondary" style="float:right;" value="상품등록" id="_pd_add" onclick="location.href='productWrite.do'">
	</div>
	
</div>

<!-- pagination -->
<div>
    <nav aria-label="Demo of active current page number">
         <ul class="page-item" id="pagination"></ul>
   </nav>
</div>

<!-- 삭제 모달창 -->
<div id="_delete" class="searchModal">
	<div class="search_modal_content">
		<div class="page_header" align="center">
			<h1>상품 삭제</h1>
		</div>
		<hr>
		<div align="center">
			<a style="color: gray" id="_pdName"></a>
		</div>
		<hr>
		
		<!-- 닫기버튼 -->
		<div align="center">
			<div id="closeModal">
				<span class="closeModalBtn">
					닫기
				</span>
			</div>
			
			<!-- 삭제버튼 -->
			<div id="deleteModal">
				<span class="deleteModalBtn">
					삭제
				</span> 
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
//전역변수
var p_status;
var choice = "${choice}";
var search = "${search}";

$(document).ready(function () {
	var status = '<%=p_status%>';
	
	if(status == '대여가능'){
	//	$("#beforeCate").css('color', '#007bff');
		$("#beforeCate").css('font-weight', 'bold');
	}else if(status == '대여중'){
	//	$("#afterCate").css('color', 'red');
		$("#afterCate").css('font-weight', 'bold');
	}else if(status == '삭제'){
	//	$("#deleteCate").css('color', '#D3D3D3');
		$("#deleteCate").css('font-weight', 'bold');
	}else{
	//	$("#allCate").css('color', 'red');
		$("#allCate").css('font-weight', 'bold');
	}
	
	// 페이징 넘겼을 때 검색값 고정
	if(search != ""){
		$("#_choice").val(choice);
		
		document.getElementById("_search").value = search;
	}
});

//검색버튼
function send() {
	var src = $("input:text[name='search']").val();	// 여성,남성 ...
	var sel = $("select").val();		// 상품명, 브랜드 ...
	
//	alert(dia.indexOf(src));
	
	location.href="product.do?choice=" + sel + "&search=" + src;
}

function status_before(ths) {
//	alert('대여가능');
	p_status = $("#beforeCate").val();
//	alert(p_status);
	location.href="product.do?p_status=" + p_status + "&choice=" + sel + "&search=" + src;
};

function status_after() {
//	alert('대여중');
	
	p_status = $("#afterCate").val();
//	alert(p_status);
	location.href="product.do?p_status=" + p_status + "&choice=" + sel + "&search=" + src;
};

function status_delete(ths) {
//	alert('대기');
	p_status = $("#deleteCate").val();
//	alert(q_status);
	location.href="product.do?p_status=" + p_status + "&choice=" + sel + "&search=" + src;
};


// 삭제버튼
function del() {
	var p_no = 0;
	var no = "";
	var count = $("input[name='p_no']:checked").length;
	var list = $("input[name='p_no']");	// 전체 list 수

	for(var i = 0; i<list.length; i++){
		// 선택되어 있으면 배열에 값을 저장
		if(list[i].checked){
			p_no = $(".no").eq(i).val();
			no += p_no + ",";
		}
	}
	
	if(count==0){
		alert('선택된 상품이 없습니다.');
	}else{
		no = no.substring(0, no.lastIndexOf(","));
	
		// @ResponseBody 꼭 추가...!
		$.ajax({
			url:"getProduct.do",
			type:"post",
			data:{ no : no },
			success:function(data){
				// 대여중인 상품일 경우
				if(data.p_status == "대여중"){
					alert('대여중인 상품으로 삭제불가합니다.');
					return;
				}
				
				// 이미 삭제한 글일 경우
				if(data.p_del == 1){
					alert('이미 삭제된 상품입니다.');
					return;
				}
				
				var p_name = JSON.stringify(data.p_name);

				if(count > 1){
					$("#_pdName").html(p_name + "외 " + (count-1) + "건의 상품을 삭제하시겠습니까?");		// pTag는 html
					$("#_delete").show();
				}else if(count == 1){
					$("#_pdName").html(p_name + " 상품을 삭제하시겠습니까?");	
					$("#_delete").show();
				}
				
				$("#deleteModal").click(function () {
					$.ajax({
						url:"pdDelete.do",
						type:"POST",
						data:{ no : no},
						success:function(data){
							if(data == 'YES'){
								alert('성공적으로 삭제되었습니다.');
								location.href="product.do";
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
let pageSize = 5;				// 페이지의 크기 1 ~ 10
let pageNumber = ${pageNumber};

let _totalPages = totalCount / pageSize;
if(totalCount%pageSize > 0){
	_totalPages++;
}

var src = $("input:text[name='search']").val();
var sel = $("select").val();

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
		location.href="product.do?choice=" + $("#_choice").val() + "&search=" + $("#_search").val() + "&pageNumber=" + (page-1);
	}
});

</script>

