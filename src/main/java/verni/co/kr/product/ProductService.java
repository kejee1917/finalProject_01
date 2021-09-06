package verni.co.kr.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import verni.co.kr.benefit.CouponDto;


@Service
public class ProductService {
	
	@Autowired
	ProductDao dao;
	
	public boolean addProduct(ProductDto pd) {
		return dao.addProduct(pd);
	}
	public List<ProductDto> allProductList(ProductParam param){
		if(param.getP_price() != null) {
		String [] price = param.getP_price().split("-");
		param.setS_price(Integer.parseInt(price[0]));
		param.setE_price(Integer.parseInt(price[1]));
		}
		return dao.allProductList(param);
	}
	
	public int getProductNum(ProductParam param) {
		if(param.getP_price() != null) {
			String [] price = param.getP_price().split("-");
			param.setS_price(Integer.parseInt(price[0]));
			param.setE_price(Integer.parseInt(price[1]));
		}
		return dao.getProductNum(param);
	}
	public List<ProductDto> getProductList(ProductDto pd){
		return dao.getProductList(pd);
	}
	
	public ProductDto getProduct(int p_no) {
		return dao.getProduct(p_no);
	}
	public void addReadCount(int p_no) {
		dao.addReadCount(p_no);
	}
	public List<ProductDto> getMainNewProduct(){
		return dao.getMainNewProduct();
	}

	public List<ProductDto> getMainNewMan() {
		return dao.getMainNewMan();
	}
	
	public List<ProductDto> getMainNewWoman() {
		return dao.getMainNewWoman();
	}
	
	public List<ProductDto> getMainWomanBag(){
		return dao.getMainWomanBag();
	}
	
	public List<ProductDto> getHermesList(){
		return dao.getHermesList();
	}
	public List<ProductDto> getProductSaleList(){
		return dao.getProductSaleList();
	}
	// 이 브랜드 다른 상품
	public List<ProductDto> getBrandList(ProductDto pd){
		return dao.getBrandList(pd);
	}
	// 비슷한상품
	public List<ProductDto> getTypeList(ProductDto pd){
		return dao.getTypeList(pd);
	}
	
	
	// 쿠폰 발행여부
	public int getEventCouponNum(String m_id) {
		return dao.getEventCouponNum(m_id);
	}
	
	
	public CouponDto getEventCoupon() {
		return dao.getEventCoupon();
	}
	
	public int eventCouponAdd(CouponDto cp) {
		return dao.eventCouponAdd(cp);
	}
	
	/*
	 * public CouponDto getEventCoupon(String m_id) {
	 * System.out.println("서비스 받아온 id:"+m_id); CouponDto cp = dao.getEventCoupon();
	 * System.out.println(cp.toString()); cp.setM_id(m_id); dao.eventCouponAdd(cp);
	 * return cp; }
	 */
}
