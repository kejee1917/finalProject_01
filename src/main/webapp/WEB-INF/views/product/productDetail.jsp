<%@page import="java.util.ArrayList"%>
<%@page import="verni.co.kr.review.R_ReplyDto"%>
<%@page import="verni.co.kr.review.ReviewDto"%>
<%@page import="verni.co.kr.util.ProductUtil"%>
<%@page import="verni.co.kr.member.MemberDto"%>
<%@page import="java.util.List"%>
<%@page import="verni.co.kr.product.ProductDto"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
<script src="./jquery/jquery.flexslider.js"></script>
<!-- 카카오에서 제공하는 js 파일 -->
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>




<link rel="stylesheet" href="./css/flexslider.css" type="text/css">
<link rel="stylesheet" href="./css/productDetail/point.css"
   type="text/css">
<link rel="stylesheet" href="./css/productDetail/radio_button.css"
   type="text/css">
<link rel="stylesheet" href="./css/productDetail/tab.css"
   type="text/css">

<link rel="stylesheet" href="./css/productDetail/share.css"
   type="text/css">








<%
ProductDto pd = (ProductDto) request.getAttribute("pd");
MemberDto mem = (MemberDto) session.getAttribute("login");
int wcount = (int) request.getAttribute("wcount");
List<ReviewDto> rlist = (List) request.getAttribute("rlist");
int[] rcount = (int[]) request.getAttribute("rcount");

ArrayList<Object> rScope = (ArrayList) request.getAttribute("rScope");

Object totalAvg = 0;
int star1 = 0;
int star2 = 0;
int star3 = 0;
int star4 = 0;
int star5 = 0;
if (rScope != null) {
	if (!rScope.get(0).equals(0)) {
		totalAvg = (double) rScope.get(0) * 20;
	} else {
		totalAvg = 0;
	}
	if (!rScope.get(6).equals(0)) {
		star1 = (int) rScope.get(6);
	} else {
		star1 = 0;
	}
	if (!rScope.get(5).equals(0)) {
		star2 = (int) rScope.get(5);
	} else {
		star2 = 0;
	}
	if (!rScope.get(4).equals(0)) {
		star3 = (int) rScope.get(4);
	} else {
		star3 = 0;
	}
	if (!rScope.get(3).equals(0)) {
		star4 = (int) rScope.get(3);
	} else {
		star4 = 0;
	}
	if (!rScope.get(2).equals(0)) {
		star5 = (int) rScope.get(2);
	} else {
		star5 = 0;
	}

	int totalBar = star1 + star2 + star3 + star4 + star5;
	int percent = 0;
	try {
		percent = 100 / totalBar;
	} catch (ArithmeticException ae) {
		percent = 1;

	}
	star1 = percent * star1;
	star2 = percent * star2;
	star3 = percent * star3;
	star4 = percent * star4;
	star5 = percent * star5;
}

// 할인 계산 전 금액

String price3Before = ProductUtil.change((pd.getP_price() * 100) / (100 - pd.getP_discount()));
String price5Before = ProductUtil.change((pd.getP_price() * 100 * 1.5) / (100 - pd.getP_discount()));

// 할인 계산 금액
String price3After = ProductUtil.change(pd.getP_price());
String price5After = ProductUtil.change((pd.getP_price() * 1.5));

// 결제 예상 금액
int price3 = pd.getP_price();
int price5 = (int) Math.round((pd.getP_price() * 1.5));
%>




<!-- 스와이퍼 -->
<style>
.bg-dark {
	background-color: white !important;
}

body {
	margin: 0px;
	padding: 0px;
}

.jbTitle {
	text-align: center;
	height: 500px;
}

.jbMenu {
	text-align: center;
	padding: 0px;
	width: 100%;
}

.jbContent {
	
}

.jbFixed {
	position: fixed;
	top: 0px;
}

/* 안쪽 스크롤 */
#container {
	width: 100%;
	margin: 0px auto;
	padding: 40px 0;
}

#scrollbox {
	width: 100%;
	height: 400px;
	overflow: auto;
	overflow-x: hidden;
}

#container>p {
	background: #eee;
	color: #666;
	font-family: Arial, sans-serif;
	font-size: 0.75em;
	padding: 5px;
	margin: 0;
	text-align: right;
}

/* 엄지언니 */
<!--
엄 css --> /* qna 토글 */ summary {
	cursor: pointer;
}

summary {
	list-style: none;
}

summary::-webkit-details-marker {
	display: none;
}

.faq-title-box {
	padding: 10px;
	margin-left: auto;
	margin-right: auto;
	border: 5px solid #e8e8e8;
	color: #404040;
	background: #dfdfdf;
}

.faq-title-box.typeThin {
	border-width: 1px;
	border-color: #d7d5d5;
	background: white;
}

.faq-content-box {
	margin-left: auto;
	margin-right: auto;
	margin-bottom: 0;
	border: 3px solid #e8e8e8;
	color: #404040;
	background: white;
	min-height: 50px;
}

.faq-content-box.typeThin {
	border-width: 1px;
	border-color: #d7d5d5;
}

/*p*/
.page-item.active .page-link {
	z-index: 3;
	color: black;
	background-color: #fff;
	border-color: #e9ecef;
	font-size: 13px;
}

.page-link {
	position: relative;
	display: block;
	padding: .5rem .75rem;
	margin-left: -1px;
	line-height: 1.25;
	color: #007bff;
	background-color: #fff;
	border: 0px solid white;
	font-size: 13px;
}

/* 스킬바 */
Graph stuff

.bar-graph {
	list-style: none;
	margin: 50px 0px auto;
}

.bar-wrap { @include prefix(border-radius,10px 10px 10px 10px);
	width: 100%;
	background-color: #f5f5f5;
	border: black;
	margin-bottom: 10px;
}

.bar-fill { @include prefix(border-radius,10px 10px 10px 10px); @include
	prefix(animation, bar-fill 1s);
	background-color: red;
	display: block;
	height: 15px;
	width: 0px;
}

//
General stuff

body {
	background-color: #000;
}

p {
	color: black;
	font: { family : 'Helvetica';
	size: 16px;
	weight: 100;
}

text-transform




:




uppercase


;
}
<!--
별점 평균 -->h2 {
	font-size: 15px;
}

.star-rating {
	width: 205px;
}

.star-rating, .star-rating span {
	display: inline-block;
	height: 39px;
	overflow: hidden;
	background: url(./image/detail/star.png) no-repeat;
}

.star-rating span {
	background-position: left bottom;
	line-height: 0;
	vertical-align: top;
}

#myImg {
	border-radius: 5px;
	cursor: pointer;
	transition: 0.3s;
}

#myImg:hover {
	opacity: 0.7;
}

/* The Modal (background) */
.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	padding-top: 100px; /* Location of the box */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgba(255, 255, 255, 0.5); /* Fallback color  */
	background-color: rgba(255, 255, 255, 0.5); /* Black w/ opacity */
}

