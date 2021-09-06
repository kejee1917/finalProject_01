package verni.co.kr.product;



import java.io.File;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import verni.co.kr.likes.LikesDto;
import verni.co.kr.likes.LikesService;
import verni.co.kr.member.MemberDto;
import verni.co.kr.review.R_ReplyDto;
import verni.co.kr.review.ReviewDto;
import verni.co.kr.review.ReviewService;
import verni.co.kr.util.ProductUtil;
import verni.co.kr.wish.WishDto;
import verni.co.kr.wish.WishService;


@Controller
public class ProductController {

	@Autowired
	ProductService service;
	@Autowired
	WishService wishService;
	@Autowired
	ReviewService rservice;
	@Autowired
	LikesService lservice;

	
	@RequestMapping(value = "productWrite.do", method = RequestMethod.GET)
	public String productWrite() {
		return "productWrite.tiles";
	}
		
	@RequestMapping(value = "productList.do", method = RequestMethod.GET)
	public String productList(Model model, HttpServletRequest request, ProductParam param) {
		
//		System.out.println(param.getP_price().toString());
		MemberDto mem =  (MemberDto)request.getSession().getAttribute("login");
		
		int start, end;
		start = 1 + 24 * param.getPageNumber();
		end = 24 + 24 * param.getPageNumber();
		// setting한 값 집어넣기.
		param.setStart(start);
		param.setEnd(end);
		
		List<ProductDto> plist = service.allProductList(param);
		
		
		int totalCount = service.getProductNum(param);
		model.addAttribute("plist", plist);
		model.addAttribute("totalCount", totalCount);
		
		
		// 현재 페이지
		model.addAttribute("pageNumber", param.getPageNumber());
		
		
		// 찜인지 아닌지 보내주기
		int[] count = wcount(mem, plist);
		model.addAttribute("count", count);

		return "productList.tiles";
	}
	
	@RequestMapping(value = "productDetail.do", method = RequestMethod.GET)
	public String productDetail(Model model, int p_no, HttpServletRequest request) {
		service.addReadCount(p_no);
		ProductDto dto = service.getProduct(p_no);
		model.addAttribute("pd", dto);
		
		
		
		MemberDto mem =  (MemberDto)request.getSession().getAttribute("login");
		int count = 0;
		if(mem != null) {
			String id = mem.getM_id();
			int no = dto.getP_no();
			WishDto ws = new WishDto(0, id, no);
			count = wishService.getWishDetail(ws);
		}
		model.addAttribute("wcount", count);
		
		
		// 리뷰
		
		List<ReviewDto> rlist = rservice.reviewList(p_no);
		model.addAttribute("rlist", rlist);
		int[] lcount = lcount(mem, rlist);
		model.addAttribute("rcount",lcount);
		
		List<Object> rScope = rservice.rScope(p_no);
		model.addAttribute("rScope",rScope);
	
		
		/////////////////// 아래 뿌려줄 상품 리스트들 ///////////////
		List<ProductDto> blist = service.getBrandList(dto);
		List<ProductDto> tlist = service.getTypeList(dto);
//		for(int i=0; i<blist.size(); i++) {
//			dto = blist.get(i);
//			System.out.println(dto.toString());
//		}
		model.addAttribute("blist", blist);
		model.addAttribute("tlist", tlist);
		
		return "productDetail.tiles";
	}
	
		
	
	
	@ResponseBody
	@RequestMapping(value = "addLike.do", method = RequestMethod.POST)
	public String addLike(int r_no, HttpServletRequest request) {
		MemberDto mem =  (MemberDto)request.getSession().getAttribute("login");
		String id = mem.getM_id();
//		System.out.println("id : " + id + " r_no : "+ r_no);
		LikesDto li = new LikesDto(0, id, r_no);
		int count = lservice.likesList(li);
//		System.out.println(count);
		int like = 0;
		if(count == 0) {
			
			lservice.likesAdd(li);
			like = rservice.getLikeCount(r_no);
			return "add"+like;
		}else {
			lservice.likesDelete(li);
			like = rservice.getLikeCount(r_no);
			return "del"+like;
		}
		
	}
	
	
	@ResponseBody
	@RequestMapping(value = "addWish.do", method = RequestMethod.POST)
	public String addWish(int p_no, HttpServletRequest request) {
		MemberDto mem =  (MemberDto)request.getSession().getAttribute("login");
		String id = mem.getM_id();
		
		WishDto ws = new WishDto(0, id, p_no);
		int count = wishService.getWishList(ws);
	//	System.out.println("count : " + count +", p_no :" + ws.getP_no());
		if(count == 0) {
			wishService.addWish(ws);
			return "add";
		}else {
			wishService.delWish(ws);
			return "del";
		}
	}
	
	
	
	
	@RequestMapping(value = "productSaleList.do", method = RequestMethod.GET)
	public String bagList(Model model, HttpServletRequest request, ProductDto pd) {
		MemberDto mem =  (MemberDto)request.getSession().getAttribute("login");
		List<ProductDto> plist = service.getProductSaleList();
		
		model.addAttribute("plist", plist);
		
		// 찜인지 아닌지 보내주기
		int[] count = wcount(mem, plist);
		model.addAttribute("count", count);
		
		
		return "productSaleList.tiles";
	}
	

	
	
