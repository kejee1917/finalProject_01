package verni.co.kr.admin2;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import verni.co.kr.admin.AdminParam;
import verni.co.kr.benefit.CouponDto;
import verni.co.kr.message.MessageService;
import verni.co.kr.order.OrderDetailDto;
import verni.co.kr.order.OrderDto;

@Controller
public class Admin2Controller {
	@Autowired
	Admin2Service service;
	@Autowired
	MessageService mservice;
	@RequestMapping( value = "adminOrder.do", method = RequestMethod.GET)
	public String adminOrder(Model model, AdminParam param) {
		int sn = param.getPageNumber();
		int start = 1 + sn * 10;
		int end = 10 + sn * 10;
		
		param.setStart(start);
		param.setEnd(end);
		
		// 현재 페이지
		model.addAttribute("pageNumber", param.getPageNumber()+1);
		
		// 글의총수
		int page = service.getTotalCount(param);
		model.addAttribute("page", page);
		
		// 검색 고정
		model.addAttribute("choice", param.getChoice());
		model.addAttribute("search", param.getSearch());
		
		List<OrderDto> olist = service.getOrderList(param);
		model.addAttribute("olist", olist);
		
		return "adminOrder.tiles";
	}

	
	
	@ResponseBody
	@RequestMapping( value = "orderUpdate.do", method = RequestMethod.GET)
	public int orderUpdate(OrderDetailDto od, String m_id, String p_no, int ms_no) {
		int count = 0;
//		System.out.println(od.getOd_status());
		
		if(od.getOd_status().equals("주문확인")) {
			mservice.statusUpdate(ms_no);
			count = service.orderStatusUpdate(od);
		}
		else if(od.getOd_status().equals("주문취소")) {
			mservice.statusUpdate(ms_no);
			count = service.orderStatusUpdate(od);
			service.productStatusUpdate(p_no);
		}
		else if(od.getOd_status().equals("배송완료")) {
			service.memberLevelUpdate(m_id);
			service.postSuccessUpdate(od);
			count = service.orderStatusUpdate(od);
			
			
			List<CouponDto> clist;
			int cp_number = service.getCouponNum(m_id);	// 쿠폰 발행 여부 확인
			int level = service.getMemberLever(m_id);	// 멤버 레벨 가져오기
			if(level == 3) {
				if(cp_number == 3) {
					clist = service.getSiverCouponList(m_id);
				}
				
			}else if(level == 4) {
				if(cp_number == 3) {
					clist = service.getSiverCouponList(m_id);
					clist = service.getGoldCouponList(m_id);
				}
				else if(cp_number == 6) {
					clist = service.getGoldCouponList(m_id);
				}
				
			}else if(level == 5) {
				if(cp_number == 3) {
					clist = service.getSiverCouponList(m_id);
					clist = service.getGoldCouponList(m_id);
					clist = service.getDiaCouponList(m_id);
				}
				else if(cp_number == 6) {
					clist = service.getGoldCouponList(m_id);
					clist = service.getDiaCouponList(m_id);
				}
				else if(cp_number == 9) {
					clist = service.getDiaCouponList(m_id);
				}
			}
		}else if(od.getOd_status().equals("회수완료")) {
			service.productStatusUpdate(p_no);
			count = service.orderStatusUpdate(od);
		}else if(od.getOd_status().equals("발송완료")) { // 발송완료
			count = service.orderStatusUpdate(od);
		}
		return count;
	}
	
	@ResponseBody
	@RequestMapping( value = "orderMultyUpdate.do", method = RequestMethod.GET)
	public int orderMultyUpdate(String od_status,
						   String o_numberStr, String od_periodStr, String p_noStr, String m_idStr, String ms_noStr, String od_noStr) {
		int count = 0;
		System.out.println(o_numberStr);
		System.out.println(od_status);
		String [] o_number = o_numberStr.split(",");
		String [] od_period = od_periodStr.split(",");
		String [] p_no = p_noStr.split(",");
		String [] m_id = m_idStr.split(",");
		String [] ms_no = ms_noStr.split(",");
		String [] od_no = od_noStr.split(",");
		
		int size = o_number.length;
		
		OrderDetailDto od = null;
		OrderDetailDto od2 = null;
		for( int i=0; i<size; i++) {
			 od = new OrderDetailDto(Integer.parseInt(od_no[i]), od_status);
			 od2 = new OrderDetailDto(Integer.parseInt(od_no[i]), od_period[i],od_status );
			 System.out.println(od.toString());
			 
			if(od_status.equals("주문확인")) {
				// 메세지 상태 업데이트
				mservice.statusUpdate(Integer.parseInt(ms_no[i]));
				// 주문 상태 업데이트
				count = service.orderStatusUpdate(od);
			}else if(od_status.equals("주문취소")) {
				mservice.statusUpdate(Integer.parseInt(ms_no[i]));
				service.productStatusUpdate(p_no[i]);
				count = service.orderStatusUpdate(od);
			}else if(od_status.equals("배송완료")) {
				// 맴버 레벨 업
				service.memberLevelUpdate(m_id[i]);
				// 대여 시작일, 종료일 업데이트
				service.postSuccessUpdate(od2);
				count = service.orderStatusUpdate(od);

				List<CouponDto> clist;
				int cp_number = service.getCouponNum(m_id[i]);	// 쿠폰 발행 여부 확인
				int level = service.getMemberLever(m_id[i]);	// 멤버 레벨 가져오기
				System.out.println("쿠폰 발행 여부 확인:"+cp_number+"멤버 레벨 :"+level);
				if(level == 3) {
					if(cp_number == 3) {
						clist = service.getSiverCouponList(m_id[i]);
					}
					
				}else if(level == 4) {
					if(cp_number == 3) {
						clist = service.getSiverCouponList(m_id[i]);
						clist = service.getGoldCouponList(m_id[i]);
					}
					else if(cp_number == 6) {
						clist = service.getGoldCouponList(m_id[i]);
					}
					
				}else if(level == 5) {
					if(cp_number == 3) {
						clist = service.getSiverCouponList(m_id[i]);
						clist = service.getGoldCouponList(m_id[i]);
						clist = service.getDiaCouponList(m_id[i]);
					}
					else if(cp_number == 6) {
						clist = service.getGoldCouponList(m_id[i]);
						clist = service.getDiaCouponList(m_id[i]);
					}
					else if(cp_number == 9) {
						clist = service.getDiaCouponList(m_id[i]);
					}
				}
				
			}else if(od_status.equals("회수완료")) {
				// 상품 상태 업데이트
				service.productStatusUpdate(p_no[i]);
				count = service.orderStatusUpdate(od);
			}else { // 발송완료
				count = service.orderStatusUpdate(od);
			}
			
			count++;
		}
		
		System.out.println("count:"+count);
		return count;
		
	}
}
