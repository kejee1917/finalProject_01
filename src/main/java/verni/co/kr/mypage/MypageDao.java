package verni.co.kr.mypage;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import verni.co.kr.benefit.CouponDto;
import verni.co.kr.benefit.PointUseDto;
import verni.co.kr.member.MemberDto;
import verni.co.kr.order.OrderDetailDto;
import verni.co.kr.product.ProductDto;
import verni.co.kr.review.ReviewDto;

@Repository
public class MypageDao {

   @Autowired
   SqlSession session;
   
   String ns = "Member.";
   
   public int myInfoAf(MemberDto dto) {
      return session.update(ns + "myInfoAf", dto);
   }
   
   public MemberDto getUpdateMember(String m_id) {
      return session.selectOne(ns + "getUpdateMember", m_id);
   }
   
   public List<PointUseDto> getPointList(String m_id) {
      return session.selectList("Point.getPointList", m_id);
   }
   
   public int getPoint(String m_id) {
      return session.selectOne("Point.getPoint", m_id);
   }
   
   public int myCouponCount(String m_id) {
      return session.selectOne("Coupon.myCouponCount", m_id);
   }
   
   public List<CouponDto> myCouponList(String m_id) {
      return session.selectList("Coupon.myCouponList", m_id);
   }
   
   public List<OrderDetailDto> getMyOrderList(Map<String, Object> map) {
      return session.selectList("Mypage.getMyOrderList", map);
   }
   
   public List<OrderDetailDto> getMy1monthList(String m_id) {
      return session.selectList("Mypage.getMy1monthList", m_id);
   }
   
   public ProductDto getProductInfo(int p_no) {
      return session.selectOne("Mypage.getProductInfo", p_no);
   }
   
   public int myorderCancelAf(int od_no) {
      return session.update("Mypage.myorderCancelAf", od_no);
   }
   
   public int totalpay(String m_id) {
      return session.selectOne("Mypage.totalpay", m_id);
   }
   
   public List<OrderDetailDto> validReview(String m_id) {
      return session.selectList("Mypage.validReview", m_id);
   }
   
   //내가 쓴 리뷰가져오기
   public List<ReviewDto> writtenReview(String m_id) {
      return session.selectList("Mypage.writtenReview", m_id);
   }
   
   //리뷰 읽기
   public ReviewDto getReview(int r_no) {
      return session.selectOne("Mypage.getReview", r_no);
   }
   
   //0826 은지 : 리뷰삭제
   public int myreviewDelete(int r_no) {
	  return session.update("Mypage.myreviewDelete", r_no);
   }
   public int messageDel(int r_no) {
	  return session.delete("Mypage.messageDel", r_no);
   }   
   
   //리뷰 답글가져오기
   public ReviewDto getmyreviewReply(int r_no) {
	   return session.selectOne("Mypage.getmyreviewReply", r_no);
   }
   
   //리뷰 수정
   public int reviewUpdateAf(ReviewDto dto) {
	   return session.update("Mypage.reviewUpdateAf", dto);
   }
   
   //배송중 수
   public int deliveryCount(String m_id) {
      return session.selectOne("Mypage.deliveryCount", m_id);
   }
   
   //답변 달린 myqna 수
   public int answerCount(String m_id) {
      return session.selectOne("Mypage.answerCount", m_id);
   }
   
   //대여 정보 달력에 뿌리기
   public List<OrderDetailDto> getDeliveryComplete(String m_id) {
	   return session.selectList("Mypage.getDeliveryComplete", m_id);
   }
}