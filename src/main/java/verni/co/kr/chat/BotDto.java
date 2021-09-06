package verni.co.kr.chat;

public class BotDto {
	
	private int b_no;
	private String b_category;
	private String b_c_default;
	private String b_question;
	private String b_answer;
	
	public BotDto() {
		// TODO Auto-generated constructor stub
	}

	public BotDto(int b_no, String b_category, String b_c_default, String b_question, String b_answer) {
		super();
		this.b_no = b_no;
		this.b_category = b_category;
		this.b_c_default = b_c_default;
		this.b_question = b_question;
		this.b_answer = b_answer;
	}

	public int getB_no() {
		return b_no;
	}

	public void setB_no(int b_no) {
		this.b_no = b_no;
	}

	public String getB_category() {
		return b_category;
	}

	public void setB_category(String b_category) {
		this.b_category = b_category;
	}

	public String getB_c_default() {
		return b_c_default;
	}

	public void setB_c_default(String b_c_default) {
		this.b_c_default = b_c_default;
	}

	public String getB_question() {
		return b_question;
	}

	public void setB_question(String b_question) {
		this.b_question = b_question;
	}

	public String getB_answer() {
		return b_answer;
	}

	public void setB_answer(String b_answer) {
		this.b_answer = b_answer;
	}

	@Override
	public String toString() {
		return "BotDto [b_no=" + b_no + ", b_category=" + b_category + ", b_c_default=" + b_c_default + ", b_question="
				+ b_question + ", b_answer=" + b_answer + "]";
	}
	
	
}
