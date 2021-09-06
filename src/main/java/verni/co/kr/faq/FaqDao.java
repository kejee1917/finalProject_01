package verni.co.kr.faq;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class FaqDao {
	@Autowired
	SqlSession session;
	String ns = "Faq.";
	
	public List<FaqDto> getFaqList(String cate){
		return session.selectList(ns+"getFaqList", cate);
	}
	
	public boolean faqAdd(FaqDto faq) {
		int count = session.insert(ns+"faqAdd", faq);
		return count>0;
	}
	
	
}
