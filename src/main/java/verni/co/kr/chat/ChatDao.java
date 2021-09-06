package verni.co.kr.chat;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import verni.co.kr.admin.ChartDto;

@Repository
public class ChatDao {

	@Autowired
	SqlSession session;
	
	String ns = "Chat.";
	
	public boolean makeRoom(String r_uid) {
		
		int count = session.insert(ns + "makeRoom", r_uid);
		
		return count>0?true:false;
	}
	
	public boolean chatMessage(ChatDto dto) {
	
		System.out.println("chat");
		
		int count = session.insert(ns + "chatMessage", dto);
		
		return count>0?true:false;
	}
	
	public int getRoomInfo(String r_uid) {
		
		int number = session.selectOne(ns + "getRoomInfo", r_uid);
		
		return number;
	}
	
	public int getRoomNum() {
		
		int number = session.selectOne(ns + "getRoomNum");
		System.out.println("getRoomNum" + number);
		return number;
	}
	
	public List<ChatDto> getChatData(String r_no){
		
		List<ChatDto> list = session.selectList(ns + "getChatData", r_no);
		
		return list;
	}
	
	public List<ChatRoomDto> getChatRoomList(){
		
		List<ChatRoomDto> list = session.selectList(ns + "getChatRoomList");

		return list;
	}
	
	public ChatDto getChatList(int r_no){
		
		ChatDto dto = session.selectOne(ns + "getChatList", r_no);
		
		return dto;
	}
	
	public boolean readUpdate(String r_no) {
		
		int count = session.update(ns + "readUpdate", r_no);
		
		return count>0?true:false;
	}
	
	public boolean statusUpdate(int r_no) {
		
		int count = session.update(ns + "statusUpdate", r_no);
		
		return count>0?true:false;
	}
	
	
	//chart
	public List<ChartDto> getMonthTotal() {
		
		List<ChartDto> list = session.selectList(ns + "getMonthTotal");
		
		return list;
	}
	
	public List<ChartDto> getGenderRat(){
		
		List<ChartDto> list = session.selectList(ns + "getGenderRat");
		
		return list;
	}
	
	public List<ChartDto> getTopProduct(){
		
		List<ChartDto> list = session.selectList(ns + "getTopProduct");
		
		return list;
	}
}
