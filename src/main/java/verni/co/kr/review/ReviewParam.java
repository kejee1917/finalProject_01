package verni.co.kr.review;

public class ReviewParam {
	private String search;
	private int start;
	private int end;
	private int pageNumber;
	
	public ReviewParam() {}

	public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
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

	@Override
	public String toString() {
		return "ReviewParam [search=" + search + ", start=" + start + ", end=" + end + ", pageNumber=" + pageNumber
				+ "]";
	}
	
	
}
