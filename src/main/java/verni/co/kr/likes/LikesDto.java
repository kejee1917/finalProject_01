package verni.co.kr.likes;

import java.io.Serializable;

/*
CREATE TABLE LIKES_RV
(
    L_NO           NUMBER            NOT NULL, 
    M_ID           VARCHAR2(50)      NOT NULL, 
    R_NO           NUMBER            NOT NULL, 
    L_LIKES_RV1    VARCHAR2(4000)    NULL, 
    L_LIKES_RV2    VARCHAR2(4000)    NULL, 
     PRIMARY KEY (L_NO)
);
 */

public class LikesDto implements Serializable{
	
	private int l_no;
	private String m_id;
	private int r_no;
	
	public LikesDto() {
	}

	public LikesDto(int l_no, String m_id, int r_no) {
		super();
		this.l_no = l_no;
		this.m_id = m_id;
		this.r_no = r_no;
	}

	public int getL_no() {
		return l_no;
	}

	public void setL_no(int l_no) {
		this.l_no = l_no;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public int getR_no() {
		return r_no;
	}

	public void setR_no(int r_no) {
		this.r_no = r_no;
	}

	@Override
	public String toString() {
		return "LikesDto [l_no=" + l_no + ", m_id=" + m_id + ", r_no=" + r_no + "]";
	}
	
}
