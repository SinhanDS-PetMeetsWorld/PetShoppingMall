package sinhanDS.first.project.user.product;

import java.util.List;

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

import sinhanDS.first.project.product.vo.ProductCategoryVO;
import sinhanDS.first.project.product.vo.ProductOptionVO;
import sinhanDS.first.project.product.vo.ProductQnAVO;
import sinhanDS.first.project.product.vo.ProductSearchVO;
import sinhanDS.first.project.product.vo.ProductVO;
import sinhanDS.first.project.product.vo.ReviewVO;
import sinhanDS.first.project.user.vo.CartOptionVO;
import sinhanDS.first.project.user.vo.CartVO;
import sinhanDS.first.project.user.vo.UserVO;



@Controller
@RequestMapping("/user/product")
public class ProductController {
	@Autowired
	private ProductService service;
	
	// 신정훈(11 / 29) QNA 페이지 , 리뷰 페이지 구현	
	// 신정훈(12 / 05) 상품 상세 페이지 구현
	@GetMapping("/goods.do")
	public String QNA_Review_list(Model model, HttpServletRequest request, ProductVO pvo, ProductQnAVO qnavo , ReviewVO revvo , ProductCategoryVO pcvo , ProductOptionVO povo) {
		
		// 멤버 번호
		HttpSession loginsess = request.getSession();
		UserVO login = (UserVO)loginsess.getAttribute("userLoginInfo");
		
		List<ProductVO> product_more = service.Product_more(pvo);
		List<ProductQnAVO> qna_list = service.QNA_list(qnavo);
		List<ReviewVO> review_list = service.Review_list(revvo);
		List<ProductCategoryVO> product_more_category = service.Product_more_category(pcvo);
		List<ProductOptionVO> product_more_option = service.Product_more_option(povo);
		ProductCategoryVO catekor = new ProductCategoryVO();
		
		String product_no = request.getParameter("no");
		pvo.setNo(Integer.valueOf(product_no));
		
		model.addAttribute("product_more_option", product_more_option);
		model.addAttribute("catekor" , catekor);
		model.addAttribute("product_more_category" , product_more_category);
		model.addAttribute("product_more" , product_more);
		model.addAttribute("qna_list", qna_list);
		model.addAttribute("review_list", review_list);
		model.addAttribute("product_no" , product_no);
		
				
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



