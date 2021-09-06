<%@page import="verni.co.kr.member.MemberDto"%>
<%@page import="verni.co.kr.util.ProductUtil"%>
<%@page import="verni.co.kr.review.ReviewDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
MemberDto mem = (MemberDto)session.getAttribute("login");
List<ReviewDto> rlist = (List)request.getAttribute("rlist");
List<ReviewDto> blist = (List)request.getAttribute("blist");
int [] lcount = (int [])request.getAttribute("1count");
int [] bcount = (int [])request.getAttribute("bcount");
String  search = request.getParameter("search");

//제품총수b
int len = (int)request.getAttribute("totalCount");

//page 수
int ProductPage = len / 10;		
if ((len % 10 ) > 0){		
	ProductPage += 1;
}


Object obj = request.getAttribute("pageNumber");
int pageNumber = 0;
if(obj != null){
	pageNumber = (Integer)obj; 
}




%>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="./jquery/swiper.min.js"></script>
<link rel="stylesheet" href="./css/swiper.min.css">	
<style type="text/css">
.box-radio-input input[type="radio"] {
	display: none;
}

.box-radio-input input[type="radio"]+span {
	display: inline-block;
	text-align: center;
	width: 60px;
	height: 60px;
	line-height: 60px;
	color: white;
	font-weight: 500;
	cursor: pointer;
	margin-top: 5px;
	padding-bottom: 5px;
	border-radius: 30px;
	background: gray;
	font-weight: 500;
}

.box-radio-input input[type="radio"]:checked+span {
	color: #EEE5DB;
	background: #2E4D58;
}

.fa-star {
	font-size: 13px;
}

.like_btn {
	font-size: 13px;
	border-color: lightgrey;
	border-style: solid;
	border-width: 1px;
	border-radius: 18px;
	background-color: white;
}

.like_modal_btn {
	font-size: 13px;
	border-color: lightgrey;
	border-style: solid;
	border-width: 1px;
	border-radius: 18px;
	background-color: #2E4D58;
}
/* .modal{ 
   position:absolute; width:80%; height:100%; background:black; top:0; left:0; display:none;
} */

/* The Modal (background) */
.searchModal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 10; /* Sit on top */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}
/* Modal Content/Box */
.search-modal-content {
	background: #2E4D58;
	border-radius: 10px;
	margin: 15% auto; /* 15% from the top and centered */
	padding: 20px;
	width: 900px;;
	height: 550px;
	border: 1px solid #888;
	/*width: 30%;  Could be more or less, depending on screen size */
}


	/* 슬라이드 */ 
.swiper-container {
	width: 100%;
	height: 100%;
}

.swiper-slide {
	text-align: center;
	font-size: 18px;
	background: #fff;
	/* Center slide text vertically */
	display: -webkit-box;
	display: -ms-flexbox;
	display: -webkit-flex;
	display: flex;
	-webkit-box-pack: center;
	-ms-flex-pack: center;
	-webkit-justify-content: center;
	justify-content: center;
	-webkit-box-align: center;
	-ms-flex-align: center;
	-webkit-align-items: center;
	align-items: center;
}

.swiper-slide img {
	display: block;
	width: 100%;
	height: 100%;
	object-fit: cover;
}
</style>

<script type="text/javascript">

