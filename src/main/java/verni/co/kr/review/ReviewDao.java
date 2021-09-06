package verni.co.kr.review;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import verni.co.kr.benefit.PointDto;
import verni.co.kr.product.ProductDto;

@Repository
public class ReviewDao {
	
	@Autowired
	SqlSession session;
	
	String ns = "Review.";
	
	//리스트
	public List<ReviewDto> reviewList(int p_no) {
		return session.selectList(ns + "reviewList", p_no);
	}
	
	// 리뷰작성
	public boolean revWrite(ReviewDto rev) {
		int n = session.insert(ns + "revWrite", rev);
		return n>0?true:false;
	}
	// 0826 은지 수정 : 리뷰 작성 후 업데이트
	public int od_reviewUpdate(int od_no) {
		return session.update(ns + "od_reviewUpdate", od_no);
	}
	
	public int getLikeCount(int r_no) {
		return session.selectOne(ns+"getLikeCount", r_no);
	}
	
	
	
	
	
	// 리뷰 삭제
	public boolean reviewDel(int r_no) {
		int b = session.delete(ns + "reviewDel", r_no);
		return b>0;
	}
	// 별 높은 순
	public List<ReviewDto> reviewTop(int p_no) {
		return session.selectList(ns + "reviewTop", p_no);
	}
	
	// 별 낮은 순
	public List<ReviewDto> reviewLow(int p_no) {
		return session.selectList(ns + "reviewLow", p_no);
	}
	
	// 별점평균
	   public Object reviewAvg(int p_no) {
	      return session.selectOne(ns + "reviewAvg", p_no);
	   }
	   // 리뷰 갯수
	   public Object reviewCount(int p_no) {
	      return session.selectOne(ns + "reviewCount", p_no);
	   }
	   // 몇명?
	   public Object scopeFive(int p_no) {
	      return session.selectOne(ns + "scopeFive", p_no);
	   }
	   public Object scopeFour(int p_no) {
	      return session.selectOne(ns + "scopeFour", p_no);
	   }
	   public Object scopeThree(int p_no) {
	      return session.selectOne(ns + "scopeThree", p_no);
	   }
	   public Object scopeTwo(int p_no) {
	      return session.selectOne(ns + "scopeTwo", p_no);
	   }
	   public Object scopeOne(int p_no) {
	      return session.selectOne(ns + "scopeOne", p_no);
	   }
	
	
	
	
	// 리플 추가
	public boolean rReplyWrite(R_ReplyDto rp) {
		int r = session.insert(ns+"rReplyWrite", rp);
		return r>0;
	}
	
	public List<R_ReplyDto> getReplyList(int p_no) {
		return session.selectList(ns + "getReplyList", p_no);
	}
	
	public ReviewDto getReview(int r_no) {
		return session.selectOne(ns+"getReview", r_no);
	}
	//////
	
	
	// 리뷰 페이지
	
	public List<ReviewDto> getReviewList(ReviewParam param){
		return session.selectList(ns+"getReviewList", param);
	}
	
	// 리뷰 뿌리기용 
	public ProductDto getProduct(int od_no) {
		return session.selectOne(ns+"getProduct", od_no);
	}
	
	public List<ReviewDto> getBestReview(){
		return session.selectList(ns+"getBestReview");	
	}
	
	// 토탈 리스트 수
	public int getReviewNum(ReviewParam param) {
		return session.selectOne(ns+"getReviewNum", param);
	}
	
	
	// 메세지용 리뷰
	public int getReviewMaxNo() {
		return session.selectOne(ns+"getReviewMaxNo");
	}
	
	// 포인트 적립
	public void pointUpdate(PointDto pt) {
		session.update(ns+"pointUpdate", pt);
	}
	// 포인트 인설트
	public boolean setPoint(PointDto pt) {
		int count = session.insert(ns+"setPoint", pt);
		return count>0;
	}
	
	public boolean setPointUse(PointDto pt) {
		int count = session.insert(ns+"setPointUse", pt);
		return count>0;
	}
	
	public int getPointMaxNo() {
		return session.selectOne(ns+"getPointMaxNo");
	}
}
