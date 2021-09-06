package verni.co.kr.order;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import verni.co.kr.benefit.CouponDto;
import verni.co.kr.benefit.PointDto;
import verni.co.kr.benefit.PointUseDto;
import verni.co.kr.member.MemberDto;

@Repository
public class OrderDao {

	@Autowired
	SqlSession session;
	
	String ns = "Orders.";
	
	public boolean memberUpdate(MemberDto dto) {
		
		int count = session.update(ns + "memberUpdate", dto);
		
		return count>0?true:false;
	}
	
	public boolean couponUpdate(CouponDto dto) {
		
		int count = session.update(ns + "couponUpdate", dto);
		
		return count>0?true:false;
	}
	
	public List<PointDto> getPointList(String id){
		
		List<PointDto> list = session.selectList(ns + "getPointList", id);

		return list;
	}
	
	public boolean ordered(OrderDto dto) {
		
		int count = session.insert(ns + "ordered", dto);
		
		return count>0?true:false;
	}
	
	public boolean orderDetail(OrderDetailDto dto) {
		
		int count = session.insert(ns + "orderDetail", dto);
		
		return count>0?true:false;
	}
	
	public boolean pointUpdate(PointDto dto) {
		
		int count = session.update(ns + "pointUpdate", dto);
		
		return count>0?true:false;
	}
	
	public boolean usePoint(PointUseDto dto) {
		
		int count = session.insert(ns + "usePoint", dto);
		
		return count>0?true:false;
	}
	
	public boolean cartDelete(int c_no) {
		
		int count = session.delete(ns + "cartDelete", c_no);
		
		return count>0?true:false;
	}
	
	public boolean updateStatus(int p_no) {
		
		int count = session.update(ns + "updateStatus", p_no);
		
		return count>0?true:false;
	}
	
}
