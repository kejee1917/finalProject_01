package verni.co.kr.admin2;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import verni.co.kr.admin.AdminParam;
import verni.co.kr.benefit.CouponDto;
import verni.co.kr.order.OrderDetailDto;
import verni.co.kr.order.OrderDto;

@Service
public class Admin2Service {
	@Autowired
	Admin2Dao dao;
	
	public List<OrderDto> getOrderList(AdminParam param){
		return dao.getOrderList(param);
	}
	// 총 글 수 
	public int getTotalCount(AdminParam param) {
		return dao.getTotalCount(param);
	}
	public int  orderStatusUpdate(OrderDetailDto od) {
		return dao.orderStatusUpdate(od);
	}
	
	public int postSuccessUpdate(OrderDetailDto od) {
		return dao.postSuccessUpdate(od);
	}
	public void memberLevelUpdate(String m_id) {
		dao.memberLevelUpdate(m_id);
	}
	public int productStatusUpdate(String p_no) {
		return dao.productStatusUpdate(p_no);
	}
	
	public int getMemberLever(String m_id) {
		return dao.getMemberLever(m_id);
	}
	
	public int getCouponNum(String m_id) {
		return dao.getCouponNum(m_id);
	}
	
	public List<CouponDto> getSiverCouponList(String m_id){
		List<CouponDto> list = dao.getSiverCouponList();
		for(int i=0; i<list.size(); i++) {
			list.get(i).setM_id(m_id);
		}
		dao.setRegiCoupon(list);
		
		return list;
	}
	public List<CouponDto> getGoldCouponList(String m_id){
		List<CouponDto> list = dao.getGoldCouponList();
		for(int i=0; i<list.size(); i++) {
			list.get(i).setM_id(m_id);
		}
		dao.setRegiCoupon(list);
		
		return list;
	}
	public List<CouponDto> getDiaCouponList(String m_id){
		List<CouponDto> list = dao.getDiaCouponList();
		for(int i=0; i<list.size(); i++) {
			list.get(i).setM_id(m_id);
		}
		dao.setRegiCoupon(list);
		
		return list;
	}
	
	
	
}
