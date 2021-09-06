package verni.co.kr.member;

import java.util.HashMap;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import verni.co.kr.util.MypageUtil;



public class JsonParser {
	

	public MemberDto changeJson(String string) throws Exception {

		HashMap<String, Object> map = new HashMap<>();
		JSONParser jsonParser = new JSONParser();
		MemberDto dto = new MemberDto();

		JSONObject jsonObject = (JSONObject) jsonParser.parse(string);

		jsonObject = (JSONObject) jsonObject.get("response");

		//map.put("userGender", jsonObject.get("gender"));
		map.put("m_email", jsonObject.get("email"));
		map.put("m_name", jsonObject.get("name"));
		map.put("m_phoneNum", jsonObject.get("mobile"));
		
		//@앞에 String만 id로 저장
		String naverId = MypageUtil.naverDomain((String)map.get("m_email"));
		
		//dto에 넣기
		dto.setM_id(naverId);
		dto.setM_name(map.get("m_name").toString());
		dto.setM_email(map.get("m_email").toString()); 
		dto.setM_phoneNum(map.get("m_phoneNum").toString());
		
		System.out.println("json dto: " + dto);
		return dto;
	}
}