package verni.co.kr.product;

import java.io.Serializable;
import java.util.Arrays;

public class ProductParam implements Serializable{
	private int start;
	private int end;
	private int pageNumber;
	private String sorting;
	private String [] p_type1;
	private String [] p_type2;
	private String [] p_regdate;
	private String [] p_case ;	// 데일리.. 등등
	private String [] p_brand;
	private String [] p_color;
	private String [] p_size;	
	private String [] p_status;		//대여가능 1 대여중 2
	private String [] p_gender;
	private String p_price;
	private int s_price;
	private int e_price;
	
	
	public ProductParam() {}


	public ProductParam(int start, int end, int pageNumber, String sorting, String[] p_type1, String[] p_type2,
			String[] p_regdate, String[] p_case, String[] p_brand, String[] p_color, String[] p_size, String[] p_status,
			String[] p_gender, String p_price, int s_price, int e_price) {
		super();
		this.start = start;
		this.end = end;
		this.pageNumber = pageNumber;
		this.sorting = sorting;
		this.p_type1 = p_type1;
		this.p_type2 = p_type2;
		this.p_regdate = p_regdate;
		this.p_case = p_case;
		this.p_brand = p_brand;
		this.p_color = p_color;
		this.p_size = p_size;
		this.p_status = p_status;
		this.p_gender = p_gender;
		this.p_price = p_price;
		this.s_price = s_price;
		this.e_price = e_price;
	}


	public int getStart() {
		return start;
	}


	public void setStart(int start) {
		this.start = start;
	}


	public int getEnd() {
		return end;
	}


	public void setEnd(int end) {
		this.end = end;
	}


	public int getPageNumber() {
		return pageNumber;
	}


	public void setPageNumber(int pageNumber) {
		this.pageNumber = pageNumber;
	}


	public String getSorting() {
		return sorting;
	}


	public void setSorting(String sorting) {
		this.sorting = sorting;
	}


	public String[] getP_type1() {
		return p_type1;
	}


	public void setP_type1(String[] p_type1) {
		this.p_type1 = p_type1;
	}


	public String[] getP_type2() {
		return p_type2;
	}


	public void setP_type2(String[] p_type2) {
		this.p_type2 = p_type2;
	}


	public String[] getP_regdate() {
		return p_regdate;
	}


	public void setP_regdate(String[] p_regdate) {
		this.p_regdate = p_regdate;
	}


	public String[] getP_case() {
		return p_case;
	}


	public void setP_case(String[] p_case) {
		this.p_case = p_case;
	}


	public String[] getP_brand() {
		return p_brand;
	}


	public void setP_brand(String[] p_brand) {
		this.p_brand = p_brand;
	}


	public String[] getP_color() {
		return p_color;
	}


	public void setP_color(String[] p_color) {
		this.p_color = p_color;
	}


	public String[] getP_size() {
		return p_size;
	}


	public void setP_size(String[] p_size) {
		this.p_size = p_size;
	}


	public String[] getP_status() {
		return p_status;
	}


	public void setP_status(String[] p_status) {
		this.p_status = p_status;
	}


	public String[] getP_gender() {
		return p_gender;
	}


	public void setP_gender(String[] p_gender) {
		this.p_gender = p_gender;
	}


	public String getP_price() {
		return p_price;
	}


	public void setP_price(String p_price) {
		this.p_price = p_price;
	}


	public int getS_price() {
		return s_price;
	}


	public void setS_price(int s_price) {
		this.s_price = s_price;
	}


	public int getE_price() {
		return e_price;
	}


	public void setE_price(int e_price) {
		this.e_price = e_price;
	}


	@Override
	public String toString() {
		return "ProductParam [start=" + start + ", end=" + end + ", pageNumber=" + pageNumber + ", sorting=" + sorting
				+ ", p_type1=" + Arrays.toString(p_type1) + ", p_type2=" + Arrays.toString(p_type2) + ", p_regdate="
				+ Arrays.toString(p_regdate) + ", p_case=" + Arrays.toString(p_case) + ", p_brand="
				+ Arrays.toString(p_brand) + ", p_color=" + Arrays.toString(p_color) + ", p_size="
				+ Arrays.toString(p_size) + ", p_status=" + Arrays.toString(p_status) + ", p_gender="
				+ Arrays.toString(p_gender) + ", p_price=" + p_price + ", s_price=" + s_price + ", e_price=" + e_price
				+ "]";
	}
	
	
	
	
}	
	