$(document).ready(function() {
	<%if (search != null){ %>
		$("#<%=search%>").prop("checked", true);
		
	<%}%>
});
</script>
<div class="contianer" style="padding-left: 20%; padding-right: 20%;">
	<div style="width: 100%; background-color: whitesmoke;">
		<div align="left"
			style="padding-left: 5%; padding-top: 30px; background-color: whitesmoke;">
			<h2>
				<b>BEST REVIEW !</b>
			</h2>
			<br>
		</div>
		<!-- 여기부터 -->

		<div class="swiper-container mySwiper">
			<div class="swiper-wrapper">
				<% for(int i = 0; i<blist.size(); i++){
						ReviewDto rv = blist.get(i);
						%>
				<div class="swiper-slide" style="text-align: left;">
					<div
						style="background-color: whitesmoke; width: 100%; height: 350px;">
						<div style="padding-left: 3%; float: left; width: 35%;">
							<%if(rv.getR_newfilename() != null){ %>
							<%String[] bimage = rv.getR_newfilename().split(","); %>
							<img alt='' src='./upload/reviewImage/<%=bimage[0]%>'
								onclick="func(<%=rv.getR_no() %>)"
								style="height: 300px; border-color: lightgrey; border-style: solid; border-width: 1px;">
							<%}else{ %>
							<img alt="..."
								src="./upload/thumbnailImage/<%=rv.getP_newimage1()%>"
								onclick="func(<%=rv.getR_no() %>)"
								style="height: 300px; border-color: lightgrey; border-style: solid; border-width: 1px;">
							<%} %>
						</div>
						<div class="ec-base-box typeThin"
							style="float: left; width: 62%; height: 300px; background-color: white; padding-top: 10px;">
							<div style="width: auto;">
								<%if (rv.getR_scope() == 1) {%>
								<i class="fas fa-star" style="color: #DAA520"></i>&nbsp; <i
									class="fas fa-star" style="color: lightgrey"></i>&nbsp; <i
									class="fas fa-star" style="color: lightgrey"></i>&nbsp; <i
									class="fas fa-star" style="color: lightgrey"></i>&nbsp; <i
									class="fas fa-star" style="color: lightgrey"></i>
								<%} else if (rv.getR_scope() == 2) {%>
								<i class="fas fa-star" style="color: #DAA520"></i>&nbsp; <i
									class="fas fa-star" style="color: #DAA520"></i>&nbsp; <i
									class="fas fa-star" style="color: lightgrey"></i>&nbsp; <i
									class="fas fa-star" style="color: lightgrey"></i>&nbsp; <i
									class="fas fa-star" style="color: lightgrey"></i>
								<%} else if (rv.getR_scope() == 3) {%>
								<i class="fas fa-star" style="color: #DAA520"></i>&nbsp; <i
									class="fas fa-star" style="color: #DAA520"></i>&nbsp; <i
									class="fas fa-star" style="color: #DAA520"></i>&nbsp; <i
									class="fas fa-star" style="color: lightgrey"></i>&nbsp; <i
									class="fas fa-star" style="color: lightgrey"></i>
								<%} else if (rv.getR_scope() == 4) {%>
								<i class="fas fa-star" style="color: #DAA520"></i>&nbsp; <i
									class="fas fa-star" style="color: #DAA520"></i>&nbsp; <i
									class="fas fa-star" style="color: #DAA520"></i>&nbsp; <i
									class="fas fa-star" style="color: #DAA520"></i>&nbsp; <i
									class="fas fa-star" style="color: lightgrey"></i>
								<%} else if (rv.getR_scope() == 5) {%>
								<i class="fas fa-star" style="color: #DAA520"></i>&nbsp; <i
									class="fas fa-star" style="color: #DAA520"></i>&nbsp; <i
									class="fas fa-star" style="color: #DAA520"></i>&nbsp; <i
									class="fas fa-star" style="color: #DAA520"></i>&nbsp; <i
									class="fas fa-star" style="color: #DAA520"></i>&nbsp;
								<%}	%>
							</div>

							<div style="width: auto; padding-top: 10px; height: 138px;">
								<h5 style="line-height: 150%">
									<%if(rv.getR_content().length() > 300){ %>
									<%=rv.getR_content().substring(0, 300)+"..." %>
									<%}else{ %>
									<%=rv.getR_content()%>
									<%} %>
								</h5>
							</div>
							<div style="width: auto; padding-top: 10px; float: left;">
								<h5 style="color: gray;">
									<%=rv.getM_id().substring(0, 3)+"*"%>님의 리뷰&nbsp;&nbsp; &nbsp;|&nbsp;
									&nbsp;
									<%=rv.getR_wdate().substring(2, 11)%>&nbsp; &nbsp;|&nbsp;
								</h5>
							</div>
							<div id="like_td<%=rv.getR_no()%>" align="left"
								style="font-size: 11px; color: grey; float: left; width: 65px; padding-top: 7px;">
								&nbsp; &nbsp;
								<%if (mem == null) {%>
								<button onclick='login()' class='like_btn' style='color: gray;'>
									<div class='material-icons' style="font-size: 18px;">thumb_up_off_alt</div>
									<b style="color: black;"><%=rv.getR_likecount()%></b>
								</button>
								<%} else {
										 	if (bcount[0] == 0) {%>
								<button type="button" class='like_btn'
									id="likes<%=rv.getR_no()%>" onclick='likes(<%=rv.getR_no()%>)'
									style='color: gray;'>
									<div class='material-icons' title='이 리뷰가 도움되었나요?'
										style="font-size: 18px;">thumb_up_off_alt</div>
									<b style="color: black;"><%=rv.getR_likecount()%></b>
								</button>
								<%} else {%>
								<button type="button" class='like_btn'
									id="likes<%=rv.getR_no()%>" onclick='likes(<%=rv.getR_no()%>)'
									style='color: #B22222;'>
									<div class='material-icons' title='취소하시겠습니까?'
										style="font-size: 18px;">thumb_up_off_alt</div>
									<b style="color: black;"><%=rv.getR_likecount()%></b>
								</button>
								<%}
										}%>

							</div>
							<div style="clear: both; padding-top: 2px;">
								<hr>
							</div>

							<div>
								<button type="button" class="wish"
									onclick="location.href='productDetail.do?p_no=<%=rv.getP_no()%>'">
									<div style="width: 100%; height: 50px;">
										<div style="float: left;">
											<img alt="..."
												src="./upload/thumbnailImage/<%=rv.getP_newimage1()%>"
												style="width: 50px; border-color: lightgrey; border-style: solid; border-width: 1px;">
										</div>
										<div
											style="float: left; padding-top: 5px; padding-left: 5px; padding-right: 5px; width: 310px;">
											<h5 align="left" style="color: gray;"><%=ProductUtil.brandName(rv.getP_brand())%>
												>
											</h5>
											<%if(rv.getP_name().length() > 30){ %>
											<h5 align="left" style="color: gray;"><%=rv.getP_name().substring(0, 30)+"..." %></h5>
											<%}else{ %>
											<h5 align="left" style="color: gray;"><%=rv.getP_name()%></h5>
											<%} %>
										</div>
									</div>
								</button>
							</div>
						</div>
					</div>
				</div>

				<!-- 여기까지 -->
				<%} %>
			</div>
			<div class="swiper-button-next" style="color: gray;"></div>
			<div class="swiper-button-prev" style="color: gray;"></div>
		</div>
	</div>