/* Modal Content (image) */
.modal-content {
	margin: auto;
	display: block;
	width: 500px;
	max-width: 700px;
}

/* Caption of Modal Image */
#caption {
	margin: auto;
	display: block;
	width: 80%;
	max-width: 700px;
	text-align: center;
	color: #ccc;
	padding: 10px 0;
	height: 150px;
}

/* Add Animation */
.modal-content, #caption {
	-webkit-animation-name: zoom;
	-webkit-animation-duration: 0.6s;
	animation-name: zoom;
	animation-duration: 0.6s;
}

@
-webkit-keyframes zoom {
	from {-webkit-transform: scale(0)
}

to {
	-webkit-transform: scale(1)
}

}
@
keyframes zoom {
	from {transform: scale(0)
}

to {
	transform: scale(1)
}

}

/* The Close Button */
.close {
	position: absolute;
	top: 40px;
	right: 550px;
	color: black; /* #f1f1f1 */
	font-size: 40px;
	font-weight: bold;
	transition: 0.3s;
}

.close:hover, .close:focus {
	color: #bbb;
	text-decoration: none;
	cursor: pointer;
}

/* 100% Image Width on Smaller Screens */
@media only screen and (max-width: 700px) {
	.modal-content {
		width: 100%;
	}
}

<!--
더보기 -->.box {
	margin: 30px;
}

.content {
	width: 100%;
	padding: 10px;
	/* border:1px solid #ddd; */
	font: 400 1rem/1.5rem 'NotoSansKR';
}

<!--
엄 여기까지 -->img {
	display: block;
	margin: 0px auto;
}

#point {
	background-color: white;
	border: none;
}

.tm {
	padding-top: 60px;
}

html {
	scroll-behavior: smooth
}

.show {
	display: block
} /*보여주기*/
.hide {
	display: none
} /*숨기기*/
.like_btn {
	font-size: 13px;
	border-color: lightgrey;
	border-style: solid;
	border-width: 1px;
	border-radius: 18px;
	background-color: white;
}

/*네비시도*/

/*---------- tab nav */
#topBar {
	display: block;
	width: 100%;
}

#topBar ul {
	display: table;
	margin: 0px;
	padding: 0px;
	list-style: none;
	overflow: hidden;
	width: 100%;
	/* <---------- Remove this property to make the width of the tabs normal*/
}

#topBar li {
	display: table-cell;
	text-align: center;
	padding: 0 2px 0 0;
}

#topBar li a {
	display: block;
	font-weight: bold;
	color: #555;
	text-decoration: none;
	padding: 20px;
	/*Rounded Corners*/
	border-radius: 5px 5px 0 0;
	-webkit-border-radius: 5px 5px 0 0;
	-moz-border-radius: 5px 5px 0 0;
	border-right: 1px solid #ccc;
	/*Gradient*/
	background: -webkit-linear-gradient(top, #fff, #f2f2f2);
	background: -webkit-linear-gradient(top, #fff, #f2f2f2);
	background: -ms-linear-gradient(top, #fff, #f2f2f2);
	background: -o-linear-gradient(top, #fff, #f2f2f2);
}

#topBar li a:hover {
	/* background: -webkit-linear-gradient(top, #7A7771, #D1C19D);
   background: -webkit-linear-gradient(top, #7A7771, #D1C19D);
   background: -ms-linear-gradient(top, #7A7771, #D1C19D);
   background: -o-linear-gradient(top, #7A7771, #D1C19D); */
	background: #0F2620;
	color: white;
}

#topBar li a.selected {
	background: #fff;
	color: #000;
}

#topBar div {
	display: none;
	margin: 0px;
	padding: 20px;
	color: #555;
	background: #ccc;
	box-shadow: 2px 1px 1px 0px #dddddd;
}

#topBar div.selected {
	display: block;
}

#topBar div p {
	margin: 0px 0px 20px 0px;
}



.answerT td{
color: #424242;
}
</style>






