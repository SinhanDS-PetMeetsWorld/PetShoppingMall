package sinhanDS.first.project.user.product;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;
import sinhanDS.first.project.product.vo.ProductCategoryVO;
import sinhanDS.first.project.product.vo.ProductOptionVO;
import sinhanDS.first.project.product.vo.ProductQnAVO;
import sinhanDS.first.project.product.vo.ProductSearchVO;
import sinhanDS.first.project.product.vo.ProductVO;
import sinhanDS.first.project.product.vo.ReviewVO;
import sinhanDS.first.project.user.vo.CartOptionVO;
import sinhanDS.first.project.user.vo.CartVO;
import sinhanDS.first.project.user.vo.SaveBoxVO;
import sinhanDS.first.project.user.vo.UserVO;



@Controller
@RequestMapping("/user/product")
@Slf4j
public class ProductController {
	@Autowired
	private ProductService service;
	
	// 신정훈 (11 / 29) QNA 페이지 , 리뷰 페이지 구현	
	// 신정훈 (12 / 05) 상품 상세 페이지 구현
	// 신정훈 (12 / 16) 상품 찜 기능 구현
 	@GetMapping("/goods.do")
	public String QNA_Review_list(Model model, UserVO uvo, HttpServletRequest request, ProductVO pvo, ProductQnAVO qnavo 
			, ReviewVO revvo , ProductCategoryVO pcvo ,ProductOptionVO povo, SaveBoxVO savo) {
		HttpSession loginsess = request.getSession();
		UserVO login = (UserVO)loginsess.getAttribute("userLoginInfo");
		String product_no = request.getParameter("no");
		
		if (login != null) {
		
		/*	 (신정훈) 12 - 16 찜박스 구현 
		 * 로그인 필요 여부에 따라서 적용*/
		 
			int user_no = login.getNo();
			
			
			savo.setUser_no(user_no);
			savo.setProduct_no(Integer.valueOf(product_no));
			
			List<SaveBoxVO> zzim_check = service.zzim_check(savo);
			
			model.addAttribute("zzim_check" , zzim_check);
			
		}
		List<ProductVO> product_more = service.Product_more(pvo);
		List<ProductCategoryVO> product_more_category = service.Product_more_category(pcvo);
		List<ProductOptionVO> product_more_option = service.Product_more_option(povo);
		ProductCategoryVO catekor = new ProductCategoryVO();
		
		model.addAttribute("product_more_option", product_more_option);
		model.addAttribute("catekor" , catekor);
		model.addAttribute("product_more_category" , product_more_category);
		model.addAttribute("product_more" , product_more);
		model.addAttribute("product_no" , product_no);
		
		return "user/product/goods/goods";
	}
 	@GetMapping("getReview.do")
 	public String getReview(Model model, ProductVO pvo, ProductSearchVO svo) {
		svo.setNumberOfProductInPage(svo.getNumberInPage_review());
		svo.setProduct_no(pvo.getNo());
		log.debug("review_svo: " + svo);
		List<ReviewVO> list = service.Review_list(svo);
		log.debug("review_list: " + list);
		int count = service.getNumberOfReviewPage(pvo.getNo());
		int totalPage = count / svo.getNumberOfProductInPage();
		if(count % svo.getNumberOfProductInPage() > 0) totalPage++;
		Map<String, Object> map = new HashMap<>();
		map.put("count", count);
		map.put("totalPage", totalPage);
		
		int endPage = (int)(Math.ceil(svo.getPage()/(float)svo.getNumberOfPageInIndexList()) * svo.getNumberOfPageInIndexList());
		int startPage = endPage - (svo.getNumberOfPageInIndexList() - 1);
		if( endPage > totalPage) endPage = totalPage;
		boolean prev = startPage > 1;
		boolean next = endPage < totalPage;
		map.put("endPage", endPage);
		map.put("startPage", startPage);
		map.put("prev", prev);
		map.put("next", next);
        
        model.addAttribute("reviewPaging", map);
        model.addAttribute("review_svo", svo);
        model.addAttribute("review_list", list);
        
        return "/user/product/goods/reviewList";
 	}
 	
 	@GetMapping("getQnA.do")
 	public String getQnA(Model model, ProductVO pvo, ProductSearchVO svo) {
 		svo.setNumberOfProductInPage(svo.getNumberInPage_qna());
		svo.setProduct_no(pvo.getNo());
		log.debug("svo: " + svo);
		List<ProductQnAVO> list = service.getQna_list(svo);
		log.debug("list: " + list);
		int count = service.getNumberOfQnA(pvo.getNo());
		int totalPage = count / svo.getNumberOfProductInPage();
		if(count % svo.getNumberOfProductInPage() > 0) totalPage++;
		Map<String, Object> map = new HashMap<>();
		map.put("count", count);
		map.put("totalPage", totalPage);
		
		int endPage = (int)(Math.ceil(svo.getPage()/(float)svo.getNumberOfPageInIndexList()) * svo.getNumberOfPageInIndexList());
		int startPage = endPage - (svo.getNumberOfPageInIndexList() - 1);
		if( endPage > totalPage) endPage = totalPage;
		boolean prev = startPage > 1;
		boolean next = endPage < totalPage;
		map.put("endPage", endPage);
		map.put("startPage", startPage);
		map.put("prev", prev);
		map.put("next", next);
        
        model.addAttribute("qnaPaging", map);
        model.addAttribute("qna_svo", svo);
        model.addAttribute("qna_list", list);
        
        return "/user/product/goods/QnAList";
 	}
 	
 	
	@PostMapping("/zziminsert.do")
	public String zzim_insert(Model model, HttpServletRequest request, SaveBoxVO savo) {
		
		// 멤버 번호
		HttpSession loginsess = request.getSession();
		UserVO login = (UserVO)loginsess.getAttribute("userLoginInfo");
		
	/*  (신정훈) 12 - 16 찜박스 구현
	 *  int zzim_no = service.zzim_insert(savo);
	*/	
		int r = service.zzim_insert(savo);
		
		
		return "user/product/goods/goods";

	}
	
