package verni.co.kr.message;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MessageService {
	
	@Autowired
	MessageDao dao;
	
	public boolean messageAdd(MessageDto ms) {
		return dao.messageAdd(ms);
	}
	
	public List<MessageDto> getMessageList(MessageParam param){
		return dao.getMessageList(param);
	}
	
	public int getMessageTotal(MessageParam param) {
		return dao.getMessageTotal(param);
	}
	
	//상태 업데이트
	public void statusUpdate(int ms_no) {
		dao.statusUpdate(ms_no);
	}
	
	public int getOrderMaxNo() {
		return dao.getOrderMaxNo();
	}
	
	public int getMsno(int od_no) {
		return dao.getMsno(od_no);
	}
	public boolean msgUpdate(MessageDto ms) {
		return dao.msgUpdate(ms);
	}
}
