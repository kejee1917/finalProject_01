<%@page import="verni.co.kr.util.ProductUtil"%>
<%@page import="verni.co.kr.wish.WishDto"%>
<%@page import="verni.co.kr.member.MemberDto"%>
<%@page import="verni.co.kr.product.ProductDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<%
String p_type1 = request.getParameter("p_type1");
String [] p_type2 = request.getParameterValues("p_type2");
String [] p_brand = request.getParameterValues("p_brand");
String [] p_case = request.getParameterValues("p_case");
String [] p_color = request.getParameterValues("p_color");
String [] p_gender = request.getParameterValues("p_gender");
String [] p_status = request.getParameterValues("p_status");
String [] p_size =request.getParameterValues("p_size");
String  p_price = request.getParameter("p_price");
String  sorting = request.getParameter("sorting");
%> 
<%
List<ProductDto> plist = (List)request.getAttribute("plist");
MemberDto mem = (MemberDto)session.getAttribute("login");
int count [] = (int[])request.getAttribute("count");

// 제품총수
int len = (int)request.getAttribute("totalCount");

//page 수
int ProductPage = len / 24;		// 24 / 10 -> 2
if ((len % 24 ) > 0){		// 몫으로 1page 늘리기
	ProductPage += 1;
}

//컨트롤러에서 pageNumber 넘거간거 받아주기
Object obj = request.getAttribute("pageNumber");
int pageNumber = 0;
//파마미터로 넘어온 값이 있으면 셋팅 // 없으면 0으로 셋팅
if(obj != null){
	pageNumber = (Integer)obj; 
}

%>


<style>
.img-wrap{
	position: relative;
	width: 250px; 
	height: 250px;
	/* margin: auto; */
}



.img-text{
	text-align: center;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate( -50%, -50% );
	
}

