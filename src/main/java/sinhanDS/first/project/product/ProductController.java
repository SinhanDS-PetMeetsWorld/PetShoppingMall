package sinhanDS.first.project.product;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import sinhanDS.first.project.product.vo.ProductVO;




@Controller
@RequestMapping("/product")
public class ProductController {
	@Autowired
	private ProductService service;
	
	@GetMapping("/regist.do")
	public String regist() {
		return "product/regist/regist_form";
	}	
	
	@PostMapping("/regist.do")
	public String regist(ProductVO vo) {
		System.out.println("여기옴");
		
		return "redirect:/";
	}
}
