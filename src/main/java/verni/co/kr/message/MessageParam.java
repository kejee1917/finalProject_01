package verni.co.kr.message;

public class MessageParam {
	private int start;
	private int end;
	private int pageNumber;
	private String choice;
	private String search;
	private String sorting;
	
	public MessageParam() {}

	public MessageParam(int start, int end, int pageNumber, String choice, String search, String sorting) {
		super();
		this.start = start;
		this.end = end;
		this.pageNumber = pageNumber;
		this.choice = choice;
		this.search = search;
		this.sorting = sorting;
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

	public String getSorting() {
		return sorting;
	}

	public void setSorting(String sorting) {
		this.sorting = sorting;
	}

	@Override
	public String toString() {
		return "MessageParam [start=" + start + ", end=" + end + ", pageNumber=" + pageNumber + ", choice=" + choice
				+ ", search=" + search + ", sorting=" + sorting + "]";
	}
	
	
	
}
