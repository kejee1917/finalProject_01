<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
.navbar{
	font-family: 'SpoqaHanSansNeo-Regular';
}
@font-face {
    font-family: 'SpoqaHanSansNeo-Regular';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2108@1.1/SpoqaHanSansNeo-Regular.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
.bg-dark {
    background-color: white!important;
}
.nav-link{
color: black;
}
</style>

<div style="width: auto;" align="center">
	<div class="contianer" style="padding-left: 11%; padding-right: 11%;"
		align="center">
	<br>

		<!-- 기존꺼 -->
		<div class="container" style="width: auto; height: 40px;  ">
			<nav class="navbar navbar-expand-md bg-dark navbar-dark" style="border-radius: 0; padding: 0; margin: 0;  height: 30px; ">
				<div class="collapse navbar-collapse" id="collapsibleNavbar">
					<ul class="navbar-nav">
						<li class="nav-item  active"><a class="nav-link" href="main.do" style="font-size: 14px; padding-left: 150px;color: black;">Home&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<span class="sr-only">(current)</span>
						</a></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false" style="font-size: 14px; color: black;">의류</a>
							<div class="dropdown-menu" aria-labelledby="navbarDropdown">
								<a class="dropdown-item" href="productList.do?p_type1=의류">전체</a>
								<a class="dropdown-item" href="productList.do?p_type1=의류&p_type2=아우터">아우터</a> 
								<a class="dropdown-item" href="productList.do?p_type1=의류&p_type2=드레스">드레스</a> 
								<a class="dropdown-item" href="productList.do?p_type1=의류&p_type2=투피스">투피스</a> 
								<a class="dropdown-item" href="productList.do?p_type1=의류&p_type2=상의">상의</a> 
								<a class="dropdown-item" href="productList.do?p_type1=의류&p_type2=하의">하의</a>
							</div></li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false" style="font-size: 14px;color: black;"> 가방 </a>
							<div class="dropdown-menu" aria-labelledby="navbarDropdown">
								<a class="dropdown-item" href="productList.do?p_type1=가방">전체</a>
								<a class="dropdown-item"
									href="productList.do?p_type1=가방&p_type2=토트백">토트백</a> <a
									class="dropdown-item"
									href="productList.do?p_type1=가방&p_type2=숄더백">숄더백</a> <a
									class="dropdown-item"
									href="productList.do?p_type1=가방&p_type2=크로스백">크로스백</a> <a
									class="dropdown-item"
									href="productList.do?p_type1=가방&p_type2=클러치">클러치</a> <a
									class="dropdown-item"
									href="productList.do?p_type1=가방&p_type2=백팩">백팩</a> <a
									class="dropdown-item"
									href="productList.do?p_type1=가방&p_type2=트래블백">트래블백</a>
							</div></li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false" style="font-size: 14px;color: black;"> 지갑 </a>
							<div class="dropdown-menu" aria-labelledby="navbarDropdown">
								<a class="dropdown-item" href="productList.do?p_type1=지갑">전체</a>
								<a class="dropdown-item"
									href="productList.do?p_type1=지갑&p_type2=장지갑">장지갑</a> <a
									class="dropdown-item"
									href="productList.do?p_type1=지갑&p_type2=반지갑">중지갑/반지갑</a> <a
									class="dropdown-item"
									href="productList.do?p_type1=지갑&p_type2=머니클립">머니클립</a> <a
									class="dropdown-item"
									href="productList.do?p_type1=지갑&p_type2=명함지갑">카드/명함지갑</a> <a
									class="dropdown-item"
									href="productList.do?p_type1=지갑&p_type2=동전지갑">동전지갑</a>
							</div></li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false" style="font-size: 14px;color: black;"> 시계 </a>
							<div class="dropdown-menu" aria-labelledby="navbarDropdown">
								<a class="dropdown-item" href="productList.do?p_type1=시계">전체</a>
								<a class="dropdown-item"
									href="productList.do?p_type1=시계&p_type2=메탈">메탈</a> <a
									class="dropdown-item"
									href="productList.do?p_type1=시계&p_type2=가죽">가죽</a>
							</div></li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false" style="font-size: 14px;color: black;"> 패션잡화 </a>
							<div class="dropdown-menu" aria-labelledby="navbarDropdown">
								<a class="dropdown-item" href="productList.do?p_type1=패션잡화">전체</a>
								<a class="dropdown-item"
									href="productList.do?p_type1=패션잡화&p_type2=모자">모자</a> <a
									class="dropdown-item"
									href="productList.do?p_type1=패션잡화&p_type2=스카프">스카프/머플러</a> <a
									class="dropdown-item"
									href="productList.do?p_type1=패션잡화&p_type2=넥타이">넥타이</a> <a
									class="dropdown-item"
									href="productList.do?p_type1=패션잡화&p_type2=벨트">벨트</a> <a
									class="dropdown-item"
									href="productList.do?p_type1=패션잡화&p_type2=장갑">장갑</a> <a
									class="dropdown-item"
									href="productList.do?p_type1=패션잡화&p_type2=썬글라스">썬글라스</a>
							</div></li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

						<li class="nav-item"><a class="nav-link"
							href="reviewList.do?search=all" style="font-size: 14px;color: black;">리뷰&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<span class="sr-only">(current)</span>
						</a></li>
						<li class="nav-item"><a class="nav-link"
							href="faqList.do?f_category=회원가입/탈퇴"  style="font-size: 14px;color: black;">FAQ&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<span class="sr-only">(current)</span>
						</a></li>
						<li class="nav-item"><a class="nav-link"
							href="event.do" style="font-size: 14px;color: black;">이벤트&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<span class="sr-only">(current)</span>
						</a></li>
					</ul>
					<button class="navbar-toggler" type="button" data-toggle="collapse"
						data-target="#collapsibleNavbar">
						<span class="navbar-toggler-icon"></span>
					</button>
				</div>
			</nav>
			

			<br>
		</div>

<hr>










	</div>
</div>



