package verni.co.kr.admin;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import verni.co.kr.benefit.CouponDto;
import verni.co.kr.faq.FaqDto;
import verni.co.kr.member.MemberDto;
import verni.co.kr.message.MessageDto;
import verni.co.kr.myqna.MQ_ReplyDto;
import verni.co.kr.myqna.MyqnaDto;
import verni.co.kr.product.ProductDto;
import verni.co.kr.qna.Q_ReplyDto;
import verni.co.kr.qna.QnaDto;
import verni.co.kr.review.R_ReplyDto;
import verni.co.kr.review.ReviewDto;
import verni.co.kr.util.AdminUtil;
import verni.co.kr.util.ProductUtil;

@Controller
public class AdminController {
	
	@Autowired
	AdminService service;
	
	///////////////////////관리자계정관리///////////////////////////
	@RequestMapping( value = "adminMain.do", method = RequestMethod.GET)
	public String adminMain() {
		return "admin.tiles";
	}
	
	
	@RequestMapping( value = "pwdUpdate.do", method = RequestMethod.POST)
	public String pwdUpdate(MemberDto dto, HttpServletRequest req) {
		
		int count = service.pwdUpdate(dto);
		
		// 비밀번호 불러오기
		String pwd = dto.getM_password();
		
		// 비밀번호 새로 셋팅
		MemberDto mem = (MemberDto)req.getSession().getAttribute("login");
		mem.setM_password(pwd);
		if(count > 0) {
			System.out.println("비밀번호 변경 완료" + mem.toString());
			req.getSession().setAttribute("login", mem);
			return "admin.tiles";
			
		}else {
			System.out.println("비밀번호 변경 실패");
			return "admin.tiles";
		}
	}

	@RequestMapping( value = "inforUpdate.do", method = RequestMethod.POST)
	public String inforUpdate(MemberDto dto, HttpServletRequest req) {
		
		// 이름, 이메일 불러오기
		String name = dto.getM_name();
		String email = dto.getM_email();
		
		// 이름, 이메일 재셋팅
		MemberDto mem = (MemberDto)req.getSession().getAttribute("login");
		mem.setM_name(name);
		mem.setM_email(email);
		
		int count = service.infroUpdate(dto);
		if(count > 0) {
			System.out.println("회원정보 변경 완료" + dto.toString());
			req.getSession().setAttribute("login", dto);
			return "admin.tiles";
		}else {
			System.out.println("회원정보 변경 실패");
			return "admin.tiles";
		}
	}
	
	///////////////////////회원관리///////////////////////////
	
	@RequestMapping( value = "member.do", method = RequestMethod.GET)
	public String member(Model model, AdminParam param) {
		
		int pn = param.getPageNumber();
		int start, end;
		
		// pageNumber : 0이면 1페이지
		start = 1 + pn * 10;
		end = 10 + pn * 10;
		
		param.setStart(start);
		param.setEnd(end);
		
		model.addAttribute("choice", param.getChoice());
		model.addAttribute("search", param.getSearch());
		
		String general = "일반";
		String silver = "실버";
		String gold = "골드";
		String dia = "다이아";
		String w_mem = "탈퇴";
		
		
		if(param.getChoice() != null) { // 첫화면
			if(param.getChoice().equals("등급")){
				if(dia.indexOf(param.getSearch()) != -1){
					param.setSearch("5");
				}else if(gold.indexOf(param.getSearch()) != -1){
					param.setSearch("4");
				}else if(silver.indexOf(param.getSearch()) != -1){
					param.setSearch("3");
				}else if(general.indexOf(param.getSearch()) != -1){
					param.setSearch("2");
				}else if(w_mem.indexOf(param.getSearch()) != -1){
					param.setSearch("9");
				}
			}		
		}
		
		List<MemberDto> list = service.memList(param);
		System.out.println("기본:" + param.toString());
		model.addAttribute("list", list);

		// 총 글의 수
		int mPage = service.getMemberCount(param);
		model.addAttribute("page", mPage);
		
		// 현재 페이지
		model.addAttribute("pageNumber", param.getPageNumber()+1);
		
		return "member.tiles";
		
	}
	
	@ResponseBody
	@RequestMapping( value = "getMember.do", method = RequestMethod.POST)
	public MemberDto getMember(Model model, String no) {
		int m_no;
		MemberDto dto = null;
		String[] sno = no.split(","); // 0,1,2
	 
		for(int i=0; i<sno.length; i++) {
			sno[i] = sno[i].replace(",", ""); // 0 1 2
			 
			System.out.println(sno[i]);
			 
			m_no = Integer.parseInt(sno[i]);
			
			dto = service.getMember(m_no);
			
			model.addAttribute("dto", dto);
			System.out.println("회원 : " + dto.toString());
		}
		
		return dto;
	}
	
