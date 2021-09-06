package verni.co.kr.product;

import java.io.Serializable;

/*
DROP TABLE PRODUCT
CASCADE CONSTRAINTS;

DROP SEQUENCE NO_PRODUCT;

CREATE SEQUENCE NO_PRODUCT
INCREMENT BY 1
START WITH 1;

CREATE TABLE PRODUCT(
    P_NO NUMBER(8) PRIMARY KEY,
    P_NAME VARCHAR2(200) NOT NULL,       -- 옷이름
    P_BRAND VARCHAR2(200) NOT NULL,      -- 브랜드
    P_CASE VARCHAR2(200) NOT NULL,       -- 상황 (ex: 마실룩)
    P_TYPE1 VARCHAR2(200) NOT NULL,       -- 종류 (옷,가방)
    P_TYPE2 VARCHAR2(100) NOT NULL,     -- 상의, 하의 등등
    P_SEASON VARCHAR2(20) NOT NULL,      -- 계절
    P_SIZE VARCHAR2(20) NOT NULL,        -- 사이즈
    P_COLOR VARCHAR2(100) NOT NULL,      -- 색상
    P_IMAGE1 VARCHAR2(1000) NOT NULL,    -- 썸네일이미지
    P_NEWIMAGE1 VARCHAR2(1000) NOT NULL, 
    P_IMAGE2 VARCHAR2(4000) NOT NULL,     -- 이미지
    P_NEWIMAGE2 VARCHAR2(4000) NOT NULL,
    P_IMAGE3 VARCHAR2(4000) NOT NULL,     -- 이미지
    P_NEWIMAGE3 VARCHAR2(4000) NOT NULL,
    P_CONTENT VARCHAR2(4000) NOT NULL,   -- 제품 설명
    P_PRICE NUMBER(8) NOT NULL,          -- 가격
    P_DISCOUNT NUMBER(2) DEFAULT 0,      -- 세일
    P_STATUS VARCHAR2(20) ,              -- 정렬(ex: 대여가능, 대여중)
    P_WISHCOUNT NUMBER(8) DEFAULT 0 ,    -- 찜TOTAL
    P_READCOUNT NUMBER(8) DEFAULT 0 ,                             
    P_REGDATE DATE DEFAULT SYSDATE,
	P_GENDER VARCHAR2(20),				-- ex)남녀공용, 여성, 남성
	P_PRODUCT3 VARCHAR2(4000)
);
 */



public class ProductDto implements Serializable{
	private int p_no;
	private String p_name;
	private String p_brand;
	private String p_case;
	private String p_type1;
	private String p_type2;
	private String p_season;
	private String p_size;
	private String p_color;
	private String p_image1;
	private String p_newimage1;
	private String p_image2;
	private String p_newimage2;
	private String p_content;
	private int p_price;
	private int p_discount;
	private String p_status;
	private int p_wishcount;
	private int p_readcount;
	private String p_regdate;
	private String p_gender;
	private int p_del;
	
	private int od_point;
	private String o_number;

	public ProductDto() {
	}
	
	// 0826 은지 추가
	public ProductDto(int p_no, String p_name, String p_brand, String p_case, String p_type1, String p_type2,
			String p_season, String p_size, String p_color, String p_image1, String p_newimage1, String p_image2,
			String p_newimage2, String p_content, int p_price, int p_discount, String p_status, int p_wishcount,
			int p_readcount, String p_regdate, String p_gender, int od_point, String o_number) {
		super();
		this.p_no = p_no;
		this.p_name = p_name;
		this.p_brand = p_brand;
		this.p_case = p_case;
		this.p_type1 = p_type1;
		this.p_type2 = p_type2;
		this.p_season = p_season;
		this.p_size = p_size;
		this.p_color = p_color;
		this.p_image1 = p_image1;
		this.p_newimage1 = p_newimage1;
		this.p_image2 = p_image2;
		this.p_newimage2 = p_newimage2;
		this.p_content = p_content;
		this.p_price = p_price;
		this.p_discount = p_discount;
		this.p_status = p_status;
		this.p_wishcount = p_wishcount;
		this.p_readcount = p_readcount;
		this.p_regdate = p_regdate;
		this.p_gender = p_gender;
		this.od_point = od_point;
		this.o_number = o_number;
	}

	public ProductDto(String p_name, String p_brand, String p_case, String p_type1, String p_type2, String p_season,
			String p_size, String p_color, String p_image1, String p_newimage1, String p_image2, String p_newimage2,
			String p_content, int p_price, int p_discount, String p_gender, String p_status) {
		super();
		this.p_name = p_name;
		this.p_brand = p_brand;
		this.p_case = p_case;
		this.p_type1 = p_type1;
		this.p_type2 = p_type2;
		this.p_season = p_season;
		this.p_size = p_size;
		this.p_color = p_color;
		this.p_image1 = p_image1;
		this.p_newimage1 = p_newimage1;
		this.p_image2 = p_image2;
		this.p_newimage2 = p_newimage2;
		this.p_content = p_content;
		this.p_price = p_price;
		this.p_discount = p_discount;
		this.p_gender = p_gender;
		this.p_status = p_status;
		
	}

	

