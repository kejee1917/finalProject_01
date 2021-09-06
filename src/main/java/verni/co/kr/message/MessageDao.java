package verni.co.kr.message;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MessageDao {

	@Autowired
	SqlSession session;
	String ns = "Message.";
	
	public boolean messageAdd(MessageDto ms) {
		int count = session.insert(ns+"messageAdd", ms);
		return count > 0;
	}
	
	public List<MessageDto> getMessageList(MessageParam param){
		return session.selectList(ns+"getMessageList", param);
	}
	
	public int getMessageTotal(MessageParam param) {
		return session.selectOne(ns+"getMessageTotal", param);
	}
	
	//상태업데이트
	public void statusUpdate(int ms_no) {
		session.update(ns+"statusUpdate", ms_no);
	}
	
	// 오더 시퀀스 맥스값
	public int getOrderMaxNo() {
		return session.selectOne(ns+"getOrderMaxNo");
	}
	
	// 주문취소용
	public int getMsno(int od_no) {
		return session.selectOne(ns+"getMsno", od_no);
	}
	// 메세지 업데이트
	public boolean msgUpdate(MessageDto ms) {
		int count = session.update(ns+"msgUpdate", ms);
		return  count > 0;
	}
}