	@ResponseBody
	@RequestMapping( value = "memDelete.do", method = RequestMethod.POST)
	public String memDelete(String no) {
		int m_no;
		int count = 0;
		String[] sno = no.split(",");
		
		for(int i=0; i<sno.length; i++) {
			sno[i] = sno[i].replace(",", ""); // 0 1 3
			 
			System.out.println(sno[i]);
			 
			m_no = Integer.parseInt(sno[i]);
			count = service.memDelete(m_no);
		}

		if(count>0) {
			return "YES";
		}else {
			return "NO";
		}
	}
	
	@RequestMapping( value = "memDetail.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String memDetail(Model model, int m_no) {
		
		MemberDto dto = service.getMember(m_no);
		System.out.println("회원상세보기 Ctr : " + dto.toString());
		model.addAttribute("dto", dto);
		
		return "memDetail.tiles";
	}
	
	@RequestMapping( value = "memUpdate.do", method = RequestMethod.POST)
	public String memUpdate(Model model, int m_no) {
		MemberDto dto = service.getMember(m_no);
		
		model.addAttribute("dto", dto);
		
		return "memUpdate.tiles";
	}
	
	@RequestMapping( value = "memUpdateAf.do", method = RequestMethod.POST)
	public String memUpdateAf(Model model, MemberDto dto) {
		
		int count = service.memUpdate(dto);
		System.out.println("회원수정 Ctr : " + dto.toString());
		
		if(count>0) {
			return "redirect:/member.do";
		}else {
			return "redirect:/memUpdateAf.do";
		}
	}
	
	///////////////////////상품관리///////////////////////////
	
	@RequestMapping( value = "product.do", method = RequestMethod.GET)
	public String pdList(Model model, AdminParam param) {
		
		int pn = param.getPageNumber();
		int start, end;
		
		// pageNumber : 0이면 1페이지
		start = 1 + pn * 5;		// 1-5
		end = 5 + pn * 5;		// 6-10
		
		param.setStart(start);
		param.setEnd(end);
		
		List<ProductDto> list = service.pdList(param);
		
		// 상품명 12자리 이상은 끊어내기
		for(int i=0; i<list.size(); i++) {	
			ProductDto dto = list.get(i);
			if(dto.getP_name().length() > 12) {
				dto.setP_name(AdminUtil.dot3(dto.getP_name(), 12));
			}
		}
		
		model.addAttribute("list", list);
		
		// 총 글의 수
		int pPage = service.getProductCount(param);
		model.addAttribute("page", pPage);
		
		// 현재 페이지
		model.addAttribute("pageNumber", param.getPageNumber()+1);
		
		// 검색한 상태로 페이지 넘겼을 때 리셋되지않도록
		model.addAttribute("choice", param.getChoice());
		model.addAttribute("search", param.getSearch());
		
		return "product.tiles";
	}
	
	@ResponseBody
	@RequestMapping( value = "getProduct.do", method = RequestMethod.POST)
	public ProductDto getProduct(Model model, String no) {
		int p_no;
		ProductDto dto = null;
		String[] sno = no.split(","); // 0,1,2
	 
		for(int i=0; i<sno.length; i++) {
			sno[i] = sno[i].replace(",", ""); // 0 1 2
			 
			System.out.println(sno[i]);
			 
			p_no = Integer.parseInt(sno[i]);
			
			dto = service.getProduct(p_no);
			
			model.addAttribute("dto", dto);
			System.out.println("상품 : " + dto.toString());
		}
		
		return dto;
	}
	
	@RequestMapping( value = "pdDetail.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String pdDetail(Model model, int p_no) {
		
		ProductDto dto = service.getProduct(p_no);
		
		System.out.println("상품상세보기 Ctr : " + dto.toString());
		
		model.addAttribute("dto", dto);
		
		return "pdDetail.tiles";
	}
	
	@RequestMapping( value = "pdUpdate.do", method = RequestMethod.POST)
	public String pdUpdate(Model model, int p_no) {
		ProductDto dto = service.getProduct(p_no);
		
		model.addAttribute("dto", dto);
		System.out.println("상품수정 Ctr" + dto.toString());
		return "pdUpdate.tiles";
	}
	
