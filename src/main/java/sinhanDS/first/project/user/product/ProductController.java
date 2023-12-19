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
			System.out.println("생명의 전화 번호 : " + user_no);
			
			
			savo.setUser_no(user_no);
			savo.setProduct_no(Integer.valueOf(product_no));
			System.out.println("원피스 사보의 모험 : " + savo );
			
			List<SaveBoxVO> zzim_list = service.zzim_list(savo);
			
			System.out.println("찜 리스트 나오냐?? "+ zzim_list);
			model.addAttribute("zzim_list" , zzim_list);
			
		}
		List<ProductVO> product_more = service.Product_more(pvo);
		
		/* review paging 처리 */
		
		ProductSearchVO review_svo = new ProductSearchVO();
		review_svo.setNumberOfProductInPage(1);
		review_svo.setProduct_no(pvo.getNo());
		List<ReviewVO> review_list = service.Review_list(review_svo);
		log.debug("review_list: " + review_list);
		int reviewCount = service.getNumberOfReviewPage(pvo.getNo());
		int reviewTotalPage = reviewCount / review_svo.getNumberOfProductInPage();
		if(reviewCount % review_svo.getNumberOfProductInPage() > 0) reviewTotalPage++;
		Map<String, Object> reviewMap = new HashMap<>();
		reviewMap.put("count", reviewCount);
		reviewMap.put("totalPage", reviewTotalPage);
		
		int review_endPage = (int)(Math.ceil(review_svo.getPage()/(float)review_svo.getNumberOfPageInIndexList()) * review_svo.getNumberOfPageInIndexList());
		int review_startPage = review_endPage - (review_svo.getNumberOfPageInIndexList() - 1);
		if( review_endPage > reviewTotalPage) review_endPage = reviewTotalPage;
		boolean review_prev = review_startPage > 1;
		boolean review_next = review_endPage < reviewTotalPage;
		reviewMap.put("endPage", review_endPage);
		reviewMap.put("startPage", review_startPage);
		reviewMap.put("prev", review_prev);
		reviewMap.put("next", review_next);
        
		log.debug("reviewPaging: " + reviewMap);
        model.addAttribute("reviewPaging", reviewMap);
        model.addAttribute("review_svo", review_svo);
		
		
		
		List<ProductQnAVO> qna_list = service.QNA_list(qnavo);
		
		
		
		
		
		List<ProductCategoryVO> product_more_category = service.Product_more_category(pcvo);
		List<ProductOptionVO> product_more_option = service.Product_more_option(povo);
		ProductCategoryVO catekor = new ProductCategoryVO();
		
		model.addAttribute("product_more_option", product_more_option);
		model.addAttribute("catekor" , catekor);
		model.addAttribute("product_more_category" , product_more_category);
		model.addAttribute("product_more" , product_more);
		model.addAttribute("qna_list", qna_list);
		model.addAttribute("review_list", review_list);
		model.addAttribute("product_no" , product_no);
		
		return "user/product/goods/goods";
	}
 	
 	@GetMapping("getReview.do")
 	public String getReview() {
 		
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
		
		System.out.println("savo 체크 : " + savo);
		
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
		
		System.out.println("savo 체크 : " + savo);

		return "user/product/goods/goods";
	}
 	
 	
 	
 	
	
	// 신정훈 (12 / 03) QNA 작성 페이지 구현
	// write페이지에서 등록 페이지를 누르면 insert 메소드가 동작하면서 DB에 insert 
	@GetMapping("/qnawrite.do")
	public String QNA_write(Model model , HttpServletRequest request , ProductVO pvo) {
				
		int no = pvo.getNo() ;	
		
		System.out.println("제품 번호 찍히나??" + no);
		System.out.println("product_no 체크: " + request.getParameter("no"));
		
		int seller_no = service.Seller_no(Integer.valueOf(no));
		System.out.println("qna_search_seller 체크: " + seller_no);
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
		
		System.out.println("qnavo 체크 : " + qnavo);
		int r = service.QNA_insert(qnavo , request);
		System.out.println("r값 확인 :" +  r);
		
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
	public String searchByCategory(HttpServletRequest request, Model model, ProductSearchVO searchvo) {
		request.setAttribute("category1", request.getParameter("category1"));
		request.setAttribute("category2", request.getParameter("category2"));
		
		ProductCategoryVO catekor = new ProductCategoryVO();
		model.addAttribute("catekor" , catekor);
		
		List<ProductVO> product_list = service.product_list(searchvo);
		model.addAttribute("ProductSearchVO", searchvo);
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
	public String cart_insert(Model model, HttpServletRequest request, @RequestParam(value="option_no",required=true) List<String> optionno_list,
			CartVO cartvo, CartOptionVO cartoptionvo) {
		boolean suc = false;
		int cart_no = service.cart_insert(cartvo);
		cartoptionvo.setCart_no(cartvo.getNo());

		if(cart_no>0) {
			for(int i=0; i<optionno_list.size(); i++){
				cartoptionvo.setOption_no(Integer.parseInt(optionno_list.get(i)));
				suc = service.cart_option_insert(cartoptionvo);
			}
		}
		return String.valueOf(suc);
	}
}



