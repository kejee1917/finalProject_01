package verni.co.kr.util;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;
import java.util.concurrent.TimeUnit;

import org.springframework.beans.factory.annotation.Autowired;

import verni.co.kr.likes.LikesDto;
import verni.co.kr.likes.LikesService;
import verni.co.kr.member.MemberDto;
import verni.co.kr.product.ProductDto;
import verni.co.kr.review.ReviewDto;
import verni.co.kr.wish.WishDto;
import verni.co.kr.wish.WishService;

public class ProductUtil {
	// String f : 오리지날 filename
		
	
		public static String getNewFileName(String f) {
			String filename = "";
			UUID uuid = UUID.randomUUID();
			filename = uuid.toString()+f;
			return filename;
		}
		
		// 가격
		public static String change(double number) {
			DecimalFormat df = new DecimalFormat("###,###");
			String str = df.format(number);
			return str;
		}
		
		// new이미지 조건 메소드
		public static int news(String regDate)throws Exception {
			String days = regDate.replace("-", "/");
			SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss.s");
	        Date firstDate = sdf2.parse(days);
	        Date secondDate = new Date();
	        long diff = secondDate.getTime() - firstDate.getTime();
	        TimeUnit time = TimeUnit.DAYS; 
	        int diffrence = (int)time.convert(diff, TimeUnit.MILLISECONDS);
	        
	        return diffrence;
		}
		
		// 브랜드 이름
		public static String brandName(String name) {
			if(name.contains("-")) {
				name = name.replace("-", " ");
			}
			else if(name.contains("_")) {
				name = name.replace("_", "&");
			}
			
			return name;
		}
		
		
		
	
}
