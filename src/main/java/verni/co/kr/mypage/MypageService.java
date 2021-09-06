package verni.co.kr.mypage;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import verni.co.kr.benefit.CouponDto;
import verni.co.kr.benefit.PointUseDto;
import verni.co.kr.member.MemberDto;
import verni.co.kr.order.OrderDetailDto;
import verni.co.kr.product.ProductDto;
import verni.co.kr.review.ReviewDto;

@Service
public class MypageService {

   @Autowired
   MypageDao dao;
   
   
   public int myInfoAf(MemberDto dto) {
      return dao.myInfoAf(dto);
   }
   
   public MemberDto getUpdateMember(String m_id) {
      return dao.getUpdateMember(m_id);
   }
   
   public List<PointUseDto> getPointList(String m_id) {
      return dao.getPointList(m_id);
   }
   
   public int getPoint(String m_id) {
      return dao.getPoint(m_id);
   }
   public int myCouponCount(String m_id) {
      return dao.myCouponCount(m_id);
   }
   
   public List<CouponDto> myCouponList(String m_id) {
      return dao.myCouponList(m_id);
   }
   
   public List<OrderDetailDto> getMyOrderList(Map<String, Object> map) {
      return dao.getMyOrderList(map);
   }
   
   public List<OrderDetailDto> getMy1monthList(String m_id) {
      return dao.getMy1monthList(m_id);
   }
   
   public ProductDto getProductInfo(int p_no) {
      return dao.getProductInfo(p_no);   
   }
   
   public int myorderCancelAf(int od_no) {
      return dao.myorderCancelAf(od_no);
   }
   
   public int totalpay(String m_id) {
      return dao.totalpay(m_id);
   }
   
   public List<OrderDetailDto> validReview(String m_id) {
      return dao.validReview(m_id);
   }
   
   //내가 쓴 리뷰가져오기
   public List<ReviewDto> writtenReview(String m_id) {
      return dao.writtenReview(m_id);   
   }
   
   //리뷰읽기
   public ReviewDto getReview(int r_no) {
      return dao.getReview(r_no);
   }
   
   //0826 은지 : 리뷰삭제
   public int myreviewDelete(int r_no) {
	   dao.messageDel(r_no);
 	  return dao.myreviewDelete(r_no);
   }
 	
   //리뷰 답글가져오기
   public ReviewDto getmyreviewReply(int r_no) { 	
       return dao.getmyreviewReply(r_no);
   }
   
   //리뷰 수정
   public int reviewUpdateAf(ReviewDto dto) {
       return dao.reviewUpdateAf(dto);
   }
   
   //배송중 수
   public int deliveryCount(String m_id) {
      return dao.deliveryCount(m_id);
   }
   
   //답변 달린 myqna 수
   public int answerCount(String m_id) {
      return dao.answerCount(m_id);
   }
   
   //달력에 뿌리기
   public List<OrderDetailDto> getDeliveryComplete(String m_id) {
	   return dao.getDeliveryComplete(m_id);
   }
   
}