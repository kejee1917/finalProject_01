package verni.co.kr.util;

public class AdminUtil {
	// 문자가 길 때 문자잘라주는 함수
	public static String dot3(String msg, int size) {
		String str = "";
		if(msg.length() > size) {
			str = msg.substring(0, size);
		}else {
			str = msg.trim();
		}		
		return str;
	}
	
}
