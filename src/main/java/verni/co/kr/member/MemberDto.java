package verni.co.kr.member;

import java.io.Serializable;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
/*
-- 멤버테이블
SELECT * FROM MEMBER

DROP TABLE MEMBER
CASCADE CONSTRAINTS;

DROP SEQUENCE NO_member;

CREATE SEQUENCE NO_member
INCREMENT BY 1
START WITH 1;


CREATE TABLE MEMBER(
   M_NO NUMBER NOT NULL,
   M_NAME VARCHAR2(20) NOT NULL,             -- 이름
   M_ID VARCHAR2(50) PRIMARY KEY,            -- 아이디
   M_PASSWORD VARCHAR2(50) NOT NULL,         -- 비밀번호
   M_ADDRESS_POSTCODE VARCHAR2(20) NOT NULL,  -- 우편번호
   M_ADDRESS_PRIMARY VARCHAR2(100) NOT NULL,   -- 기본주소
   M_ADDRESS_DETAIL VARCHAR2(100),             -- 상세주소
   M_EMAIL VARCHAR2(100) NOT NULL,             -- 이메일   
   M_PHONENUM VARCHAR2(13) NOT NULL,           -- 전화번호
   M_JOINDATE DATE DEFAULT SYSDATE,
   M_LEVEL NUMBER NOT NULL,                 -- 관리자 1, 일반회원 2, silver회원 3, gold회원 4, dia회원 5, 탈퇴회원 9
   M_POINT NUMBER DEFAULT 0,               -- 총포인트 
   M_TOTAL NUMBER DEFAULT 0,              -- 총구매금액
   M_BIRTH VARCHAR2(10),                       -- 생일
   M_GENDER NUMBER(1)
   M_REASON VARCHAR2(100),					-- 탈퇴사유
   M_MEMBER2 VARCHAR2(4000),
   M_MEMBER3 VARCHAR2(4000)
);
 */
public class MemberDto implements Serializable{

	private int m_no;
	private String m_name;
	private String m_id;
	private String m_password;
	private String m_address_postcode;
	private String m_address_primary;
	private String m_address_detail;
	private String m_email;
	private String m_phoneNum;
	private String m_joindate;
	private int m_level;
	private int m_point;
	private int m_total;
	private String m_birth;
	private int m_gender;
	private String m_reason;
	
	public MemberDto() {}


	
	
	// 초희 추가	(2021-08-19)
	public MemberDto(String m_id, int m_point) {
		super();
		this.m_id = m_id;
		this.m_point = m_point;
	}
	// 초희 추가	(2021-08-19)
	public MemberDto(String m_id, String m_email) {
		super();
		this.m_id = m_id;
		this.m_email = m_email;
	}
	
	public MemberDto(int m_no, String m_name, String m_id, String m_password, String m_address_postcode,
			String m_address_primary, String m_address_detail, String m_email, String m_phoneNum, String m_joindate,
			int m_level, int m_point, int m_total, String m_birth, int m_gender, String m_reason) {
		super();
		this.m_no = m_no;
		this.m_name = m_name;
		this.m_id = m_id;
		this.m_password = m_password;
		this.m_address_postcode = m_address_postcode;
		this.m_address_primary = m_address_primary;
		this.m_address_detail = m_address_detail;
		this.m_email = m_email;
		this.m_phoneNum = m_phoneNum;
		this.m_joindate = m_joindate;
		this.m_level = m_level;
		this.m_point = m_point;
		this.m_total = m_total;
		this.m_birth = m_birth;
		this.m_gender = m_gender;
		this.m_reason = m_reason;
	}


	public int getM_no() {
		return m_no;
	}


	public void setM_no(int m_no) {
		this.m_no = m_no;
	}


	public String getM_name() {
		return m_name;
	}


	public void setM_name(String m_name) {
		this.m_name = m_name;
	}


	public String getM_id() {
		return m_id;
	}


	public void setM_id(String m_id) {
		this.m_id = m_id;
	}


	public String getM_password() {
		return m_password;
	}


	public void setM_password(String m_password) {
		this.m_password = m_password;
	}


	public String getM_address_postcode() {
		return m_address_postcode;
	}


	public void setM_address_postcode(String m_address_postcode) {
		this.m_address_postcode = m_address_postcode;
	}


	public String getM_address_primary() {
		return m_address_primary;
	}


	public void setM_address_primary(String m_address_primary) {
		this.m_address_primary = m_address_primary;
	}


	public String getM_address_detail() {
		return m_address_detail;
	}


	public void setM_address_detail(String m_address_detail) {
		this.m_address_detail = m_address_detail;
	}


	public String getM_email() {
		return m_email;
	}


	public void setM_email(String m_email) {
		this.m_email = m_email;
	}


	public String getM_phoneNum() {
		return m_phoneNum;
	}


	public void setM_phoneNum(String m_phoneNum) {
		this.m_phoneNum = m_phoneNum;
	}


	public String getM_joindate() {
		return m_joindate;
	}


	public void setM_joindate(String m_joindate) {
		this.m_joindate = m_joindate;
	}


	public int getM_level() {
		return m_level;
	}


	public void setM_level(int m_level) {
		this.m_level = m_level;
	}


	public int getM_point() {
		return m_point;
	}


	public void setM_point(int m_point) {
		this.m_point = m_point;
	}


	public int getM_total() {
		return m_total;
	}


	public void setM_total(int m_total) {
		this.m_total = m_total;
	}


	public String getM_birth() {
		return m_birth;
	}


	public void setM_birth(String m_birth) {
		this.m_birth = m_birth;
	}


	public int getM_gender() {
		return m_gender;
	}


	public void setM_gender(int m_gender) {
		this.m_gender = m_gender;
	}


	public String getM_reason() {
		return m_reason;
	}


	public void setM_reason(String m_reason) {
		this.m_reason = m_reason;
	}


	@Override
	public String toString() {
		return "MemberDto [m_no=" + m_no + ", m_name=" + m_name + ", m_id=" + m_id + ", m_password=" + m_password
				+ ", m_address_postcode=" + m_address_postcode + ", m_address_primary=" + m_address_primary
				+ ", m_address_detail=" + m_address_detail + ", m_email=" + m_email + ", m_phoneNum=" + m_phoneNum
				+ ", m_joindate=" + m_joindate + ", m_level=" + m_level + ", m_point=" + m_point + ", m_total="
				+ m_total + ", m_birth=" + m_birth + ", m_gender=" + m_gender + ", m_reason=" + m_reason + "]";
	}


	
}
