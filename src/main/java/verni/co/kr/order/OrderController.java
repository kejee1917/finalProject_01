package verni.co.kr.order;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import verni.co.kr.benefit.CouponDto;
import verni.co.kr.benefit.PointDto;
import verni.co.kr.benefit.PointUseDto;
import verni.co.kr.member.MemberDto;
import verni.co.kr.message.MessageDto;
import verni.co.kr.message.MessageService;


@Controller
public class OrderController {

	@Autowired
	OrderService service;
	// 8월 20일 초희 추가
	@Autowired
	MessageService mservice;

	
	@RequestMapping(value="complete.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String ocomplete(Model model, OrderDto dto) {
		
		System.out.println("complete: " + dto.toString());
		
		OrderDto odto = new OrderDto();
		odto.setO_number(dto.getO_number());
		odto.setO_total(dto.getO_total());
		
		model.addAttribute("completeInfo", odto);
		
		return "complete.tiles";
	}
	
	
	
	@ResponseBody
	@RequestMapping(value="memberUpdate.do", method = { RequestMethod.GET, RequestMethod.POST })
	public void memberUpdate(MemberDto dto) {
		
		boolean check = service.memberUpdate(dto);
		
		System.out.println("memberUpdate: " + check);
	}
	
	@ResponseBody
	@RequestMapping(value="couponUpdate.do", method = { RequestMethod.GET, RequestMethod.POST })
	public void couponUpdate(CouponDto dto) {
		
		boolean check = service.couponUpdate(dto);
		
		System.out.println("couponUpdate: " + check);

		
	}
	
//	@RequestMapping(value="getPointList.do", method = { RequestMethod.GET, RequestMethod.POST })
//	public void getPointList(Model model,String id){
//		
//		List<PointDto> list = service.getPointList(id);
//		
//		model.addAttribute("pointList", list);
//	}
	
	@ResponseBody
	@RequestMapping(value="ordered.do", method = { RequestMethod.GET, RequestMethod.POST })
	public void ordered(OrderDto dto) {
		boolean check = service.ordered(dto);
		
		// 8월 20일 초희 추가
		MessageDto ms = new MessageDto(0, "미처리", "주문",  dto.getM_id()+"님으로부터 주문("+dto.getO_number()+")이 들어왔습니다.", null, mservice.getOrderMaxNo());
		boolean a = mservice.messageAdd(ms);
		System.out.println("order: " + check);
	}
	
	@ResponseBody
	@RequestMapping(value="orderDetail.do", method = { RequestMethod.GET, RequestMethod.POST })
	public void orderDetail(OrderDetailDto dto) {
		
		boolean check = service.orderDetail(dto);
		System.out.println("orderDetail: " + check);

	}
	
	@ResponseBody
	@RequestMapping(value="pointUpdate.do", method = { RequestMethod.GET, RequestMethod.POST })
	public void pointUpdate(PointDto dto) {
		
		boolean check = service.pointUpdate(dto);
		System.out.println("Point: " + check);
	}
	
	@ResponseBody
	@RequestMapping(value="usePoint.do", method = { RequestMethod.GET, RequestMethod.POST })
	public void usePoint(PointUseDto dto) {
		
		boolean check = service.usePoint(dto);
		System.out.println("PointUse: " + check);
	}
	
	@ResponseBody
	@RequestMapping(value="cartDelete.do", method = { RequestMethod.GET, RequestMethod.POST })
	public void cartDelete(int c_no) {
		
		boolean check = service.cartDelete(c_no);
		System.out.println("cartDelete: " + check);

	}
	
	@ResponseBody
	@RequestMapping(value="updateStatus.do", method = { RequestMethod.GET, RequestMethod.POST })
	public void updateStatus(int p_no) {
		
		boolean check = service.updateStatus(p_no);
		System.out.println("updateStatus: " + check);

	}
}
