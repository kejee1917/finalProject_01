<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="./css/mainslider.css">
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="verni.co.kr.chat.BotDto"%>


<style>
.material-icons.md-48 { font-size: 48px;}
div.bx-wrapper{ 
	-moz-box-shadow: none;
	webkit-box-shadow: none; 
	box-shadow: none; /* 그림자 없애기  */
	border: 0; /* 흰색 보더 없애기  */
	height: 450px;
}
img.banner{
	height: 300px;
}

.cs-header-box {
  margin-top: 50px;
  margin-bottom: 20px;
}
.cs-header-box .cs-header-text {
  font-size: 26px;
  color: #282828;
}











	<!-- CSS 여기서부터 전체추가 -->

/* loding CSS */
/* .loading-box {position:fixed; left:50%; top:50%; z-index:100; transform:translate(-50%, -50%); padding:20px; width:200px; text-align:center; background:#fff; box-shadow:0 3px 0 rgba(0,0,0,.2);}
 */.loading-box .circles {padding-top:10px;}
.loading-box .circles i {animation:scaleBounce .4s alternate infinite; display:inline-block; margin:0 4px; width:5px; height:5px; background:#BBBBBB; border-radius:50em;}
.loading-box .circles i:nth-child(2) {animation-delay:.1s;}
.loading-box .circles i:nth-child(3) {animation-delay:.2s;}
.loading-box p {margin-top:20px; font-size:18px;}
@keyframes scaleBounce{
	from {transform:scale(.7)}
	to {transform:scale(1.3)}
}
.fixedButton {
    position: fixed !important;
    bottom: 49px !important;
    /* display: block !important; */
    width: auto !important;
    overflow: initial !important;
    z-index: 10000000 !important;
    font-family: NotoSansKR, NotoSansJP, -apple-system, BlinkMacSystemFont, "Helvetica Neue", "맑은 고딕", "Yu Gothic", "Segoe UI", Roboto, system-ui, sans-serif !important;
    flex-wrap: nowrap !important;
    background: transparent !important;
    right: 13px !important;
}
.fixedButtonBackground {
    position: relative !important;
    overflow: initial !important;
    display: flex !important;
    -webkit-box-align: center !important;
    align-items: center !important;
    -webkit-box-pack: center !important;
    justify-content: center !important;
    box-shadow: rgb(0 0 0 / 15%) 0px 4px 6px 0px !important;
    transition: box-shadow 0.2s ease-out 0s !important;
    box-sizing: border-box !important;
    animation: 0.2s cubic-bezier(0.1, 0, 0.6, 1) 0.35s 1 normal backwards running fcEaNs !important;
    cursor: pointer !important;
    flex-wrap: nowrap !important;
    width: 62px !important;
    height: 62px !important;
    background: linear-gradient(rgb(34, 64, 55) 0%, rgb(34, 64, 55) 50%, rgb(138, 152, 154) 100%) !important;
    border-radius: 31px !important;
}

.outBtn {
    content: "";
    display: block;
    width: 18px;
    height: 18px;
    background-image: url(https://cdn.channel.io/plugin/images/close2-white.png);
    background-size: cover;
    opacity: 0.6;
}

.fixedButton2{

        position: fixed;
        bottom: 5px;
        right: 5px; 
        /* padding: 20px; */
        height: 60px;
       /* 	line-height: 80px;   */
       	width: 60px;  
		/* font-size: 1.2em;
       	font-weight: bold; */
       	border-radius: 50%;
       	background-color: #8A989A ;
      	/* color: white; */
      	text-align: center;
      	cursor: pointer;
        }
        
        
.buttonImage {
    content: "" !important;
    display: block !important;
    flex-basis: initial !important;
    width: 34px !important;
    height: 34px !important;
    background-image: url(https://cdn.channel.io/plugin/images/ch-new-launcher-icon-68.png) !important;
    background-size: 136px !important;
    background-position: 0px 0px !important;
}
        
/* .fixedButton img{
	width: 50%;
	height: 50%;
}    */     
        
#chat-container{
position: fixed;
bottom: 20px;
right: 20px; 
/* padding: 40px; */
border-radius: 20px;
/* background-color: blue; */
background-color: white;
/* background: linear-gradient(rgb(34, 64, 55) 0%, rgb(34, 64, 55) 50%, rgb(255, 255, 255) 100%) !important; */
width: 360px;
height: 520px;
box-shadow: 10px 10px 60px rgba(0,0,0,.2);
		
}        

#top-fix{
position: fixed;
right: 20px; 
/* padding: 40px; */
bottom: 470px;
height: 70px;
width: 360px;
color: white;
background-color: #224037;
border-top-left-radius: 20px;
border-top-right-radius: 20px;
box-shadow: 0 7px 7px -4px rgba(0,0,0,.15);
/* box-shadow: 0px 20px 40px grey; */

}

#click{
position: fixed;
/* right: 20px;  */
bottom: 30px;
/* height: 70px;
width: 360px; */
}

