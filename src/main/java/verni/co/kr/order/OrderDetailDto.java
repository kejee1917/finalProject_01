package verni.co.kr.order;

public class OrderDetailDto {
	
	private int od_no;
	private String o_number;
	private int p_no;
	private String od_period;
	private int od_amount;
	private String od_as;
	private String od_startdate;
	private String od_enddate;
	private int od_point;
	private String od_status;
	
	
	//0818 은지 추가
		private String o_time;
		private int o_no;
		private String p_brand;
		private String p_newimage1;
		private String p_name;
		
	//0819 은지 추가	
		private int od_review;
	
	public OrderDetailDto() {
		// TODO Auto-generated constructor stub
	}

	
	
	// 0824 초희 추가
	public OrderDetailDto(int od_no, String od_period, String od_status) {
		super();
		this.od_no = od_no;
		this.od_period = od_period;
		this.od_status = od_status;
	}
	
	// 0824 초희 추가
	public OrderDetailDto(int od_no, String od_status) {
		super();
		this.od_no = od_no;
		this.od_status = od_status;
	}



	public OrderDetailDto(int od_no, String o_number, int p_no, String od_period, int od_amount, String od_as,
			String od_startdate, String od_enddate, int od_point, String od_status, String o_time, int o_no,
			String p_brand, String p_newimage1, String p_name) {
		super();
		this.od_no = od_no;
		this.o_number = o_number;
		this.p_no = p_no;
		this.od_period = od_period;
		this.od_amount = od_amount;
		this.od_as = od_as;
		this.od_startdate = od_startdate;
		this.od_enddate = od_enddate;
		this.od_point = od_point;
		this.od_status = od_status;
		this.o_time = o_time;
		this.o_no = o_no;
		this.p_brand = p_brand;
		this.p_newimage1 = p_newimage1;
		this.p_name = p_name;
	}




	public OrderDetailDto(int od_no, String o_number, int p_no, String od_period, int od_amount, String od_as,
			String od_startdate, String od_enddate, int od_point, String od_status) {
		super();
		this.od_no = od_no;
		this.o_number = o_number;
		this.p_no = p_no;
		this.od_period = od_period;
		this.od_amount = od_amount;
		this.od_as = od_as;
		this.od_startdate = od_startdate;
		this.od_enddate = od_enddate;
		this.od_point = od_point;
		this.od_status = od_status;
	}

	
	
	public OrderDetailDto(int od_no, String o_number, int p_no, String od_period, int od_amount, String od_as,
			String od_startdate, String od_enddate, int od_point, String od_status, String o_time, int o_no,
			String p_brand, String p_newimage1, String p_name, int od_review) {
		super();
		this.od_no = od_no;
		this.o_number = o_number;
		this.p_no = p_no;
		this.od_period = od_period;
		this.od_amount = od_amount;
		this.od_as = od_as;
		this.od_startdate = od_startdate;
		this.od_enddate = od_enddate;
		this.od_point = od_point;
		this.od_status = od_status;
		this.o_time = o_time;
		this.o_no = o_no;
		this.p_brand = p_brand;
		this.p_newimage1 = p_newimage1;
		this.p_name = p_name;
		this.od_review = od_review;
	}






	public int getOd_no() {
		return od_no;
	}

	public void setOd_no(int od_no) {
		this.od_no = od_no;
	}

	public String getO_number() {
		return o_number;
	}

	public void setO_number(String o_number) {
		this.o_number = o_number;
	}

	public int getP_no() {
		return p_no;
	}

	public void setP_no(int p_no) {
		this.p_no = p_no;
	}

	public String getOd_period() {
		return od_period;
	}

	public void setOd_period(String od_period) {
		this.od_period = od_period;
	}

	public int getOd_amount() {
		return od_amount;
	}

	public void setOd_amount(int od_amount) {
		this.od_amount = od_amount;
	}

	public String getOd_as() {
		return od_as;
	}

	public void setOd_as(String od_as) {
		this.od_as = od_as;
	}

	public String getOd_startdate() {
		return od_startdate;
	}

	public void setOd_startdate(String od_startdate) {
		this.od_startdate = od_startdate;
	}

	public String getOd_enddate() {
		return od_enddate;
	}

	public void setOd_enddate(String od_enddate) {
		this.od_enddate = od_enddate;
	}

	public int getOd_point() {
		return od_point;
	}

	public void setOd_point(int od_point) {
		this.od_point = od_point;
	}

	public String getOd_status() {
		return od_status;
	}

	public void setOd_status(String od_status) {
		this.od_status = od_status;
	}
	

	public String getO_time() {
		return o_time;
	}




	public void setO_time(String o_time) {
		this.o_time = o_time;
	}




	public int getO_no() {
		return o_no;
	}




	public void setO_no(int o_no) {
		this.o_no = o_no;
	}




	public String getP_brand() {
		return p_brand;
	}




	public void setP_brand(String p_brand) {
		this.p_brand = p_brand;
	}




	public String getP_newimage1() {
		return p_newimage1;
	}




	public void setP_newimage1(String p_newimage1) {
		this.p_newimage1 = p_newimage1;
	}




	public String getP_name() {
		return p_name;
	}




	public void setP_name(String p_name) {
		this.p_name = p_name;
	}




	public int getOd_review() {
		return od_review;
	}




	public void setOd_review(int od_review) {
		this.od_review = od_review;
	}




	@Override
	public String toString() {
		return "OrderDetailDto [od_no=" + od_no + ", o_number=" + o_number + ", p_no=" + p_no + ", od_period="
				+ od_period + ", od_amount=" + od_amount + ", od_as=" + od_as + ", od_startdate=" + od_startdate
				+ ", od_enddate=" + od_enddate + ", od_point=" + od_point + ", od_status=" + od_status + ", o_time="
				+ o_time + ", o_no=" + o_no + ", p_brand=" + p_brand + ", p_newimage1=" + p_newimage1 + ", p_name="
				+ p_name + ", od_review=" + od_review + "]";
	}


	
}
