package verni.co.kr.member;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import verni.co.kr.benefit.CouponDto;
import verni.co.kr.benefit.PointDto;

@Repository
public class MemberDao {
	
	@Autowired
	SqlSession session;
	
	String ns = "Member.";
	
	
	public int idcheck(String m_id) {
		return session.selectOne(ns + "idcheck", m_id);
	}
	
	public int joinMember(MemberDto dto) {
		return session.insert(ns + "joinMember", dto);
	}
	
	//가입시 포인트 적립
	public int setPoint(String m_id) {
		return session.insert(ns + "setPoint", m_id);
	}
	
	//포인트 내역 가져오기
	public PointDto getPoint(String m_id) {
		return session.selectOne(ns + "getPoint", m_id);
	}
	
	//가입시 포인트 내역에 저장
	public int setPointUse(PointDto dto) {
		return session.insert(ns + "setPointUse", dto);
	}
	
	//가입시 발급되는 쿠폰 리스트
	public List<CouponDto> getRegiCouponList() {
		return session.selectList("Coupon.getRegiCouponList");
	}
	
	//가입시 쿠폰 지급
	public int setRegiCoupon(List<CouponDto> list) {
		return session.update(ns + "setRegiCoupon", list);
	}
	
	public MemberDto getMember(MemberDto dto) {
		return session.selectOne(ns + "getMember", dto);
	}
	
	public String pwdFind(MemberDto dto) {
		return session.selectOne(ns + "pwdFind", dto);
	}
	
	public int withdraw(MemberDto dto) {
		return session.update(ns + "withdraw", dto);
	}
	
	//네이버 정보 가져오기
	public MemberDto getNaverMember(MemberDto dto) {
		return session.selectOne(ns + "getNaverMember", dto);
	}
	
	//네이버로 처음 로그인 시에 DB에 저장
	public int joinNaverMember(MemberDto dto) {
		return session.insert(ns + "joinNaverMember", dto);
	}

	//id 찾기
	public MemberDto idFindAf(MemberDto dto) {
		return session.selectOne(ns + "idFind", dto);
	}
}