#click2{
position: fixed;
right: 20px;
bottom: 30px;

}

#bottom-fix{
/* background-color: green; */
background-color: white;
margin-top: 80px;
margin-left: 20px;
width: 335px;
height: 400px;
overflow-x:hidden; 
overflow-y:auto; 
position: absolute;
}

.chat{
		font-size: 15px;
		color:black;
		margin: 5px;
		min-height: 20px;
		padding: 5px;
		min-width: 30px;
		max-width: 280px;
		text-align: left;
        height:auto;
        word-break : break-all;
        background: #f6f6f6;
        width:auto;
        display:inline-block;
        border-radius: 10px 10px 10px 10px;
	}

.qestion-Btn{
		min-height: 20px;
		padding: 5px;
		max-width: 300px;
		text-align: right;
        height:auto;
        word-break : break-all;
        width:auto;
        display:inline-block;
}	
	
.chat-box{
		text-align:left;
	}	

.my-chat-box{
		text-align: right;		
}	
	
.my-chat{
		margin-right: 10px;
		position: relative;
		text-align: left;
		background: #224037;
		color: white;
		border-radius: 10px 10px 10px 10px;
		/* animation:up 0.3s; */
	}	
	
@keyframes up{

 0%{top:300px;}

 100%{top:0;}

}	
	
.btn{
  text-align: right;
  color: black;
  border: 1px solid lightgrey;
  background-color: white;
  border-radius: 15px;
  padding: 10px 15px;
  margin-right: 5px;
  cursor: pointer;
  font-size: 14px;
}	

.my-time{
/* animation:up2 0.3s;*/
text-align: right;
position: relative;
}

@keyframes up2{

 0%{top:300px;}

 100%{top:0;}

}		

        
#chat-fix{
vertical-align: center;
/* background-color: red; */
width: 335px;
height: 35px;
bottom: 0px;
position: absolute;
margin-top: 5px;
margin-left: 15px;
}       


</style>

<!-- box 슬라이더 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/bxslider/4.2.15/jquery.bxslider.min.css" rel="stylesheet" /> 
<script src="https://cdnjs.cloudflare.com/ajax/libs/bxslider/4.2.15/jquery.bxslider.min.js"></script>


<div class="contianer" style="width: auto; height:auto; padding-left: 11%;padding-right: 11%; ">
<br>
<img src="./image/main/main.jpg" width="100%"/>
<br><br><br><br>



<div class="cs-header-box">
	<table>
		<col width="700px"><col width="50%">
		<tr>
			<td style="text-align: left;"><h3 class="cs-header-text"><b>New Bag</b></h3></td>
			<td style="text-align: right;"><a href="productList.do?p_type1=가방&p_gender=여성&sorting=regdate"><h5>더보기▶</h5></a></td>
		</tr>
	</table>
</div>
<div align="center" style="clear: both; display: flex; justify-content: center; flex-flow: row nowrap;">
	<c:forEach items="${bagList}" var="list" varStatus="i">
		<div class="card" style="max-width: 25rem; float: left; margin:16px; border: hidden;">
			<a href="productDetail.do?p_no=${list.p_no}">
				<img alt="..."   class="card-img-top" src="./upload/thumbnailImage/${list.p_newimage1}" style="height:250px;">
			</a>	
			<div class="card-body">	
			<c:choose>
				<c:when test="${fn:contains(list.p_brand, '-')}">
				<h3 class="card-title" style="height: 20px; padding-top: 1px;">${fn:replace(list.p_brand, "-", " ")}</h3>
				</c:when>
				<c:when test="${fn:contains(list.p_brand, '_')}">
				<h3 class="card-title" style="height: 20px; padding-top: 1px;">${fn:replace(list.p_brand, "_", "&")}</h3>
				</c:when>
				<c:otherwise>
				<h3 class="card-title" style="height: 20px; padding-top: 1px;">${list.p_brand}</h3>
				</c:otherwise>
			</c:choose>	
				<h5 class="card-title" style="height: 17px; text-overflow:ellipsis; white-space: nowrap; overflow: hidden;">
				<a href="productDetail.do?p_no=${list.p_no}">${list.p_name}</a></h5>
			</div>
		</div>		
	</c:forEach>
