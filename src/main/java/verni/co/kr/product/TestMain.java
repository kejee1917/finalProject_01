package verni.co.kr.product;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.concurrent.TimeUnit;

public class TestMain {
	public static void main(String[] args) throws Exception {
		
		/*
	
		데이터 스트링 변환
	 	Date from = new Date();
		SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String to = fm.format(from);
		
		 */
		
		/*
		
		
		스트링 데이터 변환
		
		String from = "2018-09.06 11:11:11";
		SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date to = fm.parse(from);
		*/
		
		
		
		
		
		Date from = new Date();
		/*
		 * 
		 * String datas2 = datas.replace("-",
		 * "/");
		 * 
		 * SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss.ss"); String
		 * to = sdf.format(from); String date = sdf.format(datas2);
		 * System.out.println("toDate  :"+to); System.out.println("regDate :"+date);
		 */
		
		String datas = "2021-08-01 01:35:59.0"; 
		String datas2 = datas.replace("-", "/");

		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss.s");
        Date firstDate = sdf2.parse(datas2);
        Date secondDate = new Date();

        long diff = secondDate.getTime() - firstDate.getTime();

        TimeUnit time = TimeUnit.DAYS; 
        int diffrence = (int)time.convert(diff, TimeUnit.MILLISECONDS);
        System.out.println("The difference in days is : "+diffrence);
		



        
	}
}
