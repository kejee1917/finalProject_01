package verni.co.kr.benefit;


/*
CREATE TABLE POINT_USE( -- 포인트 사용 내역

PU_NO NUMBER NOT NULL PRIMARY KEY,
P_NO NUMBER NOT NULL, -- 포인트 번호
PU_CATEGORY VARCHAR2(30) NOT NULL, -- 취소, 사용, 적립, 만료
O_NUMBER VARCHAR2(50), -- 결제사용시 주문번호 저장
PU_AMOUNT NUMBER NOT NULL, -- 포인트
PU_NAME VARCHAR2(100) NOT NULL, -- 가입포인트 적립 , 유효기간 만료 등
PU_USEDATE VARCHAR2(50) NOT NULL -- 적립날짜/사용날짜


Create Sequence NO_POINT_USE;  ?생성

함수 없을 경우 생성

create or replace function get_seq( seq_name in varchar2 )
return
number
is
v_num number;
sql_stmt varchar2(64);
begin
sql_stmt := 'select ' || seq_name || '.nextval from dual';
execute immediate sql_stmt into v_num;
return v_num;
end;
);
 */
public class PointUseDto {
   
   private int pu_no;
   private int p_no;
   private String pu_category;
   private String o_number;
   private int pu_amount; 
   private String pu_name;
   private String pu_usedate;
   
   //0821은지 내역 불러오기 수정
   private String p_use;
   private String p_enddate;
   private String p_name;
   private String p_startdate;
   
   public PointUseDto() {
   }

   public PointUseDto(int pu_no, int p_no, String pu_category, String o_number, int pu_amount, String pu_name,
         String pu_usedate) {
      super();
      this.pu_no = pu_no;
      this.p_no = p_no;
      this.pu_category = pu_category;
      this.o_number = o_number;
      this.pu_amount = pu_amount;
      this.pu_name = pu_name;
      this.pu_usedate = pu_usedate;
   }
   
   //0821 은지 : 포인트내역 불러오기 추가
   public PointUseDto(int pu_no, int p_no, String pu_category, String o_number, int pu_amount, String pu_name,
      String pu_usedate, String p_use, String p_enddate, String p_name, String p_startdate) {
      
      super();
      this.pu_no = pu_no;
      this.p_no = p_no;
      this.pu_category = pu_category;
      this.o_number = o_number;
      this.pu_amount = pu_amount;
      this.pu_name = pu_name;
      this.pu_usedate = pu_usedate;
      this.p_use = p_use;
      this.p_enddate = p_enddate;
      this.p_name = p_name;
      this.p_startdate = p_startdate;
   }



   public int getPu_no() {
      return pu_no;
   }

   public void setPu_no(int pu_no) {
      this.pu_no = pu_no;
   }

   public int getP_no() {
      return p_no;
   }

   public void setP_no(int p_no) {
      this.p_no = p_no;
   }

   public String getPu_category() {
      return pu_category;
   }

   public void setPu_category(String pu_category) {
      this.pu_category = pu_category;
   }

   public String getO_number() {
      return o_number;
   }

   public void setO_number(String o_number) {
      this.o_number = o_number;
   }

   public int getPu_amount() {
      return pu_amount;
   }

   public void setPu_amount(int pu_amount) {
      this.pu_amount = pu_amount;
   }

   public String getPu_name() {
      return pu_name;
   }

   public void setPu_name(String pu_name) {
      this.pu_name = pu_name;
   }

   public String getPu_usedate() {
      return pu_usedate;
   }

   public void setPu_usedate(String pu_usedate) {
      this.pu_usedate = pu_usedate;
   }
   
   // 0818 은지 추가
   public String getP_use() {
      return p_use;
   }

   public void setP_use(String p_use) {
      this.p_use = p_use;
   }

   public String getP_enddate() {
      return p_enddate;
   }

   public void setP_enddate(String p_enddate) {
      this.p_enddate = p_enddate;
   }


   public String getP_name() {
      return p_name;
   }

   public void setP_name(String p_name) {
      this.p_name = p_name;
   }
   
   

   public String getP_startdate() {
   return p_startdate;
   }
   
   public void setP_startdate(String p_startdate) {
      this.p_startdate = p_startdate;
   }

   @Override
   public String toString() {
      return "PointUseDto [pu_no=" + pu_no + ", p_no=" + p_no + ", pu_category=" + pu_category + ", o_number="
            + o_number + ", pu_amount=" + pu_amount + ", pu_name=" + pu_name + ", pu_usedate=" + pu_usedate
            + ", p_use=" + p_use + ", p_enddate=" + p_enddate + ", p_name=" + p_name + ", p_startdate="
            + p_startdate + "]";
   }
   
}