</div>
<br><br>











<div class="cs-header-box">
	<table>
		<col width="700px"><col width="50%">
		<tr>
			<td style="text-align: left;"><h3 class="cs-header-text"><b>New Man Clothes</b></h3></td>
			<td style="text-align: right;"><a href="productList.do?p_type1=의류&p_gender=남성&sorting=regdate"><h5>더보기▶</h5></a></td>
		</tr>
	</table>
</div>
<div align="center" style="clear: both; display: flex; justify-content: center; flex-flow: row nowrap;">
	<c:forEach items="${manList}" var="list" varStatus="i">
		<div class="card" style="max-width: 25rem; float: left; margin:16px; border: hidden;">
			<a href="productDetail.do?p_no=${list.p_no}">
				<img alt="..."   class="card-img-top" src="./upload/thumbnailImage/${list.p_newimage1}" style="height:250px;">
			</a>	
			<div class="card-body">	
			<c:choose>
				<c:when test="${fn:contains(list.p_brand, '-')}">
				<h3 class="card-title" style="height: 20px; padding-top: 1px;">${fn:replace(list.p_brand, "-", " ")}</h3>
				</c:when>
				<c:when test="${fn:contains(list.p_brand, '_')}">
				<h3 class="card-title" style="height: 20px; padding-top: 1px;">${fn:replace(list.p_brand, "_", "&")}</h3>
				</c:when>
				<c:otherwise>
				<h3 class="card-title" style="height: 20px; padding-top: 1px;">${list.p_brand}</h3>
				</c:otherwise>
			</c:choose>	
				<h5 class="card-title" style="height: 17px; text-overflow:ellipsis; white-space: nowrap; overflow: hidden;">
				<a href="productDetail.do?p_no=${list.p_no}">${list.p_name}</a></h5>
			</div>
		</div>		
	</c:forEach>
</div>
<br><br>
<div class="cs-header-box">
	<table>
		<col width="700px"><col width="50%">
		<tr>
			<td style="text-align: left;"><h3 class="cs-header-text"><b>New Woman Clothes</b></h3></td>
			<td style="text-align: right;"><a href="productList.do?p_type1=의류&p_gender=여성&sorting=regdate"><h5>더보기▶</h5></a></td>
		</tr>
	</table>
</div>
<div align="center" style="clear: both; display: flex; justify-content: center; flex-flow: row nowrap;">
	<c:forEach items="${womanList}" var="list" varStatus="i">
		<div class="card" style="max-width: 25rem; float: left; margin:16px; border: hidden;">
			<a href="productDetail.do?p_no=${list.p_no}">
				<img alt="..."   class="card-img-top" src="./upload/thumbnailImage/${list.p_newimage1}" style="height:250px;">
			</a>	
			<div class="card-body">	
			<c:choose>
				<c:when test="${fn:contains(list.p_brand, '-')}">
				<h3 class="card-title" style="height: 20px; padding-top: 1px;">${fn:replace(list.p_brand, "-", " ")}</h3>
				</c:when>
				<c:when test="${fn:contains(list.p_brand, '_')}">
				<h3 class="card-title" style="height: 20px; padding-top: 1px;">${fn:replace(list.p_brand, "_", "&")}</h3>
				</c:when>
				<c:otherwise>
				<h3 class="card-title" style="height: 20px; padding-top: 1px;">${list.p_brand}</h3>
				</c:otherwise>
			</c:choose>	
				<h5 class="card-title" style="height: 17px; text-overflow:ellipsis; white-space: nowrap; overflow: hidden;">
				<a href="productDetail.do?p_no=${list.p_no}">${list.p_name}</a></h5>
			</div>
		</div>		
	</c:forEach>
