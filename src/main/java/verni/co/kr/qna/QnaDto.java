package verni.co.kr.qna;

import java.io.Serializable;

/*
DROP TABLE QNA
CASCADE CONSTRAINTS;

DROP SEQUENCE NO_QNA;

CREATE SEQUENCE NO_QNA
INCREMENT BY 1
START WITH 1;

CREATE TABLE QNA(
    Q_NO NUMBER(8) PRIMARY KEY,
    M_ID VARCHAR2(50) NOT NULL,             -- 작성자(외래키)  
    P_NO NUMBER(8) NOT NULL,                -- 제품 SEQ (외래키)
    Q_TITLE VARCHAR2(1000) NOT NULL,        -- 제목
    Q_KATE NUMBER(1) NOT NULL,              -- 카테고리
    Q_CONTENT VARCHAR2(4000) NOT NULL,       -- 내용
    Q_SECRIT NUMBER(1) NOT NULL,            -- 1: 비밀글
    Q_DEL NUMBER(1) DEFAULT 0 NOT NULL,     -- 1: 삭제
    Q_WDATE DATE DEFAULT SYSDATE,
    Q_STATUS VARCHAR2(50),
    Q_QNA1 VARCHAR2(4000),
    Q_QNA2 VARCHAR2(4000),
    Q_QNA3 VARCHAR2(4000),
    CONSTRAINT FK_QNA1 FOREIGN KEY(P_NO)
    REFERENCES PRODUCT(P_NO) ON DELETE CASCADE,
    CONSTRAINT FK_QNA2 FOREIGN KEY(M_ID)
    REFERENCES MEMBER(M_ID) ON DELETE CASCADE   
);
 */

public class QnaDto implements Serializable {
	
	private int q_no;
	private String m_id;
	private int p_no;
	private String q_title;
	private String q_cate;
	private String q_content;
	private int q_secrit;
	private int q_del;
	private String q_wdate;
	private String q_status;
	
	private int qr_no;
	private String qr_wdate;
	private String qr_content;
	
	private String p_brand;
	private String p_name;
	private String p_type1;
	private String p_newimage1;
	
	public QnaDto() {
	}

	

	public QnaDto(int q_no, String m_id, int p_no, String q_title, String q_cate, String q_content, int q_secrit,
			int q_del, String q_wdate, String q_status, int qr_no, String qr_wdate, String qr_content) {
		super();
		this.q_no = q_no;
		this.m_id = m_id;
		this.p_no = p_no;
		this.q_title = q_title;
		this.q_cate = q_cate;
		this.q_content = q_content;
		this.q_secrit = q_secrit;
		this.q_del = q_del;
		this.q_wdate = q_wdate;
		this.q_status = q_status;
		this.qr_no = qr_no;
		this.qr_wdate = qr_wdate;
		this.qr_content = qr_content;
	}



	public QnaDto(String q_title, String q_cate, String q_content, int q_secrit) {
		super();
		this.q_title = q_title;
		this.q_cate = q_cate;
		this.q_content = q_content;
		this.q_secrit = q_secrit;
	}
	

	public int getQr_no() {
		return qr_no;
	}



	public void setQr_no(int qr_no) {
		this.qr_no = qr_no;
	}



	public String getQr_wdate() {
		return qr_wdate;
	}



	public void setQr_wdate(String qr_wdate) {
		this.qr_wdate = qr_wdate;
	}



	public String getQr_content() {
		return qr_content;
	}



	public void setQr_content(String qr_content) {
		this.qr_content = qr_content;
	}



	public int getQ_no() {
		return q_no;
	}

	public void setQ_no(int q_no) {
		this.q_no = q_no;
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


	public String getQ_title() {
		return q_title;
	}

	public void setQ_title(String q_title) {
		this.q_title = q_title;
	}

	

	public String getQ_cate() {
		return q_cate;
	}



	public void setQ_cate(String q_cate) {
		this.q_cate = q_cate;
	}



	public String getQ_content() {
		return q_content;
	}

	public void setQ_content(String q_content) {
		this.q_content = q_content;
	}

	public int getQ_secrit() {
		return q_secrit;
	}

	public void setQ_secrit(int q_secrit) {
		this.q_secrit = q_secrit;
	}

	public int getQ_del() {
		return q_del;
	}

	public void setQ_del(int q_del) {
		this.q_del = q_del;
	}

	public String getQ_wdate() {
		return q_wdate;
	}

	public void setQ_wdate(String q_wdate) {
		this.q_wdate = q_wdate;
	}

	public String getQ_status() {
		return q_status;
	}

	public void setQ_status(String q_status) {
		this.q_status = q_status;
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
	@Override
	public String toString() {
		return "QnaDto [q_no=" + q_no + ", m_id=" + m_id + ", p_no=" + p_no + ", q_title=" + q_title + ", q_cate="
				+ q_cate + ", q_content=" + q_content + ", q_secrit=" + q_secrit + ", q_del=" + q_del + ", q_wdate="
				+ q_wdate + ", q_status=" + q_status + ", qr_no=" + qr_no + ", qr_wdate=" + qr_wdate + ", qr_content="
				+ qr_content + ", p_brand=" + p_brand + ", p_name=" + p_name + ", p_type1=" + p_type1 + ", p_newimage1="
				+ p_newimage1 + "]";
	}
	
}
