package verni.co.kr.review;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import verni.co.kr.benefit.PointDto;
import verni.co.kr.likes.LikesDto;
import verni.co.kr.likes.LikesService;
import verni.co.kr.member.MemberDto;
import verni.co.kr.message.MessageDto;
import verni.co.kr.message.MessageService;
import verni.co.kr.mypage.MypageService;
import verni.co.kr.product.ProductDto;
import verni.co.kr.product.ProductService;
import verni.co.kr.util.ProductUtil;

@Controller
public class ReviewController {

	@Autowired
	ReviewService service;
	@Autowired
	ProductService pservice;
	@Autowired
	LikesService lservice;
	@Autowired
	MessageService mservice;
	@Autowired
	MypageService mpservice;
	
	
	@RequestMapping(value = "reviewWrite.do", method = RequestMethod.GET)
	public String reviewWrite(Model model, int od_no) {
		//System.out.println("시퀀스 : " + od_no);
		ProductDto pd = service.getProduct(od_no);
		//System.out.println(pd.toString());
		
		//0826 은지 추가
		model.addAttribute("od_no", od_no);
		model.addAttribute("pd", pd);
		return "review.tiles";
	}
	
	
   @RequestMapping(value = "reviewWriteAf.do", method = RequestMethod.POST)
   public String reviewWriteAf(ReviewDto rev, int od_no, MultipartHttpServletRequest mhsr,  Model model,
                        @RequestParam("filename") MultipartFile[] file) throws Exception {
      ProductDto pd = service.getProduct(od_no);   
      PointDto pt = new PointDto(0, rev.getM_id(), pd.getOd_point());
      
      
      // 포인트 INSERT
      service.setPoint(pt);
      
      // 포인트사용 INSERT
      PointDto pt2 = new PointDto(service.getPointMaxNo(), null, pd.getOd_point());
      service.setPointUse(pt2);
     
      
      //////0826 은지 수정 : 리뷰 쓰면 OD_REVIEW에 1 update
      service.od_reviewUpdate(od_no);
      List<ReviewDto> list = mpservice.writtenReview(rev.getM_id());
      // 디테일 이미지
      String fileOriginName = "";
      String fileMultiName = "";
      String OriginName = "";
      String uploadPath = mhsr.getRealPath("/upload/reviewImage");
      
      System.out.println("file[0] : "+ file[0].getOriginalFilename());
      
      
      boolean flag = false;
      
      
      if( file[0].getOriginalFilename().equals("") || file[0].getOriginalFilename() == null) {
         rev.setR_filename("");
         rev.setR_newfilename("");
         
         flag = service.revWrite(rev, pt);
      }else if(!file[0].getOriginalFilename().equals("") || file[0].getOriginalFilename() != null) {
         for (int i = 0; i < file.length; i++) {
            fileOriginName = ProductUtil.getNewFileName(file[i].getOriginalFilename());
            
         //   System.out.println("기존 파일명 : " + file[i].getOriginalFilename());
         //   System.out.println("변경된 파일명 : " + fileOriginName);
            File f = new File(uploadPath + "\\" + fileOriginName);
            file[i].transferTo(f);
            
            if (i == 0) {
               fileMultiName += fileOriginName;
               OriginName += file[i].getOriginalFilename();
            } else {
               fileMultiName += "," + fileOriginName;
               OriginName += "," + file[i].getOriginalFilename();
            }
         }
         
         rev.setR_filename(OriginName);
         rev.setR_newfilename(fileMultiName);
         flag = service.revWrite(rev, pt);
      }
      
      MessageDto ms = new MessageDto(0, "미처리", "리뷰",  rev.getM_id()+"님으로부터 리뷰가 등록되었습니다.", null, service.getReviewMaxNo());
      boolean a = mservice.messageAdd(ms);
            
      //0819 은지 추가
       model.addAttribute("list", list);
      return "myreview.tiles";
   }
	
	
	@RequestMapping(value = "r_replyWrite.do", method = RequestMethod.GET)
	public String r_replyWrite(Model model, int r_no) {
		ReviewDto rv = service.getReview(r_no);
		model.addAttribute("rlist", rv);
		return "r_reply.tiles";
	}
	
	@RequestMapping(value = "r_replyWriteAf.do", method = RequestMethod.POST)
	public String r_replyWriteAf(R_ReplyDto rp, int ms_no) {
		boolean flag = service.rReplyWrite(rp);
		mservice.statusUpdate(ms_no);
		return "redirect:/messageList.do";
	}
	
	// 리뷰리스트
	@RequestMapping(value = "reviewList.do", method = RequestMethod.GET)
	public String reviewList(Model model, ReviewParam param, HttpServletRequest request) {
		
		MemberDto mem =  (MemberDto)request.getSession().getAttribute("login");
		
		int start, end;
		start = 1 + 10 * param.getPageNumber();
		end = 10 + 10 * param.getPageNumber();
		param.setStart(start);
		param.setEnd(end);
		// 현재 페이지
		model.addAttribute("pageNumber", param.getPageNumber());
		
		int totalCount = service.getReviewNum(param);
		model.addAttribute("totalCount", totalCount);
		
		List<ReviewDto> rlist = service.getReviewList(param);
		model.addAttribute("rlist", rlist);
		
		int[] lcount = lcount(mem, rlist);
		model.addAttribute("1count",lcount);
		
		List<ReviewDto> blist = service.getBestReview();
		model.addAttribute("blist", blist);
		int[] bcount = lcount(mem, blist);
		model.addAttribute("bcount",bcount);
		return "reviewList.tiles";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	// 리뷰찜 메소드
		public int[] lcount(MemberDto mem, List<ReviewDto> rlist) {
			int[] count = new int[rlist.size()];
			if (mem == null) {
				for (int i = 0; i < rlist.size(); i++) {
					count[i] = 0;
				}
			} else if (mem != null) {
				String id = mem.getM_id();
				int[] r_no = new int[rlist.size()];
				for (int i = 0; i < rlist.size(); i++) {
					r_no[i] = rlist.get(i).getR_no();
					LikesDto li = new LikesDto(0, id, r_no[i]);
					count[i] = lservice.likesList(li);
				}
			}
			return count;
		}
	

	
}