</div>
<br><br>

<div class="cs-header-box" style="clear: both; margin-top: 35px;">
	<h3 class="cs-header-text"><b>At Times Like This</b></h3>
</div>
<div align="center" style="margin-top: 35px;">
	<table style="margin-top: 20px;">
		<col width="100px"><col width="100px"><col width="100px"><col width="100px"><col width="100px"><col width="100px"><col width="100px">
		<tr style="text-align: center;">
			<th>
				<a href="productList.do?p_type1=의류&p_case=데일리"><img  src="./image/main/daily.png" width="90px"></a>
			</th>
			<th>
				<a href="productList.do?p_type1=의류&p_case=오피스"><img  src="./image/main/office.png" width="90px"></a>
			</th>
			<th>
				<a href="productList.do?p_type1=의류&p_case=로맨틱"><img  src="./image/main/romantic.png" width="90px"></a>
			</th>
			<th>
				<a href="productList.do?p_type1=의류&p_case=휴가"><img  src="./image/main/vacation.png" width="90px"></a>
			</th>
			<th>
				<a href="productList.do?p_type1=의류&p_case=주말"><img  src="./image/main/week.png" width="90px"></a>
			</th>
			<th>
				<a href="productList.do?p_type1=의류&p_case=웨딩"><img  src="./image/main/marri.png" width="90px"></a>
			</th>
			<th>
				<a href="productList.do?p_type1=의류&p_case=파티"><img  src="./image/main/party.png" width="90px"></a>
			</th>
		</tr>
		<tr style="text-align: center;">
			<th><h5>데일리</h5></th>
			<th><h5>오피스</h5></th>
			<th><h5>로맨틱</h5></th>
			<th><h5>휴가</h5></th>
			<th><h5>주말</h5></th>
			<th><h5>웨딩</h5></th>
			<th><h5>파티</h5></th>
			
		</tr>	
</table>
</div>

<br><br><br>




	<div class="cs-header-box" style="clear: both; margin-top: 35px;">
		<h3 class="cs-header-text">
			<b>BEST REVIEW</b>
		</h3>
	</div>
	<div align="center"
		style="clear: both; display: flex; justify-content: center; flex-flow: row nowrap;">
		<c:forEach items="${rlist}" var="list" varStatus="i">

			<div class="container"
				style="padding-top: 10px; padding-bottom: 10px;">
				<div class="card"
					style="max-width: 35rem; background: rgba(0, 0, 0, .03);">

					<c:choose>
						<c:when test="${empty list.r_newfilename}">
							<img alt="..." class="card-img-top"
								src="./upload/thumbnailImage/${list.p_newimage1}" width="400px"
								height="300px">
						</c:when>
						<c:when test="${not empty list.r_newfilename}">
							<c:set var="filename" value="${fn:split(list.r_newfilename,',')}"></c:set>
							<img alt="..." class="card-img-top"
								src="./upload/reviewImage/${filename[0]}" width="400px"
								height="300px">
						</c:when>
					</c:choose>
					<hr>
					<div class="card-body">
						<div class="card-body" style="height: 100px; text-align: left;">
							<h4 class="card-title">${list.r_content}</h4>
						</div>
					</div>

					<div class="card mb3" style="max-width: 35rem;">
						<div class="card-header">

							<button type="button" class="wish"
								onclick="location.href='productDetail.do?p_no=${list.p_no}'">
								<div
									style="width: 100%; background: rgba(0, 0, 0, .03); height: 60px;">
									<div style="float: left; padding: 5px;">
										<img alt="..."
											src="./upload/thumbnailImage/${list.p_newimage1}"
											style="width: 50px; border-color: lightgrey; border-style: solid; border-width: 1px;">
									</div>
									<div
										style="float: left; padding-top: 10px; padding-left: 5px; padding-right: 5px; width: 230px;">
										<h5 align="left" style="color: gray;">
											<c:set var="p_brand" value="${list.p_brand}" />
											<c:choose>
												<c:when test="${fn:contains(p_brand, '_')}">
													<c:set var="p_brand"
														value="${fn:replace(p_brand, '_', '&')}" />
												</c:when>
												<c:when test="${fn:contains(p_brand, '-')}">
													<c:set var="p_brand"
														value="${fn:replace(p_brand, '-', ' ')}" />
												</c:when>
											</c:choose>
											${p_brand}
										</h5>
										<h5 align="left" style="color: gray;">
											<c:choose>
												<c:when test="${fn:length(list.p_name) > 30 }">
									${fn:substring(list.p_name,0,29)}
								</c:when>
												<c:otherwise>
									${list.p_name}
								</c:otherwise>
											</c:choose>
										</h5>
									</div>
								</div>
							</button>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
