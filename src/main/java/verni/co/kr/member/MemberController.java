package verni.co.kr.member;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.scribejava.core.model.OAuth2AccessToken;

import verni.co.kr.benefit.CouponDto;
import verni.co.kr.benefit.PointDto;
import verni.co.kr.main.MainService;
import verni.co.kr.mypage.MypageService;


@Controller
public class MemberController {
	
	/* NaverLoginBO */
    private NaverLoginBO naverLoginBO;
    private String apiResult = null;
    
    @Autowired
    private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
        this.naverLoginBO = naverLoginBO;
    }
	
	@Autowired
	MemberService service;
	@Autowired
	MainService mservice;
	@Autowired
	MypageService myservice;

	@RequestMapping(value="login.do", method = RequestMethod.GET)
	public String login(HttpSession session, Model model, String url) {
		
        /* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
        String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
        
        //https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
        //redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
        //System.out.println("네이버:" + naverAuthUrl);
        
        //네이버 
        model.addAttribute("naverurl", naverAuthUrl);
 
        /* 생성한 인증 URL을 View로 전달 */
		
		
		return "login.tiles";
	}
	
    //네이버 로그인 성공시 callback호출 메소드
    @RequestMapping(value = "callback.do", method = { RequestMethod.GET, RequestMethod.POST })
    public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session, MemberDto dto)
            throws Exception {
    	
    	JsonParser json = new JsonParser();
    	
        //System.out.println("여기는 callback");
        
        OAuth2AccessToken oauthToken;
        oauthToken = naverLoginBO.getAccessToken(session, code, state);
        //로그인 사용자 정보를 읽어온다.
        String apiResult = naverLoginBO.getUserProfile(oauthToken);
        
        dto = json.changeJson(apiResult); // dto에 저장
        
        
        //System.out.println(apiResult);
        
        if (service.getNaverMember(dto) != null) { // 세션만들기 (이미 한번이라도 로그인한 정보가 있으면~)
			session.setAttribute("login", dto);
		}else { //쉐어베르니에서 로그인을 한번도 안했다면 가입!
			service.joinNaverMember(dto);
			session.setAttribute("login", dto);
			
			/* 포인트 적립 */
			service.setPoint(dto.getM_id());  //포인트 적립
			PointDto pd = service.getPoint(dto.getM_id());  
			
			service.setPointUse(pd); //적립 내역 가져오기
			
			/*1~3번 쿠폰 값 List에 담기*/
			List<CouponDto> list = service.getRegiCouponList(dto.getM_id());
			
			model.addAttribute("pd", pd);
			model.addAttribute("list", list);
		}
        
        
        model.addAttribute("result", apiResult);
 
        /* 네이버 로그인 성공 페이지 View 호출 */
        return "callback.tiles";
    }
	
	
	
	
	@RequestMapping(value="regi.do", method = RequestMethod.GET)
	public String regi() {
		return "regi.tiles";
	}
	
	@ResponseBody
	@RequestMapping(value="idcheck.do", method = RequestMethod.POST)
	public String idcheck(String m_id) {
		
		int count = service.idcheck(m_id);
		System.out.println(count);
		if(count > 0) {
			return "NO";
		}else {
			return "YES";
		}
	}
	//팝업1
	@RequestMapping(value="agree1.do", method = RequestMethod.GET)
	public String agree1() {
		return "member/agree1";
	}
	
	//팝업2
	@RequestMapping(value="agree2.do", method = RequestMethod.GET)
	public String agree2() {
		return "member/agree2";
	}
	
	@RequestMapping(value="regiAf.do", method = RequestMethod.POST)
	public String joinMember(MemberDto dto, Model model) {
		
		boolean flag = service.joinMember(dto);
		
		/* 포인트 적립 */
		service.setPoint(dto.getM_id());  //포인트 적립
		PointDto pd = service.getPoint(dto.getM_id());  
		
		service.setPointUse(pd); //적립 내역 가져오기
		
		/*1~3번 쿠폰 값 List에 담기*/
		List<CouponDto> list = service.getRegiCouponList(dto.getM_id());
		
		model.addAttribute("pd", pd);
		model.addAttribute("list", list);
		
		if(flag) {
			return "redirect:/login.do";
		}else {
			return "redirect:/regi.do";
		}
	}
	
	// 초희 추가 한 부분 있음
	@ResponseBody
	@RequestMapping(value = "loginAf.do", method = RequestMethod.POST)
	public String getMember(MemberDto dto, HttpServletRequest req, String url) {
	//	System.out.println("요청온 주소 Af : " + url);
		MemberDto loginmem = service.getMember(dto);
		// 초희 추가	(2021-08-19)
		List<PointDto> plist = mservice.getPointUseUpdateList();
		int pointUse = mservice.setPointUse(plist);
		mservice.pointUseUpdate(plist);
		List<CouponDto> clist = mservice.getCouponUseUpdateList();
		mservice.couponUseUpdate(clist);
		// 여기까지
		
		
		
		if (loginmem != null && !dto.getM_id().equals("")) {
			req.getSession().setAttribute("login", loginmem);
			req.getSession().setMaxInactiveInterval(60 * 60 * 24);

			if (loginmem.getM_level() == 1) { // 관리자면~
				return "ADMIN";
			}else if (loginmem.getM_level() == 9) { //탈퇴한 회원이면~
				return "WITHDRAW";
			}else { // 회원이면~
			
			// 초희 추가	(2021-08-19)
				
			List<PointDto> plist2 = mservice.getUserPointList(dto.getM_id());
			int point = 0;
			PointDto pd = new PointDto();
			for(int i=0; i<plist2.size(); i++) {
				pd = plist2.get(i);
				point += pd.getP_point();
			}
			
			MemberDto mem = new MemberDto(dto.getM_id(), point);
			mservice.mPointUpdate(mem);
				if(url == null) {
					return "MEM"+"null";			
				}else {
				
					return "MEM"+url;
				}
			}	
		} else {
			return "NO";
		}
	}

	
	@RequestMapping(value="pwdFind.do", method = RequestMethod.GET)
	public String pwdFind() {
		return "pwdFind.tiles";
	}
	
	@RequestMapping(value="idFind.do", method = RequestMethod.GET)
	public String idFind() {
		return "idFind.tiles";
	}
	
	@RequestMapping(value="idFindAf.do", method = RequestMethod.GET)
	public String idFindAf(Model model, MemberDto dto) {
		 
		
		MemberDto finddto = service.idFindAf(dto);
		
		model.addAttribute("dto", finddto);
		
		return "idFindAf.tiles";
	}
	
	
	//회원탈퇴 (level : 9)
	@RequestMapping(value="withdraw.do", method = RequestMethod.GET)
	public String withdraw(HttpServletRequest req, String menu, Model model) {
	    String m_id = ((MemberDto)req.getSession().getAttribute("login")).getM_id();
	      
	      //내 정보 가져오기
	    MemberDto dto = myservice.getUpdateMember(m_id);
	    
	    model.addAttribute("dto", dto);
		model.addAttribute("menu", menu);
		return "withdraw.tiles";
	}
	
	@ResponseBody
	@RequestMapping(value="withdrawAf.do", method = RequestMethod.GET)
	public String withdrawAf(String menu, Model model, MemberDto dto) {
		
		String message = "";
		//System.out.println("탈퇴확인:" + dto.toString());
		int count = service.withdraw(dto);
		if(count > 0) {
			message = "<script>location.href='logout.do';</script>";
		}else {
			message = "<script>alert('ej 탈퇴 에러');location.href='withdraw.do';</script>";
		}
		
		return message;
	}
}
