package verni.co.kr.myqna;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import verni.co.kr.member.MemberDto;
import verni.co.kr.member.MemberService;
import verni.co.kr.message.MessageDto;
import verni.co.kr.message.MessageService;
import verni.co.kr.mypage.MypageParam;
import verni.co.kr.mypage.MypageService;
import verni.co.kr.qna.QnaDto;
import verni.co.kr.qna.QnaService;
import verni.co.kr.util.ProductUtil;

@Controller
public class MyqnaController {

	@Autowired
	MyqnaService service;
	
	@Autowired
	MessageService mservice;
	
	@Autowired
	MypageService myservice;
	
	@Autowired
	QnaService qservice;
	
	@RequestMapping(value="myqna.do", method = RequestMethod.GET)
	public String myqnaList(String menu, HttpServletRequest req, Model model, MypageParam param) {
		
		//로그인한 정보 세션에서 얻어오기
		String m_id = ((MemberDto)req.getSession().getAttribute("login")).getM_id();
		//List<MyqnaDto> list = service.myqnaList(m_id);
		
		//내 정보 가져오기
	    MemberDto dto = myservice.getUpdateMember(m_id);
	   
			 
		int start, end;
		start = 1 + 5 * param.getPageNumber(); //1 6
		end = (param.getPageNumber() + 1) * 5; //5 10
		
		// 값 넣기
		param.setStart(start);
		param.setEnd(end);
		
		//Map에 넣기 (두개이상 파라미터 값 가져갈 때)
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("m_id", m_id);
		map.put("search", param.getSearch());
		map.put("start", param.getStart());
		map.put("end", param.getEnd());
		
		List<MyqnaDto> list = service.myqnaList(map);
		int countAll = service.myqnaAllCount(map);
		
		model.addAttribute("menu", menu);
		model.addAttribute("list", list); 
		model.addAttribute("countAll", countAll); //처음과 검색시 글의 총 수
		model.addAttribute("search", param.getSearch());  //처음엔 리스트 전체 뿌리기
		model.addAttribute("pageNumber", param.getPageNumber()); //현재 페이지
		model.addAttribute("dto", dto);
		 
		return "myqna.tiles";
	}
	
	@RequestMapping(value="writeMyqna.do", method = RequestMethod.GET)
	public String writeMyqna() {
		return "writeMyqna.tiles";
	}
	
	@RequestMapping(value="writeMyqnaAf.do", method = RequestMethod.POST)
	public String addMyqna(MyqnaDto dto, MultipartHttpServletRequest mhsr, 
						@RequestParam("myqnaImage") MultipartFile[] file) throws Exception{

		
		String fileOriginName = "";
		String fileMultiName = "";
		String OriginName = "";
		String uploadPath = mhsr.getRealPath("/upload/myqnaImage");
		
		for (int i = 0; i < file.length; i++) {
			fileOriginName = ProductUtil.getNewFileName(file[i].getOriginalFilename());
			
		//	System.out.println("기존 파일명 : " + file[i].getOriginalFilename());
		//	System.out.println("변경된 파일명 : " + fileOriginName);
			File f = new File(uploadPath + "\\" + fileOriginName);
			file[i].transferTo(f);
			
			if (i == 0) {
				fileMultiName += fileOriginName;
				OriginName += file[i].getOriginalFilename();
			} else {
				fileMultiName += "," + fileOriginName;
				OriginName += "," + file[i].getOriginalFilename();
			}
		}
		
		if(OriginName == null || OriginName.equals("")) {
			dto.setMq_filename("");
			dto.setMq_newfilename("");
		}else {
			dto.setMq_filename(OriginName);
			dto.setMq_newfilename(fileMultiName);
		}
		
		
		
		service.writeMyqna(dto);
		int mq_no = service.getMyqnaMaxNo();
		
		//메세지 보내기
		MessageDto ms = new MessageDto(0, "미처리", "온라인문의", dto.getM_id() + "님으로부터 온라인 문의가 들어왔습니다.", null, mq_no);
		mservice.messageAdd(ms);
		
		return "redirect:/myqna.do";
		
	}
	
