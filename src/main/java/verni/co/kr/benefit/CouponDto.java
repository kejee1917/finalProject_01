package verni.co.kr.benefit;

/*
Create Sequence NO_MEMBER_COUPON;

create or replace function get_seq( seq_name in varchar2 ) 
return 
  number 
is
  v_num number;
  sql_stmt varchar2(64);
begin
  sql_stmt := 'select ' || seq_name || '.nextval from dual';
  execute immediate sql_stmt into v_num;
  return v_num;
end;

DROP TABLE MEMBER_COUPON
CASCADE CONSTRAINTS;

DROP SEQUENCE NO_MEMBER_COUPON;

---이것 쓰지 마세요!! 다중 insert 사용하려면 위의 코드 써야함
CREATE SEQUENCE NO_MEMBER_COUPON
INCREMENT BY 1
START WITH 1;
------이거 쓰지 마세요!!

CREATE TABLE MEMBER_COUPON(

MC_NO NUMBER NOT NULL PRIMARY KEY,
CP_NO NUMBER NOT NULL, -- 쿠폰 번호
M_ID VARCHAR2(50), -- 멤버 아이디
MC_STARTDATE VARCHAR2(50), -- 발급일자 2021-07-27 00:00:00
MC_ENDDATE VARCHAR2(50), -- 만료일자 2021-08-02 23:59:59
MC_USE VARCHAR2(50) -- 사용여부 TRUE FALSE

);
 */
public class CouponDto {

	private int mc_no;
	private int cp_no;
	private String cp_category;
	private String cp_name;
	private String cp_amount;
	private int cp_limitmin;
	private int cp_limitmax;
	private String cp_use;
	
	private String m_id;
	private String mc_startdate;
	private String mc_enddate;
	private String mc_use;
	
	public CouponDto() {
		// TODO Auto-generated constructor stub
	}

	public CouponDto(int mc_no, int cp_no, String cp_category, String cp_name, String cp_amount, int cp_limitmin,
			int cp_limitmax, String cp_use, String m_id, String mc_startdate, String mc_enddate, String mc_use) {
		super();
		this.mc_no = mc_no;
		this.cp_no = cp_no;
		this.cp_category = cp_category;
		this.cp_name = cp_name;
		this.cp_amount = cp_amount;
		this.cp_limitmin = cp_limitmin;
		this.cp_limitmax = cp_limitmax;
		this.cp_use = cp_use;
		this.m_id = m_id;
		this.mc_startdate = mc_startdate;
		this.mc_enddate = mc_enddate;
		this.mc_use = mc_use;
	}
	
	//0811은지 수정 : 회원가입 시 쿠폰 발급
	public CouponDto(int cp_no, String cp_category, String cp_name, String cp_amount, int cp_limitmin, int cp_limitmax,
			String cp_use) {
		super();
		this.cp_no = cp_no;
		this.cp_category = cp_category;
		this.cp_name = cp_name;
		this.cp_amount = cp_amount;
		this.cp_limitmin = cp_limitmin;
		this.cp_limitmax = cp_limitmax;
		this.cp_use = cp_use;
	}

	public int getMc_no() {
		return mc_no;
	}


	public void setMc_no(int mc_no) {
		this.mc_no = mc_no;
	}

	public int getCp_no() {
		return cp_no;
	}

	public void setCp_no(int cp_no) {
		this.cp_no = cp_no;
	}

	public String getCp_category() {
		return cp_category;
	}

	public void setCp_category(String cp_category) {
		this.cp_category = cp_category;
	}

	public String getCp_name() {
		return cp_name;
	}

	public void setCp_name(String cp_name) {
		this.cp_name = cp_name;
	}

	public String getCp_amount() {
		return cp_amount;
	}

	public void setCp_amount(String cp_amount) {
		this.cp_amount = cp_amount;
	}

	public int getCp_limitmin() {
		return cp_limitmin;
	}

	public void setCp_limitmin(int cp_limitmin) {
		this.cp_limitmin = cp_limitmin;
	}

	public int getCp_limitmax() {
		return cp_limitmax;
	}

	public void setCp_limitmax(int cp_limitmax) {
		this.cp_limitmax = cp_limitmax;
	}

	public String getCp_use() {
		return cp_use;
	}

	public void setCp_use(String cp_use) {
		this.cp_use = cp_use;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getMc_startdate() {
		return mc_startdate;
	}

	public void setMc_startdate(String mc_startdate) {
		this.mc_startdate = mc_startdate;
	}

	public String getMc_enddate() {
		return mc_enddate;
	}

	public void setMc_enddate(String mc_enddate) {
		this.mc_enddate = mc_enddate;
	}

	public String getMc_use() {
		return mc_use;
	}

	public void setMc_use(String mc_use) {
		this.mc_use = mc_use;
	}

	@Override
	public String toString() {
		return "CouponDto [mc_no=" + mc_no + ", cp_no=" + cp_no + ", cp_category=" + cp_category + ", cp_name="
				+ cp_name + ", cp_amount=" + cp_amount + ", cp_limitmin=" + cp_limitmin + ", cp_limitmax=" + cp_limitmax
				+ ", cp_use=" + cp_use + ", m_id=" + m_id + ", mc_startdate=" + mc_startdate + ", mc_enddate="
				+ mc_enddate + ", mc_use=" + mc_use + "]";
	}

	
	
	
}
