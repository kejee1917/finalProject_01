package verni.co.kr.myqna;


/*
CREATE TABLE MYQNA
(
    MQ_NO             NUMBER            NOT NULL, 
    MQ_REF            NUMBER            NOT NULL, 
    M_ID              VARCHAR2(50)      NOT NULL, 
    MQ_TITLE          VARCHAR2(1000)    NOT NULL, 
    MQ_CONTENT        VARCHAR2(4000)    NOT NULL, 
    MQ_CATEGORY       VARCHAR2(20)      NOT NULL, 
    MQ_TYPE           NUMBER(1)         NOT NULL, -- (1:질문 , 2: 답변)
    MQ_STATUS         NUMBER(1)         NULL, --(1: 답변대기 2: 답변완료)
    MQ_FILENAME       VARCHAR2(4000)    NULL, 
    MQ_NEWFILENAME    VARCHAR2(4000)    NULL, 
    MQ_DEL            NUMBER(1)         DEFAULT 0, 
    MQ_WDATE          DATE              DEFAULT SYSDATE, 
    MQ_MYQNA1         VARCHAR2(4000)    NULL, 
    MQ_MYQNA2         VARCHAR2(4000)    NULL, 
    MQ_MYQNA3         VARCHAR2(4000)    NULL, 
    CONSTRAINT PK_MYQNA PRIMARY KEY (MQ_NO)
);
 */
public class MyqnaDto {

	private int mq_no;
	private int mq_ref;
	private String m_id;
	private String mq_title;
	private String mq_content;
	private String mq_category;
	private int mq_type;
	private int mq_status;
	private String mq_filename;
	private String mq_newfilename;
	private int mq_del;
	private String mq_wdate;
	
	public MyqnaDto() {
	}

	public MyqnaDto(int mq_no, int mq_ref, String m_id, String mq_title, String mq_content, String mq_category,
			int mq_type, int mq_status, String mq_filename, String mq_newfilename, int mq_del, String mq_wdate) {
		super();
		this.mq_no = mq_no;
		this.mq_ref = mq_ref;
		this.m_id = m_id;
		this.mq_title = mq_title;
		this.mq_content = mq_content;
		this.mq_category = mq_category;
		this.mq_type = mq_type;
		this.mq_status = mq_status;
		this.mq_filename = mq_filename;
		this.mq_newfilename = mq_newfilename;
		this.mq_del = mq_del;
		this.mq_wdate = mq_wdate;
	}

	public int getMq_no() {
		return mq_no;
	}

	public void setMq_no(int mq_no) {
		this.mq_no = mq_no;
	}

	public int getMq_ref() {
		return mq_ref;
	}

	public void setMq_ref(int mq_ref) {
		this.mq_ref = mq_ref;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getMq_title() {
		return mq_title;
	}

	public void setMq_title(String mq_title) {
		this.mq_title = mq_title;
	}

	public String getMq_content() {
		return mq_content;
	}

	public void setMq_content(String mq_content) {
		this.mq_content = mq_content;
	}

	public String getMq_category() {
		return mq_category;
	}

	public void setMq_category(String mq_category) {
		this.mq_category = mq_category;
	}

	public int getMq_type() {
		return mq_type;
	}

	public void setMq_type(int mq_type) {
		this.mq_type = mq_type;
	}

	public int getMq_status() {
		return mq_status;
	}

	public void setMq_status(int mq_status) {
		this.mq_status = mq_status;
	}

	public String getMq_filename() {
		return mq_filename;
	}

	public void setMq_filename(String mq_filename) {
		this.mq_filename = mq_filename;
	}

	public String getMq_newfilename() {
		return mq_newfilename;
	}

	public void setMq_newfilename(String mq_newfilename) {
		this.mq_newfilename = mq_newfilename;
	}

	public int getMq_del() {
		return mq_del;
	}

	public void setMq_del(int mq_del) {
		this.mq_del = mq_del;
	}

	public String getMq_wdate() {
		return mq_wdate;
	}

	public void setMq_wdate(String mq_wdate) {
		this.mq_wdate = mq_wdate;
	}

	@Override
	public String toString() {
		return "MyqnaService [mq_no=" + mq_no + ", mq_ref=" + mq_ref + ", m_id=" + m_id + ", mq_title=" + mq_title
				+ ", mq_content=" + mq_content + ", mq_category=" + mq_category + ", mq_type=" + mq_type
				+ ", mq_status=" + mq_status + ", mq_filename=" + mq_filename + ", mq_newfilename=" + mq_newfilename
				+ ", mq_del=" + mq_del + ", mq_wdate=" + mq_wdate + "]";
	}
	
}
