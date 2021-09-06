package verni.co.kr.cart;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import verni.co.kr.benefit.CouponDto;
import verni.co.kr.benefit.PointDto;
import verni.co.kr.member.MemberDto;
import verni.co.kr.member.MemberService;
import verni.co.kr.order.OrderService;
import verni.co.kr.product.ProductDto;
import verni.co.kr.product.ProductService;

@Controller
public class CartController {
	
	@Autowired
	CartService service;
	
	@Autowired
	MemberService mservice;
	
	@Autowired
	OrderService oservice;
	@Autowired
	ProductService pservice;
	
	@RequestMapping(value="cart.do", method = RequestMethod.GET)
	public String cart() {
		return "cart.tiles";
	}
	

	@RequestMapping(value="cartList.do", method = RequestMethod.GET)
	public String cartList(Model model, HttpServletRequest req, MemberDto dto) {
		
		dto = (MemberDto)req.getSession().getAttribute("login");
		
		System.out.println("id:"+dto.getM_id());
		
		List<CartDto> list = service.cartList(dto.getM_id());
		
		model.addAttribute("cartList", list);
		
		System.out.println(list.toString());
		
		return "cart.tiles";
	}
	
	@RequestMapping(value="payment.do", method = RequestMethod.GET)
	public String payment(Model model, String index, HttpServletRequest req, MemberDto dto) {
		
		dto = (MemberDto)req.getSession().getAttribute("login");
		
		//System.out.println("pay_id:"+dto.getM_id());
		
		List<CartDto> list = service.cartList(dto.getM_id());
				
		//System.out.println("list: " + list.toString());
		
		List<CartDto> orderList = new ArrayList<CartDto>();
		
		String[] idx = index.split(","); // 0,1,2 0,   1,  2,
		
	
		for(int i = 0; i < idx.length; i++) {
			
		idx[i] = idx[i].replace(",", ""); // 0 1 3
		
	   // System.out.println(idx[i]);
	    
	    //System.out.println(list.get(Integer.parseInt(idx[i])));
		
		orderList.add(list.get(Integer.parseInt(idx[i])));
		
		
		}	
		
		// 쿠폰 리스트
		List<CouponDto> clist = service.couponList(dto.getM_id());
				
		//System.out.println(clist.toString());

		model.addAttribute("couponList", clist);
		
		// 회원 정보
		MemberDto mdto = mservice.getMember(dto);
		model.addAttribute("memInfo", mdto);
		
		// 포인트 리스트
		List<PointDto> plist = oservice.getPointList(dto.getM_id());
		model.addAttribute("pointList", plist);
		
		//System.out.println("plist:" + plist.toString());
		// 주문 상품 리스트
		//System.out.println("list: " + orderList.toString());
		model.addAttribute("orderList", orderList);
		
		
				
		return "payment.tiles";
	}
	
	@ResponseBody
	@RequestMapping(value="changePeriod.do", method = { RequestMethod.GET, RequestMethod.POST })
	public void changePeriod(CartDto dto) {
		System.out.println("change Dto: " + dto.toString());
		
		boolean check = service.changePeriod(dto);
		
		System.out.println("change: " + check);
	
	}
	
//	@ResponseBody
	@RequestMapping(value="deleteCart.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String deleteCart(String no) {
		
		int c_no;
		String[] sno = no.split(","); // 0,1,2 0,   1,  2,
		
		for(int i = 0; i < sno.length; i++) {
			
		sno[i] = sno[i].replace(",", ""); // 0 1 3
		
	    System.out.println(sno[i]);
	    
	    c_no = Integer.parseInt(sno[i]);
	    
	    boolean check = service.deleteCart(c_no);
	    
	    System.out.println("deleteCheck: " + check);
		
		}	
		
		return "redirect:/cartList.do";
	}
	
	
	// 8/5일 초희 추가
	@ResponseBody
	@RequestMapping(value="cartAdd.do", method = RequestMethod.POST)
	public boolean cartAdd(CartDto ct) {
		int num = service.getCart(ct);
		boolean flag = false;
		if(num == 0) {
		flag = service.addCart(ct);
			return flag;
		}else {
			return flag;
		}
	}
	// 8/10일 초희 추가
	@RequestMapping(value="paymentPage.do", method = RequestMethod.GET)
	public String paymentPage(Model model, String index, HttpServletRequest req, MemberDto dto, CartDto cdto) {
		
		dto = (MemberDto)req.getSession().getAttribute("login");
		
		System.out.println(cdto.toString());
		
		List<CartDto> orderList = new ArrayList<CartDto>();
		
		ProductDto pd = pservice.getProduct(cdto.getP_no());
		
		cdto.setP_brand(pd.getP_brand());
		cdto.setP_name(pd.getP_name());
		cdto.setP_newimage1(pd.getP_newimage1());
		
		orderList.add(cdto);
		
		
			
		
		// 쿠폰 리스트
		List<CouponDto> clist = service.couponList(dto.getM_id());
		model.addAttribute("couponList", clist);
		
		// 회원 정보
		MemberDto mdto = mservice.getMember(dto);
		model.addAttribute("memInfo", mdto);
		
		// 포인트 리스트
		List<PointDto> plist = oservice.getPointList(dto.getM_id());
		model.addAttribute("pointList", plist);
		
		
		model.addAttribute("orderList", orderList);
		
		
				
		return "payment.tiles";
	}
	
	
	
}