<div class="jbTitle">
	<div class="contianer" style="padding-left: 15%; padding-right: 15%;">
		<div style="padding-right: 16%">




			 <div class="flexslider" style="width: 55%; float: left;">
		         <ul class="slides" style="text-align: center;">
		            <%
		            String image[] = pd.getP_newimage2().split(",");
		            for (int i = 0; i < image.length; i++) {
		            %>
		            <li><img src="./upload/detailImage/<%=image[i]%>" width="400px"
		               style="margin: auto;" /></li>
		            <%
		            }
		            %>
		         </ul>
		      </div>


			<div style="width: 5%; float: left;">&nbsp;&nbsp;&nbsp;</div>

			<div style="width: 40%; float: left;">
				<div style="height: 500px; float: left; text-align: left;">
					<hr style="background-color: #2E4D58; height: 2px;">
					<h2><%=ProductUtil.brandName(pd.getP_brand())%></h2>
					<h5>${pd.p_name}</h5>
					<br>
					<%
            if (pd.getP_discount() == 0) {
            %>
					<div style="width: 500px;">
						<div
							style="width: 50px; float: left; height: 15px; padding-top: 5px;">
							<h5>3일권</h5>
						</div>
						<div style="width: 400px; float: left;">
							<h3><%=price3Before%>원
							</h3>
						</div>
					</div>
					<div style="width: 500px; clear: both;">
						<div
							style="width: 50px; float: left; height: 15px; padding-top: 5px;">
							<h5>5일권</h5>
						</div>
						<div style="width: 400px; float: left;">
							<h3><%=price5Before%>원
							</h3>
						</div>
					</div>
					<%
            } else {
            %>
					<h2 style="color: brown;">
						<i><%=pd.getP_discount()%>%</i>
					</h2>
					<div style="width: 500px; float: left;">
						<div
							style="width: 50px; float: left; height: 15px; padding-top: 5px;">
							<h5>3일권</h5>
						</div>
						<div
							style="width: 65px; float: left; height: 15px; padding-top: 5px;">
							<h5 style="color: gray;">
								<del><%=price3Before%>원
								</del>
							</h5>
						</div>
						<div style="width: 150px; float: left;">
							<h3><%=price3After%>원
							</h3>
						</div>
					</div>
					<div style="width: 500px; clear: both;">
						<div
							style="width: 50px; float: left; height: 15px; padding-top: 5px;">
							<h5>5일권</h5>
						</div>
						<div
							style="width: 65px; float: left; height: 15px; padding-top: 5px;">
							<h5 style="color: gray;">
								<del><%=price5Before%>원
								</del>
							</h5>
						</div>
						<div style="width: 150px; float: left;">
							<h3><%=price5After%>원
							</h3>
						</div>
					</div>
					<%
            }
            %>
            		<div style="clear: both;padding-top: 8px;">
            			<div style="float: left; width: 34%; background-color: ligthgray;height: 25px; ">
            				<p class="ec-box typeThin" style=" width:100%; height: 25px; font-size: 12px;padding-top: 2px;">
            				 <i class="fas fa-ticket-alt"></i>&nbsp;&nbsp;베르니 회원 7% 할인 쿠폰
							
            				</p>
            			</div>
					
						<div style="float: left;width: 66%;">
						<% if(mem == null) {%>
							<button class="couponSubmit" onclick="login()">
							<i class="fas fa-arrow-circle-down"></i>&nbsp;&nbsp;쿠폰받기</button>	
						<%}else{ %>
							<button class="couponSubmit" onclick="couponAdd()">
							<i class="fas fa-arrow-circle-down"></i>&nbsp;&nbsp;쿠폰받기</button>	

						<%} %>	
						</div>
						
					</div>
            
            
					<div style="clear: both; padding-top: 8px;">
						<hr style="background-color: #2E4D58;">
					</div>

					<div style="clear: both;">
						<table>
							<col width="80px">
							<col width="75px">
							<col width="320px">
							<%
                  if (rlist != null || rlist.size() != 0) {
                  %>
							<tr>
								<td><h6 style="text-align: top">만족도</h6></td>
								<td colspan="1" valign="top">
									<h6 style="text-align: top">
										<i class="fas fa-star" style="color: #DAA520"></i> <b><%=rScope.get(0)%></b><b
											style="color: lightgray">/5</b>
									</h6>
								</td>
								<td colspan="1" valign="top" align="right"><a
									href="#productReview"><%=rlist.size()%>개 상품리뷰 ></a></td>
							</tr>

							<%
                  }
                  %>
							<tr style="height: 30px">
								<td><h6>포인트 혜택</h6></td>
								<td><h6>리뷰작성시 지급</h6></td>
								<td align="left" valign="middle">
									<div id="menu" style="float: left;">
										<div>
											<span class="point"
												style="font-size: 11px; padding-bottom: 5px;"><i
												class="far fa-question-circle"></i></span>
											<p class="arrow_box">
												등급별 적립혜택<br> <br>일반회원 1%<br>실버회원 3%<br>
												골드회원 5%<br>다이아몬드회원 7%<br> <br>실 결제금액에 한함
											</p>
										</div>
									</div> <br>
								</td>
							</tr>
							<tr style="height: 40px">
								<td valign="top"><h6 style="text-align: top">배송비</h6></td>
								<td colspan="2" valign="top">
									<h6>50,000원 이상 무료배송</h6>
									<h6>(주문총액 미만 시 배송비 2,500원 발생)</h6>
								</td>
							</tr>
							<tr>
								<td valign="top"><h6>배송시간</h6></td>
								<td colspan="2">
									<h6>서울지역 - 오전 8시 건 까지 당일 배송(오후 2~7시 수령 가능)</h6>
									<h6>수도권 및 지방지역 - 오후 4시 건까지 당일 출고(2~3일 내 수령 가능)</h6>
									<h6>* 주말, 공휴일 제외</h6>
								</td>
							</tr>
						</table>
					</div>
					<div style="clear: both;">
						<span style="line-height: 20%"></span>
						<hr style="background-color: #2E4D58;">
					</div>

					<div style="clear: both;">
						<table>
							<col width="80px">
							<col width="400px">
							<tr>
								<td><h6>대여기간 선택</h6></td>
								<td>
									<div style="min-height: 30px;">
										<label class="box-radio-input"> <input type="radio"
											name="p_price" id="p_day1" checked="checked"
											value="<%=price3After%>"> <span>3일</span>
										</label> <label class="box-radio-input"> <input type="radio"
											name="p_price" id="p_day2" value="<%=price5After%>">
											<span>5일</span>
										</label> <input type="hidden" id="c_period" value="3일"> <input
											type="hidden" id="c_price" value="<%=price3%>">
									</div>
								</td>
							</tr>
							<tr>
								<td><h6>결제 예상금액</h6></td>
								<td><h1 id="price" style="padding-top: 0"><%=price3After%>원
									</h1></td>
							</tr>
						</table>
					</div>

					
					<div style="clear: both; width: 480px; text-align: right;">
					<a id="btnKakao" class="link-icon kakao" href="javascript:shareKakao();" style="font-size: 15px; color: #fae100;">
               				<i class="fas fa-comment-dots"></i></a> &nbsp;	
						<span class="button gray medium"><a href="#"
							onclick="clip(); return false;"><i class="fas fa-share-alt"
								id="share" style="font-size: 15px;"></i>&nbsp;</a></span>
						<%
               if (mem == null) {
               %>
						<button onclick="login()" class="wish"
							style="font-size: 15px; color: gray;">
							<i class="fas fa-heart"></i>
						</button>
						&nbsp;
						<%
               } else {
               %>
						<%
               if (wcount == 0) {
               %>
               			
						<button class="wish" id="wish" onclick="wished(<%=pd.getP_no()%>)"
							style="font-size: 15px; color: gray;">
							<i id="test" class="fas fa-heart"></i>
						</button>
						<%
               } else {
               %>
						<button class="wish" id="wish" onclick="wished(<%=pd.getP_no()%>)"
							style="font-size: 15px; color: red;">
							<i id="test" class="fas fa-heart"></i>
						</button>
						<%
               }
               }
               %>

					</div>

					<div style="clear: both; height: 40px; text-align: center;">
						<br>
						<div class="ec-base-button gColumn">
							<% if(pd.getP_del() == 1){%>
							<button type="button" class="btnSubmit sizeL"
												style="width: 404px; height: 30px;">대여불가</button>
							
							
							
							<%}else{ 
				                  if (pd.getP_status().equals("대여중")) {
				                  %>
											<button type="button" class="btnSubmit sizeL"
												style="width: 404px; height: 30px;">대여중</button>
											<%
				                  } else {
				                  %>
											<%
				                  if (mem == null) {
				                  %>
				
											<button type="button" onclick="login()" class="btnSubmit sizeL"
												style="width: 200px; height: 30px;">대여하기</button>
											&nbsp;
											<button type="button" onclick="login()" class="btnEm sizeL"
												style="width: 200px; height: 30px;">장바구니</button>
											&nbsp;
											<%
				                  } else {
				                  %>
											<button type="button" id="buy" class="btnSubmit sizeL"
												style="width: 200px; height: 30px;">대여하기</button>
											&nbsp;
											<button type="button" id="basket" class="btnEm sizeL"
												style="width: 200px; height: 30px;">장바구니</button>
											&nbsp;
				
											<%
				               }}
				               }
				               %>


						</div>
					</div>
					<br> <br>
					
                     <!-- <div align="right">
                     <a id="btnTwitter" class="link-icon twitter" href="javascript:shareTwitter();"><i class="fab fa-twitter"></i></a>
                     <a id="btnFacebook" class="link-icon facebook" href="javascript:shareFacebook();"><i class="fab fa-facebook-square"></i></a>    
                     <a id="btnKakao" class="link-icon kakao" href="javascript:shareKakao();"><i class="fas fa-comment-dots"></i></a> 
                     <span class="button gray medium"><a href="#" onclick="clip(); return false;"><i class="fas fa-cut"></i></a></span> 
                       
                     </div> -->
				</div>
				<!-- 디테일 상단 끝태그 -->
			</div>
		</div>
	</div>
