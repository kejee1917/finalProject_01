package verni.co.kr.qna;

import java.io.Serializable;

public class QnaParam implements Serializable{
	private int start;
	private int end;
	private int pageNumber;
	private int p_no;
	
	public QnaParam() {
	}
	

	public QnaParam(int start, int end, int pageNumber, int p_no) {
		super();
		this.start = start;
		this.end = end;
		this.pageNumber = pageNumber;
		this.p_no = p_no;
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

	public int getPageNumber() {
		return pageNumber;
	}

	public void setPageNumber(int pageNumber) {
		this.pageNumber = pageNumber;
	}

	public int getP_no() {
		return p_no;
	}

	public void setP_no(int p_no) {
		this.p_no = p_no;
	}
	
	
}
