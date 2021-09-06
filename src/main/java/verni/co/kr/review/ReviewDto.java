package verni.co.kr.review;

/*
CREATE TABLE REVIEW
(
    R_NO             NUMBER            NOT NULL, 			-- 리뷰 SEQ
    M_ID             VARCHAR2(50)      NOT NULL, 			-- 작성자(외래키)
    P_NO             NUMBER            NOT NULL, 			-- 제품 SEQ(외래키)
    O_NUMBER         VARCHAR2(50)      NOT NULL, 			-- 주문 번호
    R_SCOPE          NUMBER(1)         NOT NULL, 			-- 별점
    R_CONTENT        VARCHAR2(4000)    NOT NULL, 			-- 내용
    R_STATUS         VARCHAR2(50)      NOT NULL,			-- 답변여부
    R_FILENAME       VARCHAR2(4000)    NULL, 				-- 업로드 파일
    R_NEWFILENAME    VARCHAR2(4000)    NULL, 
    P_LIKECOUNT      NUMBER            DEFAULT 0, 
    R_DEL            NUMBER(1)         DEFAULT 0, 
    R_WDATE          DATE              DEFAULT SYSDATE, 
    R_REVIEW1        VARCHAR2(4000)    NULL, 
    R_REVIEW2        VARCHAR2(4000)    NULL, 
    R_REVIEW3        VARCHAR2(4000)    NULL, 
     PRIMARY KEY (R_NO)
);

 */

public class ReviewDto {

	private int r_no;
	private String m_id;
	private int p_no;
	private String o_number;
	private int r_scope;
	private String r_content;
	private String r_status;
	private String r_filename;
	private String r_newfilename;
	private int r_likecount;
	private int r_del;
	private String r_wdate;
	
	private int rp_no;
	private String rp_wdate;
	private String rp_content;
	

	private String p_brand;
	private String p_name;
	private String p_type1;
	private String p_newimage1;
	
	
	public ReviewDto() {
	}


	public ReviewDto(int r_no, String m_id, int p_no, String o_number, int r_scope, String r_content, String r_filename,
			String r_newfilename, int r_likecount, int r_del, String r_wdate, int rp_no, String rp_wdate,
			String rp_content) {
		super();
		this.r_no = r_no;
		this.m_id = m_id;
		this.p_no = p_no;
		this.o_number = o_number;
		this.r_scope = r_scope;
		this.r_content = r_content;
		this.r_filename = r_filename;
		this.r_newfilename = r_newfilename;
		this.r_likecount = r_likecount;
		this.r_del = r_del;
		this.r_wdate = r_wdate;
		this.rp_no = rp_no;
		this.rp_wdate = rp_wdate;
		this.rp_content = rp_content;
	}
	
	public ReviewDto(int r_no, String m_id, int p_no, String o_number, int r_scope, String r_content, String r_status,
			String r_filename, String r_newfilename, int r_likecount, int r_del, String r_wdate, int rp_no,
			String rp_wdate, String rp_content, String p_brand, String p_name, String p_type1, String p_newimage1) {
		super();
		this.r_no = r_no;
		this.m_id = m_id;
		this.p_no = p_no;
		this.o_number = o_number;
		this.r_scope = r_scope;
		this.r_content = r_content;
		this.r_status = r_status;
		this.r_filename = r_filename;
		this.r_newfilename = r_newfilename;
		this.r_likecount = r_likecount;
		this.r_del = r_del;
		this.r_wdate = r_wdate;
		this.rp_no = rp_no;
		this.rp_wdate = rp_wdate;
		this.rp_content = rp_content;
		this.p_brand = p_brand;
		this.p_name = p_name;
		this.p_type1 = p_type1;
		this.p_newimage1 = p_newimage1;
	}


	public String getP_brand() {
		return p_brand;
	}


	public void setP_brand(String p_brand) {
		this.p_brand = p_brand;
	}


	public String getP_name() {
		return p_name;
	}


	public void setP_name(String p_name) {
		this.p_name = p_name;
	}


	public String getP_type1() {
		return p_type1;
	}


	public void setP_type1(String p_type1) {
		this.p_type1 = p_type1;
	}


	public String getP_newimage1() {
		return p_newimage1;
	}


	public void setP_newimage1(String p_newimage1) {
		this.p_newimage1 = p_newimage1;
	}


	public int getR_no() {
		return r_no;
	}


	public void setR_no(int r_no) {
		this.r_no = r_no;
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


	public String getO_number() {
		return o_number;
	}


	public void setO_number(String o_number) {
		this.o_number = o_number;
	}


	public int getR_scope() {
		return r_scope;
	}


	public void setR_scope(int r_scope) {
		this.r_scope = r_scope;
	}


	public String getR_content() {
		return r_content;
	}


	public void setR_content(String r_content) {
		this.r_content = r_content;
	}


	public String getR_status() {
		return r_status;
	}


	public void setR_status(String r_status) {
		this.r_status = r_status;
	}


	public String getR_filename() {
		return r_filename;
	}


	public void setR_filename(String r_filename) {
		this.r_filename = r_filename;
	}


	public String getR_newfilename() {
		return r_newfilename;
	}


	public void setR_newfilename(String r_newfilename) {
		this.r_newfilename = r_newfilename;
	}


	public int getR_likecount() {
		return r_likecount;
	}


	public void setR_likecount(int r_likecount) {
		this.r_likecount = r_likecount;
	}


	public int getR_del() {
		return r_del;
	}


	public void setR_del(int r_del) {
		this.r_del = r_del;
	}


	public String getR_wdate() {
		return r_wdate;
	}


	public void setR_wdate(String r_wdate) {
		this.r_wdate = r_wdate;
	}


	public int getRp_no() {
		return rp_no;
	}


	public void setRp_no(int rp_no) {
		this.rp_no = rp_no;
	}


	public String getRp_wdate() {
		return rp_wdate;
	}


	public void setRp_wdate(String rp_wdate) {
		this.rp_wdate = rp_wdate;
	}


	public String getRp_content() {
		return rp_content;
	}


	public void setRp_content(String rp_content) {
		this.rp_content = rp_content;
	}


	@Override
	public String toString() {
		return "ReviewDto [r_no=" + r_no + ", m_id=" + m_id + ", p_no=" + p_no + ", o_number=" + o_number + ", r_scope="
				+ r_scope + ", r_content=" + r_content + ", r_status=" + r_status + ", r_filename=" + r_filename
				+ ", r_newfilename=" + r_newfilename + ", r_likecount=" + r_likecount + ", r_del=" + r_del
				+ ", r_wdate=" + r_wdate + ", rp_no=" + rp_no + ", rp_wdate=" + rp_wdate + ", rp_content=" + rp_content
				+ ", p_brand=" + p_brand + ", p_name=" + p_name + ", p_type1=" + p_type1 + ", p_newimage1="
				+ p_newimage1 + "]";
	}

}
