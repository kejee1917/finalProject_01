package verni.co.kr.cart;

public class CartProductDto {
	
	private int p_no;
	private String p_name;
	private String p_brand;
	private String p_size;
	private String p_newimage1;
	private int p_price;
	
	public CartProductDto() {
		// TODO Auto-generated constructor stub
	}
	
	public CartProductDto(int p_no, String p_name, String p_brand, String p_size, String p_newimage1, int p_price) {
		super();
		this.p_no = p_no;
		this.p_name = p_name;
		this.p_brand = p_brand;
		this.p_size = p_size;
		this.p_newimage1 = p_newimage1;
		this.p_price = p_price;
	}

	public int getP_no() {
		return p_no;
	}

	public void setP_no(int p_no) {
		this.p_no = p_no;
	}

	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	public String getP_brand() {
		return p_brand;
	}

	public void setP_brand(String p_brand) {
		this.p_brand = p_brand;
	}

	public String getP_size() {
		return p_size;
	}

	public void setP_size(String p_size) {
		this.p_size = p_size;
	}

	public String getP_newimage1() {
		return p_newimage1;
	}

	public void setP_newimage1(String p_newimage1) {
		this.p_newimage1 = p_newimage1;
	}

	public int getP_price() {
		return p_price;
	}

	public void setP_price(int p_price) {
		this.p_price = p_price;
	}

	@Override
	public String toString() {
		return "CartProductDto [p_no=" + p_no + ", p_name=" + p_name + ", p_brand=" + p_brand + ", p_size=" + p_size
				+ ", p_newimage1=" + p_newimage1 + ", p_price=" + p_price + "]";
	}
	
	

}