	@RequestMapping(value = "hermesList.do", method = RequestMethod.GET)
	public String hermesList(Model model, HttpServletRequest request) {
		MemberDto mem =  (MemberDto)request.getSession().getAttribute("login");
		List<ProductDto> plist = service.getHermesList();
		
		model.addAttribute("plist", plist);
		
		// 찜인지 아닌지 보내주기
		int[] count = wcount(mem, plist);
		model.addAttribute("count", count);
		return "hermesList.tiles";
	}
	
	
	
	
	
	
	@RequestMapping(value="productWriteAf.do", method = RequestMethod.POST) 
	public String addProduct(
							 @RequestParam(value="thumbnailImage", required = false) MultipartFile fileload, // 파일 받는 부분
							 HttpServletRequest req,
							 ProductDto pd, MultipartHttpServletRequest mhsr, 
							 @RequestParam("detailImage") MultipartFile[] file) throws Exception { 
		
		// 썸네일 이미지
		String filename = fileload.getOriginalFilename();
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
		
		service.addProduct(pd);
		return "redirect:/product.do";
	}
	
	// 썸머노트
	@ResponseBody
	@RequestMapping(value="contentImageSend.do", method = RequestMethod.POST)
	public void contentImageSend(MultipartFile file, HttpServletRequest request, HttpServletResponse response) throws Exception {
	response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		// 업로드할 폴더 경로
		String realFolder = request.getSession().getServletContext().getRealPath("/upload/contentImage");
	
		// 업로드할 파일 이름
		String org_filename = file.getOriginalFilename();
		String str_filename = ProductUtil.getNewFileName(org_filename);
	
	//	System.out.println("원본 파일명 : " + org_filename);
	//	System.out.println("저장할 파일명 : " + str_filename);
	
		String filepath = realFolder + "\\"+ str_filename;
	//	System.out.println("파일경로 : " + filepath);
	
		File f = new File(filepath);
		if (!f.exists()) {
		f.mkdirs();
		}
		file.transferTo(f);
		out.println("upload/contentImage/"+str_filename);
		out.close();

	}
	
	
	@ResponseBody
	@RequestMapping(value = "couponAdd.do", method = RequestMethod.POST)
	public int couponAdd(HttpServletRequest request) {
		MemberDto mem =  (MemberDto)request.getSession().getAttribute("login");
		// 쿠폰 발행 여부
		int count = service.getEventCouponNum(mem.getM_id());
		if(count == 0) {
			CouponDto cp = service.getEventCoupon();
			cp.setM_id(mem.getM_id());
			System.out.println(cp.toString());
			int num =service.eventCouponAdd(cp);
			return num;
			
		}else {
			return 0;
		}
				
	}
	
		
		
		
		
		
		
		
		
	
	
	
	
	
	
	
	
	
		
	
	
	
	
	// 찜 메소드
	public int[] wcount(MemberDto mem, List<ProductDto> plist) {
		int[] count = new int[plist.size()];
		if (mem == null) {
			for (int i = 0; i < plist.size(); i++) {
				count[i] = 0;
			}
		} else if (mem != null) {
			String id = mem.getM_id();
			int[] p_no = new int[plist.size()];
			for (int i = 0; i < plist.size(); i++) {
				p_no[i] = plist.get(i).getP_no();
				WishDto ws = new WishDto(0, id, p_no[i]);
				count[i] = wishService.getWishDetail(ws);
			}
		}
		return count;
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