</div>


<div class="contianer"
	style="padding-left: 20%; padding-right: 20%; padding-top: 30px; clear: both;">
	<div align="left" style="padding-left: 5%">
		<h2>
			<b>카테고리별 리뷰</b>
		</h2>
		<br>
	</div>
	<div align="center">
		<form action="reviewList.do" id="frm">
			<table>
				<col width="10%">
				<col width="10%">
				<col width="10%">
				<col width="10%">
				<col width="10%">
				<col width="10%">
				<tr>
					<td><label class="box-radio-input"> <input
							type="radio" name="search" id="all" value="all"> <span><strong>전체</strong></span>
					</label></td>
					<td><label class="box-radio-input"> <input
							type="radio" name="search" id="의류" value="의류"> <span><strong>의류</strong></span>
					</label></td>
					<td><label class="box-radio-input"> <input
							type="radio" name="search" id="가방" value="가방"> <span><strong>가방</strong></span>
					</label></td>
					<td><label class="box-radio-input"> <input
							type="radio" name="search" id="지갑" value="지갑"> <span><strong>지갑</strong></span>
					</label></td>
					<td><label class="box-radio-input"> <input
							type="radio" name="search" id="시계" value="시계"> <span><strong>시계</strong></span>
					</label></td>
					<td><label class="box-radio-input"> <input
							type="radio" name="search" id="패션잡화" value="패션잡화"> <span><strong>패션잡화</strong></span>
					</label></td>
				</tr>
			</table>
		</form>
	</div>
	<br>
	<hr>
	<br>


	<%if(rlist == null || rlist.size() == 0) { %>
	<div height='250px' style='text-align: center; padding-top: 50px; font-size: 14px;'>
		<img src='./image/detail/review.png' width='80px'><br>
		<h3 style="color: #424242; padding-top: 10px;"><b>등록된 상품리뷰가 없습니다.</b></h3>
		이 상품 구매하셨나요? 마이페이지 > 상품리뷰를 작성해주세요!<br>
		<br><br><br>
		</div>

	<%}else{ 
		for(int i=0; i<rlist.size(); i++){
			ReviewDto rv = rlist.get(i);%>

	<div align="left">
		<div
			style="width: 26%; height: 240px; padding-top: 20px; padding-bottom: 30px; float: left;">
			<%if (rv.getR_filename() == null || rv.getR_filename().equals("")) {%>
			<img alt="..." src="./upload/thumbnailImage/<%=rv.getP_newimage1()%>"
				onclick="func(<%=rv.getR_no() %>)"
				style="width: 180px; height: 180px; border-color: lightgrey; border-style: solid; border-width: 1px;">
			<%} else {
			String[] rimage = rv.getR_newfilename().split(",");%>
			<img alt='...' src='./upload/reviewImage/<%=rimage[0]%>'
				onclick="func(<%=rv.getR_no() %>)"
				style="width: 180px; height: 180px; border-color: lightgrey; border-style: solid; border-width: 1px;">
			<%}%>
		</div>

		<div
			style="width: 74%; height: 240px; padding-top: 20px; float: left;">
			<a href="productDetail.do?p_no=<%=rv.getP_no()%>">
				<h5 style="color: gray;"><%=ProductUtil.brandName(rv.getP_brand())%>
					>
				</h5>
				<h5 style="color: gray;"><%=rv.getP_name() %></h5>
			</a>
			<hr>
			<div style="width: auto; padding-top: 5px;">
				<%if (rv.getR_scope() == 1) {%>
				<i class="fas fa-star" style="color: #DAA520"></i>&nbsp; <i
					class="fas fa-star" style="color: lightgrey"></i>&nbsp; <i
					class="fas fa-star" style="color: lightgrey"></i>&nbsp; <i
					class="fas fa-star" style="color: lightgrey"></i>&nbsp; <i
					class="fas fa-star" style="color: lightgrey"></i>
				<%} else if (rv.getR_scope() == 2) {%>
				<i class="fas fa-star" style="color: #DAA520"></i>&nbsp; <i
					class="fas fa-star" style="color: #DAA520"></i>&nbsp; <i
					class="fas fa-star" style="color: lightgrey"></i>&nbsp; <i
					class="fas fa-star" style="color: lightgrey"></i>&nbsp; <i
					class="fas fa-star" style="color: lightgrey"></i>
				<%} else if (rv.getR_scope() == 3) {%>
				<i class="fas fa-star" style="color: #DAA520"></i>&nbsp; <i
					class="fas fa-star" style="color: #DAA520"></i>&nbsp; <i
					class="fas fa-star" style="color: #DAA520"></i>&nbsp; <i
					class="fas fa-star" style="color: lightgrey"></i>&nbsp; <i
					class="fas fa-star" style="color: lightgrey"></i>
				<%} else if (rv.getR_scope() == 4) {%>
				<i class="fas fa-star" style="color: #DAA520"></i>&nbsp; <i
					class="fas fa-star" style="color: #DAA520"></i>&nbsp; <i
					class="fas fa-star" style="color: #DAA520"></i>&nbsp; <i
					class="fas fa-star" style="color: #DAA520"></i>&nbsp; <i
					class="fas fa-star" style="color: lightgrey"></i>
				<%} else if (rv.getR_scope() == 5) {%>
				<i class="fas fa-star" style="color: #DAA520"></i>&nbsp; <i
					class="fas fa-star" style="color: #DAA520"></i>&nbsp; <i
					class="fas fa-star" style="color: #DAA520"></i>&nbsp; <i
					class="fas fa-star" style="color: #DAA520"></i>&nbsp; <i
					class="fas fa-star" style="color: #DAA520"></i>&nbsp;
				<%}	%>
			</div>
			<div style="width: auto; padding-top: 5px; height: 58px;">
				<%-- <pre><%=rv.getR_content() %></pre> --%>
				<h5 style="color: #000000;">
					<%if(rv.getR_content().length() > 246){ %>
					<%=rv.getR_content().substring(0, 246)+"..." %>
					<%}else{ %>
					<%=rv.getR_content()%>
					<%} %>
				</h5>
			</div>
			<div style="width: auto; padding-top: 20px; float: left;">
				<h5 style="color: gray;">
					<%=rv.getM_id().substring(0, 3)+"*"%>님의 리뷰&nbsp; &nbsp; &nbsp;|&nbsp;
					&nbsp;
					<%=rv.getR_wdate().substring(2, 11)%>&nbsp; &nbsp;|&nbsp;
				</h5>
			</div>
			<div id="like_td<%=rv.getR_no()%>" align="left"
				style="font-size: 11px; color: grey; float: left; width: 65px; padding-top: 17px;">
				&nbsp; &nbsp;
				<%if (mem == null) {%>
				<button onclick='login()' class='like_btn' style='color: gray;'>
					<span class='material-icons' style="font-size: 18px;">thumb_up_off_alt</span><b
						style="color: black;"><%=rv.getR_likecount()%></b>
				</button>
				<%} else {
					 	if (lcount[i] == 0) {%>
				<button type="button" class='like_btn' id="likes<%=rv.getR_no()%>"
					onclick='likes(<%=rv.getR_no()%>)' style='color: gray;'>
					<span class='material-icons' title='이 리뷰가 도움되었나요?'
						style="font-size: 18px;">thumb_up_off_alt</span> <b
						style="color: black;"><%=rv.getR_likecount()%></b>
				</button>
				<%} else {%>
				<button type="button" class='like_btn' id="likes<%=rv.getR_no()%>"
					onclick='likes(<%=rv.getR_no()%>)' style='color: #B22222;'>
					<span class='material-icons' title='취소하시겠습니까?'
						style="font-size: 18px;">thumb_up_off_alt</span> <b
						style="color: black;"><%=rv.getR_likecount()%></b>
				</button>
				<%}
					}%>
			</div>
		</div>
	</div>
	
	
	
	
	<div style="clear: both;">
		<hr>
	</div>


	<div id="modal<%=rv.getR_no()%>" class="searchModal">
		<div class="search-modal-content">
			<div
				style="width: 400px; height: 400px; float: left; ">
				<%
					if (rv.getR_filename() == null || rv.getR_filename().equals("")) {
					%>
				<img alt="..."
					src="./upload/thumbnailImage/<%=rv.getP_newimage1()%>"
					width="400px"
					style="border-color: lightgrey; border-style: solid; border-width: 1px; margin: auto; ">

				<%
					} else {
						String[] rimage = rv.getR_newfilename().split(",");
							if(!rv.getR_newfilename().contains(",")){ 
					%>
							 <img alt="..." src="./upload/reviewImage/<%=rv.getR_newfilename()%>"  style="width: 400px; height: 400px; border-color: lightgrey; border-style: solid; border-width: 1px; margin: auto;">
							<%}else{ %> 
							<div class="swiper-container mySwiper2">
								<div class="swiper-wrapper">
									<%	for (int j = 0; j < rimage.length; j++) { %>
									<div class="swiper-slide">
										<img alt="..." src="./upload/reviewImage/<%=rimage[j]%>"  style=" border-color: lightgrey; border-style: solid; border-width: 1px; margin: auto;">
									</div>
			
									<%
										}	%>
								</div>
								<div class="swiper-button-next" style="color: gray;"></div>
								<div class="swiper-button-prev" style="color: gray;"></div>
							</div>

				<%			}	
					}
					%>

			</div>


			<div style="width: 5%; float: left;">&nbsp;&nbsp;&nbsp;</div>

			<div style="width: 40%; float: left; padding-right: 2%" align="left">
				<div style="width: auto; padding-top: 20px;">
					<%if (rv.getR_scope() == 1) {%>
					<i class="fas fa-star" style="color: #DAA520"></i>&nbsp; <i
						class="fas fa-star" style="color: lightgrey"></i>&nbsp; <i
						class="fas fa-star" style="color: lightgrey"></i>&nbsp; <i
						class="fas fa-star" style="color: lightgrey"></i>&nbsp; <i
						class="fas fa-star" style="color: lightgrey"></i>
					<%} else if (rv.getR_scope() == 2) {%>
					<i class="fas fa-star" style="color: #DAA520"></i>&nbsp; <i
						class="fas fa-star" style="color: #DAA520"></i>&nbsp; <i
						class="fas fa-star" style="color: lightgrey"></i>&nbsp; <i
						class="fas fa-star" style="color: lightgrey"></i>&nbsp; <i
						class="fas fa-star" style="color: lightgrey"></i>
					<%} else if (rv.getR_scope() == 3) {%>
					<i class="fas fa-star" style="color: #DAA520"></i>&nbsp; <i
						class="fas fa-star" style="color: #DAA520"></i>&nbsp; <i
						class="fas fa-star" style="color: #DAA520"></i>&nbsp; <i
						class="fas fa-star" style="color: lightgrey"></i>&nbsp; <i
						class="fas fa-star" style="color: lightgrey"></i>
					<%} else if (rv.getR_scope() == 4) {%>
					<i class="fas fa-star" style="color: #DAA520"></i>&nbsp; <i
						class="fas fa-star" style="color: #DAA520"></i>&nbsp; <i
						class="fas fa-star" style="color: #DAA520"></i>&nbsp; <i
						class="fas fa-star" style="color: #DAA520"></i>&nbsp; <i
						class="fas fa-star" style="color: lightgrey"></i>
					<%} else if (rv.getR_scope() == 5) {%>
					<i class="fas fa-star" style="color: #DAA520"></i>&nbsp; <i
						class="fas fa-star" style="color: #DAA520"></i>&nbsp; <i
						class="fas fa-star" style="color: #DAA520"></i>&nbsp; <i
						class="fas fa-star" style="color: #DAA520"></i>&nbsp; <i
						class="fas fa-star" style="color: #DAA520"></i>&nbsp;
					<%}	%>
				</div>
				<div style="width: auto; padding-top: 20px;">
					<%-- <pre><%=rv.getR_content().replace("\n", "<br>") %></pre> --%>
					<h5 style="color: white;"><%=rv.getR_content()%></h5>
				</div>
				<div style="width: auto; padding-top: 20px; float: left;">
					<h5 style="color: #CCCCCC;">
						<%=rv.getM_id().substring(0, 3)+"*"%>&nbsp; &nbsp;|&nbsp; &nbsp;
						<%=rv.getR_wdate().substring(2, 11)%>&nbsp; &nbsp;|&nbsp;
					</h5>
				</div>
				<div id="like<%=rv.getR_no()%>" align="left"
					style="font-size: 11px; color: #CCCCCC; float: left; width: 65px; padding-top: 17px;">
					&nbsp; &nbsp;
					<%if (mem == null) {%>
					<button onclick='login()' class='like_modal_btn'
						style='color: #CCCCCC; background-color: #2E4D58;'>
						<span class='material-icons' style="font-size: 18px;">thumb_up_off_alt</span><b
							style="color: #CCCCCC;"><%=rv.getR_likecount()%></b>
					</button>
					<%} else {
						 	if (lcount[i] == 0) {%>
					<button type="button" class='like_modal_btn'
						id="like<%=rv.getR_no()%>" onclick='like(<%=rv.getR_no()%>)'
						style='color: #CCCCCC; background-color: #2E4D58;'>
						<span class='material-icons' title='이 리뷰가 도움되었나요?'
							style="font-size: 18px;">thumb_up_off_alt</span> <b
							style="color: #CCCCCC;"><%=rv.getR_likecount()%></b>
					</button>
					<%} else {%>
					<button type="button" class='like_modal_btn'
						id="like<%=rv.getR_no()%>" onclick='like(<%=rv.getR_no()%>)'
						style='color: #B22222; background-color: #2E4D58;'>
						<span class='material-icons' title='취소하시겠습니까?'
							style="font-size: 18px;">thumb_up_off_alt</span> <b
							style="color: #CCCCCC;"><%=rv.getR_likecount()%></b>
					</button>
					<%}
						}%>
				</div>

				<div style="clear: both; padding-top: 10%; width: 400px; margin: 2%">
					<button type="button"
						onclick="location.href='productDetail.do?p_no=<%=rv.getP_no()%>'"
						style="background: #1D292C;">
						<div style="width: 100%; background: #1D292C; height: 60px;">
							<div style="float: left; padding: 5px;">
								<img alt="..."
									src="./upload/thumbnailImage/<%=rv.getP_newimage1()%>"
									style="width: 50px; border-color: lightgrey; border-style: solid; border-width: 1px;">
							</div>
							<div
								style="float: left; padding-top: 10px; padding-left: 5px; padding-right: 5px; width: 310px;">
								<h5 align="left" style="color: gray;"><%=ProductUtil.brandName(rv.getP_brand())%>
									>
								</h5>
								<%if(rv.getP_name().length() > 30){ %>
								<h5 align="left" style="color: gray;"><%=rv.getP_name().substring(0, 30)+"..." %></h5>
								<%}else{ %>
								<h5 align="left" style="color: gray;"><%=rv.getP_name()%></h5>
								<%} %>
							</div>
						</div>
					</button>
				</div>
			</div>



			<div style="padding-top: 50px; height: 120px;clear: both;">
				<button onClick="closeModal();" style="background-color:#1D292C; text-align: center; padding-bottom: 10px; font-size:15px; width: 100%; height: 40px; border: 0; padding-top:5px; color: white;">
					닫기
				</button>
			
			
			
				<!-- <div
					style="cursor: pointer; background-color: #DDDDDD; text-align: center; padding-bottom: 10px; padding-top: 10px; clear: both; "
					onClick="closeModal();">
					<span class="pop_bt modalCloseBtn" style="font-size: 13pt;">닫기</span>
				</div> -->
			</div>
		</div>
	</div>


	<%}
	} %>

