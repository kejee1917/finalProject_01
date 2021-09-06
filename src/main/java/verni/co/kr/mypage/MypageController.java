package verni.co.kr.mypage;

import java.io.File;
import java.text.ParseException;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import verni.co.kr.benefit.CouponDto;
import verni.co.kr.benefit.PointUseDto;
import verni.co.kr.member.MemberDto;
import verni.co.kr.message.MessageDto;
import verni.co.kr.message.MessageService;
import verni.co.kr.mycalendar.MycalendarParamDto;
import verni.co.kr.myqna.MyqnaDto;
import verni.co.kr.order.OrderDetailDto;
import verni.co.kr.product.ProductDto;
import verni.co.kr.review.ReviewDto;
import verni.co.kr.util.CalendarUtil;
import verni.co.kr.util.MypageUtil;
import verni.co.kr.util.ProductUtil;

@Controller
public class MypageController {

   @Autowired
   MypageService service;
   
   @Autowired
   MessageService mservice;
   
   //마이페이지 메인화면(첫화면)
   @RequestMapping(value = "mypageHome.do", method = RequestMethod.GET)
   public String mypageHome(HttpServletRequest req, Model model) {
      
      String m_id = ((MemberDto)req.getSession().getAttribute("login")).getM_id();
      
      //내 정보 가져오기
      MemberDto dto = service.getUpdateMember(m_id);
      
      //내가 가진 쿠폰 개수 불러오기
      int count = service.myCouponCount(m_id);
      //내 포인트 불러오기
      int point = service.getPoint(m_id);
      //내 총구매 금액 불러오기
      int totalpay = service.totalpay(m_id);
      //배송중 개수 불러오기
      int deliveryCount = service.deliveryCount(m_id);
      //답변 달린 MYQNA 가져오기
      int answerCount = service.answerCount(m_id);
      
      model.addAttribute("dto", dto);
      model.addAttribute("couponCount", count);
      model.addAttribute("pointCount", point);
      model.addAttribute("totalpayCount", totalpay);
      model.addAttribute("deliveryCount", deliveryCount);
      model.addAttribute("answerCount", answerCount);
      
      return "mypageHome.tiles";
   }
   
   //내 정보 수정
   @RequestMapping(value = "mypage.do", method = RequestMethod.GET)
   public String mypage(String menu, HttpServletRequest req, Model model) {
      //로그인한 정보 세션에서 얻어오기
      String m_id = ((MemberDto)req.getSession().getAttribute("login")).getM_id();
      
      MemberDto dto = service.getUpdateMember(m_id);
      //System.out.println("확인:" + dto.toString());
      
      model.addAttribute("menu", menu);
      model.addAttribute("dto", dto);
      return "mypage.tiles";
   }
   
  
   @RequestMapping(value = "mypageAf.do", method = RequestMethod.GET)
   public String mypageAf(HttpServletRequest req, Model model) {
      //로그인한 정보 세션에서 얻어오기
      String m_id = ((MemberDto)req.getSession().getAttribute("login")).getM_id();
      
      MemberDto dto = service.getUpdateMember(m_id);
      //System.out.println("클릭 후 수정 확인: "+dto.toString());
      model.addAttribute("dto", dto);
      
      return "mypage.tiles";
   }
   
   @ResponseBody
   @RequestMapping(value = "myInfoAf.do", method = RequestMethod.POST)
   public String myInfoAf(MemberDto dto) {
      
      int count = service.myInfoAf(dto);
      
      if(count>0) {
         return "YES";
      }else {
         return "NO";
      }
   }
   
   @RequestMapping(value = "mypageCal.do", method = RequestMethod.GET)
   public String mypageCal(HttpServletRequest req, String menu, Model model, MycalendarParamDto param) {
	   
	  //로그인한 정보 세션에서 얻어오기
	  String m_id = ((MemberDto)req.getSession().getAttribute("login")).getM_id();
	  //내 정보 가져오기
      MemberDto dto = service.getUpdateMember(m_id);
      
      Calendar cal = Calendar.getInstance();
      
      int year = param.getYear();
      int month = param.getMonth();
      int day = param.getDay();
      if(month == 0) {
         year--;
         month = 12;
      }
      else if(month == 13) {
         year++;
         month = 1;
      }
      else if(month < 0) {   // 처음 들어 온경우
         year = cal.get(Calendar.YEAR);
         month = cal.get(Calendar.MONTH) + 1;
         if(day < 0) {
            day = cal.get(Calendar.DATE);
         }
      }
      cal.set(year, month - 1, 1);
      
      // 시작 요일
      int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK);
      // 마지막 날짜
      int lastDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
      
