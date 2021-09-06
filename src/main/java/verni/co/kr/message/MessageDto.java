package verni.co.kr.message;

import java.io.Serializable;
/*
DROP TABLE MESSAGE
CASCADE CONSTRAINTS;

DROP SEQUENCE NO_MESSAGE;


CREATE TABLE MESSAGE(
    MS_NO NUMBER PRIMARY KEY,
    MS_STATUS VARCHAR2(50),     -- 상태
    MS_CATEGORY VARCHAR2(50),   -- 분류
    MS_CONTENT VARCHAR2(200),   -- 내용
    MS_RAGDATE DATE DEFAULT SYSDATE,
    MS_NOS NUMBER
);

CREATE SEQUENCE NO_MESSAGE
INCREMENT BY 1
START WITH 1;
 */
public class MessageDto implements Serializable {
	private int ms_no;
	private String ms_status;
	private String ms_category;
	private String ms_content;
	private String ms_ragdate;
	private int ms_nos;
	
	public MessageDto() {}

	public MessageDto(int ms_no, String ms_status, String ms_category, String ms_content, String ms_ragdate,
			int ms_nos) {
		super();
		this.ms_no = ms_no;
		this.ms_status = ms_status;
		this.ms_category = ms_category;
		this.ms_content = ms_content;
		this.ms_ragdate = ms_ragdate;
		this.ms_nos = ms_nos;
	}

	public int getMs_no() {
		return ms_no;
	}

	public void setMs_no(int ms_no) {
		this.ms_no = ms_no;
	}

	public String getMs_status() {
		return ms_status;
	}

	public void setMs_status(String ms_status) {
		this.ms_status = ms_status;
	}

	public String getMs_category() {
		return ms_category;
	}

	public void setMs_category(String ms_category) {
		this.ms_category = ms_category;
	}

	public String getMs_content() {
		return ms_content;
	}

	public void setMs_content(String ms_content) {
		this.ms_content = ms_content;
	}

	public String getMs_ragdate() {
		return ms_ragdate;
	}

	public void setMs_ragdate(String ms_ragdate) {
		this.ms_ragdate = ms_ragdate;
	}

	public int getMs_nos() {
		return ms_nos;
	}

	public void setMs_nos(int ms_nos) {
		this.ms_nos = ms_nos;
	}

	@Override
	public String toString() {
		return "MessageDto [ms_no=" + ms_no + ", ms_status=" + ms_status + ", ms_category=" + ms_category
				+ ", ms_content=" + ms_content + ", ms_ragdate=" + ms_ragdate + ", ms_nos=" + ms_nos + "]";
	}

	
	

	
}