	@RequestMapping(value="readMyqna.do", method = RequestMethod.GET)
	public String readMyqna(int mq_no, Model model, String menu, HttpServletRequest req) {
		
		MyqnaDto qdto = service.readMyqna(mq_no);
		MyqnaReplyDto replydto = service.getMyqnaReply(mq_no);
		
		//로그인한 정보 세션에서 얻어오기
		String m_id = ((MemberDto)req.getSession().getAttribute("login")).getM_id();
		//내 정보 가져오기
	    MemberDto dto = myservice.getUpdateMember(m_id);
	    
	    model.addAttribute("menu", menu);
	    model.addAttribute("dto", dto);
		model.addAttribute("qdto", qdto);
		model.addAttribute("replydto", replydto);
		
		return "readMyqna.tiles";
	}
	
	//myqna 수정 전
	@RequestMapping(value="myqnaUpdate.do", method = RequestMethod.GET)
	public String myqnaUpdate(int mq_no, String menu, HttpServletRequest req, Model model) {
		
		//로그인한 정보 세션에서 얻어오기
		String m_id = ((MemberDto)req.getSession().getAttribute("login")).getM_id();
		
		//내 정보 가져오기
	    MemberDto dto = myservice.getUpdateMember(m_id);
		//myqna글 가져오기
		MyqnaDto qdto = service.readMyqna(mq_no);
		
		model.addAttribute("menu", menu);
		model.addAttribute("dto", dto);
		model.addAttribute("qdto", qdto);
		
		return "myqnaUpdate.tiles";
	}
	
	//myqna 수정 후
	@ResponseBody
	@RequestMapping(value="myqnaUpdateAf.do", method = RequestMethod.POST) 
	public String myqnaUpdateAf(MyqnaDto dto, MultipartHttpServletRequest mhsr, 
			@RequestParam("myqnaImage") MultipartFile[] file, String oldimage) throws Exception{
		
		System.out.println("예전파일 : "+oldimage );
		
		String fileOriginName = "";
		String fileMultiName = "";
		String OriginName = "";
		String uploadPath = mhsr.getRealPath("/upload/myqnaImage");
		
		for (int i = 0; i < file.length; i++) {
			fileOriginName = ProductUtil.getNewFileName(file[i].getOriginalFilename());
			
			File f = new File(uploadPath + "\\" + fileOriginName);
			file[i].transferTo(f);
			
			if (i == 0) {
				fileMultiName += fileOriginName;
				OriginName += file[i].getOriginalFilename();
			} else {
				fileMultiName += "," + fileOriginName;
				OriginName += "," + file[i].getOriginalFilename();
			}
		}
		System.out.println("바뀐 새로운 이미지 이름"+fileMultiName);
		System.out.println("OriginName: " + OriginName);
		if(OriginName == null || OriginName.equals("")) {
			if( oldimage.equals("undefined,")) {
				dto.setMq_newfilename("");
			}else if(oldimage.contains("undefined,")) {	
				oldimage = oldimage.replace("undefined,", "");
				dto.setMq_newfilename(oldimage.substring(0,  oldimage.lastIndexOf(",")));
			}else if(oldimage.equals("")) {
				dto.setMq_filename("");
				dto.setMq_newfilename("");
			}else {
				System.out.println("컨트롤러oldimage : " +oldimage.substring(0,  oldimage.lastIndexOf(",")));
				dto.setMq_newfilename(oldimage.substring(0,  oldimage.lastIndexOf(",")));
			}
		}else {
			
			if( oldimage.equals("undefined,")) {
				dto.setMq_filename(OriginName);
				dto.setMq_newfilename(fileMultiName);
			}else if(oldimage.contains("undefined,")) {	
				dto.setMq_filename(OriginName);
				oldimage = oldimage.replace("undefined,", "");
				dto.setMq_newfilename(oldimage+fileMultiName);
			}else if(oldimage.equals("")) {
				dto.setMq_filename(OriginName);
				dto.setMq_newfilename(fileMultiName);
			}else {
				dto.setMq_filename(OriginName);
				dto.setMq_newfilename(oldimage+fileMultiName);
			}

		}
		
		int count = service.myqnaUpdateAf(dto);
		
		String alert = "";
		
		if(count > 0) {
			alert = "<script>location.href='readMyqna.do?mq_no=" + dto.getMq_no() + "';</script>";
		}else {
			alert = "<script>alert('error');location.href='myqna.do';</script>";
		}
		
		return alert;
	}
	
