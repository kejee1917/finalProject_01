package verni.co.kr.faq;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class FaqController {
	
	@Autowired
	FaqService service;
	
	
	@RequestMapping(value = "faqList.do", method = RequestMethod.GET)
	public String faqList(Model model) {
		List<FaqDto> f1list = service.getFaqList("회원가입/탈퇴");
		List<FaqDto> f2list = service.getFaqList("회원정보");
		List<FaqDto> f3list = service.getFaqList("로그인");
		List<FaqDto> f4list = service.getFaqList("주문/결제");
		List<FaqDto> f5list = service.getFaqList("제품관련");
		List<FaqDto> f6list = service.getFaqList("배송");
		List<FaqDto> f7list = service.getFaqList("반납");
		
		model.addAttribute("faq1", f1list);
		model.addAttribute("faq2", f2list);
		model.addAttribute("faq3", f3list);
		model.addAttribute("faq4", f4list);
		model.addAttribute("faq5", f5list);
		model.addAttribute("faq6", f6list);
		model.addAttribute("faq7", f7list);
		
		return "faq.tiles";
	}
	
	
	@RequestMapping(value = "faqWrite.do", method = RequestMethod.GET)
	public String faqWrite() {
		return "faqWrite.tiles";
	}
	
	@RequestMapping(value = "faqWriteAf.do", method = RequestMethod.GET)
	public String faqWriteAf(FaqDto faq) {
		String category = faq.getF_category();
		service.faqAdd(faq);
		return "redirect:/faq.do";
	}
}
