package sinhanDS.first.project.product;

import java.util.List;

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

@Controller
@RequestMapping("/product")
public class ProductController {
	@Autowired
	private ProductService service;
	
	// 신정훈(11 / 29) QNA 페이지 , 리뷰 페이지 구현	
	@GetMapping("/goods.do")
	public String QNA_Review_list(Model model, ProductQnAVO qnavo , ReviewVO revvo) {
		List<ProductQnAVO> qna_list = service.QNA_list(qnavo);
		List<ReviewVO> review_list = service.QNA_review(revvo);
		
		model.addAttribute("qna_list",qna_list);
		model.addAttribute("review_list", review_list);
		return "product/goods/goods";
	}
	
	
	@GetMapping("/regist.do")
	public String regist(Model model) {
		ProductCategoryVO vo = new ProductCategoryVO();
		model.addAttribute("vo", vo);
		return "seller/regist/regist_form";
	}	
	
	@PostMapping("/regist.do")
	public String regist(ProductVO vo, ProductCategoryVO cvo, OptionVO ovo) {
		System.out.println("vo체크: " + vo);
		System.out.println("cvo체크: "  +cvo);
		System.out.println("ovo체크: " + ovo);
		service.regist(vo, cvo, ovo);
		
		return "redirect:/seller/index.do";
	}
}