<br><br>
	<div align="center">
		<button style="font-size: 13px; padding: 10px 20px 10px 20px; background-color: white; border-color:rgba(0, 0, 0, .06);" onclick="location.href='reviewList.do?search=all'">
			전체보기  >
		</button>
	</div>



	<br><br><br>
<div class="cs-header-box" style="clear: both; margin-top: 35px;">
	<h3 class="cs-header-text"><b>EVENT</b></h3>
</div>
<ul class="bxslider"> 
	<li><a href="hermesList.do"><img src="./image/main/banner2.png" class="banner"/></a></li> 
	<li><a href="productSaleList.do"><img src="./image/main/banner1.png" class="banner"></a></li> 
</ul>





</div>


<!-- 이 부분 추가해주세요 -->
<div class="fixedButton" onclick="popup()">
	<div class="fixedButtonBackground">
		<div class="buttonImage"></div>
	</div>
</div>
<div id="chat-container">
	<div id="top-fix">
		<div style="display:inline-block; margin-top: 15px; margin-left: 30px; font-size: 18px; font-weight: bold;">SHARE VERNI</div><br>
		<div style="display:inline-block; margin-top: 0px; margin-left: 30px; font-size: 8px;">상담 운영 시간 : 평일 오전 10시 ~ 18시</div>
		<!-- <div style="display:inline; float:right; font-size: 10px; cursor:pointer;" onclick="chatEnd()">icon</div> -->
		<div style="display:inlin-block; margin-top: -15px; float:right; font-size: 18px; margin-right:20px; cursor:pointer;" onclick="endChat()"><div class="outBtn"></div></div>
	</div>
	<div id="bottom-fix">
		<div class="chat-bubble"></div>
	</div>
	
	<div id="chat-fix">
		<!-- 텍스트 박스에 채팅의 내용을 작성한다. -->
		<input id="textMessage" style="width:280px; height:30px; font-size:15px;" type="text" onkeydown="return enter()">
		<!-- 메시지를 전송하는 버튼 -->
		<input onclick="sendMessage()" style="width:50px; height:30px; font-size:15px; margin-left:-5px; margin-bottom:10px;" value="전송" type="button">
	</div>
</div>      
<!-- 여기까지 -->


<script type="text/javascript">
$(document).ready(function(){ 
	$('.bxslider').bxSlider({
		auto: true, // 자동 슬라이드 
		autoControls: false, // 시작, 정지버튼 노출 여부 
		controls: false, // prev/next 버튼 노출 여부 
		pager: false, // 블릿버튼
	}); 
	
});

<!--  여기서부터 전체 추가 -->



//상담내용 저장용 Map

let saveList = new Array();

//질문답변 저장용
let qList = [];
//챗봇 기본세팅
initSet();
$("#chat-fix").hide();
$("#chat-container").hide();
<%-- //let botList = '<%=list%>';  --%>
//alert(botList == null?true:flase);
<%-- alert(<%=list[0].b_category%>); --%>





//챗봇시작버튼을 누를 때.
function popup(){
	// 챗봇화면 보이는 상태일 때
	if($('#chat-container').is(':visible')){
		// 숨긴다.
		$("#chat-container").hide();
		$(".fixedButton").show();
		$(".fixedButtonBackground").show();
		$(".buttonImage").show();
	// 챗봇화면 안보일 때(안켰을 때)	
	} else {
		// 보여준다.
		$("#chat-container").show();
		$(".fixedButton").hide();
		$(".fixedButtonBackground").hide();
		$(".buttonImage").hide();
	}
	
 
}

