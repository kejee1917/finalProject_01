package verni.co.kr.chat;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import verni.co.kr.admin.ChartDto;

@Service
public class ChatService {

	@Autowired
	ChatDao dao;
	
	public boolean makeRoom(String r_uid) {
		return dao.makeRoom(r_uid);
	}
	
	public boolean chatMessage(ChatDto dto) {
		return dao.chatMessage(dto);
	}
	
	public int getRoomInfo(String r_uid) {
		return dao.getRoomInfo(r_uid);
	}
	
	
	public int getRoomNum() {
		return dao.getRoomNum();
	}


	public List<ChatDto> getChatData(String r_no){
		return dao.getChatData(r_no);
	}

	public List<ChatRoomDto> getChatRoomList(){
		return dao.getChatRoomList();
	}

	public ChatDto getChatList(int r_no){
		return dao.getChatList(r_no);
	}

	public boolean readUpdate(String r_no) {
		return dao.readUpdate(r_no);
	}

	public boolean statusUpdate(int r_no) {
		return dao.statusUpdate(r_no);
	}
	
	
	
//	chart
	public List<ChartDto> getMonthTotal() {
		return dao.getMonthTotal();
	}

	public List<ChartDto> getGenderRat(){
		return dao.getGenderRat();
	}
	
	public List<ChartDto> getTopProduct(){
		return dao.getTopProduct();
	}


}