</div>


<br>
<br>


<div class="jbMenu">
   <div id="topBar" style="padding-left: 15%; padding-right: 15%; padding-top: 0px;background-color: white">
   		<br>
         <ul>
            <li class="selected"><a href="#productDetail">상품상세보기</a></li>
            <li><a href="#productInfo">이용안내</a></li>
            <li><a href="#productReview">상품리뷰</a></li>
            <li><a href="#productQna">상품문의</a></li>
         </ul>
     </div>
</div>    









  
      
<div class="jbContent">
      
   <div class="tm" id="productDetail" style="clear: both; width: 100%; padding-left: 15%; padding-right: 15%; padding-top: 20px; ">
      <br>
      <br> ${pd.p_content}
      
   </div>




    
   
   
   <div id="productInfo" class="tm" style="width: 100%; padding-left: 15%; padding-right: 15%; padding-top: 90px;">
      <hr>
   
   
   
      <table class="answerT">
         <tr height="30px">
            <th><h3 style=" padding-top: 40px; padding-bottom: 10px;"><b>이용 안내</b></h3></th>
         </tr>
         <tr height="20px">
            <td><h4>• 셰어베르니 이용내역과 상품에 따라, 주문후 고객님의 개인정보를 요청드릴 수 있습니다.</h4></td>
         </tr>
         <tr height="20px">
            <td><h4>• 이용일은 상품 수령일로부터 카운트 됩니다.</h4></td>
         </tr>
         <tr height="20px">
            <td><h4>• 상품 이용 종료일 다음날 회수기사님이 방문합니다.</h4></td>
         </tr>
         <tr height="20px">
            <td><h4>• 반납일로부터 3일(주말/공휴일 제외)이내 미반납 시 연제료가 발생됩나다.</h4>
            <td>
         </tr>
         <tr height="10px">
            <td>&nbsp;</td>
         </tr>
         <tr height="30px">
            <th><h3 style=" padding-top: 15px; padding-bottom: 10px;"><b>배송 안내</b></h3></th>
         </tr>
         <tr height="20px">
            <td><h4>• 배송비 : 50,000원 이상 무료배송입니다.(주문총액 미만 시 배송비 2,500원 발생)</h4>
            <td>
         </tr>
         <tr height="20px">
            <td><h4>• 배송시간 : 서울지역은 오전 8시 건 까지 당일 배송(오후 2~7시 수령 가능) 수도권 및 지방지역은 오후
               4시 건까지 당일 출고</h4>
            <td>
         </tr>
         <tr height="20px">
            <td><h4>• 배송기간 : 약 2~3일 내 수령 가능 (주말/공휴일 제외, 평일기준)</h4>
            <td>
         </tr>         
          <tr height="20px">
            <td><h4>• 부득이한 사정으로 배송이 지연되면 개별적으로 연락드리고 있습니다. 이 점 양해 부탁드립니다.</h4>
            <td>
         </tr>        
         <tr height="10px">
            <td>&nbsp;</td>
         </tr>
         <tr height="30px">
            <th><h3 style=" padding-top: 15px; padding-bottom: 10px;"><b>환불 안내</b></h3></th>
         </tr>
         <tr height="20px">
            <td><h4>• 환불은 배송전일 경우에만 가능합니다.</h4>
            <td>
         </tr>
      </table>
      
   </div>
   
   


   <!-- REVIEW -->

   <!-- test zone -->
   <div id="productReview" style="clear: both; padding-left: 15%; padding-right: 15%; padding-top: 90px;" >
   <hr>
   <div align="center" class="tm" style="  display:flex; flex-flow:row nowrap; justify-content:center;  height: auto;">
      <div>
         <div style="width: 30%; float: left; ">
            <div align="center"
               style="height: 115px; width: 100%; padding-top: 30px; padding-right: 200px;">
               <table>
                  <tr>
                     <td>
                        <div class="wrap-star" align="left">
                           <div class='star-rating'>
                              <span style="width:<%=totalAvg%>%"></span>
                           </div>
                        </div>