	@RequestMapping( value = "pdUpdateAf.do", method = RequestMethod.POST)
	public String pdUpdateAf(@RequestParam(value="thumbnailImage", required = false) MultipartFile fileload, // 파일 받는 부분
			 HttpServletRequest req,
			 ProductDto pd, MultipartHttpServletRequest mhsr, 
			 @RequestParam("detailImage") MultipartFile[] file) throws Exception { 
		
		//pd.setP_image1(pd.getP_image1());	// DB에 저장하기 위해서 원파일명을 넣어준다.
		
		// 썸네일 이미지
		String filename = fileload.getOriginalFilename();
		
		if(filename != null && filename != "") {
			pd.setP_image1(filename);	// DB에 저장하기 위해서 원파일명을 넣어준다.
			
			String newfilename = ProductUtil.getNewFileName(filename);
			pd.setP_newimage1(newfilename);
			String fupload = req.getServletContext().getRealPath("/upload/thumbnailImage");
			
			File f = new File(fupload + "/" + newfilename);
			FileUtils.writeByteArrayToFile(f, fileload.getBytes());
			
			// 디테일 이미지
			String fileOriginName = "";
			String fileMultiName = "";
			String OriginName = "";
			String uploadPath = mhsr.getRealPath("/upload/detailImage");
			
			for (int i = 0; i < file.length; i++) {
				fileOriginName = ProductUtil.getNewFileName(file[i].getOriginalFilename());
				
				//	System.out.println("기존 파일명 : " + file[i].getOriginalFilename());
				//	System.out.println("변경된 파일명 : " + fileOriginName);
				f = new File(uploadPath + "\\" + fileOriginName);
				file[i].transferTo(f);
				
				if (i == 0) {
					fileMultiName += fileOriginName;
					OriginName += file[i].getOriginalFilename();
				} else {
					fileMultiName += "," + fileOriginName;
					OriginName += "," + file[i].getOriginalFilename();
				}
			}
			
			
			pd.setP_image2(OriginName);
			pd.setP_newimage2(fileMultiName);
			
			//	System.out.println("썸네일저장폴더 :" + fupload);
			//	System.out.println("디테일저장폴더 : "+ uploadPath);
			//	System.out.println(pd.toString());
		} 
		
		
		int count = service.pdUpdate(pd);
		System.out.println("상품수정 Ctr : " + pd.toString());
		
		if(count>0) {
			return "redirect:/product.do";
		}else {
			return "redirect:/pdUpdateAf.do";
		}
	}
	
	@ResponseBody
	@RequestMapping( value = "pdDelete.do", method = RequestMethod.POST)
	public String pdDelete(String no) {
		int p_no;
		int count = 0;
		String[] sno = no.split(",");
		
		for(int i=0; i<sno.length; i++) {
			sno[i] = sno[i].replace(",", ""); // 0 1 3
			 
			System.out.println(sno[i]);
			 
			p_no = Integer.parseInt(sno[i]);
			count = service.pdDelete(p_no);
		}

		if(count>0) {
			return "YES";
		}else {
			return "NO";
		}
	}

	///////////////////////상품문의관리///////////////////////////
		
	@RequestMapping( value = "productQna.do", method = RequestMethod.GET)
	public String pdQnaList(Model model, AdminParam param) {
		
		int pn = param.getPageNumber();
		int start, end;
		
		// pageNumber : 0이면 1페이지
		start = 1 + pn * 10;
		end = 10 + pn * 10;
		
		param.setStart(start);
		param.setEnd(end);
		System.out.println(param.getChoice() + " " + param.getSearch() + " " + param.getQ_status());
		
		List<HashMap<String,String>> pdQnaList = service.pdQnaList(param);
		
		System.out.println("상품문의 Ctr : " + pdQnaList.toString());
		
		// 내용 25자리 이상은 끊어내기
		for(int i=0; i<pdQnaList.size(); i++) {	
			HashMap<String, String> dto = pdQnaList.get(i);
			if(dto.get("Q_CONTENT").length() > 25) {
				dto.put("Q_CONTENT", AdminUtil.dot3(dto.get("Q_CONTENT"), 25));
			}
		}
		
		model.addAttribute("list", pdQnaList);
		
		// 총 글의 수
		int pQnaPage = service.getProductQnaCount(param);
		model.addAttribute("page", pQnaPage);
		
		// 현재 페이지
		model.addAttribute("pageNumber", param.getPageNumber()+1);
		
		// 검색한 상태로 페이지 넘겼을 때 리셋되지않도록
		model.addAttribute("q_status", param.getQ_status());
		model.addAttribute("choice", param.getChoice());
		model.addAttribute("search", param.getSearch());
		
		return "productQna.tiles";
	}
	
