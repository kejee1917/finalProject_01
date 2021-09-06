<%@page import="verni.co.kr.chat.ChatRoomDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%   
   /*  request.setCharacterEncoding("UTF-8");
    List<ChatRoomDto> list = (List<ChatRoomDto>)request.getAttribute("roomList"); */
%>
<!DOCTYPE html>
<html>
<head>
<title>Web Socket Example</title>
<style>
/* 여러 채팅창 간의 간격과 배열 위치*/
.float-left{
float:left;
margin: 5px;
}

/* #table_container{
text-align: center;
} */
/* 
#list th td{
font-size: 15px;
} */
    
.top_table{
	margin-bottom: 10px;
}

.adminlist_table{
	border-collapse:collapse;
	border-right: hidden;
	border-left: hidden;
	width: 100%;
	margin-top: 10px;
}

.adminlist_table th{
	border-top: outset;
	border-bottom: outset;
	background-color: #e9e9e9;
	padding: 10px;
	text-align: center;
}

.adminlist_table td{
	border-bottom: outset;
	border-bottom-width: thin;
	padding: 10px;
	text-align: center;
}

</style>
</head>
<body>
<table class="top_table">
	<tr>
		<td>
			<img src="./image/admin/chat.png" width='30px' height='30px'>
		</td>
		
		<td style="padding-left: 10px;">
			<b style="font-size: 30px;">채팅 목록</b>
		</td>
	</tr>
</table>
<div id="table_container">
<!-- 유저가 접속할 때마다 이 템플릿으로 채팅방을 생성한다. -->


<!-- <div class="template" style="display:none">-->

<div style="height: 800px;">
	<table class="adminlist_table" id="list" border="1">
	<col width="70px"><col width="100"><col width="300px"><col width="150px"><col width="100px">
	<tr>
		<th>번호</th>
		<th>아이디</th>
		<th>상담내용</th>
		<th>시간</th>
		<th>상태</th>
	</tr>
	<c:if test="${empty roomList}">
	<tr>
		<td colspan=5>
			<p style="margin-bottom: -1px;">진행중인 상담이 없습니다.</p>
		</td>
	</tr>
	</c:if>
	
	<c:if test="${not empty roomList}">
	<c:forEach items="${roomList}" var="chatRoom" varStatus="i">
	<tr <c:if test="${chatRoom.r_status eq '상담종료'}">style="color: #D3D3D3"</c:if> >
		<td>${i.count}</td>
		<td>
			<c:choose>
			        <c:when test="${fn:length(chatRoom.r_uid) gt 20}">
			        <c:out value="비회원">
			        </c:out></c:when>
			        <c:otherwise>
			        <c:out value="${chatRoom.r_uid}">
			        </c:out></c:otherwise>
			</c:choose>
		</td>
		<td class="roomInfo" style="cursor:pointer;" onclick="location.href='adminchat.do?r_no=${chatRoom.r_no}&key=${chatRoom.r_uid}'"><input class="key" type="hidden" value="${chatRoom.r_uid}"><div class='getChat' style='float:left; display:inline;'>
			<c:choose>
			        <c:when test="${fn:length(chatRoom.c_message) gt 26}">
			        <c:out value="${fn:substring(chatRoom.c_message, 0, 25)}" />...
			        </c:when>
			        <c:otherwise>
			        <c:out value="${chatRoom.c_message}">
			        </c:out></c:otherwise>
			</c:choose>
		</div><c:if test="${chatRoom.readcount != 0 && chatRoom.r_status != '상담종료'}"><div style="margin-right:5px; float:right; display:inline-block; color:white; border-radius: 50px 50px 50px 50px; background-color: red; width:20px;">${chatRoom.readcount}</div></c:if></td>
		<td><div class='time'>${chatRoom.c_time}</div></td>
		<td>${chatRoom.r_status}</td>
	</tr>
	</c:forEach>
	</c:if>
	</table>
</div>

<!-- </div> -->

</div>



<!-- 소스를 간단하게 하기 위하 Jquery를 사용했습니다. -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
let roomList = new Array();
//makeRoomList();

function makeRoomList(){
<c:forEach items="${roomList}" var="chatRoom" varStatus="i">
roomList.push({
	r_no : ${chatRoom.r_no},
	r_uid : "${chatRoom.r_uid}",
	r_status : "${chatRoom.r_status}",
	c_message : "${chatRoom.c_message}",
	c_time : "${chatRoom.c_time}",
	c_no : ${chatRoom.c_no},
	readcount : ${chatRoom.readcount}
});
</c:forEach>
}


// 서버의 admin의 서블릿으로 웹 소켓을 한다.
var webSocket = new WebSocket("ws://localhost:8090/a_verni/admin");

