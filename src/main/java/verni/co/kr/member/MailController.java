package verni.co.kr.member;

import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MailController {

	@Autowired
	private JavaMailSender mailSender;

	@Autowired
	MemberService service;
	
	
	// 회원가입시 이메일 인증 코드
	@RequestMapping(value = "mailSender.do", method = RequestMethod.GET)
	@ResponseBody
	public String mailSending(String m_email) {

		//뷰에서 넘어왔는지 확인
		//System.out.println("이메일 전송");
		
		//난수 생성(인증번호)
		Random r = new Random();
		int num = r.nextInt(888888) + 111111;  //111111 ~ 999999
		System.out.println("인증번호:" + num);
		
		/* 이메일 보내기 */
        String setFrom = "shareverni@gmail.com"; //보내는 이메일
        String toMail = m_email; //받는 사람 이메일
        String title = "회원가입 인증 이메일 입니다.";
        String content = 
                "share verni 홈페이지를 방문해주셔서 감사합니다." +
                "<br><br>" + 
                "인증 번호는 " + num + "입니다." + 
                "<br>" + 
                "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
        
        try {
            
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
            helper.setFrom(setFrom);
            helper.setTo(toMail);
            helper.setSubject(title);
            helper.setText(content,true);
            mailSender.send(message);
            
        }catch(Exception e) {
            e.printStackTrace();
        }
        
        String rnum = Integer.toString(num);  //view로 다시 반환할 때 String만 가능
        
        return rnum;
 
		
	}
	
	// 비밀번호 찾기 시 이메일 보내기
	@RequestMapping(value = "pwdSender.do", method = RequestMethod.GET)
	@ResponseBody
	public String pwdSending(String m_email, String m_id){

		//뷰에서 넘어왔는지 확인
		//System.out.println("이메일 전송");
		
		MemberDto dto = new MemberDto(m_id, m_email);
		String pwd = service.pwdFind(dto);
		System.out.println("비번 " + pwd);
		
		String str = "";
		if(pwd == null) {
			return "NO";
		}else {
			/* 이메일 보내기 */
	        String setFrom = "shareverni@gmail.com"; //보내는 이메일
	        String toMail = m_email; //받는 사람 이메일
	        String title = "비밀번호 안내 이메일 입니다.";
	        String content = 
	                "share verni 서비스 이용에 항상 감사드립니다." +
	                "<br><br>" + 
	                m_id + " 님의 비밀번호는    " + pwd + "   입니다." + 
	                "<br>" + 
	                "홈페이지로 다시 돌아가셔서 로그인해 주세요.";
	        
	        try {
	            
	            MimeMessage message = mailSender.createMimeMessage();
	            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
	            helper.setFrom(setFrom);
	            helper.setTo(toMail);
	            helper.setSubject(title);
	            helper.setText(content,true);
	            mailSender.send(message);
	            
	        }catch(Exception e) {
	            e.printStackTrace();
	        }
	        
	        return "YES";
	        			
		}
		
	}
	
}