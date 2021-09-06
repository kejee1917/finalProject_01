package verni.co.kr.myqna;

import java.io.Serializable;


/*
 CREATE TABLE MQ_REPLY
(
    MQR_NO        NUMBER            NOT NULL, 
    MQ_NO         NUMBER            NOT NULL, 
    MQR_WDATE      DATE              DEFAULT SYSDATE, 
    MQR_CONTENT    VARCHAR2(4000)    NOT NULL, 
     PRIMARY KEY (MQR_NO)
);
CREATE SEQUENCE NO_MQ_REPLY
START WITH 1
INCREMENT BY 1;

 */
public class MyqnaReplyDto implements Serializable{

	private int mqr_no;
	private int mq_no;
	private String mqr_wdate;
	private String mqr_content;
	
	public MyqnaReplyDto() {
	}

	public MyqnaReplyDto(int mqr_no, int mq_no, String mqr_wdate, String mqr_content) {
		super();
		this.mqr_no = mqr_no;
		this.mq_no = mq_no;
		this.mqr_wdate = mqr_wdate;
		this.mqr_content = mqr_content;
	}

	public int getMqr_no() {
		return mqr_no;
	}

	public void setMqr_no(int mqr_no) {
		this.mqr_no = mqr_no;
	}

	public int getMq_no() {
		return mq_no;
	}

	public void setMq_no(int mq_no) {
		this.mq_no = mq_no;
	}

	public String getMqr_wdate() {
		return mqr_wdate;
	}

	public void setMqr_wdate(String mqr_wdate) {
		this.mqr_wdate = mqr_wdate;
	}

	public String getMqr_content() {
		return mqr_content;
	}

	public void setMqr_content(String mqr_content) {
		this.mqr_content = mqr_content;
	}

	@Override
	public String toString() {
		return "MyqnaReplyDto [mqr_no=" + mqr_no + ", mq_no=" + mq_no + ", mqr_wdate=" + mqr_wdate + ", mqr_content="
				+ mqr_content + "]";
	}
	
}