<!--                      </td> -->
                  </tr>

                  <tr>
                     <td align="center">
                        <h2>
                           <b><%=rScope.get(0)%></b><b style="color: lightgray">/5</b>
                        </h2>
                     </td>
                  </tr>
               </table>
            </div>
         </div>

         <div style="width: 70%; float: left; padding-right: 0px;">

            <div style="float: left;">
               <div align="left"
                  style="height: 115px; float: left; padding-right: 2px;">
                  <p style="height: 15px;">5 star</p>
                  <p style="height: 15px;">4 star</p>
                  <p style="height: 15px;">3 star</p>
                  <p style="height: 15px;">2 star</p>
                  <p style="height: 15px;">1 star</p>
               </div>
               <div align="left" style="height: 115px; float: left; width: 550px;">
                  <div class="bar-wrap">
                     <span class="bar-fill" style="width: <%=star5%>%;"> </span>
                  </div>
                  <div class="bar-wrap">
                     <span class="bar-fill" style="width: <%=star4%>%;"> </span>
                  </div>
                  <div class="bar-wrap">
                     <span class="bar-fill" style="width: <%=star3%>%;"> </span>
                  </div>
                  <div class="bar-wrap">
                     <span class="bar-fill" style="width: <%=star2%>%;"> </span>
                  </div>
                  <div class="bar-wrap">
                     <span class="bar-fill" style="width: <%=star1%>%;"> </span>
                  </div>
               </div>

               <div align="left"
                  style="height: 115px; float: left; padding-left: 2px;">
                  <p style="height: 15px;"><%=rScope.get(2)%>명
                  </p>
                  <p style="height: 15px;"><%=rScope.get(3)%>명
                  </p>
                  <p style="height: 15px;"><%=rScope.get(4)%>명
                  </p>
                  <p style="height: 15px;"><%=rScope.get(5)%>명
                  </p>
                  <p style="height: 15px;"><%=rScope.get(6)%>명
                  </p>
               </div>
            </div>
         </div>
      </div>
   </div>
   

      <div align="center" style="clear: both; ">
         <br> <br>
         <hr>
         
         <br> <br>

         <div>
            <%
            if (rlist == null || rlist.size() == 0) {
            %>
				<div height='250px'
					style='text-align: center; padding-top: 50px; font-size: 14px;'>
					<img src='./image/detail/review.png' width='80px'><br>
					<h3 style="color: #424242; padding-top: 10px;"><b>등록된 상품리뷰가 없습니다.</b></h3>
					이 상품 구매하셨나요? 마이페이지 > 상품리뷰를 작성해주세요!<br>
					<!-- 상품리뷰 작성 시 적립금<br>
					일반회원 : 1%, 실버회원 : 3%, 골드회원 : 5 %, 다이아회원 : 7% -->
					
					<br><br><br>
				</div>
				<%
            } else {
            %>

            <h3 align="left" style="padding-bottom: 10px;">
               상품리뷰&nbsp;(<%=rlist.size()%>)
            </h3>

         <div id="container">
            <div id="scrollbox" >
               <div id="content" >


            <%
            for (int i = 0; i < rlist.size(); i++) {
               ReviewDto rv = rlist.get(i);
            %>
            <div
               style="width: 100%; text-align: left; font-size: 12px; ">

               <%
               if (rv.getR_scope() == 1) {
               %>
               <i class="fas fa-star" style="color: #DAA520"></i>&nbsp; <i
                  class="fas fa-star" style="color: lightgrey"></i>&nbsp; <i
                  class="fas fa-star" style="color: lightgrey"></i>&nbsp; <i
                  class="fas fa-star" style="color: lightgrey"></i>&nbsp; <i
                  class="fas fa-star" style="color: lightgrey"></i>
               <%
               } else if (rv.getR_scope() == 2) {
               %>
               <i class="fas fa-star" style="color: #DAA520"></i>&nbsp; <i
                  class="fas fa-star" style="color: #DAA520"></i>&nbsp; <i
                  class="fas fa-star" style="color: lightgrey"></i>&nbsp; <i
                  class="fas fa-star" style="color: lightgrey"></i>&nbsp; <i
                  class="fas fa-star" style="color: lightgrey"></i>
               <%
               } else if (rv.getR_scope() == 3) {
               %>
               <i class="fas fa-star" style="color: #DAA520"></i>&nbsp; <i
                  class="fas fa-star" style="color: #DAA520"></i>&nbsp; <i
                  class="fas fa-star" style="color: #DAA520"></i>&nbsp; <i
                  class="fas fa-star" style="color: lightgrey"></i>&nbsp; <i
                  class="fas fa-star" style="color: lightgrey"></i>
               <%
               } else if (rv.getR_scope() == 4) {
               %>
               <i class="fas fa-star" style="color: #DAA520"></i>&nbsp; <i
                  class="fas fa-star" style="color: #DAA520"></i>&nbsp; <i
                  class="fas fa-star" style="color: #DAA520"></i>&nbsp; <i
                  class="fas fa-star" style="color: #DAA520"></i>&nbsp; <i
                  class="fas fa-star" style="color: lightgrey"></i>
               <%
               } else if (rv.getR_scope() == 5) {
               %>
               <i class="fas fa-star" style="color: #DAA520"></i>&nbsp; <i
                  class="fas fa-star" style="color: #DAA520"></i>&nbsp; <i
                  class="fas fa-star" style="color: #DAA520"></i>&nbsp; <i
                  class="fas fa-star" style="color: #DAA520"></i>&nbsp; <i
                  class="fas fa-star" style="color: #DAA520"></i>&nbsp;
               <%
               }
               %>
               &nbsp;<b style="color: black"><%=rv.getR_scope()%></b>&nbsp;&nbsp;
               &nbsp; &nbsp;
               <%=rv.getM_id().substring(0, 3) + "*"%>&nbsp; &nbsp;|&nbsp; &nbsp;<%=rv.getR_wdate().substring(2, 11)%>
            </div>
            
            
            
            
            
            <div align="left" style="padding-top: 10px; font-size: 13px; padding-right:15px;">
               <div class="box">
                  <div class="content" style="margin: 0;">
                     <%=rv.getR_content()%>
                  </div>
               </div>
            </div>
              

			<div align="left" style="padding-top: 10px; padding-bottom: 15px;float: left; width: 70%;">
               <%
               if (rv.getR_filename() == null || rv.getR_filename().equals("")) {
               %>

               <%
               } else {
               String[] rimage = rv.getR_newfilename().split(",");
               if (rimage.length < 2) {
                  String reviewThumImg = rimage[0];
                  System.out.println(rimage.length);
               %>
               <img id='myImg<%=rv.getR_no()%>' onclick='modal(<%=rv.getR_no()%>)'
                  alt='' src='./upload/reviewImage/<%=reviewThumImg%>'
                  style="border-color: lightgrey; border-style: solid; border-width: 1px;"
                  width="100px" height='100px' />
               <%
               } else if (rimage.length >= 2) {
               for (int j = 0; j < rimage.length; j++) {
               %>
               <img id='myImg<%=rv.getR_no() + "" + j%>'
                  onclick='modal(<%=rv.getR_no() + "" + j%>)' alt=''
                  src='./upload/reviewImage/<%=rimage[j]%>'
                  style="border-color: lightgrey; border-style: solid; border-width: 1px;"
                  width="100px" height='100px' />

               <%
               }
               }
               }
               %>
            </div>

            <div align="right" style="padding-bottom: 25px; float: left; width: 30%; padding-right: 5px; ">			
               <div align="right"
                  style="font-size: 11px; color: grey; float: left; padding-top: 3px;">
                  이 상품리뷰가 도움이 되었나요?</div>
               <div id="like_td<%=rv.getR_no()%>" align="left"
                  style="font-size: 11px; color: grey; float: left; width: 65px;">
                  &nbsp; &nbsp;
                  <%
                  if (mem == null) {
                  %>
                  <button onclick='login()' class='like_btn' style='color: gray;'>
                     <span class='material-icons' style="font-size: 18px;">thumb_up_off_alt</span><b
                        style="color: black;"><%=rv.getR_likecount()%></b>
                  </button>
                  <%
                  } else {
                  if (rcount[i] == 0) {
                  %>
                  <button type="button" class='like_btn' id="likes<%=rv.getR_no()%>"
                     onclick='likes(<%=rv.getR_no()%>)' style='color: gray;'>
                     <span class='material-icons' title='이 리뷰가 도움되었나요?'
                        style="font-size: 18px;">thumb_up_off_alt</span><b
                        style="color: black;"><%=rv.getR_likecount()%></b>
                  </button>
                  <%
                  } else {
                  %>
                  <button type="button" class='like_btn' id="likes<%=rv.getR_no()%>"
                     onclick='likes(<%=rv.getR_no()%>)' style='color: #B22222;'>
                     <span class='material-icons' title='취소하시겠습니까?'
                        style="font-size: 18px;">thumb_up_off_alt</span><b
                        style="color: black;"><%=rv.getR_likecount()%></b>
                  </button>
                  <%
                  }
                  }
                  %>
				<br>	

               </div>

			</div>






            <div align="left" style="padding-top: 10px; font-size: 12px; width: 100%;clear: both;">
               <%
               if (rv.getRp_content() != null || rv.getRp_wdate() != null) {
               %>
               Share Verni&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=rv.getRp_wdate().substring(2, 11)%>
               
               <div class="content" style="line-height: 3px; background: #F1F3F5; border: 1px black;">
                     <%=rv.getRp_content().replace("\n", "<br>")%>
                </div>
               
               
               
               
               <%
               }
               %>
            </div> 


            <hr>
            <%
            }
            }
            %>
         </div>

      </div>