</div>

<br>
<br>
<div align="center">
	<% 
for(int i=0; i< ProductPage; i++){
	if(pageNumber == i){
	%>
	<span style="font-size: 15px; color: black; font-weight: bold; text-decoration: underline;">
		<%=i+1 %>
	</span>&nbsp;
	<%}else{ %>
	<a href="#none" title="<%=i+1 %>페이지" onclick="goPage(<%=i %>)"
		style="font-size: 15px; color: gray; font-weight: bold; text-decoration: none;">
		<%=i+1 %>
	</a>&nbsp;
<% }	
} %>
</div>
<div style="height: 200px;"></div>
<script type="text/javascript">
function func(odno) {
	   $("#modal"+ odno).show();
	}
function closeModal() {
	   $('.searchModal').hide();
	};

	$(".box-radio-input").click(function() {
		$("#frm").submit();
	});
	
	function likes(r_no) {
		$.ajax({
			url:"addLike.do",
			type:"post",
			data:{"r_no":r_no},
			success:function(data){
			//	alert(data.substr(3));
			//	alert(data.substr(0, 3));
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
	
	// 팝업용
	function like(r_no) {
		$.ajax({
			url:"addLike.do",
			type:"post",
			data:{"r_no":r_no},
			success:function(data){
			//	alert(data.substr(3));
			//	alert(data.substr(0, 3));
				let plus = ""; 

				if(data.substr(0, 3) == 'add'){
					plus += "&nbsp;&nbsp;&nbsp;&nbsp;<button type='button' class='like_btn' id='like"+r_no+"' onclick='like("+r_no+")' style='color:#B22222;background-color:#2E4D58;'><span class='material-icons' style='font-size: 18px;'>thumb_up_off_alt</span><b style='color: #CCCCCC;'>"+data.substr(3)+"</b></button>";
				}else{
					plus += "&nbsp;&nbsp;&nbsp;&nbsp;<button type='button' class='like_btn' id='like"+r_no+"' onclick='like("+r_no+")' style='color:#CCCCCC;background-color:#2E4D58;'><span class='material-icons' style='font-size: 18px;'>thumb_up_off_alt</span><b style='color: #CCCCCC;'>"+data.substr(3)+"</b></button>";
				}
				$("#like"+r_no).html("");
				$("#like"+r_no).append(plus);
			},
			error:function(){
				alert('리뷰 좋아요 에러');
			}
		});
	}
	
	
	function reviewDetail(r_no){
		$("#modal"+r_no).fadeIn();
		$("#modal_content"+r_no).click(function(){ 
			$("#modal"+r_no).fadeOut(); 
		}); 
	}
	
	
	function login() {
		if(confirm("로그인을 하시겠습니까?")){
			let url = window.document.location.href;
			location.href='login.do?url='+url;
		}
	}
	
	
	function goPage(pageNumber) {
		url = window.document.location.href;
		var count = url.indexOf('pageNumber');
		let url2 = "";
		if(count != -1){
			url2 = url.slice(0,count-1);
		}else{
			url2 = url;
		}
//		alert(url2);
		// pageNum까지 넘기기
		location.href = url2+'&pageNumber=' + pageNumber;
	}
	
	// 슬라이더
	var swiper = new Swiper(".mySwiper", {
        navigation: {
          nextEl: ".swiper-button-next",
          prevEl: ".swiper-button-prev",
        },
      });

	// 슬라이더
	var swiper2 = new Swiper(".mySwiper2", {
        navigation: {
          nextEl: ".swiper-button-next",
          prevEl: ".swiper-button-prev",
        },
      });

	</script>











