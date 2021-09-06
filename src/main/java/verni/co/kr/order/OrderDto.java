package verni.co.kr.order;

public class OrderDto {
	
	private int o_no;
	private String o_number;
	private String m_id;
	private String s_name;
	private String s_post;
	private String s_address;
	private String s_address2;
	private String s_phone;
	private String s_request;
	private String o_payment;
	private int mc_no;
	private int o_point;
	private int o_total;
	private String o_time;
	
	// 8/20 초희 추가
	private String od_period;
	private String od_status;
	private String p_name;
	private int p_no;
	private int ms_no;
	private String od_startdate;
	private String od_enddate;
	private String p_brand;
	private String p_newimage1;
	private int od_amount;
	private String od_as;
	private int od_no;
	private String ms_category;
	
	public OrderDto() {
		// TODO Auto-generated constructor stub
	}


	public OrderDto(int o_no, String o_number, String m_id, String s_name, String s_post, String s_address,
			String s_address2, String s_phone, String s_request, String o_payment, int mc_no, int o_point, int o_total,
			String o_time) {
		super();
		this.o_no = o_no;
		this.o_number = o_number;
		this.m_id = m_id;
		this.s_name = s_name;
		this.s_post = s_post;
		this.s_address = s_address;
		this.s_address2 = s_address2;
		this.s_phone = s_phone;
		this.s_request = s_request;
		this.o_payment = o_payment;
		this.mc_no = mc_no;
		this.o_point = o_point;
		this.o_total = o_total;
		this.o_time = o_time;
	}



	public int getO_no() {
		return o_no;
	}

	public void setO_no(int o_no) {
		this.o_no = o_no;
	}
	
	public String getO_number() {
		return o_number;
	}

	public void setO_number(String o_number) {
		this.o_number = o_number;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getS_name() {
		return s_name;
	}

	public void setS_name(String s_name) {
		this.s_name = s_name;
	}

	public String getS_post() {
		return s_post;
	}

	public void setS_post(String s_post) {
		this.s_post = s_post;
	}

	public String getS_address() {
		return s_address;
	}

	public void setS_address(String s_address) {
		this.s_address = s_address;
	}

	public String getS_address2() {
		return s_address2;
	}

	public void setS_address2(String s_address2) {
		this.s_address2 = s_address2;
	}

	public String getS_phone() {
		return s_phone;
	}

	public void setS_phone(String s_phone) {
		this.s_phone = s_phone;
	}

	public String getS_request() {
		return s_request;
	}

	public void setS_request(String s_request) {
		this.s_request = s_request;
	}

	public String getO_payment() {
		return o_payment;
	}

	public void setO_payment(String o_payment) {
		this.o_payment = o_payment;
	}

	public int getMc_no() {
		return mc_no;
	}

	public void setMc_no(int mc_no) {
		this.mc_no = mc_no;
	}

	public int getO_point() {
		return o_point;
	}

	public void setO_point(int o_point) {
		this.o_point = o_point;
	}

	public int getO_total() {
		return o_total;
	}

	public void setO_total(int o_total) {
		this.o_total = o_total;
	}

	public String getO_time() {
		return o_time;
	}

	public void setO_time(String o_time) {
		this.o_time = o_time;
	}
	
	// 초희 추가
	public String getOd_period() {
		return od_period;
	}


	public void setOd_period(String od_period) {
		this.od_period = od_period;
	}


	public String getOd_status() {
		return od_status;
	}


	public void setOd_status(String od_status) {
		this.od_status = od_status;
	}


	public String getP_name() {
		return p_name;
	}


	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	

	public int getP_no() {
		return p_no;
	}


	public void setP_no(int p_no) {
		this.p_no = p_no;
	}
	
	

	public int getMs_no() {
		return ms_no;
	}


	public void setMs_no(int ms_no) {
		this.ms_no = ms_no;
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
	

	public int getOd_no() {
		return od_no;
	}


	public void setOd_no(int od_no) {
		this.od_no = od_no;
	}
	
	
	public String getMs_category() {
		return ms_category;
	}


	public void setMs_category(String ms_category) {
		this.ms_category = ms_category;
	}


	@Override
	public String toString() {
		return "OrderDto [o_no=" + o_no + ", o_number=" + o_number + ", m_id=" + m_id + ", s_name=" + s_name
				+ ", s_post=" + s_post + ", s_address=" + s_address + ", s_address2=" + s_address2 + ", s_phone="
				+ s_phone + ", s_request=" + s_request + ", o_payment=" + o_payment + ", mc_no=" + mc_no + ", o_point="
				+ o_point + ", o_total=" + o_total + ", o_time=" + o_time + "]";
	}


	
	
	
	
}
