package verni.co.kr.myqna;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import verni.co.kr.qna.QnaDto;

@Repository
public class MyqnaDao {

	@Autowired
	SqlSession session;
	
	String ns = "Myqna.";
	
	public int writeMyqna(MyqnaDto dto) {
		return session.insert(ns + "writeMyqna", dto);
	}
	
	public List<MyqnaDto> myqnaList(Map<String, Object> map) {
		return session.selectList(ns + "myqnaList", map);
	}
	
	public int myqnaAllCount(Map<String, Object> map) {
		return session.selectOne(ns + "myqnaAllCount", map);
	}
	
	public MyqnaDto readMyqna(int mq_no) {
		return session.selectOne(ns + "readMyqna", mq_no);
	}
	
	//시퀀스 맥스값 구하기
	public int getMyqnaMaxNo() {
		return session.selectOne(ns + "getMyqnaMaxNo");
	}
	
	//관리자가 쓴 답글 가져오기
	public MyqnaReplyDto getMyqnaReply(int mq_no) {
		return session.selectOne(ns + "getMyqnaReply", mq_no);
	}
	
	//수정하기
	public int myqnaUpdateAf(MyqnaDto dto) {
		return session.update(ns + "myqnaUpdateAf", dto);
	}
	
	//삭제하기
	public int myqnaDelete(int mq_no) {
		return session.update(ns + "myqnaDelete", mq_no);
	}
    public int messageDel(int r_no) {
		return session.delete(ns + "messageDel", r_no);
	}   
	
	//상품 qna list 가져오기
	public List<QnaDto> myproductqnaList(Map<String, Object> map) {
		return session.selectList(ns + "myproductqnaList", map);
	}
	
	public int qnaAllCount(Map<String, Object> map) {
		return session.selectOne(ns + "qnaAllCount", map);
	}
	
	//상품 qna 글 읽기
	public QnaDto getQna(int q_no) {
		return session.selectOne(ns + "getQna", q_no);
	}
	//상품 qna 댓글 읽기
	public QnaDto getQnaReply(int q_no) {
		return session.selectOne(ns + "getQnaReply", q_no);
	}
}
