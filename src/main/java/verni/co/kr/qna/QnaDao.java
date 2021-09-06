package verni.co.kr.qna;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class QnaDao {
	
	@Autowired
	SqlSession session;
	
	String ns = "Qna.";
	
	// 리스트
	public List<QnaDto> getqnaList(QnaParam param) {
		return session.selectList(ns + "qnaList", param);
	}
	public int getQnaNum(QnaParam param) {
		return session.selectOne(ns+"getQnaNum", param);
	}
	// 문의작성
	public boolean qnaWrite(QnaDto dto) {
		int n = session.insert(ns + "qnaWrite", dto);
		return n>0?true:false;
	}
	
	// 
	public QnaDto getQna(int q_no) {
		return session.selectOne(ns + "getQna", q_no);
	}
	
	// 삭제
	public boolean qnaDel(int q_no) {
		int b = session.delete(ns + "qnaDel", q_no);
		return b>0;
	}
	// 메세지 삭
	public boolean messageDel(int q_no) {
		int b = session.delete(ns + "messageDel", q_no);
		return b>0;
	}
	// 수정하기
		public boolean qnaUpdate(QnaDto qna) {
			int b = session.update(ns+"qnaUpdate", qna);
			return b>0;
		}
	
	
	
	
	// 리뷰 상태 변경
	public void statusUpdate(int q_no) {
		session.update(ns+"statusUpdate", q_no);
	}
	
	public boolean qReplyWrite(Q_ReplyDto qr) {
		int count = session.insert(ns+"qReplyWrite", qr);
		return count > 0;
	}
	
	
	// 메세지용
	public int getMaxNo() {
		return session.selectOne(ns+"getMaxNo");
	}
	
	
}
