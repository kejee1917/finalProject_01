package verni.co.kr.chat;

public class ChatRoomDto {
	
	private int r_no;
	private String r_uid;
	private String r_status;
	
	public ChatRoomDto() {
		// TODO Auto-generated constructor stub
	}

	public ChatRoomDto(int r_no, String r_uid, String r_status) {
		super();
		this.r_no = r_no;
		this.r_uid = r_uid;
		this.r_status = r_status;
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

	@Override
	public String toString() {
		return "ChatRoomDto [r_no=" + r_no + ", r_uid=" + r_uid + ", r_status=" + r_status + "]";
	}
	
}
