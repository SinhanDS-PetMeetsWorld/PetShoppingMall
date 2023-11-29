package sinhanDS.first.project.product;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import sinhanDS.first.project.product.vo.ProductCategoryVO;
import sinhanDS.first.project.product.vo.ProductQnAVO;
import sinhanDS.first.project.product.vo.ProductVO;



@Controller
@RequestMapping("/product")
public class ProductController {
	@Autowired
	private ProductService service;
	

	// 신정훈(11 / 29) QNA 페이지 구현	
	public String view(Model model, ProductQnAVO vo) {
		
		
		return null;
		
	}
	
	@GetMapping("/regist.do")
	public String regist(Model model) {
		ProductCategoryVO vo = new ProductCategoryVO();
		model.addAttribute("vo", vo);
		return "product/regist/regist_form";
	}	
	
	@GetMapping("/regist_test.do")
	public String regist(ProductVO vo, ProductCategoryVO[] cvo) {
		System.out.println("vo체크: " + vo);
		for(int i = 0; i < cvo.length; i++) {
			System.out.println("ovo체크: " + i + " " + cvo);
		}
		service.regist(vo);
		
		return "redirect:/";
	}
}



