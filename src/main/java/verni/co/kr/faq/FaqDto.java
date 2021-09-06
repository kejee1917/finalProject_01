package verni.co.kr.faq;

import java.io.Serializable;

public class FaqDto implements Serializable {
	private int f_no;
	private String f_category;
	private String f_title;
	private String f_content;
	
	public FaqDto() {}

	public FaqDto(int f_no, String f_category, String f_title, String f_content) {
		super();
		this.f_no = f_no;
		this.f_category = f_category;
		this.f_title = f_title;
		this.f_content = f_content;
	}

	public int getF_no() {
		return f_no;
	}

	public void setF_no(int f_no) {
		this.f_no = f_no;
	}

	public String getF_category() {
		return f_category;
	}

	public void setF_category(String f_category) {
		this.f_category = f_category;
	}

	public String getF_title() {
		return f_title;
	}

	public void setF_title(String f_title) {
		this.f_title = f_title;
	}

	public String getF_content() {
		return f_content;
	}

	public void setF_content(String f_content) {
		this.f_content = f_content;
	}

	@Override
	public String toString() {
		return "FaqDto [f_no=" + f_no + ", f_category=" + f_category + ", f_title=" + f_title + ", f_content="
				+ f_content + "]";
	}
	
	
}
