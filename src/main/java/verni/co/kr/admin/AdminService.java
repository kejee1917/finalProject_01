package verni.co.kr.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

@Service
public class AdminService {

	@Autowired
	AdminDao dao;
	
	public int pwdUpdate(MemberDto dto) {
		return dao.pwdUpdate(dto);
	}
	
	public int infroUpdate(MemberDto dto) {
		return dao.inforUpdate(dto);
	}
	
	public List<MemberDto> memList(AdminParam param){
		return dao.memList(param);
	}
	
	public int getMemberCount(AdminParam param) {
		return dao.getMemberCount(param);
	}
	
	public MemberDto getMember(int m_no) {
		return dao.getMember(m_no);
	}
	
	public int memDelete(int m_no) {
		return dao.memDelete(m_no);
	}
	
	public int memUpdate(MemberDto dto) {
		return dao.memUpdate(dto);
	}
	
	public List<ProductDto> pdList(AdminParam param){
		return dao.pdList(param);
	}
	
	public int getProductCount(AdminParam param) {
		return dao.getProductCount(param);
	}

	public ProductDto getProduct(int p_no) {
		return dao.getProduct(p_no);
	}
	
	public int pdDelete(int p_no) {
		return dao.pdDelete(p_no);
	}
	
	public boolean addProduct(ProductDto pd) {
		return dao.addProduct(pd);
	}
	
	public int pdUpdate(ProductDto dto) {
		return dao.pdUpdate(dto);
	}
	
	public List<HashMap<String,String>> pdQnaList(AdminParam param) {
		return dao.pdQnaList(param);
	}
	
	public int getProductQnaCount(AdminParam param) {
		return dao.getProductQnaCount(param);
	}
	
	public QnaDto getProductQna(int q_no) {
		return dao.getProductQna(q_no);
	}
	
	public Q_ReplyDto getpdQnaReply(int q_no) {
		return dao.getpdQnaReply(q_no);
	}
	
	public int pdQnaDelete(int q_no) {
		return dao.pdQnaDelete(q_no);
	}
	
	public int pdQnaReplyWrite(QnaDto dto) {
		return dao.pdQnaReplyWrite(dto);
	}
	
	public int pdQnaStatusUpdate(int q_no) {
		return dao.pdQnaStatusUpdate(q_no);
	}
	
	public int pdQnaReplyUpdate(QnaDto dto) {
		return dao.pdQnaReplyUpdate(dto);
	}
	
	public List<HashMap<String,String>> pdReviewList(AdminParam param){
		return dao.pdReviewList(param);
	}
	
	public int getProductReviewCount(AdminParam param) {
		return dao.getProductReviewCount(param);
	}
	
	public ReviewDto getProductReview(int r_no) {
		return dao.getProductReview(r_no);
	}
	
	public R_ReplyDto getpdReviewReply(int r_no) {
		return dao.getpdReviewReply(r_no);
	}
	
	public int pdReviewDelete(int r_no) {
		return dao.pdReviewDelete(r_no);
	}

	public int pdReviewReplyWrite(ReviewDto dto) {
		return dao.pdReviewReplyWrite(dto);
	}
	
	public int pdReviewStatusUpdate(int r_no) {
		return dao.pdReviewStatusUpdate(r_no);
	}
	
	public int pdReviewReplyUpdate(ReviewDto dto) {
		return dao.pdReviewReplyUpdate(dto);
	}
	
	public List<CouponDto> couponList(AdminParam param){
		return dao.couponList(param);
	}
	
	public int getCouponCount(AdminParam param) {
		return dao.getCouponCount(param);
	}
	
	public CouponDto getCoupon(int cp_no) {
		return dao.getCoupon(cp_no);
	}
	
	public int couponDelete(int cp_no) {
		return dao.couponDelete(cp_no);
	}
	
	public int addCoupon(CouponDto dto) {
		return dao.addCoupon(dto);
	}
	
	public List<HashMap<String,String>> onlineQnaList(AdminParam param){
		return dao.onlineQnaList(param);
	}

	public int getOnlineQnaCount(AdminParam param) {
		return dao.getOnlineQnaCount(param);
	}
	
	public MyqnaDto getOnlineQna(int mq_no) {
		return dao.getOnlineQna(mq_no);
	}
	
	public MQ_ReplyDto getOnlineQnaReply(int mq_no) {
		return dao.getOnlineQnaReply(mq_no);
	}
	
	public int onlineQnaDelete(int mq_no) {
		return dao.onlineQnaDelete(mq_no);
	}
		
	public int onlineQnaReplyWrite(MQ_ReplyDto dto) {
		return dao.onlineQnaReplyWrite(dto);
	}
	
	public int msStatusUpdate(int ms_no) {
		return dao.msStatusUpdate(ms_no);
	}
	
	public int onlineQnaStatusUpdate(int mq_no) {
		return dao.onlineQnaStatusUpdate(mq_no);
	}
	
	public int onlineQnaReplyUpdate(MQ_ReplyDto dto) {
		return dao.onlineQnaReplyUpdate(dto);
	}

	public List<FaqDto> adminFaq(AdminParam param) {
		return dao.adminFaq(param);
	}
	
	public int getFaqCount(AdminParam param) {
		return dao.getFaqCount(param);
	}
	
	public FaqDto getFaq(int f_no) {
		return dao.getFaq(f_no);
	}
	
	/*
	public int faqWrite(FaqDto dto) {
		return dao.faqWrite(dto);
	}
	*/
	
	public int faqUpdate(FaqDto dto) {
		return dao.faqUpdate(dto);
	}
	
	public int faqDelete(int f_no) {
		return dao.faqDelete(f_no);
	}
}
