package sinhanDS.first.project.product;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import sinhanDS.first.project.product.vo.OptionVO;
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
	@GetMapping("/goods.do")
	public String QNA_Review_list(Model model, ProductQnAVO qnavo , ReviewVO revvo) {
		List<ProductQnAVO> qna_list = service.QNA_list(qnavo);
		List<ReviewVO> review_list = service.Review_list(revvo);
		
		model.addAttribute("qna_list",qna_list);
		model.addAttribute("review_list", review_list);
		return "user/product/goods/goods";
	}
	
	// 신정훈 (12 / 03) QNA 작성 페이지 구현
	// write페이지에서 등록 페이지를 누르면 insert 메소드가 동작하면서 DB에 insert 
	@GetMapping("/qnawrite.do")
	public String QNA_write(Model model , HttpServletRequest request) {

		System.out.println("product_no체크: " + request.getParameter("product_no"));
		
		return "user/product/goods/qnawrite";
	}
	
	@PostMapping("/qnainsert.do")
	public String QNA_insert(Model model, HttpServletRequest request, ProductQnAVO qnavo) {
		
		HttpSession loginsess = request.getSession();
		UserVO login = (UserVO)loginsess.getAttribute("loginInfo");
		
		HttpSession productsess = request.getSession();
		ProductVO pno = (ProductVO)productsess.getAttribute("product_no");

		HttpSession Sellersess = request.getSession();
		SellerVO selno = (SellerVO)Sellersess.getAttribute("seller");
		
		
		// 유저 넘버 , 상품 번호
		qnavo.setUser_no(login.getNo());
		// 판매자 넘버 (현재는 2로 강제 지정)
		qnavo.setSeller_no(pno.getSeller_no());
		// 물품 넘버 (현재는 4로 강제 지정)
		qnavo.setProduct_no(4);
		
		int r = service.QNA_insert(qnavo , request);
		System.out.println("데이터 들어가나?" + r);
		if (r > 0) {
			model.addAttribute("cmd", "move");
			model.addAttribute("msg", "정상적으로 저장되었습니다.");
			model.addAttribute("url", "/goods.do");
		} else {
			model.addAttribute("cmd", "back");
			model.addAttribute("msg", "등록 오류");
		}
		
		return "common/alert";
	}
	
	
	@GetMapping("/search.do")
	public String searchByCategory(HttpServletRequest request) {
		request.setAttribute("category1", request.getParameter("category1"));
		request.setAttribute("category2", request.getParameter("category2"));
		return "user/product/search";
	}
}