	@PostMapping("/zzimcancel.do")
	public String zzim_cancel(Model model, HttpServletRequest request, SaveBoxVO savo) {
		
		// 멤버 번호
		HttpSession loginsess = request.getSession();
		UserVO login = (UserVO)loginsess.getAttribute("userLoginInfo");
		
	/*  (신정훈) 12 - 16 찜박스 구현
	 *  int zzim_cancelNo = service.zzim_cancel(savo);
	*/	
		
		int r = service.zzim_cancel(savo);
		

		return "user/product/goods/goods";
	}
 	
 	
 	
 	
	
	// 신정훈 (12 / 03) QNA 작성 페이지 구현
	// write페이지에서 등록 페이지를 누르면 insert 메소드가 동작하면서 DB에 insert 
	@GetMapping("/qnawrite.do")
	public String QNA_write(Model model , HttpServletRequest request , ProductVO pvo) {
				
		int no = pvo.getNo() ;	
		
		int seller_no = service.Seller_no(Integer.valueOf(no));
		pvo.setSeller_no(seller_no);
		
		model.addAttribute("product_no", no);
		model.addAttribute("seller_no" , seller_no);
		
		return "user/product/goods/qnawrite";
	}
	

	@PostMapping("/qnainsert.do")
	public String QNA_insert(Model model, HttpServletRequest request, ProductQnAVO qnavo) {
		
		// 멤버 번호
		HttpSession loginsess = request.getSession();
		UserVO login = (UserVO)loginsess.getAttribute("userLoginInfo");
		
		int r = service.QNA_insert(qnavo , request);
		
		if (r == 1) { // 정상적으로 DB에 insert 
			model.addAttribute("cmd", "finish");
			model.addAttribute("msg", "문의사항이 등록되었습니다.");
		} else { // 등록 안됨
			model.addAttribute("cmd", "back");
			model.addAttribute("msg", "오류가 발생했습니다. 나중에 다시 등록해주십시오 ");
		}
		return "user/edit/alert";
		
	}
	
	
	@GetMapping("/list.do")
	public String searchByCategory(HttpServletRequest request, Model model, ProductSearchVO svo) {
		if(svo.getNumberOfProductInPage() == 5) svo.setNumberOfProductInPage(svo.getNumberInPage_search());
		//svo.setNumberOfProductInPage(svo.getNumberInPage_search());
		log.debug("svo: " + svo);
		int count = service.getNumberOfProduct(svo);
		log.debug("count: " + count);
		int totalPage = count / svo.getNumberOfProductInPage();
        if (count % svo.getNumberOfProductInPage() > 0) totalPage++;
        Map<String, Object> map = new HashMap<>();
        map.put("count", count);
        map.put("totalPage", totalPage);
        
        int endPage = (int)(Math.ceil(svo.getPage()/(float)svo.getNumberOfPageInIndexList())*svo.getNumberOfPageInIndexList());
        log.debug("endPage: " + endPage);
        int startPage = endPage - (svo.getNumberOfPageInIndexList() - 1);
        if(endPage > totalPage) endPage = totalPage;
        boolean prev = startPage > 1;
        boolean next = endPage < totalPage;
        map.put("endPage", endPage);
        map.put("startPage", startPage);
        map.put("prev", prev);
        map.put("next", next);
        
        model.addAttribute("paging", map);
        
        
		request.setAttribute("category1", request.getParameter("category1"));
		request.setAttribute("category2", request.getParameter("category2"));
		
		ProductCategoryVO catekor = new ProductCategoryVO();
		model.addAttribute("catekor" , catekor);
		
		List<ProductVO> product_list = service.product_list(svo);
		
		model.addAttribute("ProductSearchVO", svo);
		model.addAttribute("list", product_list);
		return "user/product/search";
	}
	
	@GetMapping("/search.do")
	public String searchByWord(HttpServletRequest request, Model model) {
		ProductCategoryVO catekor = new ProductCategoryVO();
		model.addAttribute("catekor" , catekor);
		
		ProductSearchVO searchvo = new ProductSearchVO();
		for(int i=0; i<3; i++) {
			searchvo.setCategory1(i);
			searchvo.setTotalSearchWord(request.getParameter("totalSearchWord"));
			
			List<ProductVO> product_list = service.total_product_search(searchvo);
			int product_count = service.total_product_searchcount(searchvo);
			
			model.addAttribute("ProductSearchVO", searchvo);
			model.addAttribute("list"+i, product_list);
			model.addAttribute("product_count"+i, product_count);
		}
		return "user/product/total_search";
	}
	
	@ResponseBody
	@PostMapping("/addcart.do")
	public String cart_insert(Model model, HttpServletRequest request, 
			@RequestParam(value="option_no",required=false) List<String> optionno_list,
			CartVO cartvo, CartOptionVO cartoptionvo) {
		boolean suc = optionno_list != null ? false : true;
		int cart_no = service.cart_insert(cartvo);
		if(optionno_list != null) {
			cartoptionvo.setCart_no(cartvo.getNo());

			if(cart_no>0) {
				for(int i=0; i<optionno_list.size(); i++){
					cartoptionvo.setOption_no(Integer.parseInt(optionno_list.get(i)));
					suc = service.cart_option_insert(cartoptionvo);
				}
			}
		}
		return String.valueOf(suc);
	}
}



