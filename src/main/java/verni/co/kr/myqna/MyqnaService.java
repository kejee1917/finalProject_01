package verni.co.kr.myqna;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import verni.co.kr.qna.QnaDto;

@Service
public class MyqnaService {

	@Autowired
	MyqnaDao dao;
	
	public int writeMyqna(MyqnaDto dto) {
		return dao.writeMyqna(dto);
	}
	
	public List<MyqnaDto> myqnaList(Map<String, Object> map) {
		return dao.myqnaList(map);
	}
	
	public int myqnaAllCount(Map<String, Object> map) {
		return dao.myqnaAllCount(map);
	}
	
	
	public MyqnaDto readMyqna(int mq_no) {
		return dao.readMyqna(mq_no);
	}
	
	
	//시퀀스 맥스값 구하기
	public int getMyqnaMaxNo() {
		return dao.getMyqnaMaxNo();
	}
	
	//관리자가 쓴 답글 가져오기
	public MyqnaReplyDto getMyqnaReply(int mq_no) {
		return dao.getMyqnaReply(mq_no);
	}	

	//수정하기
	public int myqnaUpdateAf(MyqnaDto dto) {
		return dao.myqnaUpdateAf(dto);
	}
	//삭제하기
	public int myqnaDelete(int mq_no) {
		dao.messageDel(mq_no);
		return dao.myqnaDelete(mq_no);
	}
	
	//상품 qna list 가져오기
	public List<QnaDto> myproductqnaList(Map<String, Object> map) {
		return dao.myproductqnaList(map);
	}
	
	public int qnaAllCount(Map<String, Object> map) {
		return dao.qnaAllCount(map);
	}
	
	//상품 qna 글 읽기
	public QnaDto getQna(int q_no) {
		return dao.getQna(q_no);
	}
	//상품 qna 댓글 읽기
	public QnaDto getQnaReply(int q_no) {
		return dao.getQnaReply(q_no);
	}
}
