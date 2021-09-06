package verni.co.kr.wish;

import java.io.Serializable;

/*
 
DROP TABLE WISH
CASCADE CONSTRAINTS;

DROP SEQUENCE NO_WISH;

CREATE SEQUENCE NO_WISH
INCREMENT BY 1
START WITH 1;

CREATE TABLE WISH(
    W_NO NUMBER(8) PRIMARY KEY,
    M_ID VARCHAR2(50) NOT NULL,
    P_NO NUMBER(8) NOT NULL,
    CONSTRAINT FK_WISH1 FOREIGN KEY(P_NO)
    REFERENCES PRODUCT(P_NO)
    ON DELETE CASCADE,
    CONSTRAINT FK_WISH2 FOREIGN KEY(M_ID)
    REFERENCES MEMBER(M_ID)
    ON DELETE CASCADE
);

 */

public class WishDto implements Serializable{
	
	

	private int w_no;
	private String m_id;
	private int p_no;
	private String p_brand;
	private String p_name;
	private String p_newimage1;
	private String p_status;
	
	public WishDto() {}

	public WishDto(int w_no, String m_id, int p_no) {
		super();
		this.w_no = w_no;
		this.m_id = m_id;
		this.p_no = p_no;
	}
	

	
	public WishDto(int w_no, String m_id, int p_no, String p_brand, String p_name, String p_newimage1,
			String p_status) {
		super();
		this.w_no = w_no;
		this.m_id = m_id;
		this.p_no = p_no;
		this.p_brand = p_brand;
		this.p_name = p_name;
		this.p_newimage1 = p_newimage1;
		this.p_status = p_status;
	}
	
	public String getP_status() {
		return p_status;
	}

	public void setP_status(String p_status) {
		this.p_status = p_status;
	}

	public int getW_no() {
		return w_no;
	}

	public void setW_no(int w_no) {
		this.w_no = w_no;
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

	public String getP_newimage1() {
		return p_newimage1;
	}

	public void setP_newimage1(String p_newimage1) {
		this.p_newimage1 = p_newimage1;
	}

	@Override
	public String toString() {
		return "WishDto [w_no=" + w_no + ", m_id=" + m_id + ", p_no=" + p_no + ", p_brand=" + p_brand + ", p_name="
				+ p_name + ", p_newimage1=" + p_newimage1 + ", p_status=" + p_status + "]";
	}

	
	
	
	
}