	@ResponseBody
	@RequestMapping( value = "getProductQna.do", method = RequestMethod.POST)
	public QnaDto getProductQna(Model model, String no) {
		int q_no;
		QnaDto dto = null;
		String[] sno = no.split(","); // 0,1,2
	 
		for(int i=0; i<sno.length; i++) {
			sno[i] = sno[i].replace(",", ""); // 0 1 2
			 
			System.out.println(sno[i]);
			 
			q_no = Integer.parseInt(sno[i]);
			
			dto = service.getProductQna(q_no);
			
			model.addAttribute("dto", dto);
			System.out.println("상품문의 : " + dto.toString());
		}
		
		return dto;
	}
	
	@ResponseBody
	@RequestMapping( value = "pdQnaDelete.do", method = RequestMethod.POST)
	public String pdQnaDelete(String no) {
		int q_no;
		int count = 0;
		String[] sno = no.split(",");
		
		for(int i=0; i<sno.length; i++) {
			sno[i] = sno[i].replace(",", ""); // 0 1 3
			 
			System.out.println(sno[i]);
			 
			q_no = Integer.parseInt(sno[i]);
			count = service.pdQnaDelete(q_no);
		}

		if(count>0) {
			return "YES";
		}else {
			return "NO";
		}
	}
	
	@RequestMapping( value = "pdQnaReplyDetail.do", method = RequestMethod.GET)
	public String pdQnaDetail(Model model, int q_no) {

		QnaDto dto = service.getProductQna(q_no);
		Q_ReplyDto rp = service.getpdQnaReply(q_no);
		
		model.addAttribute("dto", dto);
		model.addAttribute("rp", rp);
		
		/* System.out.println("상품문의 댓글 Ctr : " + rp.toString()); */
		
		return "pdQnaReplyDetail.tiles";
	}
	
	@RequestMapping( value = "pdQnaReplyWrite.do", method = RequestMethod.GET)
	public String pdQnaReplyWrite(Model model, int q_no, int ms_no) {
		QnaDto dto = service.getProductQna(q_no);
		
		model.addAttribute("dto", dto);
		model.addAttribute("ms_no", ms_no);
		
		return "pdQnaReplyWrite.tiles";
	}
	
	@ResponseBody	
	@RequestMapping( value = "pdQnaReplyWriteAf.do", method = RequestMethod.POST)
	public String pdQnaReplyWriteAf(QnaDto dto, int ms_no) {
		int count = service.pdQnaReplyWrite(dto);
		if(count>0) {
			// 답변여부 완료로 변경
			service.pdQnaStatusUpdate(dto.getQ_no());		// q_no
			// 메시지 상태 처리완료로 변경
			service.msStatusUpdate(ms_no);
			return "YES";
		}else {
			return "NO";
		}
	}
	
	@RequestMapping( value = "pdQnaReplyUpdate.do", method = RequestMethod.POST)
	public String pdQnaReplyUpdate(Model model, int q_no) {
		QnaDto dto = service.getProductQna(q_no);
		Q_ReplyDto rp = service.getpdQnaReply(q_no);
		
		model.addAttribute("dto", dto);
		model.addAttribute("rp", rp);
		
		return "pdQnaReplyUpdate.tiles";
	}
	
	@ResponseBody
	@RequestMapping( value = "pdQnaReplyUpdateAf.do", method = RequestMethod.POST)
	public String pdQnaReplyUpdateAf(Model model, QnaDto dto) {
		int count = service.pdQnaReplyUpdate(dto);
		String qr_content = dto.getQr_content();
		
		model.addAttribute("qr_content", qr_content);
		
		System.out.println("답변수정 Ctr : " + dto.toString());
		if(count>0) {
			return "YES";
		}else {
			return "NO";
		}
	}
	
	///////////////////////리뷰관리///////////////////////////
		