function endChat(){
	
	if(confirm("상담을 종료하시겠습니까 ?") == true){
		
		let chat = "<div class='verni' style='margin-left:10px; font-size:15px;'>"
		    + "<b>SHARE VERNI</b><font style='color:gray; font-size:6px; margin-left:3px;'>" + getTime() + "</font></div>"
		    + "<div class='chat-box'><div class='chat'>상담이 종료되었습니다.<br>"
			+ "셰어베르니를 이용해주셔서 감사합니다."
			+ "</div></div>";
			
		$(".chat-bubble").append(chat);
		$('#bottom-fix').scrollTop($('#bottom-fix')[0].scrollHeight+20);
		
		popup();
		$(".chat-bubble").empty();
		initSet();
		chatEnd();
		
 }
 else{
     return ;
 }
}


function initSet(){
	
	
	 let chat = "<div class='verni' style='margin-left:10px; font-size:15px;'>"
	    + "<b>SHARE VERNI</b><font style='color:gray; font-size:6px; margin-left:3px;'>" + getTime() + "</font></div>"
	    + "<div class='chat-box'><div class='chat'>안녕하세요 고객님!<br>"
		+ "공유옷장 셰어베르니 입니다.<br>"
		+ "궁금하신 사항은 서포트봇을 통해,<br>"
		+ "확인하실 수 있습니다! <br>"
		+ "문의하실 내용을 선택하여 주세요!<br>"
		+ "[ 고객센터 운영시간 안내 ⏰ ]<br>"
		+ "평일 오전 10시 ~ 18시<br>"
		+ "(점심시간 12시 30분~14시)<br>"
		+ "* 주말, 공휴일에는 고객센터 운영이<br>"
		+ "되지 않습니다.</div></div>";
		
		
		
		chat += "<div class='qestion-Btn'><button class='btn' onclick='question(this)' value='대여'>대여</button>"
		+ "<button class='btn' value='주문/배송' onclick='question(this)'>주문/배송</button>"
		+ "<button class='btn' value='회원가입' onclick='question(this)'>회원가입</button>"
		+ "<button class='btn' value='결제' onclick='question(this)'>결제</button>"
		+ "<button class='btn' value='진행중인 이벤트' onclick='question(this)'>진행중인 이벤트</button>"
		+ "</div>";
		
		
	$(".chat-bubble").append(chat);
	$('#bottom-fix').scrollTop($('#bottom-fix')[0].scrollHeight+20);
	
	
	


	
}



function question(obj){
<%-- 	let uid = '<%=(String)session.getAttribute("uid")%>';
--%>

	
	
	$(".qestion-Btn").remove();
	$(".btn").remove();
	
	let q = "<div class='my-time'><font style='text-align:right; color:gray; font-size:6px; margin-right:3px;'>" + getTime() + "</font></div>";
	q += "<div class='my-chat-box'><div class='chat my-chat'>" + obj.value + "</div></div>"
	$(".chat-bubble").append(q);
	$('#bottom-fix').scrollTop($('#bottom-fix')[0].scrollHeight+20);

	//alert("나야나 : " + obj.value);
	

	if(obj.value == '상담종료'){
		endChat();
	} else if(obj.value == '처음으로'){
		initSet();
	} else if(obj.value == '채팅상담'){
		 //alert(obj.value);
		 let bchat = "<div class='verni' style='margin-left:10px; font-size:15px;'>"
			    + "<b>SHARE VERNI</b><font style='color:gray; font-size:6px; margin-left:3px;'>" + getTime() + "</font></div>"
				+ "<div class='chat-box'><div class='chat'>안녕하세요 고객님!<br>💕셰어베르니입니다💕<br>궁금한 사항을 문의해 주시면<br>빠르게 안내해 드리겠습니다.</div></div>";
		 $(".chat-bubble").append(bchat);
		 $('#bottom-fix').scrollTop($('#bottom-fix')[0].scrollHeight+20);
		 $("#chat-fix").show();
		 startChat();
	} else if(obj.value == '대여 문의'){
				//alert(obj.value);
		let bchat = "<div class='verni' style='margin-left:10px; font-size:15px;'>"
	    + "<b>SHARE VERNI</b><font style='color:gray; font-size:6px; margin-left:3px;'>" + getTime() + "</font></div>"
		+ "<div class='chat-box'><div class='chat'>" + qList[0].b_answer + "</div></div>";
		$(".chat-bubble").append(bchat);
		$('#bottom-fix').scrollTop($('#bottom-fix')[0].scrollHeight+20);
		obj.value = '대여';
		loading_circle(obj);
			
	} else if(obj.value == 'A/S 보험 문의'){

		let bchat = "<div class='verni' style='margin-left:10px; font-size:15px;'>"
	    + "<b>SHARE VERNI</b><font style='color:gray; font-size:6px; margin-left:3px;'>" + getTime() + "</font></div>"
		+ "<div class='chat-box'><div class='chat'>" + qList[1].b_answer + "</div></div>";
		$(".chat-bubble").append(bchat);
		$('#bottom-fix').scrollTop($('#bottom-fix')[0].scrollHeight+20);
		obj.value = '대여';
		loading_circle(obj);
		
	} else if(obj.value == '사이즈 문의'){

		let bchat = "<div class='verni' style='margin-left:10px; font-size:15px;'>"
	    + "<b>SHARE VERNI</b><font style='color:gray; font-size:6px; margin-left:3px;'>" + getTime() + "</font></div>"
		+ "<div class='chat-box'><div class='chat'>" + qList[2].b_answer + "</div></div>";
		$(".chat-bubble").append(bchat);
		$('#bottom-fix').scrollTop($('#bottom-fix')[0].scrollHeight+20);
		obj.value = '대여';
		loading_circle(obj);
	} else {
	
	loading_circle(obj);
	
	}
}

