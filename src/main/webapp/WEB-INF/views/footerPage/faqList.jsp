<%@page import="verni.co.kr.member.MemberDto"%>
<%@page import="verni.co.kr.faq.FaqDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
MemberDto mem = (MemberDto)session.getAttribute("login");
%>
<link rel="stylesheet" href="./css/footer/faq.css?after" type="text/css">
<style>

</style>


<title>Share Verni</title>

<meta content="authenticity_token" name="csrf-param" />
<meta content="kdkNpm58S3+DNQnU3kC4P0xtNyOhDDFvpNNLqiB0gbo=" name="csrf-token" />

        
<!-- Page hiding snippet (recommended) -->
<style>.async-hide { opacity: 0 !important} </style>
  

<div class="container-wrap-1410">
<div class="common-container-1410 cs-container">
	<div class="cs-header-box">
  	<h3 class="cs-header-text">CUSTOMER SERVICE</h3>
	</div>

  <div class="cs-noti-box cs-noti-box-1">
		<h2 class="noti-text-big">고객님,<br>
		<b>무엇을 도와드릴까요?<br>
		<span class="call-num">777-7777</span></b></h2>
		<br>
		평일: 10:00 ~ 18:00 (점심시간: 13:30 ~ 14:30) <br>토요일과 법정공휴일은 휴무입니다.
  </div>
  <div class="cs-noti-box cs-noti-box-2">
		<div class="noti-box-col">
		  <h2 class="noti-text-big"><b>1 : 1 문의</b></h2>
		  통화량이 많아 고객센터 전화연결이 어려우실 경우<br>
		  1:1 문의게시판에 글을 남겨 주십시오.<br>
		  최대한 신속하게 답변을 드리겠습니다.
		  <%if(mem == null){ %>
		  <a href="javascript:void(0)" onclick="login()" class="qna-link" style="width: 40px;height: 20px;">GO &gt;</a>
		  <%}else{ %>
		  <a href="myqna.do?menu=myqna" class="qna-link" style="width: 40px;height: 20px;">GO &gt;</a>
		  <%} %>
		  <div class="cs-icon qna"></div>
		</div>
		<div class="noti-box-col">
		  <h2 class="noti-text-big"><b>상담톡</b></h2>
		  웹사이트 우측 하단에 있는 '상담톡'을 통해<br>
		  간편하게 문의 가능합니다.
		  <div class="cs-icon channel-talk"></div>
		</div>
  </div>
</div>
</div>

<div class="wrapper">
	<div class="cs-header-box">
	<h3 class="cs-header-text"><i class="far fa-question-circle" style="color: gray;"></i>&nbsp;FAQ</h3>
	</div>
	<br>
	<!-- <br>
	<div align="right">
		<input type="button" onclick="location.href='faqWrite.do'"
			value="FAQ작성">
	</div>
	<br>
	<hr>
	<br> -->

	<ul class="tabs clearfix" data-tabgroup="first-tab-group" style="width: 100%; margin:0; padding:0; ">
		<li><a href="#tab1" class="active">회원가입/탈퇴</a></li>
		<li><a href="#tab2">회원정보</a></li>
		<li><a href="#tab3">로그인</a></li>
		<li><a href="#tab4">주문/결제</a></li>
		<li><a href="#tab5">상품관련</a></li>
		<li><a href="#tab6">배송</a></li>
		<li><a href="#tab7">반납</a></li>

	</ul>

	<section id="first-tab-group" class="tabgroup">

		<div id="tab1" >
			<c:if test="${empty faq1}">
		작성된 FAQ가 없습니다.
		</c:if>
			<c:forEach items="${faq1}" var="faq" varStatus="i">

				<details>
					<summary class="faq-title-box typeThin">${faq.f_title}</summary>
					<p class="faq-content-box">
						<% pageContext.setAttribute("newLineChar", "\n"); %>
						${fn:replace(faq.f_content, newLineChar, "<br/>")}
					</p>
				</details>

			</c:forEach>
		</div>
		<div id="tab2">	
			<c:if test="${empty faq2}">
		작성된 FAQ가 없습니다.
		</c:if>
			<c:forEach items="${faq2}" var="faq" varStatus="i">

				<details>
					<summary class="faq-title-box typeThin">${faq.f_title}</summary>
					<p class="faq-content-box">
						<% pageContext.setAttribute("newLineChar", "\n"); %>
						${fn:replace(faq.f_content, newLineChar, "<br/>")}
					</p>
				</details>

			</c:forEach>
		</div>

		<div id="tab3">
			<c:if test="${empty faq3}">
		작성된 FAQ가 없습니다.
		</c:if>
			<c:forEach items="${faq3}" var="faq" varStatus="i">

				<details>
					<summary class="faq-title-box typeThin">${faq.f_title}</summary>
					<p class="faq-content-box">
						<% pageContext.setAttribute("newLineChar", "\n"); %>
						${fn:replace(faq.f_content, newLineChar, "<br/>")}
					</p>
				</details>

			</c:forEach>
		</div>

		<div id="tab4">
			<c:if test="${empty faq4}">
		작성된 FAQ가 없습니다.
		</c:if>
			<c:forEach items="${faq4}" var="faq" varStatus="i">

				<details>
					<summary class="faq-title-box typeThin">${faq.f_title}</summary>
					<p class="faq-content-box">
						<% pageContext.setAttribute("newLineChar", "\n"); %>
						${fn:replace(faq.f_content, newLineChar, "<br/>")}
					</p>
				</details>

			</c:forEach>
		</div>

		<div id="tab5">
			<c:if test="${empty faq5}">
		작성된 FAQ가 없습니다.
		</c:if>
			<c:forEach items="${faq5}" var="faq" varStatus="i">

				<details>
					<summary class="faq-title-box typeThin">${faq.f_title}</summary>
					<p class="faq-content-box">
						<% pageContext.setAttribute("newLineChar", "\n"); %>
						${fn:replace(faq.f_content, newLineChar, "<br/>")}
					</p>
				</details>

			</c:forEach>
		</div>

		<div id="tab6">
			<c:if test="${empty faq6}">
		작성된 FAQ가 없습니다.
		</c:if>
			<c:forEach items="${faq6}" var="faq" varStatus="i">

				<details>
					<summary class="faq-title-box typeThin">${faq.f_title}</summary>
					<p class="faq-content-box">
						<% pageContext.setAttribute("newLineChar", "\n"); %>
						${fn:replace(faq.f_content, newLineChar, "<br/>")}
					</p>
				</details>

			</c:forEach>
		</div>

		<div id="tab7">
			<c:if test="${empty faq7}">
		작성된 FAQ가 없습니다.
		</c:if>
			<c:forEach items="${faq7}" var="faq" varStatus="i">

				<details>
					<summary class="faq-title-box typeThin">${faq.f_title}</summary>
					<p class="faq-content-box">
						<% pageContext.setAttribute("newLineChar", "\n"); %>
						${fn:replace(faq.f_content, newLineChar, "<br/>")}
					</p>
				</details>

			</c:forEach>
		</div>
	</section>
</div>

<div style="height: 200px;"></div>
<script type="text/javascript">
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
  
});

function login() {
	if(confirm("로그인을 하시겠습니까?")){
		let url = window.document.location.href;
		location.href='login.do?url='+url;
	}
}

</script>