	@RequestMapping( value = "productReview.do", method = RequestMethod.GET)
	public String pdReviewList(Model model, AdminParam param) {
		
		int pn = param.getPageNumber();
		int start, end;
		
		// pageNumber : 0이면 1페이지
		start = 1 + pn * 10;
		end = 10 + pn * 10;
		
		param.setStart(start);
		param.setEnd(end);
		
		List<HashMap<String,String>> list = service.pdReviewList(param);
		System.out.println("리뷰관리 Ctr : " + list.toString());
		
		// 내용 25자리 이상은 끊어내기
		for(int i=0; i<list.size(); i++) {	
			HashMap<String, String> dto = list.get(i);
			if(dto.get("R_CONTENT").length() > 25) {
				dto.put("R_CONTENT", AdminUtil.dot3(dto.get("R_CONTENT"), 25));
			}
		}
		
		model.addAttribute("list", list);
		
		// 총 글의 수
		int pPage = service.getProductReviewCount(param);
		model.addAttribute("page", pPage);
		
		// 현재 페이지
		model.addAttribute("pageNumber", param.getPageNumber()+1);
		
		// 검색한 상태로 페이지 넘겼을 때 리셋되지않도록
		model.addAttribute("choice", param.getChoice());
		model.addAttribute("search", param.getSearch());
		
		return "productReview.tiles";
	}
	
	@ResponseBody
	@RequestMapping( value = "getProductReview.do", method = RequestMethod.POST)
	public ReviewDto getProductReview(Model model, String no) {
		int r_no;
		ReviewDto dto = null;
		String[] sno = no.split(","); // 0,1,2
	 
		for(int i=0; i<sno.length; i++) {
			sno[i] = sno[i].replace(",", ""); // 0 1 2
			 
			System.out.println(sno[i]);
			 
			r_no = Integer.parseInt(sno[i]);
			
			dto = service.getProductReview(r_no);
			
			model.addAttribute("dto", dto);
			System.out.println("리뷰 : " + dto.toString());
		}
		
		return dto;
	}
	
	@ResponseBody
	@RequestMapping( value = "pdReviewDelete.do", method = RequestMethod.POST)
	public String pdReviewDelete(String no) {
		int r_no;
		int count = 0;
		String[] sno = no.split(",");
		
		for(int i=0; i<sno.length; i++) {
			sno[i] = sno[i].replace(",", ""); // 0 1 3
			 
			System.out.println(sno[i]);
			 
			r_no = Integer.parseInt(sno[i]);
			count = service.pdReviewDelete(r_no);
		}

		if(count>0) {
			return "YES";
		}else {
			return "NO";
		}
	}
	
	@RequestMapping( value = "pdReviewReplyDetail.do", method = RequestMethod.GET)
	public String pdReviewDetail(Model model, int r_no) {

		ReviewDto dto = service.getProductReview(r_no);
		R_ReplyDto rp = service.getpdReviewReply(r_no);
		
		model.addAttribute("dto", dto);
		model.addAttribute("rp", rp);
		
		/* System.out.println("리뷰 댓글 Ctr : " + rp.toString()); */
		
		return "pdReviewReplyDetail.tiles";
	}
	
	@RequestMapping( value = "pdReviewReplyWrite.do", method = RequestMethod.GET)
	public String pdReviewReplyWrite(Model model, int r_no, int ms_no) {
		ReviewDto dto = service.getProductReview(r_no);
		
		model.addAttribute("dto", dto);
		model.addAttribute("ms_no", ms_no);
		
		return "pdReviewReplyWrite.tiles";
	}
	
	@ResponseBody	
	@RequestMapping( value = "pdReviewReplyWriteAf.do", method = RequestMethod.POST)
	public String pdReviewReplyWriteAf(ReviewDto dto, int ms_no) {
		int count = service.pdReviewReplyWrite(dto);
		if(count>0) {
			// 답변여부 완료로 변경
			service.pdReviewStatusUpdate(dto.getR_no());		// r_no
			// 메시지 상태 처리완료로 변경
			service.msStatusUpdate(ms_no);
			return "YES";
		}else {
			return "NO";
		}
	}
	
	@RequestMapping( value = "pdReviewReplyUpdate.do", method = RequestMethod.POST)
	public String pdReviewReplyUpdate(Model model, int r_no) {
		ReviewDto dto = service.getProductReview(r_no);
		R_ReplyDto rp = service.getpdReviewReply(r_no);
		
		model.addAttribute("dto", dto);
		model.addAttribute("rp", rp);
		
		return "pdReviewReplyUpdate.tiles";
	}
	
	@ResponseBody
	@RequestMapping( value = "pdReviewReplyUpdateAf.do", method = RequestMethod.POST)
	public String pdReviewReplyUpdateAf(Model model, ReviewDto dto) {
		int count = service.pdReviewReplyUpdate(dto);
		String rp_content = dto.getRp_content();
		
		model.addAttribute("rp_content", rp_content);
		
		System.out.println("답변수정 Ctr : " + dto.toString());
		if(count>0) {
			return "YES";
		}else {
			return "NO";
		}
	}

