package verni.co.kr.aop;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;

@Aspect
public class LogAop {

	@Around(     "within(verni.co.kr.main.MainController) "
			+ "or within(verni.co.kr.mypage.MypageController) "
			+ "or within(verni.co.kr.product.ProductController) "
			+ "or within(verni.co.kr.member.MemberController) "
			+ "or within(verni.co.kr.qna.QnaController)"
			+ "or within(verni.co.kr.mypage.MypageController)"
			+ "or within(verni.co.kr.cart.CartController)"
			+ "or within(verni.co.kr.myqna.MyqnaController)"
			+ "or within(verni.co.kr.review.ReviewController)"
			+ "or within(verni.co.kr.admin.AdminController)"
			+ "or within(verni.co.kr.admin2.Admin2Controller)"
			+ "or within(verni.co.kr.faq.FaqController)"
			)
	public Object loggerAop(ProceedingJoinPoint joinPoint) throws Throwable{
		
		String signStr = joinPoint.getSignature().toShortString();
		
		Object obj = joinPoint.proceed();
		
		System.out.println("LogAop의 " + signStr + "메소드가 실행");
		
		return obj;
	}
	
}