	public ProductDto(int p_no, String p_name, String p_brand, String p_case, String p_type1, String p_type2,
			String p_season, String p_size, String p_color, String p_image1, String p_newimage1, String p_image2,
			String p_newimage2, String p_content, int p_price, int p_discount, String p_status, int p_wishcount,
			int p_readcount, String p_regdate, String p_gender) {
		super();
		this.p_no = p_no;
		this.p_name = p_name;
		this.p_brand = p_brand;
		this.p_case = p_case;
		this.p_type1 = p_type1;
		this.p_type2 = p_type2;
		this.p_season = p_season;
		this.p_size = p_size;
		this.p_color = p_color;
		this.p_image1 = p_image1;
		this.p_newimage1 = p_newimage1;
		this.p_image2 = p_image2;
		this.p_newimage2 = p_newimage2;
		this.p_content = p_content;
		this.p_price = p_price;
		this.p_discount = p_discount;
		this.p_status = p_status;
		this.p_wishcount = p_wishcount;
		this.p_readcount = p_readcount;
		this.p_regdate = p_regdate;
		this.p_gender = p_gender;
	}

	public int getP_no() {
		return p_no;
	}

	public void setP_no(int p_no) {
		this.p_no = p_no;
	}

	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	public String getP_brand() {
		return p_brand;
	}

	public void setP_brand(String p_brand) {
		this.p_brand = p_brand;
	}

	public String getP_case() {
		return p_case;
	}

	public void setP_case(String p_case) {
		this.p_case = p_case;
	}

	public String getP_type1() {
		return p_type1;
	}

	public void setP_type1(String p_type1) {
		this.p_type1 = p_type1;
	}

	public String getP_type2() {
		return p_type2;
	}

	public void setP_type2(String p_type2) {
		this.p_type2 = p_type2;
	}

	public String getP_season() {
		return p_season;
	}

	public void setP_season(String p_season) {
		this.p_season = p_season;
	}

	public String getP_size() {
		return p_size;
	}

	public void setP_size(String p_size) {
		this.p_size = p_size;
	}

	public String getP_color() {
		return p_color;
	}

	public void setP_color(String p_color) {
		this.p_color = p_color;
	}

	public String getP_image1() {
		return p_image1;
	}

	public void setP_image1(String p_image1) {
		this.p_image1 = p_image1;
	}

	public String getP_newimage1() {
		return p_newimage1;
	}

	public void setP_newimage1(String p_newimage1) {
		this.p_newimage1 = p_newimage1;
	}

	public String getP_image2() {
		return p_image2;
	}

	public void setP_image2(String p_image2) {
		this.p_image2 = p_image2;
	}

	public String getP_newimage2() {
		return p_newimage2;
	}

	public void setP_newimage2(String p_newimage2) {
		this.p_newimage2 = p_newimage2;
	}

	public String getP_content() {
		return p_content;
	}

	public void setP_content(String p_content) {
		this.p_content = p_content;
	}
	
	public int getP_price() {
		return p_price;
	}

	public void setP_price(int p_price) {
		this.p_price = p_price;
	}

	public int getP_discount() {
		return p_discount;
	}

	public void setP_discount(int p_discount) {
		this.p_discount = p_discount;
	}

	

	public String getP_status() {
		return p_status;
	}

	public void setP_status(String p_status) {
		this.p_status = p_status;
	}

	public int getP_wishcount() {
		return p_wishcount;
	}

	public void setP_wishcount(int p_wishcount) {
		this.p_wishcount = p_wishcount;
	}

	public int getP_readcount() {
		return p_readcount;
	}

	public void setP_readcount(int p_readcount) {
		this.p_readcount = p_readcount;
	}

	public String getP_regdate() {
		return p_regdate;
	}

	public void setP_regdate(String p_regdate) {
		this.p_regdate = p_regdate;
	}
	
	

	public String getP_gender() {
		return p_gender;
	}

	public void setP_gender(String p_gender) {
		this.p_gender = p_gender;
	}
	
	

	public int getOd_point() {
		return od_point;
	}

	public void setOd_point(int od_point) {
		this.od_point = od_point;
	}
	
	public String getO_number() {
		return o_number;
	}

	public void setO_number(String o_number) {
		this.o_number = o_number;
	}
	
	public int getP_del() {
		return p_del;
	}

	public void setP_del(int p_del) {
		this.p_del = p_del;
	}

	@Override
	public String toString() {
		return "ProductDto [p_no=" + p_no + ", p_name=" + p_name + ", p_brand=" + p_brand + ", p_case=" + p_case
				+ ", p_type1=" + p_type1 + ", p_type2=" + p_type2 + ", p_season=" + p_season + ", p_size=" + p_size
				+ ", p_color=" + p_color + ", p_image1=" + p_image1 + ", p_newimage1=" + p_newimage1 + ", p_image2="
				+ p_image2 + ", p_newimage2=" + p_newimage2 + ", p_content=" + p_content + ", p_price=" + p_price
				+ ", p_discount=" + p_discount + ", p_status=" + p_status + ", p_wishcount=" + p_wishcount
				+ ", p_readcount=" + p_readcount + ", p_regdate=" + p_regdate + ", p_gender=" + p_gender + "]";
	}



	
	

	
	
	
	

	
	
	
	
}