</div>
   <!-- 이미지모달 -->
   <div id="myModal" class="modal">
      <span class="close">&times;</span> <img class="modal-content"
         id="img01">
      <div id="caption"></div>
   </div>


</div>
   </div>
   <p><span id="status" ></span></p>
</div>




   
   <!-- qna -->
   <div id="productQna" align="center" class="tm" style="padding-left: 15%; padding-right: 15%; padding-top: 90px;">
   <hr>

	
      <div align="left" style="float: left; height: 150px; width: 70%;">
         <h4 style="font-size: 16px; padding-top: 15px;">
            <strong>상품에 대해서 궁금한 점을 물어보세요!</strong>
         </h4>
         <h5 style="color: gray;">문의하신 내용에 대해서 판매자가 확인 후 답변드립니다.</h5>
         <br>
         <h5 style="color: gray;">• 상품에 관한 문의가 아닌 배송, 결제, 교환/반품/환불에 관한
            문의는 마이페이지 > 1:1문의를 이용해주세요.</h5>
         <br>
         <h6>- 문의하신 내용에 대한 답변은 해당 상품의 상제페이지 또는 마이페이지>상품문의에서 확인하실 수 있습니다.</h6>
         <h6>- 답변완료일 경우 문의글 삭제는 가능하며, 수정은 불가합니다.</h6>
      </div>



      <br> <br>

  <%--     <div align="left" style="float: left; width: 50%;">
         <h4>
            문의(<%=qlist.size()%>)
         </h4>
         <br>
      </div> --%>

      <div align="right" style="float: left; height: 150px; width: 29%;">
         <%
         if (mem == null) {
         %>
         <button onclick="login()" style="background-color: #224037; color: white; height: 35px; width:140px; font-size: 15px; padding-top: 10px; padding-bottom: 30px; text-align: center;">
         문의하기</button>
         <%
         } else {
         %>
         <button onclick="openQnaPopup()" style="background-color: #224037; color: white; height: 35px; width:140px; font-size: 15px; padding-top: 10px; padding-bottom: 30px; text-align: center;">
         문의하기</button>
         <%
         }
         %>
         
      </div>
	<div    style="clear: both;">
	<hr>
	</div>
	<div id="allQnaCount" >
		
	</div>
      
      <div  id="qnaList"  align="left" style="width: 100%; clear: both; margin-bottom: 30px">
        
      </div>
      <!-- qna -->

   </div>
   
   <br><br>
	<br><br>

	
	
	<div class="page" align="center">
	</div>
	
	
	
<!-- 맨 끝 div태그 -->

</div>

<!-- 비슷한상품 & 이브랜드 다른상품 -->
<div class="contianer"
   style="padding-left: 15%; padding-right: 15%; padding-top: 200px;">
   <h4>
      <strong>이 브랜드의 다른 상품은 어떠세요?</strong>
   </h4>
   <c:if test="${empty blist}">
      비슷한 상품이 아직 존재하지 않네요..
      찾아서 돌아 오겠습니다..
   </c:if>
   <c:forEach items="${blist}" var="list" varStatus="i">
      <div class="card"
         style="max-width: 25rem; float: left; margin: 13px; border: hidden;">
         <a href="productDetail.do?p_no=${list.p_no}"> <img alt="..."
            class="card-img-top"
            src="./upload/thumbnailImage/${list.p_newimage1}"
            style="height: 250px;">
         </a>
         <div class="card-body">
            <h3 class="card-title" style="height: 20px; padding-top: 1px;">
            <c:set var="p_brand" value="${list.p_brand}" />
				<c:choose>
					<c:when test="${fn:contains(p_brand, '_')}">
					<c:set var="p_brand" value="${fn:replace(p_brand, '_', '&')}" />
					</c:when>
					<c:when test="${fn:contains(p_brand, '-')}">
					<c:set var="p_brand" value="${fn:replace(p_brand, '-', ' ')}" />
					</c:when>
				</c:choose>
				${p_brand}
            </h3>
            <h5 class="card-title"
               style="height: 17px; text-overflow: ellipsis; white-space: nowrap; overflow: hidden;">
               <a href="productDetail.do?p_no=${list.p_no}">${list.p_name}</a>
            </h5>
         </div>
      </div>
   </c:forEach>
</div>

<div class="contianer"
   style="padding-left: 15%; padding-right: 15%; padding-top: 30px; clear: both;">
   <h4>
      <strong>이 카테고리의 다른 상품은 어떠세요?</strong>
   </h4>

   <c:if test="${empty tlist}">
      다른 상품이 아직 존재하지 않네요..
      찾아서 돌아 오겠습니다..
   </c:if>

   <c:forEach items="${tlist}" var="list" varStatus="i">

      <div class="card"
         style="max-width: 25rem; float: left; margin: 13px; border: hidden;">
         <a href="productDetail.do?p_no=${list.p_no}"> <img alt="..."
            class="card-img-top"
            src="./upload/thumbnailImage/${list.p_newimage1}"
            style="width: 250px;">
         </a>
         <div class="card-body">
            <c:if test=""></c:if>
            <h3 class="card-title" style="height: 20px; padding-top: 1px;">
            <c:set var="p_brand" value="${list.p_brand}" />
				<c:choose>
					<c:when test="${fn:contains(p_brand, '_')}">
					<c:set var="p_brand" value="${fn:replace(p_brand, '_', '&')}" />
					</c:when>
					<c:when test="${fn:contains(p_brand, '-')}">
					<c:set var="p_brand" value="${fn:replace(p_brand, '-', ' ')}" />
					</c:when>
				</c:choose>
				${p_brand}
            </h3>
            <h5 class="card-title"
               style="height: 17px; text-overflow: ellipsis; white-space: nowrap; overflow: hidden;">
               <a href="productDetail.do?p_no=${list.p_no}">${list.p_name}</a>
            </h5>
         </div>
      </div>
   </c:forEach>
</div>




<div style="height: 200px; clear: both;"></div>








<script type="text/javascript">
$(document).ready(function() {
	if(<%=pd.getP_del()%> == 1){
		alert('대여불가한 상품입니다.');
		location.href = history.back();
	}

});


$('.tabgroup > div').hide();
$('.tabgroup > div:first-of-type').show();
$('.tabs a').click(function(e){
  e.preventDefault();
    var $this = $(this),
        tabgroup = '#'+$this.parents('.tabs').data('tabgroup'),
        others = $this.closest('li').siblings().children('a'),
        target = $this.attr('href');
    others.removeClass('active');
    $this.addClass('active');
    $(tabgroup).children('div').hide();
    $(target).show();
  
})

$(document).ready(function() {
	$(window).load(function() {
	     $('.flexslider').flexslider({
	       animation: "slide"
	     });
	   });
	
    qnaList(0);
    getListCount();
   
});