      param.setYear(year);
      param.setMonth(month);
      param.setDay(day);
      param.setDayOfWeek(dayOfWeek);
      param.setLastDay(lastDay);
      
      //System.out.println("날짜: " + param);
      //배송완료된 것 가져오기
      List<OrderDetailDto> list = service.getDeliveryComplete(m_id);

      if(list.size()>0 && list != null) { //배송완료 항목이 있을때만~
    	  
    	  for(int i=0; i<list.size(); i++) {
    		  
    		  //21/08/17 -> 2021 8 17 
    		  String startdate = CalendarUtil.calJspFormat(list.get(i).getOd_startdate());
    		  String enddate = CalendarUtil.calJspFormat(list.get(i).getOd_enddate());
    		  //System.out.println("startdate : " + startdate);
    		  
    		  list.get(i).setOd_startdate(startdate);
    		  list.get(i).setOd_enddate(enddate);
    	  }
    	  
    	 model.addAttribute("list", list); 
    	 //System.out.println("배송완료 list : " + list);
      }
      model.addAttribute("dto", dto);
      model.addAttribute("cal", param);   // 날짜
      model.addAttribute("menu", menu);
      
      return "mypageCal.tiles";
   }
   
   @RequestMapping(value = "mypoint.do", method = RequestMethod.GET)
   public String mypoint(String menu, HttpServletRequest req, Model model) {
      
      String m_id = ((MemberDto)req.getSession().getAttribute("login")).getM_id();
      List<PointUseDto> list = service.getPointList(m_id);
      //내 정보 가져오기
      MemberDto dto = service.getUpdateMember(m_id);
      
      //내 포인트 불러오기
      int point = service.getPoint(m_id); 

      model.addAttribute("pointCount", point);
      model.addAttribute("menu", menu);
      model.addAttribute("list", list);
      model.addAttribute("dto", dto);
      
      return "mypoint.tiles";
   }
   
   //작성한 리뷰
   @RequestMapping(value = "myreview.do", method = RequestMethod.GET)
   public String myreview(HttpServletRequest req, String menu, Model model) {
      
      String m_id = ((MemberDto)req.getSession().getAttribute("login")).getM_id();
      //내 정보 가져오기
      MemberDto dto = service.getUpdateMember(m_id);
      
      List<ReviewDto> list = service.writtenReview(m_id);
      
      model.addAttribute("list", list);
      model.addAttribute("menu", menu);
      model.addAttribute("dto", dto);
      
      return "myreview.tiles";
   } 
   
   //작성 가능한 리뷰
   @RequestMapping(value = "valid.do", method = RequestMethod.GET)
   public String valid(HttpServletRequest req, String menu, Model model) {
      
      String m_id = ((MemberDto)req.getSession().getAttribute("login")).getM_id();
      //내 정보 가져오기
      MemberDto dto = service.getUpdateMember(m_id);
      
      List<OrderDetailDto> list = service.validReview(m_id);
      
      model.addAttribute("list", list);
      model.addAttribute("menu", menu);
      model.addAttribute("dto", dto);
      
      return "myreview_valid.tiles";
   }
   
   //내가 쓴 리뷰 팝업으로 읽기
   @RequestMapping(value = "reviewRead.do", method = RequestMethod.GET)
   public String reviewRead(int r_no, Model model) {
      
      ReviewDto dto = service.getReview(r_no);
      ReviewDto rdto = service.getmyreviewReply(r_no);
      
      model.addAttribute("updto", dto);
      model.addAttribute("downdto", rdto);
      
      return "reviewRead.tiles";
   }
   
   //0826은지 추가 : 리뷰 삭제
   @ResponseBody
   @RequestMapping(value = "myreviewDelete.do", method = RequestMethod.GET)
   public String myreviewDelete(int r_no) {
	   
	   String str = "";
	   int count = service.myreviewDelete(r_no);
	   
	   if(count > 0) {
		   str = "<script>opener.document.location.href='myreview.do';self.close();</script>";
	   }else {
		   str = "<script>alert('error');</script>";
	   }
	   
	   return str;
	   
   }
   
   //0830 리뷰 수정 전
   @RequestMapping(value = "myreviewUpdate.do", method = RequestMethod.GET)
   public String myreviewUpdate(int r_no, Model model) {

	   ReviewDto dto = service.getReview(r_no);
      
	   model.addAttribute("updto", dto);
	   
	   return "reviewUpdate.tiles";
   }
   
   //0830 리뷰 수정 후 
   @RequestMapping(value = "myreviewUpdateAf.do", method = RequestMethod.POST)
   public String myreviewUpdateAf(ReviewDto dto, MultipartHttpServletRequest mhsr, 
			@RequestParam("filename") MultipartFile[] file, String oldimage) throws Exception{  

		System.out.println("예전파일 : "+oldimage );
		
		String fileOriginName = "";
		String fileMultiName = "";
		String OriginName = "";
		String uploadPath = mhsr.getRealPath("/upload/reviewImage");
		
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
				dto.setR_newfilename("");
			}else if(oldimage.contains("undefined,")) {	
				oldimage = oldimage.replace("undefined,", "");
				dto.setR_newfilename(oldimage.substring(0,  oldimage.lastIndexOf(",")));
			}else if(oldimage.equals("")) {
				dto.setR_filename("");
				dto.setR_newfilename("");
			}else {
				System.out.println("컨트롤러oldimage : " +oldimage.substring(0,  oldimage.lastIndexOf(",")));
				dto.setR_newfilename(oldimage.substring(0,  oldimage.lastIndexOf(",")));
			}
		}else {
			
			if( oldimage.equals("undefined,")) {
				dto.setR_filename(OriginName);
				dto.setR_newfilename(fileMultiName);
			}else if(oldimage.contains("undefined,")) {	
				dto.setR_filename(OriginName);
				oldimage = oldimage.replace("undefined,", "");
				dto.setR_newfilename(oldimage+fileMultiName);
			}else if(oldimage.equals("")) {
				dto.setR_filename(OriginName);
				dto.setR_newfilename(fileMultiName);
			}else {
				dto.setR_filename(OriginName);
				dto.setR_newfilename(oldimage+fileMultiName);
			}

		}
		
		service.reviewUpdateAf(dto);
		
		return "redirect:/myreview.do";
   }
   
   @RequestMapping(value = "mycoupon.do", method = RequestMethod.GET)
   public String mycoupon(String menu, HttpServletRequest req, Model model) {
      
      String m_id = ((MemberDto)req.getSession().getAttribute("login")).getM_id();
      //내 정보 가져오기
      MemberDto dto = service.getUpdateMember(m_id);
      
      List<CouponDto> list = service.myCouponList(m_id);
      //내가 가진 쿠폰 개수 불러오기
      int count = service.myCouponCount(m_id);
      
      model.addAttribute("menu", menu);
      model.addAttribute("list", list);
      model.addAttribute("couponCount", count);
      model.addAttribute("dto", dto);
      
      return "mycoupon.tiles";
   }
   
   @RequestMapping(value = "myorder.do", method = RequestMethod.GET)
   public String myorder(String menu, String bigger, String smaller, HttpServletRequest req, Model model) {
      
      String m_id = ((MemberDto)req.getSession().getAttribute("login")).getM_id();
      //내 정보 가져오기
      MemberDto dto = service.getUpdateMember(m_id);
      
      List<OrderDetailDto> list = null;
      String[] str = new String[2];
      
      if(bigger == null && smaller == null) {
         list = service.getMy1monthList(m_id);
         str[0] = "";
         str[1] = "";
      }else {
         //2021-08-17 -> 21/08/17
         str = MypageUtil.changeDate(bigger, smaller);
         
         Map<String,Object> map = new HashMap<String,Object>();
         map.put("m_id", m_id);
         map.put("leftdate", str[0]);
         map.put("rightdate", str[1]);
         
         list = service.getMyOrderList(map);
      }
      model.addAttribute("bigger", str[1]);
      model.addAttribute("smaller", str[0]);
      model.addAttribute("list", list);
      model.addAttribute("menu", menu);
      model.addAttribute("dto", dto);
      
      return "myorder.tiles";
      
   }
   
   
   
   //주문취소
   @ResponseBody
   @RequestMapping(value = "myorderCancel.do", method = RequestMethod.GET)
   public boolean myorderCancel(String m_id, int od_no) {
      int ms_no = mservice.getMsno(od_no);
      MessageDto ms = new MessageDto(ms_no, "미처리", null, m_id + "님으로부터 주문 취소가 들어왔습니다.", null, od_no);
      System.out.println(ms.toString());
      //메세지 보내기
      boolean a = mservice.msgUpdate(ms);
      //결제완료->취소진행중
      service.myorderCancelAf(od_no);
      return a;
   }
   

}