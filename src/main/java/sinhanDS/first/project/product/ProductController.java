package sinhanDS.first.project.product;

import java.util.List;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import sinhanDS.first.project.product.vo.ProductOptionVO;
import sinhanDS.first.project.product.vo.ProductCategoryVO;
import sinhanDS.first.project.product.vo.ProductQnAVO;
import sinhanDS.first.project.product.vo.ProductVO;
import sinhanDS.first.project.product.vo.ReviewVO;
import sinhanDS.first.project.seller.vo.SellerVO;
import sinhanDS.first.project.user.VO.UserVO;



@Controller
@RequestMapping("/product")
public class ProductController {
	@Autowired
	private ProductService service;
	
	// 신정훈(11 / 29) QNA 페이지 , 리뷰 페이지 구현	
	// 신정훈(12 / 05) 상품 상세 페이지 구현
	@GetMapping("/goods.do")
	public String QNA_Review_list(Model model, HttpServletRequest request,ProductVO pvo, ProductQnAVO qnavo , ReviewVO revvo , ProductCategoryVO pcvo , ProductOptionVO povo) {
		
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
		UserVO login = (UserVO)loginsess.getAttribute("loginInfo");
		
		
		System.out.println("qnavo 체크 : " + qnavo);
		int r = service.QNA_insert(qnavo , request);
		
		if (r > 0) {
			model.addAttribute("cmd", "move");
			model.addAttribute("msg", "정상적으로 저장되었습니다.");
			model.addAttribute("url", "/user/login.do");
			System.out.println(model);
		} else {
			model.addAttribute("cmd", "back");
			model.addAttribute("msg", "등록 오류");
		}
		
		return "common/alert";
	}
	
	
	@GetMapping("/search.do")
	public String searchByCategory(HttpServletRequest request, Model model) {
		request.setAttribute("category1", request.getParameter("category1"));
		request.setAttribute("category2", request.getParameter("category2"));
		
		List<ProductVO> product_list = service.product_list();
		model.addAttribute("list", product_list);
		return "user/product/search";
	}
}



