package verni.co.kr.main;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import verni.co.kr.benefit.CouponDto;
import verni.co.kr.benefit.PointDto;
import verni.co.kr.chat.BotDto;
import verni.co.kr.member.MemberDto;
import verni.co.kr.review.ReviewDto;

@Service
public class MainService {
	
	@Autowired
	MainDao dao;
	
	public List<PointDto> getPointUseUpdateList(){
		
		return dao.getPointUseUpdateList();
		
	}
	public void memberPointUpdate(List<PointDto> plist) {
		dao.memberPointUpdate(plist);
	}
	public void pointUseUpdate(List<PointDto> plist) {
		dao.pointUseUpdate(plist);
	}
	
	public List<CouponDto> getCouponUseUpdateList(){
		return dao.getCouponUseUpdateList();
	}
	public void couponUseUpdate(List<CouponDto> clist) {
		dao.couponUseUpdate(clist);
	}

	public int setPointUse(List<PointDto> plist) {
		return dao.setPointUse(plist);
	}

	// 한개씩 M_PORINT 업데이트용
	public List<PointDto> getUserPointList(String m_id){
		return dao.getUserPointList(m_id);
	}
	
	public int mPointUpdate(MemberDto mem) {
		return dao.mPointUpdate(mem);
	}
	
	
	// 베스트리뷰 가져오기
	public List<ReviewDto> getBestReview(){
		return dao.getBestReview();
	}
	
	//진하씨 부분
	public List<BotDto> botList(){
		return dao.botList();
	}
	
	public List<BotDto> getQuestion(String b_category){
		return dao.getQuestion(b_category);
	}
	
}