function loading_circle(obj){
	let chat = "<div class='loading_circle'><div class='verni' style='margin-bottom:-10px; margin-left:10px; font-size:15px;'><b>SHARE VERNI</b>"
	chat += "<div class='loading-box'><div class='circles'><i></i><i></i><i></i></div></div></div></div>";
	
	$(".chat-bubble").append(chat);
	$('#bottom-fix').scrollTop($('#bottom-fix')[0].scrollHeight+20);	
	
	//setTimeout($(".loading_circle").remove(), 2000);
	detailQuestion(obj);
	//setTimeout(detailQuestion(obj), 2000);
}

function remove_circle(){
	$(".loading_circle").remove();
}


function detailQuestion(obj){
	//sleep(2000);
	
	   // 버튼 리스트 가져오기
	   $.ajax({
	    url:"question.do",
	    type:"GET",
	    async: false,
	    data: { b_category : obj.value },
	    success:function(data){
	    	let chat = "<div class='verni' style='margin-left:10px; font-size:15px;'><b>SHARE VERNI</b><font style='color:gray; font-size:6px; margin-left:3px;'>" + getTime() + "</font></div>";
	    	chat += "<div class='chat-box'><div class='chat'>" + data[0].b_c_default + "</div></div>";
	    	
	    		$(".chat-bubble").append(chat);
		    	$('#bottom-fix').scrollTop($('#bottom-fix')[0].scrollHeight+20);
		    	chat = "";   
	    	
    	$.each(data, function (index, item) {
    		qList.push(item);
    		chat += "<div class='qestion-Btn'><button class='btn' onclick='question(this)' value='" + item.b_question + "'>" + item.b_question + "</button>"
    			
		});
	    	
	    	//alert(data[0].b_category);
	    	chat += "<button class='btn' onclick='question(this)' value='채팅상담'>1:1 채팅상담</button>"
	    	+ "<button class='btn' onclick='question(this)' value='" + data[0].b_category + "'>이전단계</button>"
			+ "<button class='btn' onclick='question(this)' value='처음으로'>처음으로</button>"
			+ "<button class='btn' onclick='question(this)' value='상담종료'>상담종료</button></div>";
		
			remove_circle();	
		$(".chat-bubble").append(chat);
		$('#bottom-fix').scrollTop($('#bottom-fix')[0].scrollHeight+20);
	    	
	    },
	    error:function(){
	       alert('error');
	    } 
	 });      
}





