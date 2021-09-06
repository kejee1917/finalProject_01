package verni.co.kr.wish;


import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import verni.co.kr.member.MemberDto;
import verni.co.kr.product.ProductService;

@Controller
public class WishController {
	
	@Autowired
	WishService service;
	@Autowired
	ProductService pService;
	
	@RequestMapping(value = "wishList.do", method = RequestMethod.GET)
	public String wishList(Model model, HttpServletRequest hsr) {
		MemberDto mem = (MemberDto)hsr.getSession().getAttribute("login");
		String id = mem.getM_id();
		List<WishDto> list = service.wishList(id);
		model.addAttribute("list", list);
		return "wish.tiles";
	}
	
	@ResponseBody
	@RequestMapping(value = "wishDel.do", method = RequestMethod.POST)
	public boolean wishDel(int w_no) {
		boolean w = service.deleteWish(w_no);
		return w;
	}
	
	@RequestMapping(value = "deleteWish.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String deleteWish(String no) {
		int w_no;
		String[] wno = no.split(","); // 0,1,2 0,   1,  2,
		for(int i = 0; i < wno.length; i++) {
			wno[i] = wno[i].replace(",", ""); // 0 1 3
			w_no =  Integer.parseInt(wno[i]);
			service.deleteWish(w_no);
		}
		return "redirect:/wishList.do";
	}
	
	
	
}
