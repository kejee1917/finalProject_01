package verni.co.kr.cart;

public class CartDto {

	private int c_no;
	private String m_id;
	private int p_no;
	private String p_name;
	private String p_brand;
	private String p_size;
	private String p_newimage1; // 대표이미지
	private int p_price; // 디폴트 가격 (3일기준)
	private String c_period; // 대여기간 3일, 5일
	private int c_price; // 대여기간 반영 가격 ex)5일=p_price * 1.5
	private String p_status;
	
	public CartDto() {
		// TODO Auto-generated constructor stub
	}

	public CartDto(int c_no, String m_id, int p_no, String p_name, String p_brand, String p_size, String p_newimage1,
			int p_price, String c_period, int c_price, String p_status) {
		super();
		this.c_no = c_no;
		this.m_id = m_id;
		this.p_no = p_no;
		this.p_name = p_name;
		this.p_brand = p_brand;
		this.p_size = p_size;
		this.p_newimage1 = p_newimage1;
		this.p_price = p_price;
		this.c_period = c_period;
		this.c_price = c_price;
		this.p_status = p_status;
	}

	public int getC_no() {
		return c_no;
	}

	public void setC_no(int c_no) {
		this.c_no = c_no;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
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

	public String getC_period() {
		return c_period;
	}

	public void setC_period(String c_period) {
		this.c_period = c_period;
	}

	public int getC_price() {
		return c_price;
	}

	public void setC_price(int c_price) {
		this.c_price = c_price;
	}

	public String getP_status() {
		return p_status;
	}

	public void setP_status(String p_status) {
		this.p_status = p_status;
	}

	@Override
	public String toString() {
		return "CartDto [c_no=" + c_no + ", m_id=" + m_id + ", p_no=" + p_no + ", p_name=" + p_name + ", p_brand="
				+ p_brand + ", p_size=" + p_size + ", p_newimage1=" + p_newimage1 + ", p_price=" + p_price
				+ ", c_period=" + c_period + ", c_price=" + c_price + ", p_status=" + p_status + "]";
	}

	
	
	
	
}
