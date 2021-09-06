package verni.co.kr.admin;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import verni.co.kr.benefit.CouponDto;
import verni.co.kr.faq.FaqDto;
import verni.co.kr.member.MemberDto;
import verni.co.kr.myqna.MQ_ReplyDto;
import verni.co.kr.myqna.MyqnaDto;
import verni.co.kr.product.ProductDto;
import verni.co.kr.qna.Q_ReplyDto;
import verni.co.kr.qna.QnaDto;
import verni.co.kr.review.R_ReplyDto;
import verni.co.kr.review.ReviewDto;

@Repository
public class AdminDao {

	@Autowired
	SqlSession session;
	
	String ns = "Admin.";

	public int pwdUpdate(MemberDto dto) {
		return session.update(ns + "pwdUpdate", dto);
	}
	
	public int inforUpdate(MemberDto dto) {
		return session.update(ns + "inforUpdate", dto);
	}
	
	public List<MemberDto> memList(AdminParam param){
		return session.selectList(ns + "memList", param);
	}
	
	public int getMemberCount(AdminParam param) {
		return session.selectOne(ns + "getMemberCount", param);
	}
		
	public MemberDto getMember(int m_no) {
		return session.selectOne(ns + "getMember", m_no);
	}
	
	public int memDelete(int m_no) {
		return session.update(ns + "memDelete", m_no);
	}
	
	public int memUpdate(MemberDto dto) {
		return session.update(ns + "memUpdate", dto);
	}
	
	public List<ProductDto> pdList(AdminParam param){
		return session.selectList(ns + "pdList", param);
	}
	
	public int getProductCount(AdminParam param) {
		return session.selectOne(ns + "getProductCount", param);
	}

	public ProductDto getProduct(int p_no) {
		return session.selectOne(ns + "getProduct", p_no);
	}
	
	public int pdDelete(int p_no) {
		return session.update(ns + "pdDelete", p_no);
	}
	
	public boolean addProduct(ProductDto pd) {
		int count = session.insert(ns+"addProduct", pd);
		return count>0;
	}
	
	public int pdUpdate(ProductDto dto) {
		return session.update(ns + "pdUpdate", dto);
	}
	
	public List<HashMap<String,String>> pdQnaList(AdminParam param) {
		return session.selectList(ns + "pdQnaList", param);
	}
	
	public int getProductQnaCount(AdminParam param) {
		return session.selectOne(ns + "getProductQnaCount", param);
	}
	
	public QnaDto getProductQna(int q_no) {
		return session.selectOne(ns + "getProductQna", q_no);
	}
	
	public Q_ReplyDto getpdQnaReply(int q_no) {
		return session.selectOne(ns + "getpdQnaReply", q_no);
	}
	
	public int pdQnaDelete(int q_no) {
		return session.update(ns + "pdQnaDelete", q_no);
	}
	
	public int pdQnaReplyWrite(QnaDto dto) {
		return session.insert(ns + "pdQnaReplyWrite", dto);
	}
	
	public int pdQnaStatusUpdate(int q_no) {
		return session.update(ns + "pdQnaStatusUpdate", q_no);
	}
	
	public int pdQnaReplyUpdate(QnaDto dto) {
		return session.update(ns + "pdQnaReplyUpdate", dto);
	}
	
	public List<HashMap<String,String>> pdReviewList(AdminParam param){
		return session.selectList(ns + "pdReviewList", param);
	}
	
	public int getProductReviewCount(AdminParam param) {
		return session.selectOne(ns + "getProductReviewCount", param);
	}
	
	public ReviewDto getProductReview(int r_no) {
		return session.selectOne(ns + "getProductReview", r_no);
	}
	
	public R_ReplyDto getpdReviewReply(int r_no) {
		return session.selectOne(ns + "getpdReviewReply", r_no);
	}
	
	public int pdReviewDelete(int r_no) {
		return session.update(ns + "pdReviewDelete", r_no);
	}

	public int pdReviewReplyWrite(ReviewDto dto) {
		return session.insert(ns + "pdReviewReplyWrite", dto);
	}
	
	public int pdReviewStatusUpdate(int r_no) {
		return session.update(ns + "pdReviewStatusUpdate", r_no);
	}
	
	public int pdReviewReplyUpdate(ReviewDto dto) {
		return session.update(ns + "pdReviewReplyUpdate", dto);
	}
	
	public List<CouponDto> couponList(AdminParam param){
		return session.selectList(ns + "couponList", param);
	}
	
	public int getCouponCount(AdminParam param) {
		return session.selectOne(ns + "getCouponCount", param);
	}
	
	public CouponDto getCoupon(int cp_no) {
		return session.selectOne(ns + "getCoupon", cp_no);
	}
	
	public int couponDelete(int cp_no) {
		return session.delete(ns + "couponDelete", cp_no);
	}
	
	public int addCoupon(CouponDto dto) {
		return session.insert(ns + "addCoupon", dto);
	}
	
	public List<HashMap<String,String>> onlineQnaList(AdminParam param){
		return session.selectList(ns + "onlineQnaList", param);
	}
	
	public int getOnlineQnaCount(AdminParam param) {
		return session.selectOne(ns + "getOnlineQnaCount", param);
	}
	
	public MyqnaDto getOnlineQna(int mq_no) {
		return session.selectOne(ns + "getOnlineQna", mq_no);
	}
	
	public MQ_ReplyDto getOnlineQnaReply(int mq_no) {
		return session.selectOne(ns + "getOnlineQnaReply",mq_no);
	}
	
	public int onlineQnaDelete(int mq_no) {
		return session.update(ns + "onlineQnaDelete", mq_no);
	}
	
	public int onlineQnaReplyWrite(MQ_ReplyDto dto) {
		return session.insert(ns + "onlineQnaReplyWrite", dto);
	}
	
	public int msStatusUpdate(int ms_no) {
		return session.update(ns + "msStatusUpdate", ms_no);
	}
	
	public int onlineQnaStatusUpdate(int mq_no) {
		return session.update(ns + "onlineQnaStatusUpdate", mq_no);
	}
	
	public int onlineQnaReplyUpdate(MQ_ReplyDto dto) {
		return session.update(ns + "onlineQnaReplyUpdate", dto);
	}
	
	public List<FaqDto> adminFaq(AdminParam param) {
		return session.selectList(ns + "adminFaq", param);
	}
	
	public int getFaqCount(AdminParam param) {
		return session.selectOne(ns + "getFaqCount", param);
	}
	
	public FaqDto getFaq(int f_no) {
		return session.selectOne(ns + "getFaq", f_no);
	}
	/*
	public int faqWrite(FaqDto dto) {
		return session.insert(ns + "faqWrite", dto);
	}
	*/
	
	public int faqUpdate(FaqDto dto) {
		return session.update(ns + "faqUpdate", dto);
	}
	
	public int faqDelete(int f_no) {
		return session.delete(ns + "faqDelete", f_no);
	}
}