// 운영자에서의 open, close, error는 의미가 없어서 형태만 선언
webSocket.onopen = function(message) { };
webSocket.onclose = function(message) { };
webSocket.onerror = function(message) { };

let number = 1; // tr이나 리스트 수 세서... 해야겠는걸 아니ㅕㅁㄴ 마지막 number가져와서 +1
// 서버로 부터 메시지가 오면
webSocket.onmessage = function(message) {
// 메시지의 구조는 JSON 형태로 만들었다.
let node = JSON.parse(message.data);
// 메시지의 status는 유저의 접속 형태이다.
// visit은 유저가 접속했을 때 알리는 메시지다.

	    	 

/*
// 위 템플릿 div를 취득한다.
let form = $(".template").html();
let $div = $("[data-key='"+node.key+"']");
//console영역을 찾는다.
let log = $div.find(".getChat").html();
// div를 감싸고 속성 data-key에 unique키를 넣는다.
form = $("<td onclick='location.href=\"adminchat.do?r_no=" + node.r_no +"\"'><div class='getMessage'></div></td>").attr("data-key",node.key).append(form);
//number = number+1;
// table에 추가한다.
$(".getChat").append(form);
//alert(node.key); ==> e1241uf235rq7w7137 비회원 / 회원일 때... ㄱ-  로그인 : 세션받아와서 연결, 비회원 : 비회원

*/




if(node.status === "visit") {
/* // 위 템플릿 div를 취득한다.
let form = $(".template").html();
let $div = $("[data-key='"+node.key+"']");
//console영역을 찾는다.
let log = $div.find(".getChat").html();
// div를 감싸고 속성 data-key에 unique키를 넣는다.
form = $("<td onclick='location.href=\"adminchat.do?r_no=" + node.r_no +"\"'><div class='getMessage'></div></td>").attr("data-key",node.key).append(form);
//number = number+1;
// table에 추가한다.
$(".getChat").append(form);
//alert(node.key); ==> e1241uf235rq7w7137 비회원 / 회원일 때... ㄱ-  로그인 : 세션받아와서 연결, 비회원 : 비회원 */


// message는 유저가 메시지를 보낼 때 알려주는 메시지이다.
} else if(node.status === "message") {

// 최신 메시지 맨위로	
 	$.ajax({
	    url:"adminchatlist.do",
	    type:"GET",
	    async: false,
	    success:function(data){
	    	
	     	$("#table_container").empty();

/* 	    	let str='<table>';
	    	str += '<col width="70px"><col width="300px"><col width="150px"><col width="100px">';
	    	str += '<tr><th>번호</th><th>상담내용</th><th>시간</th><th>상태</th></tr>';
	    	str += '<c:forEach items="${roomList}" var="chatRoom" varStatus="i"><tr>';
	    	str += '<td>${i.count}</td><td class="roomInfo" onclick="location.href=\'adminchat.do?r_no=${chatRoom.r_no}&key=${chatRoom.r_uid}\'">';
	    	str += '<input class="key" type="hidden" value="${chatRoom.r_uid}"><div class="getChat" style="display:inline;">${chatRoom.c_message}';
	    	str += '<c:if test="${chatRoom.readcount != 0}">';
	    	str += '<div style="display:inline-block; color:white; border-radius: 50px 50px 50px 50px; background-color: red; width:20px;">${chatRoom.readcount}</div></c:if></div></td>';
	    	str += '<td><div class="time">${chatRoom.c_time}</div></td><td>${chatRoom.r_status}</td>';
	    	str += '</tr>';
	    	str += '</c:forEach>';
	    	str += '</table>';
	    	alert(str); */
	    	
	    	
	    	let str = '<table class="adminlist_table" id="list" border="1">';
	    	str += '<col width="70px"><col width="100"><col width="300px"><col width="150px"><col width="100px">';
	    	str += '<tr><th>번호</th><th>아이디</th><th>상담내용</th><th>시간</th><th>상태</th></tr>';
	    	for(var i=0; i < data.length; i++){
	    												
	    	str += '<tr'; 
	    	
	    	if(data[i].r_status == '상담종료'){ 
	    		str+=' style="color:#D3D3D3"'; 
	    	}
	    	
	    	str +='><td>' + (i+1) + '</td><td>';
	    	if((data[i].r_uid).length > 20){
	    		str += '비회원';
	    	} else {
	    		str += data[i].r_uid + '</td>';
	    	}
	    	
	    	str += '<td class="roomInfo" style="cursor:pointer;" onclick="location.href=\'adminchat.do?r_no=' + data[i].r_no + '&key=' + data[i].r_uid +'\'">';
	    	str += '<input class="key" type="hidden" value="' + data[i].r_uid + '"><div class="getChat" style="float:left; display:inline;">';
	    	
	    	if((data[i].c_message).length > 26){
	    		str += (data[i].c_message).substring(0,26) +'...';
	    	} else {
	    		str += data[i].c_message;
	    	}
	    
	    	str += '</div>';
	    	if(data[i].readcount != 0 && data[i].r_status != '상담종료'){
	    	str += '<div style="margin-right:5px; float:right; display:inline-block; color:white; border-radius: 50px 50px 50px 50px; background-color: red; width:20px;">' + data[i].readcount + '</div></td>';	
	    	}
	    	
	    	str += '<td><div class="time">' + data[i].c_time + '</div></td><td>' + data[i].r_status + '</td>';
	    	str += '</tr>';
	    	}
	    	str +='</table>';
	    	
	        /* let str = '<table id="list" border="1">';
	    	str += '<col width="70px"><col width="100"><col width="300px"><col width="150px"><col width="100px">';
	    	str += '<tr><th>번호</th><th>아이디</th><th>상담내용</th><th>시간</th><th>상태</th></tr>';
	    	str += '<c:forEach items="${roomList}" var="chatRoom" varStatus="i">';
	    	str += '<tr><td>${i.count}</td><td>';
	    	str += '<c:choose><c:when test="${fn:length(chatRoom.r_uid) gt 20}"><c:out value="비회원"></c:out></c:when><c:otherwise><c:out value="${chatRoom.r_uid}"></c:out></c:otherwise></c:choose></td>';

	    	str += '<td class="roomInfo" onclick="location.href=\'adminchat.do?r_no=${chatRoom.r_no}&key=${chatRoom.r_uid}\'"><input class="key" type="hidden" value="${chatRoom.r_uid}"><div class="getChat" style="float:left; display:inline;">';
	    	str += '<c:choose><c:when test="${fn:length(chatRoom.c_message) gt 26}"><c:out value="${fn:substring(chatRoom.c_message, 0, 25)}">...</c:out></c:when><c:otherwise><c:out value="${chatRoom.c_message}"></c:out></c:otherwise></c:choose>';
	 
	    	str += '</div><c:if test="${chatRoom.readcount != 0}"><div style="margin-right:5px; float:right; display:inline-block; color:white; border-radius: 50px 50px 50px 50px; background-color: red; width:20px;">${chatRoom.readcount}</div></c:if></td>';
	    	str += '<td><div class="time">${chatRoom.c_time}</div></td><td>${chatRoom.r_status}</td>';
	    	str += '</tr></c:forEach></table>'; */
	    	
	    	$("#table_container").append(str);
	   
	    },
	    error:function(){
alert('error');
} 
});      	
	
/*	
// key로 해당 div영역을 찾는다.
let $div = $("[data-key='"+node.key+"']");
// console영역을 찾는다.
let log = $div.find(".float-left").html();
// 아래에 메시지를 추가한다.
$div.find(".getMessage").html("(user) => " +node.message + "\n");

// time 추가 -0- 
let time = node.time; // 2021-08-16 오전 00:00
time = time.substring(0, 11);
let timeStr = time;
time = (node.time).substring(11);
timeStr += "<br>" + time;


$div.find(".time").html(timeStr);

*/


// bye는 유저가 접속을 끊었을 때 알려주는 메시지이다.
} else if(node.status === "bye") {
// 해당 키로 div를 찾아서 dom을 제거한다.
$("[data-key='"+node.key+"']").remove();
}
};
// 전송 버튼을 클릭하면 발생하는 이벤트
$(document).on("click", ".sendBtn", function(){
// div 태그를 찾는다.
let $div = $(this).closest(".float-left");
// 메시지 텍스트 박스를 찾아서 값을 취득한다.
let message = $div.find(".message").val();
// 유저 key를 취득한다.
let key = $div.data("key");
// console영역을 찾는다.
let log = $div.find(".console").val();
// 아래에 메시지를 추가한다.
$div.find(".console").val(log + "(me) => " + message + "\n");
// 텍스트 박스의 값을 초기화 한다.
$div.find(".message").val("");
// 웹소켓으로 메시지를 보낸다.
webSocket.send(key+"#####"+message);
});
// 텍스트 박스에서 엔터키를 누르면
$(document).on("keydown", ".message", function(){
// keyCode 13은 엔터이다.
if(event.keyCode === 13) {
// 버튼을 클릭하는 트리거를 발생한다.
$(this).closest(".float-left").find(".sendBtn").trigger("click");
// form에 의해 자동 submit을 막는다.
return false;
}
return true;
});

</script>
</body>
</html>


