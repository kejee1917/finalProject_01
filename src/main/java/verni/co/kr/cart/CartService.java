package verni.co.kr.cart;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import verni.co.kr.benefit.CouponDto;

@Service
public class CartService {
	
	@Autowired
	CartDao dao;
	
	public List<CartDto> cartList(String id){
		return dao.cartList(id);
	}

	public boolean changePeriod(CartDto dto) {
		return dao.changePeriod(dto);
	}
	
	public boolean deleteCart(int no) {
		return dao.deleteCart(no);
	}
	
	public List<CouponDto> couponList(String id){
		return dao.couponList(id);
	}
	
	

	// 초희 추가
	// 제품디테일에서 장바구니 add 8/5
	public boolean addCart(CartDto ct) {
		return dao.addCart(ct);
	}
	public int getCart(CartDto ct) {
		return dao.getCart(ct);
	}
}