///초희///
/////////// 가격 넣어주기 /////////// 
$("#p_day1").click(function(){
   $("#c_period").val("3일");
   $("#price").html($("#p_day1").val()+"원");
   $("#c_price").val(<%=price3%>);
});
$("#p_day2").click(function(){
   $("#c_period").val("5일");
   $("#price").html($("#p_day2").val()+"원");
   $("#c_price").val(<%=price5%>);
});



// 쿠폰 주기
function couponAdd(){
	$.ajax({
		url:"couponAdd.do",
		type:'post',
		success:function (data){
			if(data == 1){
				alert('쿠폰이 발급되었습니다.');
				return;
			}else{
				alert('이미 발급 받은 쿠폰입니다.');
				return;
			}
		},
		error:function(){
			alert('쿠폰 주기 에러');
		}
	 });
}	 

// 공유하기 말풍선
/* 
      btn = $('#btn'); //버튼 아이디 변수 선언
      layer = $('#layer'); //레이어 아이디 변수 선언
      btn.click(function(){
         layer.toggle(
           function(){layer.addClass('show')}, //클릭하면 show클래스 적용되서 보이기
           function(){layer.addClass('hide')} //한 번 더 클릭하면 hide클래스가 숨기기
         );
       }); */






// 공유하기
function shareTwitter() {
    var sendText = "명품대여 사이트입니다"; // 전달할 텍스트
    var sendUrl = window.document.location.href; // 전달할 URL
    window.open("https://twitter.com/intent/tweet?text=" + sendText + "&url=" + sendUrl);
}
function shareFacebook() {
    var sendUrl = window.document.location.href; // 전달할 URL
    window.open("http://www.facebook.com/sharer/sharer.php?u=" + sendUrl);
}
function shareKakao() {
    
     // 사용할 앱의 JavaScript 키 설정
     Kakao.init('ec1a373c079b73203c524cc7796a6af9');
    
     // 카카오링크 버튼 생성
     Kakao.Link.createDefaultButton({
       container: '#btnKakao', // 카카오공유버튼ID
       objectType: 'feed',
       content: {
         title: "share verni", // 보여질 제목
         description: "명품대여 사이트입니다", // 보여질 설명
         imageUrl: "./image/main/banner.png", // 콘텐츠 URL
         link: {
            mobileWebUrl: window.document.location.href ,
            webUrl: window.document.location.href
         }
       }
     });
}


function clip(){

   var url = '';
   var textarea = document.createElement("textarea");
   document.body.appendChild(textarea);
   url = window.document.location.href;
   textarea.value = url;
   textarea.select();
   document.execCommand("copy");
   document.body.removeChild(textarea);
   alert("URL이 복사되었습니다.")
}


/////////// 찜 /////////// 
function wished(p_no) {
   $.ajax({
      url:"addWish.do",
      type:"post",
      data:{"p_no":p_no},
      success:function(data){
          if(data == 'add'){
            $("#wish").css("color", "red");
         }else{
            $("#wish").css("color", "gray");
         } 
      },
      error:function(){
         alert('error');
      }
   });
}


//장바구니
 $("#basket").click(function(){
   let datas = {"m_id" : '${login.m_id}',
             "p_no"   : ${pd.p_no},
             "c_period" : $("#c_period").val(),
             "c_price" : $("#c_price").val()
   };

$.ajax({
      url:"cartAdd.do",
      type:"post",
      data:datas,
      success:function(data){
         if(data == true){
            alert('장바구니에 추가되었습니다.');
         }else{
            alert('이미 장바구니에 담긴 상품입니다.');
         }
         if(confirm("장바구니로 이동하시겠습니까?")){
            location.href='cartList.do';
         }
      },
      error:function(){
         alert('error');
      }
   }); 
});


// 대여하기
$("#buy").click(function(){
   location.href="paymentPage.do?p_no="+${pd.p_no}+"&c_period="+$("#c_period").val()+"&c_price="+$("#c_price").val();
});


function login() {
   if(confirm("로그인을 하시겠습니까?")){
      let url = window.document.location.href;
      location.href='login.do?url='+url;
   }
}




///////////////////////////////////////////////////////////////////////



// 리뷰 내용 더보기
$(document).ready(function(){

  $('.box').each(function(){
           var content = $(this).children('.content');
           var content_txt = content.html();
            var content_txt_short = content_txt.substring(0,100)+"...";
            var btn_more = $('<a href="javascript:void(0)" class="more">더보기</a>');

            
            $(this).append(btn_more);
            
            if(content_txt.length >= 100){
                content.html(content_txt_short)
                
            }else{
                btn_more.hide()
            }
            
            btn_more.click(toggle_content);
            // 아래 bind가 안 되는 이유는??
            // btn_more.bind('click',toggle_content);
         
            function toggle_content(){
                if($(this).hasClass('short')){
                    // 접기 상태
                    $(this).html('더보기');
                    content.html(content_txt_short)
                    $(this).removeClass('short');
                }else{
                    // 더보기 상태
                    $(this).html('접기');
                    content.text(content_txt);
                    $(this).addClass('short');

                }
            }
        });
});

//리뷰 모달
//Get the modal
function modal(r_no) {
//alert('test');
var modal = document.getElementById("myModal");

// Get the image and insert it inside the modal - use its "alt" text as a caption
var img = document.getElementById("myImg"+r_no);
var modalImg = document.getElementById("img01");
var captionText = document.getElementById("caption");
img.onclick = function(){
  modal.style.display = "block";
  modalImg.src = this.src;
  captionText.innerHTML = this.alt;
}

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// When the user clicks on <span> (x), close the modal
span.onclick = function() { 
  modal.style.display = "none";
}
}

<!-- review 좋아요 -->

<!-- 0806 엄지 수정 -->
/////////// review ///////////

// 리뷰 좋아요
function likes(r_no) {
   $.ajax({
      url:"addLike.do",
      type:"post",
      data:{"r_no":r_no},
      success:function(data){
      //   alert(data.substr(3));
      //   alert(data.substr(0, 3));
         let plus = ""; 

         if(data.substr(0, 3) == 'add'){
            plus += "&nbsp;&nbsp;&nbsp;&nbsp;<button type='button' class='like_btn' id='likes"+r_no+"' onclick='likes("+r_no+")' style='color:#B22222;'><span class='material-icons' style='font-size: 18px;'>thumb_up_off_alt</span><b style='color: black;'>"+data.substr(3)+"</b></button>";
         }else{
            plus += "&nbsp;&nbsp;&nbsp;&nbsp;<button type='button' class='like_btn' id='likes"+r_no+"' onclick='likes("+r_no+")' style='color:gray;'><span class='material-icons' style='font-size: 18px;'>thumb_up_off_alt</span><b style='color: black;'>"+data.substr(3)+"</b></button>";
         }
         $("#like_td"+r_no).html("");
         $("#like_td"+r_no).append(plus);
      },
      error:function(){
         alert('리뷰 좋아요 에러');
      }
   });
}


