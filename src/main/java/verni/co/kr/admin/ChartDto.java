package verni.co.kr.admin;

public class ChartDto {
	
	private String o_time;
	private int cnt;
	private int amount;
	
	private int m_gender;
	private int gcount;
	
	private String p_name;
	private int num;
	
	public String getO_time() {
		return o_time;
	}



	public void setO_time(String o_time) {
		this.o_time = o_time;
	}



	public int getCnt() {
		return cnt;
	}



	public void setCnt(int cnt) {
		this.cnt = cnt;
	}



	public int getAmount() {
		return amount;
	}



	public void setAmount(int amount) {
		this.amount = amount;
	}







	public int getM_gender() {
		return m_gender;
	}



	public void setM_gender(int m_gender) {
		this.m_gender = m_gender;
	}



	public int getGcount() {
		return gcount;
	}



	public void setGcount(int gcount) {
		this.gcount = gcount;
	}

	
	


	public String getP_name() {
		return p_name;
	}



	public void setP_name(String p_name) {
		this.p_name = p_name;
	}



	



//	@Override
//	public String toString() {
//		return "ChartDto [p_name=" + p_name + ", sum=" + sum + "]";
//	}



//	@Override
//	public String toString() {
//		return "ChartDto [m_gender=" + m_gender + ", gcount=" + gcount + "]";
//	}



	public int getNum() {
		return num;
	}



	public void setNum(int num) {
		this.num = num;
	}



	@Override
	public String toString() {
		return "ChartDto [o_time=" + o_time + ", cnt=" + cnt + ", amount=" + amount + "]";
	}

	
}