function answer_message(){
	
	remove_circle();
	
	let chat = "<div class='verni' style='margin-left:10px; font-size:15px;'><b>SHARE VERNI</b><font style='color:gray; font-size:6px; margin-left:3px;'>" + getTime() + "</font></div>"
	chat += "<div class='chat-box'><div class='chat'>" +  + "</div></div>";
	$(".chat-bubble").append(chat);
	$('#bottom-fix').scrollTop($('#bottom-fix')[0].scrollHeight+20);

	chat = "<div class='qestion-Btn'><button class='btn' onclick='question()'>대여 문의</button>"
		+ "<button class='btn' onclick='question()'>A/S 보험 문의</button>";
		chat += "<button class='btn' onclick='question()'>사이즈 기준</button>"
		+"<button class='btn' onclick='loading_circle()'>이전단계</button>"
		+"<button class='btn' onclick='loading_circle()'>처음으로</button>"
		+ "<button class='btn' onclick='webSocket.onclose()'>상담종료</button></div>";
	$(".chat-bubble").append(chat);
	$('#bottom-fix').scrollTop($('#bottom-fix')[0].scrollHeight+20);

}


<!-- 채팅관련 코드 -->
let webSocket;
function startChat(){
//서버의 broadsocket의 서블릿으로 웹 소켓을 연결한다.
webSocket = new WebSocket("ws://localhost:8090/a_verni/broadsocket");
//webSocket = new WebSocket("ws://localhost:8090/main.do");

//접속이 완료되면
webSocket.onopen = function(message) {
//alert('success');
};
//접속이 끝기는 경우는 브라우저를 닫는 경우이기 떄문에 이 이벤트는 의미가 없음.
//상담종료 클릭시, 나가기 클릭시 --> onclose 기능 추가 
webSocket.onclose = function(message) {
	//endChat();
};




//에러가 발생하면
webSocket.onerror = function(message) {
//에러 표시
alert('error');
};
//서버로부터 메시지가 도착하면 콘솔 화면에 메시지를 남긴다.
webSocket.onmessage = function(message) {
	 let chat = "<div class='verni' style='margin-left:10px; font-size:15px;'>"
		    + "<b>SHARE VERNI</b><font style='color:gray; font-size:6px; margin-left:3px;'>" + getTime() + "</font></div>"
			+ "<div class='chat-box'><div class='chat'>" + message.data + "</div></div>"
	 $(".chat-bubble").append(chat);
	 $('#bottom-fix').scrollTop($('#bottom-fix')[0].scrollHeight+20);
};

} // end of startChat()

function chatEnd(){
	webSocket.close();
	
	//$("#chat-container").hide();
}

function getTime(){ // 시간 표시 --> 오전 11:52
	let now = new Date();
	
	let nowHour = now.getHours();
	let nowMt = now.getMinutes();
	let time = "";
	// 한 자리수 일 때 앞에 0을 붙여준다.
	if(nowMt < 10){
		nowMt = "0" + nowMt;
	}
	// 24시를 기준으로 12시까지는 오전, 13시부터는 오후를 앞에 붙여준다.
	if(nowHour <= 12){
		// 한 자리수 일 때 앞에 0을 붙여준다.
		if(nowHour < 10){
			nowHour = "0" + nowHour;
			time = "오전 " + nowHour + ":" + nowMt; 
		} else {
		// 두 자리수 일 때
		time = "오전 " + nowHour + ":" + nowMt; 
		}
	// 13시 이후
	} else {
		nowHour = nowHour - 12;
		if(nowHour < 10){
		nowHour = "0" + nowHour;
		time = "오후 " + nowHour + ":" + nowMt;
		} else {
		time = "오후 " + nowHour + ":" + nowMt;
		}
	}
	return time;
}

//서버로 메시지를 발송하는 함수
//Send 버튼을 누르거나 텍스트 박스에서 엔터를 치면 실행
function sendMessage() {
//텍스트 박스의 객체를 가져옴
let message = document.getElementById("textMessage");
//메세지를 넣는다.
let msg = "<div class='my-time'><font style='text-align:right; color:gray; font-size:6px; margin-right:3px;'>" + getTime() + "</font></div>";
msg += "<div class='my-chat-box'><div class='chat my-chat'>" + message.value + "</div></div>"
$(".chat-bubble").append(msg);
$('#bottom-fix').scrollTop($('#bottom-fix')[0].scrollHeight+20);

//소켓으로 보낸다.
webSocket.send(message.value);
//텍스트 박스 초기화
message.value = "";
}
//텍스트 박스에서 엔터를 누르면
function enter() {
//keyCode 13은 엔터이다.
if(event.keyCode === 13) {
//서버로 메시지 전송
sendMessage();
//form에 의해 자동 submit을 막는다.
return false;
}
return true;
}
</script>
