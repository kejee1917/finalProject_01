<%@page import="verni.co.kr.chat.ChatDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%    
    request.setCharacterEncoding("UTF-8");
    String key = request.getParameter("key");
    List<ChatDto> list = (List<ChatDto>)request.getAttribute("chatList");
%>
 
<!DOCTYPE html>
<html>
<head>
<title>Web Socket Example</title>
<style>
.top_table{
	margin-bottom: 10px;
}

.chat-container{
		width: 100%;
		text-align: center;
}

.chat-bubble{
		margin: 0 auto;
		overflow-x:hidden; 
		overflow-y:auto; 
}

.chat-text{
		margin: 0 auto;
		height: 100px;
		width: 100%;
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
        background: #F4F4F4;
        width:auto;
        display:inline-block;
        border-radius: 10px 10px 10px 10px;
        
	}

.chat-box{
		text-align:left;
		margin-left:5px;
	}	

.my-chat-box{
		text-align: right;		
}	
		
.my-chat{
		margin-right: 10px;
		position: relative;
		text-align: left;
		background: #B9E2FA;
		border-radius: 10px 10px 10px 10px;
		animation:up 0.3s;
}

.my-time{
text-align: right;
position: relative;
}	

.your-time{
text-align: left;
margin-left:10px;
}

.end-chat{
background-color: #F4F4F4;
font-size: 15px;
width: 100%;
text-align: center;
}

textarea:focus {
    outline: none;
}


.sendBtn {
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
			<b style="font-size: 30px;">채팅 답변</b>
		</td>
	</tr>
</table>
<div class="chat-container" style="height: 800px;">

<!-- 서버와 메시지를 주고 받는 영역 -->
<div class="chat-bubble" style="background-color: white; border:solid 1px #d2d2d2; width:100%; height:550px;"></div>

<div class="chat-text">
<!-- 메시지 입력 텍스트 박스 -->
<textarea class="message" style="display:inline; resize: none; font-size:14px; border-top:none; border-right:none; float:left; width:80%; height:100%;" onkeydown="return enter()"></textarea>
<!-- 전송 버튼 -->
<input value="전송" type="button" class="btn btn-secondary sendBtn" style="display:inline; font-size:14px; width:20%; height:100%; text-align:center;" onclick="sendMessage()">
</div>
<br />
<button class="btn btn-dark" onclick="location.href='adminlist.do'" style="width:70px;">목록</button>
</div>

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">


let chatList = new Array();    
<c:forEach items="${chatList}" var="chat" varStatus="i">
	
chatList.push({c_no : ${chat.c_no},
					r_no : ${chat.r_no},
					r_uid : "${chat.r_uid}",
					r_status : "${chat.r_status}",
					c_message : "${chat.c_message}",
					c_time : "${chat.c_time}",
					c_read : "${chat.c_read}"
		       });
		       
</c:forEach>

let chat = "";
for(var i = 0; i < chatList.length; i++){
	
if(chatList[i].r_uid == '관리자'){
	chat += "<div class='my-time'><font style='text-align:right; color:black; font-size:6px; margin-right:3px;'>" + (chatList[i].c_time).substring(11) + "</font></div>";
	chat += "<div class='my-chat-box'><div class='chat my-chat'>" + chatList[i].c_message + "</div></div>"
} else {
	
	if((chatList[i].r_uid).length >= 20){
		chatList[i].r_uid = '비회원';
	}
	chat += "<div class='your-time'><b>" + chatList[i].r_uid + "</b><font style='text-align:left; color:black; font-size:6px; margin-left:3px;'>" + chatList[i].c_time.substring(11) + "</font></div>"
	+ "<div class='chat-box'><div class='chat'>" + chatList[i].c_message + "</div></div>"
}
}
if(chatList[0].r_status == '상담종료'){
	chat += "<div class='end-chat'>상담이 종료되었습니다.</div>"				
	$(".message").attr("disabled", true);
	$(".sendBtn").attr("disabled", true);
}

$(".chat-bubble").append(chat);
$('.chat-bubble').scrollTop($('.chat-bubble')[0].scrollHeight+20);	



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


// 서버의 admin의 서블릿으로 웹 소켓을 한다.
var webSocket = new WebSocket("ws://localhost:8090/a_verni/admin");
// 운영자에서의 open, close, error는 의미가 없어서 형태만 선언
webSocket.onopen = function(message) { };
webSocket.onclose = function(message) { };
webSocket.onerror = function(message) { };
// 서버로 부터 메시지가 오면
webSocket.onmessage = function(message) {
// 메시지의 구조는 JSON 형태로 만들었다.
let node = JSON.parse(message.data);
// 메시지의 status는 유저의 접속 형태이다.
// visit은 유저가 접속했을 때 알리는 메시지다.
let key = '<%=key%>';


if(key == node.key){
// 유저 입장	
if(node.status === "visit") {

	
	

// message는 유저가 메시지를 보낼 때 알려주는 메시지이다.
} else if(node.status === "message") {

let chat = "<div class='your-time'><font style='text-align:left; color:black; font-size:6px; margin-left:3px;'>" + getTime() + "</font></div>"
		+ "<div class='chat-box'><div class='chat'>" + node.message + "</div></div>"
$(".chat-bubble").append(chat);
$('.chat-bubble').scrollTop($('.chat-bubble')[0].scrollHeight+20);	


 
 
// bye는 유저가 접속을 끊었을 때 알려주는 메시지이다.
} else if(node.status === "bye") {

let msg = "<div class='end-chat'>상담이 종료되었습니다.</div>"	
$(".message").attr("disabled", true);
$(".sendBtn").attr("disabled", true);
//let msg = "<div class='my-time'><font style='text-align:right; color:black; font-size:6px; margin-right:3px;'>" + getTime() + "</font></div>";
//msg += "<div class='my-chat-box'><div class='chat my-chat'>" + '상담이 종료되었습니다.' + "</div></div>"
$(".chat-bubble").append(msg);	
$('.chat-bubble').scrollTop($('.chat-bubble')[0].scrollHeight+20);	
	
}
}
};

//전송 버튼을 클릭하면 발생하는 이벤트
function sendMessage(){
//$(document).on("click", ".sendBtn", function(){
let key = '<%=key%>';

// 메시지 텍스트 박스를 찾아서 값을 취득한다.
let message = $(".message").val();

// 아래에 메시지를 추가한다.
let msg = "<div class='my-time'><font style='text-align:right; color:black; font-size:6px; margin-right:3px;'>" + getTime() + "</font></div>";
msg += "<div class='my-chat-box'><div class='chat my-chat'>" + message + "</div></div>"
$(".chat-bubble").append(msg);
$('.chat-bubble').scrollTop($('.chat-bubble')[0].scrollHeight+20);	

// 텍스트 박스의 값을 초기화 한다.
$(".message").val("");

// 웹소켓으로 메시지를 보낸다.
webSocket.send(key+"#####"+message);
}
//});





// 텍스트 박스에서 엔터키를 누르면
function enter() {
// keyCode 13은 엔터이다.
if(event.keyCode === 13) {
// 서버로 메시지 전송
sendMessage();
// form에 의해 자동 submit을 막는다.
return false;
}
}

</script>
</body>
</html>