	///////////////////////쿠폰관리///////////////////////////
		
	@RequestMapping( value = "coupon.do", method = RequestMethod.GET)
	public String couponList(Model model, AdminParam param) {
		int pn = param.getPageNumber();
		int start, end;
		
		// pageNumber : 0이면 1페이지
		start = 1 + pn * 10;
		end = 10 + pn * 10;
		
		param.setStart(start);
		param.setEnd(end);
		
		List<CouponDto> list = service.couponList(param);
		System.out.println("쿠폰관리 Ctr : " + list.toString());
		model.addAttribute("list", list);
		
		// 총 글의 수
		int pPage = service.getCouponCount(param);
		System.out.println(pPage);
		model.addAttribute("page", pPage);
		
		// 현재 페이지
		model.addAttribute("pageNumber", param.getPageNumber()+1);
		
		// 검색한 상태로 페이지 넘겼을 때 리셋되지않도록
		model.addAttribute("choice", param.getChoice());
		model.addAttribute("search", param.getSearch());
		
		return "coupon.tiles";
	}
	
	
	 @ResponseBody
	 @RequestMapping( value = "getCoupon.do", method = RequestMethod.POST) 
	 public CouponDto getCoupon(Model model, String no) {
		 int cp_no; 
		 CouponDto dto = null;
		 String[] sno = no.split(","); // 0,1,2
	 
		 for(int i=0; i<sno.length; i++) {
			 sno[i] = sno[i].replace(",", ""); // 0 1 3
			 
			 System.out.println(sno[i]);
			 
			 cp_no = Integer.parseInt(sno[i]);
			 
			 dto = service.getCoupon(cp_no);
			 
			 System.out.println("쿠폰 Ctr : " + dto.toString());
			 
		 }
		 return dto;
	 }
	 
	@ResponseBody
	@RequestMapping( value = "couponDelete.do", method = RequestMethod.POST)
	public String couponDelete(String no) {
		int cp_no;
		int count = 0;
		String[] sno = no.split(",");
		
		for(int i=0; i<sno.length; i++) {
			sno[i] = sno[i].replace(",", ""); // 0 1 3
			 
			System.out.println(sno[i]);
			 
			cp_no = Integer.parseInt(sno[i]);
			count = service.couponDelete(cp_no);
			
		}
		if(count>0) {
			return "YES";
		}else {
			return "NO";
		}
	}
	
	@RequestMapping( value = "addCoupon.do", method = RequestMethod.GET)
	public String addCoupon() {
		return "addCoupon.tiles";
	}
	
	@RequestMapping( value = "addCouponAf.do", method = RequestMethod.POST)
	public String addCouponAf(CouponDto dto) {
		int count = service.addCoupon(dto);
		
		if(count>0) {
			return "redirect:/coupon.do";
		}else {
			return "redirect:/addCouponAf.do";
		}
	}
	
	///////////////////////온라인문의(1:1)///////////////////////////
	
	@RequestMapping( value = "onlineQna.do", method = RequestMethod.GET)
	public String onlineQnaList(Model model, AdminParam param) {
		
		int pn = param.getPageNumber();
		int start, end;
		
		// pageNumber : 0이면 1페이지
		start = 1 + pn * 10;
		end = 10 + pn * 10;
		
		param.setStart(start);
		param.setEnd(end);
		
		// 등급
		String member = "회원";
		String order = "주문/결제";
		String delivery = "배송";
		String as = "반품/교환";
		String product = "상품";
		String etc = "기타";
		
		// 답변여부
		String before = "대기";
		String after = "완료";
		
		// 검색한 상태로 페이지 넘겼을 때 리셋되지않도록
		model.addAttribute("choice", param.getChoice());
		model.addAttribute("search", param.getSearch());
		System.out.println("chocie : " + param.getChoice() + ", search : " + param.getSearch());
		
		if(param.getChoice() != null) {
			if(param.getChoice().equals("문의유형")) {
				if(member.indexOf(param.getSearch()) != -1){
					param.setSearch("member");
				}else if(order.indexOf(param.getSearch()) != -1){
					param.setSearch("order");
				}else if(delivery.indexOf(param.getSearch()) != -1){
					param.setSearch("delivery");
				}else if(as.indexOf(param.getSearch()) != -1){
					param.setSearch("as");
				}else if(product.indexOf(param.getSearch()) != -1){
					param.setSearch("product");
				}else if(etc.indexOf(param.getSearch()) != -1){
					param.setSearch("etc");
				}
			}else if(param.getChoice().equals("답변여부")) {
				if(before.indexOf(param.getSearch()) != -1) {
					param.setSearch("1");
				}else if(after.indexOf(param.getSearch()) != -1) {
					param.setSearch("2");
				}
			}
		}
		
		List<HashMap<String,String>> list = service.onlineQnaList(param);
		System.out.println("온라인문의(1:1) Ctr : " + list.toString());

		// 내용 25자리 이상은 끊어내기
		for(int i=0; i<list.size(); i++) {	
			HashMap<String, String> dto = list.get(i);
			if(dto.get("MQ_CONTENT").length() > 25) {
				dto.put("MQ_CONTENT", AdminUtil.dot3(dto.get("MQ_CONTENT"), 25));
			}
		}
		
		model.addAttribute("list", list);
		// 총 글의 수
		int pPage = service.getOnlineQnaCount(param);
		System.out.println("mq_status Ctr : "+param.getMq_status());
		model.addAttribute("page", pPage);
		
		// 현재 페이지
		model.addAttribute("pageNumber", param.getPageNumber()+1);
		
		return "onlineQna.tiles";
	}
	
