package verni.co.kr.benefit;


/*
CREATE TABLE POINT(

P_NO NUMBER NOT NULL PRIMARY KEY, -- 포인트 번호
M_ID VARCHAR2(50) NOT NULL, -- 멤버 아이디
P_STARTDATE VARCHAR2(50) NOT NULL, -- 적립일자
P_ENDDATE VARCHAR2(50) NOT NULL, -- 만료일자
P_POINT NUMBER NOT NULL, -- 금액
P_NAME VARCHAR2(100) NOT NULL, -- 포인트 적립내역 카테고리 ( 가입축하, 등급상승, 리뷰포인트 적립 등 )
P_USE VARCHAR2(30) NOT NULL --  사용가능, 결제사용, 기간만료
);
 */
public class PointDto {

	private int p_no;
	private String m_id;
	private String p_startdate;
	private String p_enddate;
	private int p_point;
	private String p_name;
	private String p_use;
	
	// 8/19 초희 추가
	private int puls_point;
	
	
	public PointDto() {
	}

	
	
	// 8/19 초희 추가	
	public PointDto(int p_no,String m_id, int puls_point) {
		super();
		this.p_no = p_no;
		this.m_id = m_id;
		this.puls_point = puls_point;
	}




	public PointDto(int p_no, String m_id, String p_startdate, String p_enddate, int p_point, String p_name,
			String p_use) {
		super();
		this.p_no = p_no;
		this.m_id = m_id;
		this.p_startdate = p_startdate;
		this.p_enddate = p_enddate;
		this.p_point = p_point;
		this.p_name = p_name;
		this.p_use = p_use;
	}

	public int getP_no() {
		return p_no;
	}

	public void setP_no(int p_no) {
		this.p_no = p_no;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getP_startdate() {
		return p_startdate;
	}

	public void setP_startdate(String p_startdate) {
		this.p_startdate = p_startdate;
	}

	public String getP_enddate() {
		return p_enddate;
	}

	public void setP_enddate(String p_enddate) {
		this.p_enddate = p_enddate;
	}

	public int getP_point() {
		return p_point;
	}

	public void setP_point(int p_point) {
		this.p_point = p_point;
	}

	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	public String getP_use() {
		return p_use;
	}

	public void setP_use(String p_use) {
		this.p_use = p_use;
	}
	
	
	public int getPuls_point() {
		return puls_point;
	}

	public void setPuls_point(int puls_point) {
		this.puls_point = puls_point;
	}
	
	


	@Override
	public String toString() {
		return "PointDto [p_no=" + p_no + ", m_id=" + m_id + ", p_startdate=" + p_startdate + ", p_enddate=" + p_enddate
				+ ", p_point=" + p_point + ", p_name=" + p_name + ", p_use=" + p_use + "]";
	}
	
	
	
}
