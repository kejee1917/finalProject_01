package verni.co.kr.cart;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import verni.co.kr.benefit.CouponDto;

@Repository
public class CartDao {

	@Autowired
	SqlSession session;
	
	String ns = "Cart.";
	
	
	public List<CartDto> cartList(String id){
		
		List<CartDto> list = session.selectList(ns + "cartList", id);
		
		return list;
	}
	
	public boolean changePeriod(CartDto dto) {
		
		int count = session.update(ns + "changePeriod", dto);
		
		return count>0?true:false;
	}
	
	public boolean deleteCart(int no) {
		
		int count = session.delete(ns + "deleteCart", no);
		
		return count>0?true:false;
	}
	
	public List<CouponDto> couponList(String id) {
		
		List<CouponDto> list = session.selectList(ns + "couponList", id);
		
		return list;
	}
	
	

	// 초희 추가
	// 제품디테일에서 장바구니 add 8/5
	public boolean addCart(CartDto ct) {
		int count = session.insert(ns+"addCart", ct);
		return count>0;
	}
	public int getCart(CartDto ct) {
		return session.selectOne(ns+"getCart", ct);
	}
}