	@ResponseBody
	@RequestMapping( value = "getOnlineQna.do", method = RequestMethod.POST)
	public MyqnaDto getOnlineQna(Model model, String no) {
		int mq_no;
		MyqnaDto dto = null;
		String[] sno = no.split(","); // 0,1,2
	 
		for(int i=0; i<sno.length; i++) {
			sno[i] = sno[i].replace(",", ""); // 0 1 2
			 
			System.out.println(sno[i]);
			 
			mq_no = Integer.parseInt(sno[i]);
			
			dto = service.getOnlineQna(mq_no);
			
			model.addAttribute("dto", dto);
			System.out.println("온라인문의(1:1) : " + dto.toString());
		}
		
		return dto;
	}
	
	@ResponseBody
	@RequestMapping( value = "onlineQnaDelete.do", method = RequestMethod.POST)
	public String onlineQnaDelete(String no) {
		int mq_no;
		int count = 0;
		String[] sno = no.split(",");	
		
		for(int i=0; i<sno.length; i++) {
			sno[i] = sno[i].replace(",", ""); // 0 1 3
			 
			System.out.println(sno[i]);
			 
			mq_no = Integer.parseInt(sno[i]);
			count = service.onlineQnaDelete(mq_no);
		}
		
		if(count>0) {
			return "YES";
		}else {
			return "NO";
		}
	}
	
	@RequestMapping( value = "onlineQnaReplyDetail.do", method = RequestMethod.GET)
	public String onlineQnaReplyDetail(Model model, int mq_no) {

		MyqnaDto dto = service.getOnlineQna(mq_no);
		MQ_ReplyDto rp = service.getOnlineQnaReply(mq_no);
		
		model.addAttribute("dto", dto);
		model.addAttribute("rp", rp);
		
		/* System.out.println("온라인 문의 댓글 Ctr : " + rp.toString()); */
		
		return "onlineQnaReplyDetail.tiles";
	}
	
	@RequestMapping( value = "onlineQnaReplyWrite.do", method = RequestMethod.GET)
	public String onlineQnaReplyWrite(Model model, int mq_no, int ms_no) {
		MyqnaDto dto = service.getOnlineQna(mq_no);
		
		model.addAttribute("dto", dto);
		model.addAttribute("ms_no", ms_no);
		
		return "onlineQnaReplyWrite.tiles";
	}
	
	@ResponseBody
	@RequestMapping( value = "onlineQnaReplyWriteAf.do", method = RequestMethod.POST)
	public String onlineQnaReplyWriteAf(MQ_ReplyDto dto, int ms_no) {
		int count = service.onlineQnaReplyWrite(dto);
		System.out.println("답변작성"+dto.toString());
		if(count>0) {
			// 답변여부 완료로 변경
			service.onlineQnaStatusUpdate(dto.getMq_no());		// mq_no
			// 메시지 상태 처리완료로 변경
			service.msStatusUpdate(ms_no);
			return "YES";
		}else {
			return "NO";
		}
	}
	
	@RequestMapping( value = "onlineQnaReplyUpdate.do", method = RequestMethod.POST)
	public String onlineQnaReplyUpdate(Model model, int mq_no) {
		MyqnaDto dto = service.getOnlineQna(mq_no);
		MQ_ReplyDto rp = service.getOnlineQnaReply(mq_no);
		
		model.addAttribute("dto", dto);
		model.addAttribute("rp", rp);
		
		return "onlineQnaReplyUpdate.tiles";
	}
	
