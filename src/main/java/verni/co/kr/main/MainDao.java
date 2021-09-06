package verni.co.kr.main;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import verni.co.kr.benefit.CouponDto;
import verni.co.kr.benefit.PointDto;
import verni.co.kr.chat.BotDto;
import verni.co.kr.member.MemberDto;
import verni.co.kr.review.ReviewDto;


@Repository
public class MainDao {

	@Autowired
	SqlSession session;
	String ns = "Main.";
	
	
	public List<PointDto> getPointUseUpdateList(){
		return session.selectList(ns+"getPointUseUpdateList");
	}
	
	public void memberPointUpdate(List<PointDto> plist) {
		session.update(ns+"memberPointUpdate", plist);
	}
	
	
	public void pointUseUpdate(List<PointDto> plist) {
		session.update(ns+"pointUseUpdate", plist);
	}
	
	public List<CouponDto> getCouponUseUpdateList(){
		return session.selectList(ns+"getCouponUseUpdateList");
	}
	
	
	public void couponUseUpdate(List<CouponDto> clist) {
		session.update(ns+"couponUseUpdate", clist);
	}

	public int setPointUse(List<PointDto> plist) {
		return session.update(ns + "setPointUse", plist);
	}
	
	
	// 한개씩 M_PORINT 업데이트용
	public List<PointDto> getUserPointList(String m_id){
		return session.selectList(ns+"getUserPointList", m_id);
	}
	
	public int mPointUpdate(MemberDto mem) {
		return session.update(ns+"mPointUpdate", mem);
	}
	
	
	String ns2 = "Chat.";
	public List<BotDto> botList(){
		List<BotDto> list = session.selectList(ns2 + "getDataList");
		return list;
	}
	
	public List<BotDto> getQuestion(String b_category){
		List<BotDto> list = session.selectList(ns2 + "getQuestion", b_category);
		return list;
		
	}
	
	// 베스트리뷰 가져오기
	public List<ReviewDto> getBestReview(){
		return session.selectList(ns+"getBestReview");
	}

}
