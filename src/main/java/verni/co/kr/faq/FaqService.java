package verni.co.kr.faq;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FaqService {
	@Autowired
	FaqDao dao;
	
	public List<FaqDto> getFaqList(String cate){
		return dao.getFaqList(cate);
	} 
	
	public boolean faqAdd(FaqDto faq) {
		return dao.faqAdd(faq);
	}

}
