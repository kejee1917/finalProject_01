package verni.co.kr.review;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import verni.co.kr.benefit.PointDto;
import verni.co.kr.product.ProductDto;

@Service
public class ReviewService {
	
	@Autowired
	ReviewDao dao;
	
	public List<ReviewDto> reviewList(int p_no) {
		return dao.reviewList(p_no);
	}
	// 0826 은지 수정 : 리뷰 작성 후 업데이트
	public int od_reviewUpdate(int od_no) {
		return dao.od_reviewUpdate(od_no);
	}
	
	// 리뷰쓰기 포인트 업데이트
	public boolean revWrite(ReviewDto rev, PointDto pt) {
		dao.pointUpdate(pt);
		return dao.revWrite(rev);
	}
	
	// 포인트 테이블 넣기
	public boolean setPoint(PointDto pt) {
		return dao.setPoint(pt);
	}
	
	// 포인트 사용내역 넣기
	public boolean setPointUse(PointDto pt) {
		return dao.setPointUse(pt);
	}
	
	// 리뷰뿌리기용
	public ProductDto getProduct(int od_no) {
		return dao.getProduct(od_no);
	}
	
	
	public int getLikeCount(int r_no) {
		return dao.getLikeCount(r_no);
	}
	public boolean reviewDel(int r_no) {
		return dao.reviewDel(r_no);
	}
	public List<ReviewDto> reviewTop(int p_no) {
		return dao.reviewTop(p_no);
	}
	
	public List<ReviewDto> reviewLow(int p_no) {
		return dao.reviewLow(p_no);
	}
	
	public ArrayList<Object> rScope(int p_no){
		ArrayList<Object> rScope = new ArrayList<Object>();
		
		if(dao.reviewAvg(p_no) == null) {
			rScope.add(0);
		}else{
			rScope.add(dao.reviewAvg(p_no));
		}
		
		if(dao.reviewCount(p_no) == null) {
			rScope.add(0);
		}else{
			rScope.add(dao.reviewCount(p_no));
		}
		
		if(dao.scopeFive(p_no) == null) {
			rScope.add(0);
		}else{
			rScope.add(dao.scopeFive(p_no));;
		}
		
		if(dao.scopeFour(p_no) == null) {
			rScope.add(0);
		}else{
			rScope.add(dao.scopeFour(p_no));
		}
		
		if(dao.scopeThree(p_no) == null) {
			rScope.add(0);
		}else{
			rScope.add(dao.scopeThree(p_no));
		}
		
		if(dao.scopeTwo(p_no) == null) {
			rScope.add(0);
		}else{
			rScope.add(dao.scopeTwo(p_no));
		}
		
		if(dao.scopeOne(p_no) == null) {
			rScope.add(0);
		}else{
			rScope.add(dao.scopeOne(p_no));
		}
		
		return rScope;
	}

	
	// 리플
	public ReviewDto getReview(int r_no) {
		return dao.getReview(r_no);
	}
	
	

	public boolean rReplyWrite(R_ReplyDto rp) {
		return dao.rReplyWrite(rp);
	}

	public List<R_ReplyDto> getReplyList(int p_no) {
		return dao.getReplyList(p_no);
	}
	/////
	
	// 리뷰페이지
	public List<ReviewDto>getReviewList(ReviewParam param){
		return dao.getReviewList(param);
	}
	public List<ReviewDto> getBestReview(){
		return dao.getBestReview();
	}
	
	public int getReviewNum(ReviewParam param) {
		return dao.getReviewNum(param);
	}
	
	
	
	//메세지용
	public int getReviewMaxNo() {
		return dao.getReviewMaxNo();
	}
	public int getPointMaxNo() {
		return dao.getPointMaxNo();
	}
}
