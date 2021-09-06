package verni.co.kr.qna;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class QnaService {
	
	@Autowired
	QnaDao dao;
	
	public List<QnaDto> getQnaList(QnaParam param) {
		return dao.getqnaList(param);
	}
	public int getQnaNum(QnaParam param) {
		return dao.getQnaNum(param);
	}
	public boolean qnsWrite(QnaDto dto) {
		return dao.qnaWrite(dto);
	}
	
	public QnaDto getQna(int q_no) {
		return dao.getQna(q_no);
	}
	
	public boolean qnaDel(int q_no) {
		dao.messageDel(q_no);
		return dao.qnaDel(q_no);
	}
	
	
	
	// 답글등록
	public boolean qReplyWrite(Q_ReplyDto qr) {
		// 상태 업데이트
		dao.statusUpdate(qr.getQ_no());
		return dao.qReplyWrite(qr);
	}
	
	//메세지용
	public int getMaxNo() {
		return dao.getMaxNo();
	}
	
	//수정
	public boolean qnaUpdate(QnaDto qna) {
		return dao.qnaUpdate(qna);
	}
	
}
