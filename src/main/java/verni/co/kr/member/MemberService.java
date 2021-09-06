package verni.co.kr.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import verni.co.kr.benefit.CouponDto;
import verni.co.kr.benefit.PointDto;

@Service
public class MemberService {
	
	@Autowired
	MemberDao dao;
	
	
	public int idcheck(String m_id) {
		return dao.idcheck(m_id);
	}
	
	public boolean joinMember(MemberDto dto) {
		int count = dao.joinMember(dto);
		return count>0?true:false;
	}
	
	public int setPoint(String m_id) {
		return dao.setPoint(m_id);
	}
	
	public PointDto getPoint(String m_id) {
		return dao.getPoint(m_id);
	}
	
	public int setPointUse(PointDto dto) {
		return dao.setPointUse(dto);
	}
	
	//쿠폰리스트 가져오기 + 가입 시 쿠폰 적립
	public List<CouponDto> getRegiCouponList(String m_id) {
		
		//1.쿠폰 리스트 가져오기(1~3까지만)
		List<CouponDto> list = dao.getRegiCouponList();
		
		for(int i=0; i<list.size(); i++) {
			list.get(i).setM_id(m_id);
		}
		System.out.println("쿠폰 list: " + list);
		
		//2.가입 시 쿠폰 적립
		dao.setRegiCoupon(list);
		
		return list;
	}
	

	public MemberDto getMember(MemberDto dto) {		
		return dao.getMember(dto);
	}
	
	public String pwdFind(MemberDto dto) {
		return dao.pwdFind(dto);
	}
	
	public int withdraw(MemberDto dto) {
		return dao.withdraw(dto);
	}
	
	
	
	//네이버 정보 가져오기
	public MemberDto getNaverMember(MemberDto dto) {
		return dao.getNaverMember(dto);
	}
	
	//네이버로 처음 로그인 시에 DB에 저장
	public int joinNaverMember(MemberDto dto) {
		return dao.joinNaverMember(dto);
	}
	
	//id 찾기
	public MemberDto idFindAf(MemberDto dto) {
		return dao.idFindAf(dto);
	}
}
