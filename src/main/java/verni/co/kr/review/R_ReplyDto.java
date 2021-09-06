package verni.co.kr.review;

import java.io.Serializable;

public class R_ReplyDto implements Serializable {
	private int rp_no;
	private int r_no;
	private String rp_wdate;
	private String rp_content;
	
	public R_ReplyDto() {}

	public R_ReplyDto(int rp_no, int r_no, String rp_wdate, String rp_content) {
		super();
		this.rp_no = rp_no;
		this.r_no = r_no;
		this.rp_wdate = rp_wdate;
		this.rp_content = rp_content;
	}

	public int getRp_no() {
		return rp_no;
	}

	public void setRp_no(int rp_no) {
		this.rp_no = rp_no;
	}

	public int getR_no() {
		return r_no;
	}

	public void setR_no(int r_no) {
		this.r_no = r_no;
	}

	public String getRp_wdate() {
		return rp_wdate;
	}

	public void setRp_wdate(String rp_wdate) {
		this.rp_wdate = rp_wdate;
	}

	public String getRp_content() {
		return rp_content;
	}

	public void setRp_content(String rp_content) {
		this.rp_content = rp_content;
	}

	

	@Override
	public String toString() {
		return "R_ReplyDto [rp_no=" + rp_no + ", r_no=" + r_no + ", rp_wdate=" + rp_wdate + ", rp_content=" + rp_content
				 + "]";
	}

	

	
	
	
}
