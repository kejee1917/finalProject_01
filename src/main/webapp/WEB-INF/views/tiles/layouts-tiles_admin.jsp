<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="utf-8" />	<!-- time, encoding -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<tiles:insertAttribute name="header" />		<!-- link파일 -->

<style type="text/css">
.all_wrap { 
	width:100%;
	height:100%;
	/* margin-left:auto; */ 			/* 왼쪽에 최대한 가장 큰 마진을 준다 */
	/* margin-right:auto; */ 			/* 오른쪽에 최대한 가장 큰 마진을 준다 */
	/* background-color: black; */
}

.middle_wrap {
	float:left;
	width:100%;
	height:100%;
	/* background-color: green; */
}

.middle_sidebar_wrap { 
	float:left;
	width:13%;
	height:950px;
	background-color: #323232;
	color: #fff;
}

.top_main_wrap{
	float:left;
	width:100%;
	height:50px;
}

.content_main_wrap { 
 	float:left;
	/* background-color:yellow; */
	width:85%;
	height: 100%;
	/* border-left:solid 1px #EFEFEF;  */
	margin: 10px 10px 10px 15px;		/* 상 우 하 좌 */
	padding: 10px;
}
</style>

</head>
<body>
<div class="all_wrap">
	<div class="middle_wrap">
		<div class="middle_sidebar_wrap">
			<tiles:insertAttribute name="left_menu" />
		</div>
		
		<tiles:insertAttribute name="top_inc" />
		
		<div class="content_main_wrap">
			<tiles:insertAttribute name="main" />
		</div>
	</div>
	<%-- <div class="top_main_wrap">
		<tiles:insertAttribute name="top_inc" />
	</div> --%>
</div>

</body>
</html>