.img-text p{
	color: white;
	font-size: 20px;
}
</style>
<div style=" clear:both; padding-left:15%; padding-right:9%; display:flex; flex-wrap:wrap; justify-content:flex-start;  height: auto;"  >	
	<% if(plist == null || plist.size() == 0) {%>
	<div align="center" style="padding-top: 200px; width: 100%; text-align: center; color: gray; ">
		<i class="far fa-grin-beam-sweat" style="font-size: 40px;"></i><br><br><br>
		<h4>등록된 상품이 없습니다.</h4>
		<h4>발빠르게 새로운 상품으로 찾아뵙겠습니다.</h4>
	</div>
    <%} else { 
		for(int i=0; i<plist.size(); i++) { 
			ProductDto pd = plist.get(i); %>
		
	<div class="card" style="max-width: 25rem;  margin:40px;  border: hidden; float: left;">
		
		<%if(pd.getP_status().equals("대여중")){ %>
			<div class="img-wrap">
			<a href="productDetail.do?p_no=<%=pd.getP_no()%>">
				<img alt="..."   class="card-img-top" src="./upload/thumbnailImage/<%=pd.getP_newimage1()%>" style="height:250px;position: relative; object-fit: fill; -webkit-filter: grayscale(80%); ">
			</a>
			<div class="img-text"><p>대여중</p></div></div>
		<%}else if(pd.getP_status().equals("대여가능")){ %>
			<a href="productDetail.do?p_no=<%=pd.getP_no()%>">
			<%if(ProductUtil.news(pd.getP_regdate()) < 8){%>
				<div style="position: absolute;">
	        		<div style="position: relative; top: 1px; left: 1px;"><img src="image/productList/new1.png" width="50px;"></img></div>
	   			 </div>
	   		<%} %>	 
				<img alt="..."   class="card-img-top" src="./upload/thumbnailImage/<%=pd.getP_newimage1()%>" style="height:250px;">
			</a>
		<%} %>
				
		<div class="card-body">
			<table>
				<col width="200px;"><col width="200px;">
				<tr>
					<td style="text-align: left;">
					<%=pd.getP_status()%>
				
					</td>
					<td style="text-align: right;">
				<%if(mem == null){ %>	
						<button class="wish" onclick="login()" style="font-size: 15px; color: gray;"><i class="fas fa-heart"></i></button>
				<%}else{ 
				   		if(count[i] == 0){ %>
				   			<button class="wish" id="wish<%=pd.getP_no()%>"
								onclick="wish(<%=pd.getP_no()%>)" style="font-size: 15px; color: gray;"><i id="test" class="fas fa-heart" ></i>
								</button>	
						<% }else if(count[i] == 1){ %>	
							<button class="wish" id="wish<%=pd.getP_no()%>"
								onclick="wish(<%=pd.getP_no()%>)" style="font-size: 15px; color: red;"><i id="test" class="fas fa-heart"></i></button>
						<% } 
						}%>	
					</td>	
				</tr>
			</table>
			
			<h3 class="card-title" style="height: 20px; padding-top: 1px;">
			<%=ProductUtil.brandName(pd.getP_brand())%></h3>
			<h5 class="card-title" style="height: 17px; text-overflow:ellipsis; white-space: nowrap; overflow: hidden;">
			<a href="productDetail.do?p_no=<%=pd.getP_no()%>"><%=pd.getP_name()%></a></h5>
			<%if(pd.getP_discount() == 0){ %>
			<table>
				<col width="70px;"><col width="250px;">
				<tr>
					<th style="color: gray; size: 20px;">
						<h5>3일권</h5>
					</th>
					<th><h3><%=ProductUtil.change(pd.getP_price())%>원</h3></th>
				</tr>
				<tr>
					<th style="color: gray; size: 20px;">
						<h5>5일권</h5>
					</th>
					<th><h3><%=ProductUtil.change(pd.getP_price()*1.5)%>원</h3></th>
				</tr>
			</table>
			<%}else{ %>
			<h5 class="card-text" style="height: 17px; padding-top: 0px; color: gray;">3일권 <del><%=ProductUtil.change((pd.getP_price() * 100)/(100 -pd.getP_discount())) %>원</del></h5>
			<table>
				<col width="50px;"><col width="350px;">
				<tr>
					<th style="color: brown; size: 20px;">
						<h2><i><%=pd.getP_discount()%>%</i></h2>
					</th>
					<th><h3><%=ProductUtil.change(pd.getP_price())%>원</h3></th>
				</tr>
			</table>
			<%} %>
		</div>
	</div>	
<%		}
      }
%>
</div>

<br><br>
<div align="center">
<% 
for(int i=0; i< ProductPage; i++){
	if(pageNumber == i){
	%>
	<span style="font-size: 15px; color: black; font-weight: bold; text-decoration:underline;">
		<%=i+1 %>
	</span>&nbsp;	
 <%}else{ %>
	<a href="#none"	title="<%=i+1 %>페이지" onclick="goPage(<%=i %>)"
		style="font-size: 15px; color: gray; font-weight: bold; text-decoration:none;">
		<%=i+1 %>
		</a>&nbsp;
<% }	
} %>	
</div>





<div style="height: 500px;"></div>

<script type="text/javascript">

function wish(p_no) {
	$.ajax({
		url:"addWish.do",
		type:"post",
		data:{"p_no":p_no},
		success:function(data){
			if(data == 'add'){
				$("#wish"+p_no).css("color", "red");
			}else{
				$("#wish"+p_no).css("color", "gray");
			}
		},
		error:function(){
			alert('error');
		}
	});
}

function login() {
	if(confirm("로그인을 하시겠습니까?")){
		let url = window.document.location.href;
		location.href='login.do?url='+url;
	}
}
// 체크박스 초기화
function check_reset() {
	$(':checkbox:checked').prop('checked',false);
}



//page 링크 만들기 (검색시 2페이지 눌렀을 때 원본의 2페이지가 안나오도록 해야한다.)
function goPage(pageNumber) {
	
	url = window.document.location.href;
	var count = url.indexOf('pageNumber');
	let url2 = "";
	if(count != -1){
		url2 = url.slice(0,count-1);
	}else{
		url2 = url;
	}
//	alert(url2);
	// pageNum까지 넘기기
	location.href = url2+'&pageNumber=' + pageNumber;
}
</script>