///////////////////////////
/////////// qna ///////////
// qna 가져오기
function qnaList(pageNumber) {
   $.ajax({
      url: "qnaList.do",
      type: "GET",
      data: {"p_no":'<%=pd.getP_no()%>', 'pageNumber':pageNumber},
      success:function(data) {
         let plus = "";
        
         if(data == "") {
            plus = "<hr><div height='250px' style='text-align: center; padding-top:100px; font-size:14px;'><img src='./image/detail/qna.png' width='80px'><br>등록된 문의내역이 없습니다.<br>상품에 대해 궁금하신 것을 문의해 보세요!<br><br><br><br><br><hr></div>";
            $("#qnaList").html("");
            $("#qnaList").append(plus);
        
         }else {
           plus="";
           
      
            $.each(data, function(index, items){
               
               plus +="<div style='font-size:12px; '>"
                    +"<table><tr height='30px'>"
                    +"<td width='200px' align='left'>"+items.m_id.substr(0, 3)+"*</td>"
                     +"<td width='200px' align='center'>"+items.q_wdate.substr(0, 10)+"</td>"
                    +"<td width='500px' align='left'>"+items.q_status+"</td>"
                 +"<td>";
                if('${login.m_id}' == items.m_id && items.q_status == '답변대기'){
               plus += "<input type='button' class='wish' value='수정' onclick='qnaUpdate("+items.q_no+")'>";
                   plus += "|<input type='button' class='wish' value='삭제' onclick='qnaDelete("+items.q_no+")'>";
                }else if ('${login.m_id}' == items.m_id && items.q_status == '답변완료')
                   plus += "<input type='button' class='wish' value='삭제' onclick='qnaDelete("+items.q_no+")'>";
                plus += "</td></tr></table>"
                    +"<div>"
                    +"<details>";
                    
               
                  plus +="<summary class='faq-title-box typeThin'>["+items.q_cate+"]&nbsp;&nbsp;&nbsp;";
               
               
               if(items.q_secrit == 0) {
                     plus += items.q_title+"</summary>";
               }else if(items.q_secrit == 1 && '${login.m_id}' == items.m_id) {
                  plus += items.q_title+"&nbsp;&nbsp;<img src='./image/detail/scr.png' width='15px'></summary>";
                }else if(items.q_secrit == 1 && '${login.m_id}' != items.m_id){
                     plus += "비밀글입니다&nbsp;&nbsp;<img src='./image/detail/scr.png' width='15px'></summary>";
                } 
               
               // 비밀글은 보여줄수 없으니 조건걸기
               if(items.q_secrit == 0 || (items.q_secrit == 1 && '${login.m_id}' == items.m_id)) {
                  plus += "<p class='faq-content-box'>"+items.q_content.replace('\n', '<br>')+"<br><br><hr>";
                  if(items.qr_content != null || items.qr_wdate != null){
                     plus += "Share Verni&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+items.qr_wdate.substr(0, 11)+" <br><br> "+items.qr_content+"<hr>";
                  }else{
                     plus += "답변대기중입니다.<hr>";
                  }
               
               
               
                  plus +="</p></details>";
      
               }
               plus +="</div>";
            
            });
            $("#qnaList").html("");
            $("#qnaList").append(plus);
         }
      },
      error:function() {
         alert('er');
      }
   });
}

//글의 총수 가져오기
function getListCount() {	
	$.ajax({
		url:"getQnaCount.do",
		type:"get",
		data:{"p_no":'<%=pd.getP_no()%>',"pageNumber":0 },
		success:function(count){
			loadPage(count);
			
			let plus = "<br><h3 align='left' style='padding-bottom: 10px;'>문의&nbsp;("+count+")</h3>";
			
			$("#allQnaCount").html("");
			$("#allQnaCount").append(plus);
			
			
		}
	});
}


function loadPage( totalCount ) {
	let pageSize = 10;
	let totalPages = Math.floor(totalCount / pageSize);	

	let plus = "";
	if(totalCount % pageSize > 0){
		totalPages+= 1; 
	}
	for( i=0; i< totalPages; i++){
		if(totalPages == i){ // 현재페이지
		plus +="<span style='font-size: 15px; color: black; font-weight: bold; text-decoration: underline;'>"+(i+1)+"</span>&nbsp;&nbsp;&nbsp;";
		}else{
			plus += "<a href='#none' title='"+(i+1)+"페이지' onclick='goPage("+(i+1)+")'"
			      + "style='font-size: 15px; color: gray; font-weight: bold; text-decoration: none;'>" +(i+1)+"</a>&nbsp;&nbsp;&nbsp;";
		}
	}
	$(".page").append(plus);

}

//페이징 이동
function goPage(pageNumber) {
	qnaList( pageNumber - 1 );
}

//qna 팝업
function openQnaPopup() {
   var popup;
   popup = window.open('qnaWrite.do?p_no=${pd.p_no}','popup01','width=430 ,height=650,location=no,status=no,scrollbars=yes');
   popup.addEventListener('beforeunload', function() {
      qnaList(0);
  });
}

// qna 삭제
function qnaDelete(q_no) {
   if(confirm("글을 삭제하시겠습니까?")){
      $.ajax({
         url:"qnaDel.do",
         type:"post",
         data:{"q_no":q_no},
         success:function(data) {
            if(data == true) {
               alert('문의 글이 삭제되었습니다');
               qnaList(0);
            }else {
               alert('삭제 실패');
               return;
            }
         },
         error:function() {
            alert('UMZI qnaDelete error');
         }
      });
   }
}

//qna 수정하기
function qnaUpdate(q_no) {
   var popup;
   popup = window.open('qnaUpdate.do?q_no='+q_no,'popup04','width=430 ,height=650,location=no,status=no,scrollbars=yes');
   popup.addEventListener('beforeunload', function() {
      qnaList(0);
  });
}

function qnaUpdateNo(q_no) {
	alert('수정이 불가합니다');
}


//안쪽 스크롤
$('document').ready(function(){
   updatestatus();
   scrollalert();
});
function updatestatus(){
   //Show number of loaded items
   var totalItems=$('#content p').length;
}
function scrollalert(){
   var scrolltop=$('#scrollbox').attr('scrollTop');
   var scrollheight=$('#scrollbox').attr('scrollHeight');
   var windowheight=$('#scrollbox').attr('clientHeight');
   var scrolloffset=20;
   if(scrolltop>=(scrollheight-(windowheight+scrolloffset)))
   {
      //fetch new items
      $('#status').text('Loading more items...');
      $.get('new-items.html', '', function(newitems){
         $('#content').append(newitems);
         updatestatus();
      });
   }
   setTimeout('scrollalert();', 1500);
}

/////////////////////////////////

$( document ).ready( function() {
        var jbOffset = $( '.jbMenu' ).offset();
        $( window ).scroll( function() {
          if ( $( document ).scrollTop() > jbOffset.top ) {
            $( '.jbMenu' ).addClass( 'jbFixed' );
          }
          else {
            $( '.jbMenu' ).removeClass( 'jbFixed' );
          }
        });
      });




</script>