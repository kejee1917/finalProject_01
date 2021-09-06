package verni.co.kr.qna;

/*
 DROP TABLE Q_REPLY
CASCADE CONSTRAINTS;

DROP SEQUENCE NO_Q_REPLY;

CREATE SEQUENCE NO_Q_REPLY
INCREMENT BY 1
START WITH 1;

-- P_QNA 댓글 테이블 (관리자만 작성가능)
CREATE TABLE Q_REPLY(
   QR_NO NUMBER(8) PRIMARY KEY,    -- 댓글 글번호
   Q_NO NUMBER(8),                 -- QNA SEQ
   QR_WDATE DATE DEFAULT SYSDATE,   -- 작성일
   QR_CONTENT VARCHAR2(4000),    -- 댓글 내용
   QR_REPLY1 VARCHAR2(4000),
   QR_REPLY2 VARCHAR2(4000),
   QR_REPLY3 VARCHAR2(4000),
   CONSTRAINT FK_Q_REPLY FOREIGN KEY(Q_NO)
   REFERENCES QNA(Q_NO) ON DELETE CASCADE
);
 */



import java.io.Serializable;

public class Q_ReplyDto implements Serializable {
	private int qr_no;
	private int q_no;
	private String qr_wdate;
	private String qr_content;
	
	public Q_ReplyDto() {}

	public Q_ReplyDto(int qr_no, int q_no, String qr_wdate, String qr_content) {
		super();
		this.qr_no = qr_no;
		this.q_no = q_no;
		this.qr_wdate = qr_wdate;
		this.qr_content = qr_content;
	}

	public int getQr_no() {
		return qr_no;
	}

	public void setQr_no(int qr_no) {
		this.qr_no = qr_no;
	}

	public int getQ_no() {
		return q_no;
	}

	public void setQ_no(int q_no) {
		this.q_no = q_no;
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

	@Override
	public String toString() {
		return "Q_ReplyDto [qr_no=" + qr_no + ", q_no=" + q_no + ", qr_wdate=" + qr_wdate + ", qr_content=" + qr_content
				+ "]";
	}
	
}