	@ResponseBody
	@RequestMapping( value = "onlineQnaReplyUpdateAf.do", method = RequestMethod.POST)
	public String onlineQnaReplyUpdateAf(Model model, MQ_ReplyDto dto) {
		int count = service.onlineQnaReplyUpdate(dto);
		String mqr_content = dto.getMqr_content();
		
		model.addAttribute("mqr_content", mqr_content);
		
		System.out.println("답변수정 Ctr : " + dto.toString());
		if(count>0) {
			return "YES";
		}else {
			return "NO";
		}
	}
	
	///////////////////////FAQ///////////////////////////
	@RequestMapping( value = "faq.do", method = RequestMethod.GET)
	public String fagList(Model model, AdminParam param) {
		int pn = param.getPageNumber();
		int start, end;
		
		// pageNumber : 0이면 1페이지
		start = 1 + pn * 10;
		end = 10 + pn * 10;
		
		param.setStart(start);
		param.setEnd(end);
		
		List<FaqDto> list = service.adminFaq(param);
		
		// 내용 35자리 이상은 끊어내기
		for(int i=0; i<list.size(); i++) {	
			FaqDto dto = list.get(i);
			if(dto.getF_content().length() > 35) {
				dto.setF_content(AdminUtil.dot3(dto.getF_content(), 35));
			}
		}
		
		System.out.println("FAQ Ctr : " + list.toString());
		model.addAttribute("list", list);
		
		// 총 글의 수
		int pPage = service.getFaqCount(param);
		System.out.println(pPage);
		model.addAttribute("page", pPage);
		
		// 현재 페이지
		model.addAttribute("pageNumber", param.getPageNumber()+1);
		
		// 검색한 상태로 페이지 넘겼을 때 리셋되지않도록
		model.addAttribute("choice", param.getChoice());
		model.addAttribute("search", param.getSearch());
		
		return "adminFaq.tiles";
	}
	
	@RequestMapping( value = "faqDetail.do", method = RequestMethod.GET)
	public String faqDetail(Model model, int f_no) {

		FaqDto dto = service.getFaq(f_no);
		
		model.addAttribute("dto", dto);
		
		System.out.println("FAQ 상세보기 Ctr : " + dto.toString());
		
		return "faqDetail.tiles";
	}
	
	@RequestMapping( value = "faqUpdate.do", method = RequestMethod.POST)
	public String faqUpdate(FaqDto dto, Model model) {
		model.addAttribute("dto", dto);
		
		String f_category = dto.getF_category();
		model.addAttribute("f_category", f_category);
		
		System.out.println("FAQ 수정 Ctr : " + dto.toString());
		
		return "faqUpdate.tiles";
	}

	@RequestMapping( value = "faqUpdateAf.do", method = RequestMethod.POST)
	public String faqUpdateAf(FaqDto dto) {
		int count = service.faqUpdate(dto);
		
		if(count>0) {
			return "redirect:/faq.do";
		}else {
			return "redirect:/faqUpdateAf.do";
		}
	}

	@ResponseBody
	@RequestMapping( value = "getFaq.do", method = RequestMethod.POST)
	public FaqDto getFaq(Model model, String no) {
		int f_no; 
		FaqDto dto = null;
		String[] sno = no.split(","); // 0,1,2
	 
		for(int i=0; i<sno.length; i++) {
			 sno[i] = sno[i].replace(",", ""); // 0 1 2
			 
			 System.out.println(sno[i]);
			 
			 f_no = Integer.parseInt(sno[i]);
			 
			 dto = service.getFaq(f_no);
			 
			 System.out.println("FAQ Ctr : " + dto.toString());
		 }
		
		 return dto;
	}
	
	@ResponseBody
	@RequestMapping( value = "faqDelete.do", method = RequestMethod.POST)
	public String faqDelete(String no) {
		int f_no;
		
		int count = 0;
		String[] sno = no.split(",");
		
		for(int i=0; i<sno.length; i++) {
			sno[i] = sno[i].replace(",", ""); // 0 1 3
			 
			System.out.println(sno[i]);
			 
			f_no = Integer.parseInt(sno[i]);
			count = service.faqDelete(f_no);
			
		}
		if(count>0) {
			return "YES";
		}else {
			return "NO";
		}
	}
	
}
