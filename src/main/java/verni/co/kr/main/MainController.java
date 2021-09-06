package verni.co.kr.main;

import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import verni.co.kr.chat.BotDto;
import verni.co.kr.product.ProductDto;
import verni.co.kr.product.ProductService;
import verni.co.kr.review.ReviewDto;


@Controller
public class MainController {
	
	@Autowired
	ProductService service;
	@Autowired
	MainService mService;
	
	
	@RequestMapping(value="main.do", method = RequestMethod.GET)
	public String main(Model model, HttpServletRequest req) {

	
		

		List<ProductDto> manList = service.getMainNewMan();
		model.addAttribute("manList", manList);
		List<ProductDto> womanList = service.getMainNewWoman();
		model.addAttribute("womanList", womanList);
		List<ProductDto> bagList = service.getMainWomanBag();
		model.addAttribute("bagList", bagList);
		List<ReviewDto> reviewList = mService.getBestReview();
		model.addAttribute("rlist", reviewList);
		

		// 메인페이지 열 때 사용하는 메소드 안에 같이 넣어주세요! 

		
		// 세션을 가져온다. (가져올 세션이 없다면 생성한다.)
        HttpSession httpSession = req.getSession(true);
        
        
		String uid;
		uid = (String)httpSession.getAttribute("uid");
		
		// session에 uid 저장여부 확인 없으면 새로 생성
		if(uid == null) {
			// UID 생성하기
			uid = UUID.randomUUID().toString().replace("-", "");
			// session에 UID 저장
			
	        httpSession.setAttribute("uid", uid);
			//req.getSession().setAttribute("uid", uid);
			System.out.println("uid생성 : " + uid);
		} else {
		// 있으면 계속 사용
			System.out.println("uid확인 : " + uid);
		}
		
		return "main.tiles";
	}
	
	@RequestMapping(value="logout.do", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "main.tiles";
	}
	
	@RequestMapping(value="admin.do", method = RequestMethod.GET) 
    public String login() {
		return "redirect:/chart.do"; 
     }
	   
	
	
	@RequestMapping(value="content.do", method = RequestMethod.GET) 
	public String content() {
		return "content.tiles";
	}
	
	
	@RequestMapping(value="event.do", method = RequestMethod.GET) 
	public String event() {
		return "event.tiles";
	}
	
	@RequestMapping(value="about.do", method = RequestMethod.GET) 
	public String about() {
		return "about.tiles";
	}
	
	@RequestMapping(value="userInfo.do", method = RequestMethod.GET) 
	public String userInfo() {
		return "userInfo.tiles";
	}
	@RequestMapping(value="terms.do", method = RequestMethod.GET) 
	public String terms() {
		return "terms.tiles";
	}
	
	
	

	// 메인 컨트롤러에 밑에 2개 추가해주세요
	
	@ResponseBody
	@RequestMapping(value="question.do", method = RequestMethod.GET)
	public List<BotDto> getQuestion(Model model, String b_category) {
		List<BotDto> list = mService.getQuestion(b_category);
		model.addAttribute("qlist", list);
		System.out.println(list.toString());
		
		return list;
	}
	
	
	
	@ResponseBody
	@RequestMapping(value="getBotData.do", method = RequestMethod.GET)
	public void getBotData(Model model) {
		
				// 챗봇 정보 리스트 가져오기
				List<BotDto> list = mService.botList();
				// 모델에 저장
				model.addAttribute("botList", list);
				System.out.println(list.toString());
		
	}
	
	
}
