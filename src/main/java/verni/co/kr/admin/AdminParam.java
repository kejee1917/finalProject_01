package verni.co.kr.admin;

import java.io.Serializable;

public class AdminParam implements Serializable{

	private String choice;
	private String search;
	private int pageNumber;
	
	private int start;
	private int end;
	private String p_status;
	private String q_status;
	private String r_status;
	private int mq_status;
	private String cp_use;
	
	public AdminParam() {
	}
	
	public AdminParam(String choice, String search, int pageNumber, int start, int end, String p_status,
			String q_status, String r_status, int mq_status, String cp_use) {
		super();
		this.choice = choice;
		this.search = search;
		this.pageNumber = pageNumber;
		this.start = start;
		this.end = end;
		this.p_status = p_status;
		this.q_status = q_status;
		this.r_status = r_status;
		this.mq_status = mq_status;
		this.cp_use = cp_use;
	}

	public String getChoice() {
		return choice;
	}

	public void setChoice(String choice) {
		this.choice = choice;
	}

	public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}

	public int getPageNumber() {
		return pageNumber;
	}

	public void setPageNumber(int pageNumber) {
		this.pageNumber = pageNumber;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	public String getP_status() {
		return p_status;
	}

	public void setP_status(String p_status) {
		this.p_status = p_status;
	}

	public String getQ_status() {
		return q_status;
	}

	public void setQ_status(String q_status) {
		this.q_status = q_status;
	}
	
	public String getR_status() {
		return r_status;
	}

	public void setR_status(String r_status) {
		this.r_status = r_status;
	}

	public int getMq_status() {
		return mq_status;
	}

	public void setMq_status(int mq_status) {
		this.mq_status = mq_status;
	}

	public String getCp_use() {
		return cp_use;
	}

	public void setCp_use(String cp_use) {
		this.cp_use = cp_use;
	}

	@Override
	public String toString() {
		return "AdminParam [choice=" + choice + ", search=" + search + ", pageNumber=" + pageNumber + ", start=" + start
				+ ", end=" + end + ", p_status=" + p_status + ", q_status=" + q_status + ", r_status=" + r_status
				+ ", mq_status=" + mq_status + ", cp_use=" + cp_use + "]";
	}

}
