package verni.co.kr.admin2;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import verni.co.kr.admin.AdminParam;
import verni.co.kr.benefit.CouponDto;
import verni.co.kr.order.OrderDetailDto;
import verni.co.kr.order.OrderDto;

@Repository
public class Admin2Dao {
	@Autowired
	SqlSession session;
	String ns = "Admin2.";
	
	public List<OrderDto> getOrderList(AdminParam param) {
		return session.selectList(ns+"getOrderList", param);
	}
	// 총 글수
	public int getTotalCount(AdminParam param) {
		return session.selectOne(ns+"getTotalCount", param);
	}
	
	public int orderStatusUpdate(OrderDetailDto od) {
		return session.update(ns+"orderStatusUpdate", od);
	}
	
	public int postSuccessUpdate(OrderDetailDto od) {
		return session.update(ns+"postSuccessUpdate", od);
	}
	public void memberLevelUpdate(String m_id) {
		session.update(ns+"memberLevelUpdate", m_id);
	}
	
	public int productStatusUpdate(String p_no) {
		return session.update(ns+"productStatusUpdate", p_no);
	}
	
	// 등업 쿠폰 넣어주기 관련
	public int getMemberLever(String m_id) {
		return session.selectOne(ns+"getMemberLever", m_id);
	}
	// 쿠폰 발행 여부 확인
	public int getCouponNum(String m_id) {
		return session.selectOne(ns+"getCouponNum", m_id);
	}
	// 실버쿠폰 가져오기
	public List<CouponDto> getSiverCouponList(){
		return session.selectList(ns+"getSiverCouponList");
	}
	public List<CouponDto> getGoldCouponList(){
		return session.selectList(ns+"getGoldCouponList");
	}
	public List<CouponDto> getDiaCouponList(){
		return session.selectList(ns+"getDiaCouponList");
	}
	//레벨업시 쿠폰 지급
	public int setRegiCoupon(List<CouponDto> list) {
		return session.update(ns + "setRegiCoupon", list);
	}
}
