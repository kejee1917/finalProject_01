<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="utf-8" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<tiles:insertAttribute name="header" />


</head>
<body>

<div class="contianer"  style=" width: 100%; margin-bottom: 20px">
	<div>
		<tiles:insertAttribute name="top_inc" />
		<tiles:insertAttribute name="top_menu" />
	</div>
	
	<div>
		<div style=" width: 100%; margin-bottom: 20px; ">
			<tiles:insertAttribute name="top" />
		</div>
		<div style="">
			<tiles:insertAttribute name="content"  />
		</div>		
	</div>	
	<div style="justify-content: flex-end;">
		<tiles:insertAttribute name="bottom_inc" />
	</div>
</div>