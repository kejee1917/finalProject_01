package verni.co.kr.message;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class MessageController {
	
	@Autowired
	MessageService service;
	
	@RequestMapping(value="messageList.do", method = RequestMethod.GET) 
	public String messageList(Model model, MessageParam param) {
		int sn = param.getPageNumber();	// 0 1 2 3 4
		int start = 1 + sn * 13;
		int end = 13 + sn * 13;
		
		param.setStart(start);
		param.setEnd(end);
		
		// 현재 페이지
		model.addAttribute("pageNumber", param.getPageNumber()+1);
		// 글의 총수
		int page = service.getMessageTotal(param);
		model.addAttribute("page", page);

		
		// 검색 고정
		model.addAttribute("choice", param.getChoice());
		model.addAttribute("search", param.getSearch());
		model.addAttribute("sorting", param.getSorting());
		
		List<MessageDto> mlist = service.getMessageList(param);
		model.addAttribute("mlist", mlist);
		
		return "messageList.tiles";
	}
	
}
