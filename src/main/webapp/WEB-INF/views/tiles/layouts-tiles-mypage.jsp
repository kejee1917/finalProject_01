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


</head>
<body>

<div style=" width: 100%;">
	<div>
		<tiles:insertAttribute name="top_inc" />
		<tiles:insertAttribute name="top_menu" />
	</div>
	
	<div>
		<div style="width: 20%; margin-left:12%; float: left; " >
			<tiles:insertAttribute name="left_menu" />
		</div>
		<div style=" width: 65%; margin-right:3%; float: left;  " >
			<tiles:insertAttribute name="main" />
		</div>		
	</div>
	
	<div>
		<tiles:insertAttribute name="bottom_inc" />
	</div>	
</div>




</body>
</html>






