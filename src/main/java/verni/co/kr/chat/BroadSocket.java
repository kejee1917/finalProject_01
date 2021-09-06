package verni.co.kr.chat;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.EndpointConfig;
import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.server.standard.SpringConfigurator;

import verni.co.kr.member.MemberDto;




// 일반 유저에서 서버간의 웹 소켓 url
//@ServerEndpoint(value = "/broadsocket")
//@ServerEndpoint(value = "/broadsocket", configurator = SpringConfigurator.class)


@Component
@ServerEndpoint(value = "/broadsocket", configurator = HttpSessionConfigurator.class)
//@ServerEndpoint(value = "/broadsocket", configurator = SpringConfigurator.class)
public class BroadSocket {
	
	private static ChatService service;

	@Autowired
	public BroadSocket(ChatService service) {
		this.service = service;
	}
	
	public BroadSocket() {
		// TODO Auto-generated constructor stub
	}
	
	
	private Map<Session, EndpointConfig> configs = Collections.synchronizedMap(new HashMap<>());
	// handshake가 끝나면 handleOpen이 호출된다.


		
// searchUser 함수의 filter 표현식을 위한 인터페이스
private interface SearchExpression {
// 람다식을 위한 함수
boolean expression(User user);
}
// 서버와 유저간의 접속을 key로 구분하기 위한 인라인 클래스
private class User {
Session session;
String key;
}
// 유저와 서버간의 접속 리스트
private static List<User> sessionUsers = Collections.synchronizedList(new ArrayList<>());
// Session으로 접속 리스트에서 User 클래스를 탐색
private static User getUser(Session session) {
return searchUser(x -> x.session == session);
}
// Key로 접속 리스트에서 User 클래스를 탐색
private static User getUser(String key) {
return searchUser(x -> x.key.equals(key));
}
// 접속 리스트 탐색 함수
private static User searchUser(SearchExpression func) {
Optional<User> op = sessionUsers.stream().filter(x -> func.expression(x)).findFirst();
// 결과가 있으면
if (op.isPresent()) {
// 결과를 리턴
return op.get();
}
// 없으면 null 처리
return null;
}

String uid = null;
int r_no = 0; // 룸넘버
String m_id = null; 
MemberDto dto = new MemberDto();
// browser에서 웹 소켓으로 접속하면 호출되는 함수
@OnOpen
public void handleOpen(Session userSession, EndpointConfig config) {
		
// 인라인 클래스 User를 생성
User user = new User();


HttpSession session = (HttpSession) config.getUserProperties().get(HttpSessionConfigurator.Session);

//uid가 저장되어 있으면 가져온다( 다른페이지로 이동했다가도 다시 접속을 위해 )
//uid = (String)session.getAttribute("uid"); 
dto = (MemberDto)session.getAttribute("login");
//System.out.println("getSession uid확인 : " + uid);

// 로그인 했을 때
if(dto != null) {
// 세션에서 아이디를 가져와서 저장한다.
m_id = dto.getM_id();
// uid에 아이디 저장
uid = m_id;
// 유저키에 아이디 세팅(채팅용)
user.key = uid;
}
System.out.println("getSession id확인 : " + uid);


// 로그인 안했을 때(비회원)
if(uid == null) {
// Unique키를 발급 ('-'는 제거한다.)
user.key = UUID.randomUUID().toString().replace("-", "");
uid = user.key;
System.out.println("비로그인 uid확인 : " + uid);

}

// WebSocket의 세션
user.session = userSession;
// 유저 리스트에 등록한다.
sessionUsers.add(user);
// 운영자 Client에 유저가 접속한 것을 알린다.
Admin.visit(user.key);



if (!configs.containsKey(userSession)) {
	System.out.println("configs 없다");
	// userSession 클래스는 connection이 될 때마다 인스턴스 생성되는 값이기 때문에 키로서 사용할 수 있다.
	configs.put(userSession, config);
	} else {
		System.out.println("configs 있다");
	}






if (configs.containsKey(userSession)) {
	
	
	config = configs.get(userSession);
	
	/*
	// HttpSessionConfigurator에서 설정한 session값을 가져온다.
	HttpSession session = (HttpSession) config.getUserProperties().get(HttpSessionConfigurator.Session);

	// uid가 저장되어 있으면 가져온다( 다른페이지로 이동했다가도 다시 접속을 위해 )
	uid = (String)session.getAttribute("uid"); 
	dto = (MemberDto)session.getAttribute("login");
	System.out.println("getSession uid확인 : " + uid);
	
	if(dto != null) {
	m_id = dto.getM_id();
	}
	System.out.println("getSession id확인 : " + m_id);
	*/
	}
	
	
	
	
	
//HttpServletRequest session = (HttpServletRequest) config.getUserProperties().get(HttpSession.class.getName());

//HttpSession session = (HttpSession) config.getUserProperties().get(HttpSessionConfigurator.Session);
//Session의 TestSession키로 데이터를 가져온다. (테스트용)
//dto = (MemberDto)session.getAttribute("login");
//String uuid = (String)session.getAttribute("uid"); 
//System.out.println("session : " + uuid == null?true:false);


//MemberDto dto = (MemberDto)req.getSession().getAttribute("login");


}


public String getTime() {
String format = "yyyy-MM-dd aa hh:mm";

Calendar today = Calendar.getInstance();

SimpleDateFormat type = new SimpleDateFormat(format);


return type.format(today.getTime());
}



 
// browser에서 웹 소켓을 통해 메시지가 오면 호출되는 함수
@OnMessage
public void handleMessage(String message, Session userSession) throws IOException {
//
//	if (configs.containsKey(userSession)) {
//		System.out.println("아까 집어 넣었잖아");
//		
//		EndpointConfig config = configs.get(userSession);
//		// HttpSessionConfigurator에서 설정한 session값을 가져온다.
//		HttpSession session = (HttpSession) config.getUserProperties().get(HttpSessionConfigurator.Session);
//
//		// uid가 저장되어 있으면 가져온다( 다른페이지로 이동했다가도 다시 접속을 위해 )
//		uid = (String)session.getAttribute("uid"); 
//		System.out.println("handelMessage : " + uid);
//
//		}


// Session으로 접속 리스트에서 User 클래스를 탐색
User user = getUser(userSession);
// 접속 리스트에 User가 있으면
if (user != null) {
// 운영자 Client에 유저 key와 메시지를 보낸다.

// 룸넘버가 없을 때(방을 생성 안했을 때) 채팅방을 만든다.
if(r_no == 0) {	
//ChatRoomDto dto = new ChatRoomDto();
//dto.setR_no(r_no);
//dto.setR_uid(uid);

service.makeRoom(uid);
	
/*	
if(m_id == null) { // 비회원(비로그인)일 때
// DB에 룸생성
service.makeRoom(user.key);
uid = user.key;
} else { // 회원일 때
service.makeRoom(m_id);
uid = m_id;
}
*/

}

r_no= service.getRoomInfo(uid);
System.out.println("roomNumber확인: " +r_no);
		
		



if(service != null) {
System.out.println("onmessage service not null");
// DB에 메시지 저장
ChatDto dto = new ChatDto(0, r_no, uid, message, getTime(), "안읽음");
boolean a =  service.chatMessage(dto);
System.out.println("save: " + a);
} else {
	System.out.println("onmessage service null");
}

Admin.sendMessage(r_no, uid, message, getTime());
}
}
// 운영자 client가 유저에게 메시지를 보내는 함수
public static void sendMessage(int roomNumber, String key, String message, String time) {
// key로 접속 리스트에서 User 클래스를 탐색
User user = getUser(key);
// 접속 리스트에 User가 있으면(당연히 있다. 없으면 버그..)
if (user != null) {
try {
// 유저 Session으로 socket을 취득한 후 메시지를 전송한다.
user.session.getBasicRemote().sendText(message);
} catch (IOException e) {
e.printStackTrace();
}
}
}
// WebSocket이 종료가 되면, 종료 버튼이 없기 때문에 유저 브라우저가 닫히면 발생한다.
@OnClose
public void handleClose(Session userSession) {

// 상담종료로 변경한다.	
service.statusUpdate(r_no);
	
// Session으로 접속 리스트에서 User 클래스를 탐색
User user = getUser(userSession);
// 접속 리스트에 User가 있으면(당연히 있다. 없으면 버그..)
if (user != null) {
// 운영자 Client에 유저 key로 접속 종료를 알린다.
Admin.bye(user.key);
// 위 유저 접속 리스트에서 유저를 삭제한다.
sessionUsers.remove(user);
}
}
// 유저간의 접속 리스트의 키를 취득하려고 할때.
public static String[] getUserKeys() {
// 반환할 String 배열을 선언한다.
String[] ret = new String[sessionUsers.size()];
// 유저 리스트를 반복문에 돌린다.
for (int i = 0; i < ret.length; i++) {
// 유저의 키만 반환 변수에 넣는다.
ret[i] = sessionUsers.get(i).key;
}
// 값 반환
return ret;
}
}