	//삭제하기
	@RequestMapping(value="myqnaDelete.do", method = RequestMethod.GET) 
	public String myqnaDelete(int mq_no) {
		
		service.myqnaDelete(mq_no);
		
		return "redirect:/myqna.do";
	}
	
	
	//0830 상품 Q&A 리스트 불러오기
	@RequestMapping(value="myproductqna.do", method = RequestMethod.GET) 
	public String myproductqna(String menu, HttpServletRequest req, Model model, MypageParam param) {
		
		//로그인한 정보 세션에서 얻어오기
		String m_id = ((MemberDto)req.getSession().getAttribute("login")).getM_id();
		
		//내 정보 가져오기
	    MemberDto dto = myservice.getUpdateMember(m_id);
			 
		int start, end;
		start = 1 + 5 * param.getPageNumber(); //1 6
		end = (param.getPageNumber() + 1) * 5; //5 10
		
		// 값 넣기
		param.setStart(start);
		param.setEnd(end);
		
		//Map에 넣기 (두개이상 파라미터 값 가져갈 때)
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("m_id", m_id);
		map.put("search", param.getSearch());
		map.put("start", param.getStart());
		map.put("end", param.getEnd());
		
		List<QnaDto> list = service.myproductqnaList(map); 
		int countAll = service.qnaAllCount(map);
		
		model.addAttribute("menu", menu);
		model.addAttribute("list", list); 
		model.addAttribute("countAll", countAll); //처음과 검색시 글의 총 수
		model.addAttribute("search", param.getSearch());  //처음엔 리스트 전체 뿌리기
		model.addAttribute("pageNumber", param.getPageNumber()); //현재 페이지
		model.addAttribute("dto", dto);
		 
		return "myproductqna.tiles";
	}
	
	//0831 상품 문의 읽기
	@RequestMapping(value="myproductqnaRead.do", method = RequestMethod.GET) 	
	public String myproductqnaRead(int q_no, Model model) {
		
		QnaDto updto = service.getQna(q_no);
		QnaDto downdto = service.getQnaReply(q_no);
		
		model.addAttribute("updto", updto);
		model.addAttribute("downdto", downdto);
		
		return "myproductqnaRead.tiles";
	}
	
	//상품문의 수정 전 // 수정 후는 qnaController에 있음
	@RequestMapping(value="myproductqnaUpdate.do", method = RequestMethod.GET) 
	public String myproductqnaUpdate(int q_no, Model model) {
		
		QnaDto updto = service.getQna(q_no);
		
		model.addAttribute("qna", updto);
		
		return "myproductqnaUpdate.tiles";
	}
	
	//상품문의 삭제
	@ResponseBody
	@RequestMapping(value="myproductqnaDelete.do", method = RequestMethod.GET) 
	public String myproductqnaDelete(int q_no) {
		
	    String str = "";
	    boolean flag = qservice.qnaDel(q_no);
	   
	    if(flag) {
		    str = "<script>opener.document.location.href='myproductqna.do';self.close();</script>";
	    }else {
		    str = "<script>alert('error');</script>";
	    }
	   
	    return str;
	}
	   
}
