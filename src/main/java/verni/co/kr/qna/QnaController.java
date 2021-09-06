package verni.co.kr.qna;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import verni.co.kr.message.MessageDto;
import verni.co.kr.message.MessageService;

import java.util.List;


@Controller
public class QnaController {
	
	@Autowired
	QnaService service;
	@Autowired
	MessageService mservice;
	// 고장남
	@ResponseBody
	@RequestMapping(value = "qnaList.do", method = RequestMethod.GET)
	public List<QnaDto> QnaList(QnaParam param) {
		
		
		int sn = param.getPageNumber();
		int start = 1+sn*10; // 1, 11 
		int end = (sn+1)*10; // 10, 20
		 
		param.setStart(start); 
		param.setEnd(end);
		 
		List<QnaDto> list = service.getQnaList(param);
		
		return list;
	}
	
	@ResponseBody
	@RequestMapping(value = "getQnaCount.do", method = RequestMethod.GET)
	public int getQnaCount(QnaParam param) {
		System.out.println("qna글총수:"+service.getQnaNum(param));
		return service.getQnaNum(param);
	}
	
	
	
	
	@RequestMapping(value = "qnaWrite.do", method = RequestMethod.GET)
	public String qnaWrite(QnaDto qna) {
		return "qna.tiles";
	}
	
	
	// 8월 16일 메세지 등록
	@ResponseBody
	@RequestMapping(value = "qnaWriteAf.do", method = RequestMethod.POST)
	public boolean qnaWriteAf(QnaDto qna) {
		boolean b = service.qnsWrite(qna);
		MessageDto ms;
			ms = new MessageDto(0, "미처리", "상품문의",  qna.getM_id()+"님으로부터 문의가 들어왔습니다.", null, service.getMaxNo());
			mservice.messageAdd(ms);
			

		
		
		return b;
	}

	
	@ResponseBody
	@RequestMapping(value = "qnaDel.do", method = RequestMethod.POST)
	public boolean qnaDel(int q_no) {
		System.out.println(q_no);
		boolean b = service.qnaDel(q_no);
		return b;
	}
	
	@RequestMapping(value = "q_replyWrite.do", method = RequestMethod.GET)
	public String q_replyWrite(Model model, int q_no) {
		QnaDto qna = service.getQna(q_no);
		
		model.addAttribute("qna", qna);
		return "q_reply.tiles";
	}
	
	@ResponseBody
	@RequestMapping(value = "q_replyWriteAf.do", method = RequestMethod.POST)
	public boolean q_replyWriteAf(Q_ReplyDto qr, int ms_no) {
		boolean flag = service.qReplyWrite(qr);
		mservice.statusUpdate(ms_no);
		return flag;
	}
	
	// 수정하기
	@RequestMapping(value = "qnaUpdate.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String qnaUpdate(int q_no, Model model){	
		QnaDto qna=service.getQna(q_no);	
		System.out.println(qna.toString());
		model.addAttribute("qna", qna);		
		return "qnaUpdate.tiles";
	}

	@ResponseBody
	@RequestMapping(value = "qnaUpdateAf.do", method = {RequestMethod.GET, RequestMethod.POST})
	public boolean qnaUpdate(QnaDto qna, Model model){	
		
		return service.qnaUpdate(qna);
	}
	
}
