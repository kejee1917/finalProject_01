package verni.co.kr.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class MypageUtil {

	public static String formStartDate(String wdate) {// 21/08/08  -> 21.08.08 00:00:00
		
		String year = wdate.substring(0, 2);
		String month = wdate.substring(3, 5);
		String day = wdate.substring(6, 8);
		
		String strDate = year + ".  " + month + ".  " + day + "   " +  " 00:00:00" ;
		return strDate;
	}
	
	public static String formEndDate(String wdate) {// 21/08/08  -> 21.08.08 00:00:00
		
		String year = wdate.substring(0, 2);
		String month = wdate.substring(3, 5);
		String day = wdate.substring(6, 8);
		
		String strDate = year + ".  " + month + ".  " + day + "   " +  " 23:59:59" ;
		return strDate;
	}
	
	public static String formDate2(String wdate) { //2021-08-10 23:59:59 -> 2021.08.10 
		
		String year = wdate.substring(0, 4);
		String month = wdate.substring(5, 7);
		String day = wdate.substring(8, 10);
		
		String strDate = year + ".  " + month + ".  " + day;
		return strDate;
	}
	
	  public static String formDate(String wdate) {
	      
	      String year = wdate.substring(0, 4);
	      String month = wdate.substring(5, 7);
	      String day = wdate.substring(8, 10);
	      String hour = wdate.substring(11, 13);
	      String min = wdate.substring(14, 16);
	      
	      String strDate = year + ".  " + month + ".  " + day + "   " + hour + ": " + min ;
	      return strDate;
	   }
	  
	 //날짜끼리 빼기  
	 public static int calDate(String bigger, String smaller) throws ParseException {
		 
		 SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		 
		 //날짜로 변환
		 Date date2 = sdf.parse(bigger);
		 Date date1 = sdf.parse(smaller);
		 
		long calDate = date2.getTime()-date1.getTime();
		long calDateDays = calDate / (24*60*60*1000); 
		 
		calDateDays = Math.abs(calDateDays);
        
		System.out.println("날짜 차이: "+calDateDays+" 일");		 
		 
		return (int)calDateDays;
		 
	 }
	 
	 //2021-08-17 -> 21/08/17
	 public static String[] changeDate(String bigger, String smaller) {
		 
		 String byear = bigger.substring(2, 4);
	     String bmonth = bigger.substring(5, 7);
	     String bday = bigger.substring(8, 10);
	     
	     String syear = smaller.substring(2, 4);
	     String smonth = smaller.substring(5, 7);
	     String sday = smaller.substring(8, 10);
	     
	     String date2 = byear + "/" + bmonth + "/" + bday;
	     String date1 = syear + "/" + smonth + "/" + sday;
	     
	     String[] str = new String[2];
	     
	     str[0] = date1;    //작은수
	     str[1] = date2;	//큰수
	     //System.out.println(date1);
	     return str;	     
	 }
	 
	 // 21/08/17 -> 2021-08-17
	 public static String[] backDate(String bigger, String smaller) {
		 String byear = bigger.substring(0, 2);
	     String bmonth = bigger.substring(3, 5);
	     String bday = bigger.substring(6, 8);
	     
	     String syear = smaller.substring(0, 2);
	     String smonth = smaller.substring(3, 5);
	     String sday = smaller.substring(6, 8);
	     
	     String date2 = "20" + byear + "-" + bmonth + "-" + bday;
	     String date1 = "20" + syear + "-" + smonth + "-" + sday;
	     
	     String[] str = new String[2];
	     
	     str[0] = date1;    //작은수
	     str[1] = date2;	//큰수
	     
	     return str;
	 }
	 
	 //문자열 길때 잘라주기 15
	 public static String dot3(String content) {
		String str = "";
		if(content.length() > 16) {
			str = content.substring(0, 15) + "...";
		}else {
			str = content.trim();
		}		
		return str;
	 }
	 
	 //문자열 길때 잘라주기 3
	 public static String dot2(String content) {
		String str = "";
		if(content.length() > 2) {
			str = content.substring(0, 2) + "..";
		}else {
			str = content.trim();
		}		
		return str;
	 }
	 
	
	 //네이버아이디로 로그인할때 @앞에 String 잘라오기
	 public static String naverDomain(String email) {
		 
		 String[] str = new String[2];
		 
		 str = email.split("@");
		 
		 return str[0];
	 }
	 
	public static String formDate3(String wdate) {// 21/08/08  -> 2021.08.08 
		
		String year = wdate.substring(0, 2);
		String month = wdate.substring(3, 5);
		String day = wdate.substring(6, 8);
		
		String strDate = "20" + year + ".  " + month + ".  " + day;
		
		return strDate;
	}
	
	 
}
