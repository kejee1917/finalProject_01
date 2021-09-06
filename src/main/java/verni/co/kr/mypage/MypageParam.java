package verni.co.kr.mypage;

import java.io.Serializable;

public class MypageParam implements Serializable{

	private int start;
	private int end;
	private int pageNumber;
	private String search;
	
	public MypageParam() {
	}

	public MypageParam(int start, int end, int pageNumber, String search) {
		super();
		this.start = start;
		this.end = end;
		this.pageNumber = pageNumber;
		this.search = search;
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

	public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}

	@Override
	public String toString() {
		return "MypageParam [start=" + start + ", end=" + end + ", pageNumber=" + pageNumber + ", search=" + search
				+ "]";
	}
	
	
	
}
