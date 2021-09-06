package verni.co.kr.util;

import java.sql.Date;
import java.util.List;

import verni.co.kr.order.OrderDetailDto;

public class CalendarUtil {

   
   // 일별 일정
   public static String callist(int year, int month, int day) {
      String str = "";
      
         
      str += "<table class='innerTable1'>";
      str += "<col width='100px'/>";
      
      str += "<tr class='innerTr1'>";
      str += "<td class='innerTd1'>";
      str += "</td>";
      str += "</tr>";
      str += String.format("%2d", day);
      str += "</table>";
      
      // <a href='callist.jsp?year=2021&month=3&day=19'>19</a>
      return str;
   }
   
   // 달력의 날짜 별로 설정할 테이블을 작성하는 함수
   public static String makeTable(int year, int month, int day, List<OrderDetailDto> list) {
      
      String str = "";
      
      String date = year + " " + month + " " + day;
      
      OrderDetailDto dto = new OrderDetailDto();

      
      str += "<table class='innerTable2'>";
      str += "<col width='100px'/>";      
      
      
      if(list != null && list.size() > 0) { //대여했으면~
         for(int i=0; i<list.size(); i++) {
            dto = list.get(i);
            if(dto.getOd_startdate().equals(date)) {
               //대여일
               str += "<tr>";
               str += "<td class='startdate' height='20px' onmouseover='mouseOver("+ i +")' onmouseout='mouseOut("+ i +")' >";
               str += "<p class='startdate"+i+"' onclick='func("+ dto.getOd_no() +")'>" + "[대여일] " + MypageUtil.dot2(dto.getP_name()) + "</p>";
               str += "</td>";
               str += "</tr>";
            }else if(dto.getOd_enddate().equals(date)) {
               //반납일 들어가는 부분
               str += "<tr>";
               str += "<td class='enddate' height='20px' onmouseover='mouseOver("+ i +")' onmouseout='mouseOut("+ i +")'>";
               str += "<p class='enddate"+i+"' onclick='funcimage()'>" +  "[반납일] " + MypageUtil.dot2(dto.getP_name()) + "</p>";
               str += "</td>";
               str += "</tr>";
            }else if(comparedate(date) >= comparedate(dto.getOd_startdate())
                  && comparedate(date) <= comparedate(dto.getOd_enddate())) {
               
               //하이라이트 처리
               str += "<tr>";
               str += "<td class='startdate' height='20px'>";
               str += "<p class='startdate"+i+"'>" + "&nbsp;" + "</p>";
               str += "</td>";
               str += "</tr>";
               
            }
            
            else {
               //빈칸
               str += "<tr>";
               str += "<td class=''>";
               str += "</td>";
               str += "</tr>";
            }   
            
         }
      }else { //대여 안했으면~
         //빈칸
         str += "<tr>";
         str += "<td class=''>";
         str += "</td>";
         str += "</tr>";
         
         str += "<tr>";
         str += "<td class=''>";
         str += "</td>";
         str += "</tr>";
      }

      str += "</table>";   
      
      return str;
   }
   
   
   // 21/08/17 -> 2021 8 17
   public static String calJspFormat(String xmldate) {
      String cyear = xmldate.substring(0, 2);
       String cmonth = xmldate.substring(3, 5);
       String cday = xmldate.substring(6, 8);
       
       cyear = "20" + cyear;
       cmonth = cmonth.indexOf("0")==0?cmonth.substring(1):cmonth;
       cday = cday.indexOf("0")==0?cday.substring(1):cday;

       
       return cyear + " " + cmonth + " " + cday;
   }
   
   // String 2021 8 17 -> int 20210817
   public static int comparedate(String date) {
      String[] str = date.split(" ");
      
      str[1] = str[1].trim().length()==1?"0"+str[1]:str[1];
      str[2] = str[2].trim().length()==1?"0"+str[2]:str[2];
      
      return Integer.parseInt(str[0]+str[1]+str[2]);
      
   }
   
   // 한문자를 두문자로 변경해 주는 함수   2021 03 19   -> 1 ~ 9 -> 01 ~ 09
   public static String two(String msg) {
      return msg.trim().length()<2?"0"+msg.trim():msg.trim();
   }
   
   // nvl 함수 : 문자열이 비어 있는지 확인 함수
   public static boolean nvl(String msg) {
      return msg == null || msg.trim().equals("")?true:false;
   }
   

   public static String yyyymm(int year, int month) {
      return "" + year + two(month + "");
   }
   
   public static String yyyymmdd(int year, int month, int day) {
      return "" + year + two(month + "") + two(day + "");
   }
   
   public static String yyyymmddhhmm(int year, int month, int day, int hour, int min) {      
      return yyyymmdd(year, month, day) + two(hour + "") + two(min + "");      
   }
   
   // ...처리
   public static String dot3(String msg) {
      String str = "";
      if(msg.length() >= 7) {
         str = msg.substring(0, 7);
         str += "...";
      }else {
         str = msg.trim();
      }      
      return str;
   }
   
   // 2021-04-26 -> java.sql.Date로 변경
   public static Date toDate(int year, int month, int day) {
      String s = year + "-" + two(month + "") + "-" + two(day + "");
      Date d = Date.valueOf(s);
      return d;
   }
   
}

