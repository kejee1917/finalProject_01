package verni.co.kr.product;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import verni.co.kr.benefit.CouponDto;

@Repository
public class ProductDao {
	
	@Autowired
	SqlSession session;
	String ns="Product.";
	
	public boolean addProduct(ProductDto pd) {
		int count = session.insert(ns+"addProduct", pd);
		return count>0;
	}
	
	public List<ProductDto> allProductList(ProductParam param){
		return session.selectList(ns+"allProductList", param);
	}
	
	public int getProductNum(ProductParam param) {
		return session.selectOne(ns+"getProductNum", param);
	}
	
	public List<ProductDto> getProductList(ProductDto pd){
		return session.selectList(ns+"getProductList", pd);
	}
	
	
	

	
	public ProductDto getProduct(int p_no) {
		return session.selectOne(ns+"getProduct", p_no);
	}
	
	public void addReadCount(int p_no) {
		session.update(ns+"addReadCount", p_no);
	}
	
	// 메인
	public List<ProductDto> getMainNewProduct() {
		return session.selectList(ns+"getMainNewProduct");
	}

	
	public List<ProductDto> getMainNewMan() {
		return session.selectList(ns+"getMainNewMan");
	}
	
	public List<ProductDto> getMainNewWoman() {
		return session.selectList(ns+"getMainNewWoman");
	}
	
	public List<ProductDto> getMainWomanBag(){
		return session.selectList(ns+"getMainWomanBag");
	}
	
	// 이벤트 헤르메스
	public List<ProductDto> getHermesList() {
		return session.selectList(ns+"getHermesList");
	}
	public List<ProductDto> getProductSaleList(){
		return session.selectList(ns+"getProductSaleList");
	}
	
	// 이 브랜드 다른 상품
	public List<ProductDto> getBrandList(ProductDto pd){
		return session.selectList(ns+"getBrandList", pd);
	}
	
	// 비슷한상품
	public List<ProductDto> getTypeList(ProductDto pd){
		return session.selectList(ns+"getTypeList", pd);
	}
	
	
	public CouponDto getEventCoupon(){
		return session.selectOne(ns+"getEventCoupon");
	}

	public int eventCouponAdd(CouponDto cp) {
		return session.insert(ns+"eventCouponAdd", cp);
	}
	
	public int getEventCouponNum(String m_id) {
		return session.selectOne(ns+"getEventCouponNum", m_id);
	}


}
