package verni.co.kr.order;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import verni.co.kr.benefit.CouponDto;
import verni.co.kr.benefit.PointDto;
import verni.co.kr.benefit.PointUseDto;
import verni.co.kr.member.MemberDto;

@Service
public class OrderService {
	
	@Autowired
	OrderDao dao;
	
	public boolean memberUpdate(MemberDto dto) {
		return dao.memberUpdate(dto);
	}
	
	public boolean couponUpdate(CouponDto dto) {
		return dao.couponUpdate(dto);
	}
	
	public List<PointDto> getPointList(String id){
		return dao.getPointList(id);
	}
	
	public boolean ordered(OrderDto dto) {
		return dao.ordered(dto);
	}
	
	public boolean orderDetail(OrderDetailDto dto) {
		return dao.orderDetail(dto);
	}

	public boolean pointUpdate(PointDto dto) {
		return dao.pointUpdate(dto);
	}
	
	public boolean usePoint(PointUseDto dto) {
		return dao.usePoint(dto);
	}
	
	public boolean cartDelete(int c_no) {
		return dao.cartDelete(c_no);
	}

	public boolean updateStatus(int p_no) {
		return dao.updateStatus(p_no);
	}

}
