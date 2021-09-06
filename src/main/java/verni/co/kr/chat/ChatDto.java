package verni.co.kr.chat;

public class ChatDto {
	
	private int c_no;
	private int r_no;
	private String r_uid;
	private String r_status;
	private String c_message;
	private String c_time;
	private String c_read;
	private int readcount;
	
	
	public ChatDto() {
		// TODO Auto-generated constructor stub
	}

	
	public ChatDto(int c_no, int r_no, String r_uid, String c_message, String c_time, String c_read) {
		super();
		this.c_no = c_no;
		this.r_no = r_no;
		this.r_uid = r_uid;
		this.c_message = c_message;
		this.c_time = c_time;
		this.c_read = c_read;
	}


	public ChatDto(int c_no, int r_no, String r_uid, String r_status, String c_message, String c_time, String c_read,
			int readcount) {
		super();
		this.c_no = c_no;
		this.r_no = r_no;
		this.r_uid = r_uid;
		this.r_status = r_status;
		this.c_message = c_message;
		this.c_time = c_time;
		this.c_read = c_read;
		this.readcount = readcount;
	}


	public int getC_no() {
		return c_no;
	}


	public void setC_no(int c_no) {
		this.c_no = c_no;
	}


	public int getR_no() {
		return r_no;
	}


	public void setR_no(int r_no) {
		this.r_no = r_no;
	}


	public String getR_uid() {
		return r_uid;
	}


	public void setR_uid(String r_uid) {
		this.r_uid = r_uid;
	}


	public String getR_status() {
		return r_status;
	}


	public void setR_status(String r_status) {
		this.r_status = r_status;
	}


	public String getC_message() {
		return c_message;
	}


	public void setC_message(String c_message) {
		this.c_message = c_message;
	}


	public String getC_time() {
		return c_time;
	}


	public void setC_time(String c_time) {
		this.c_time = c_time;
	}


	public String getC_read() {
		return c_read;
	}


	public void setC_read(String c_read) {
		this.c_read = c_read;
	}


	public int getReadcount() {
		return readcount;
	}


	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}


	@Override
	public String toString() {
		return "ChatDto [c_no=" + c_no + ", r_no=" + r_no + ", r_uid=" + r_uid + ", r_status=" + r_status
				+ ", c_message=" + c_message + ", c_time=" + c_time + ", c_read=" + c_read + ", readcount=" + readcount
				+ "]";
	}



}
