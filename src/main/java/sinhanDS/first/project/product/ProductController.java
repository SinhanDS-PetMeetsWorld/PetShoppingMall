package sinhanDS.first.project.product;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
<<<<<<< HEAD
import org.springframework.ui.Model;
=======
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
>>>>>>> branch 'master' of https://github.com/kimcider/PetShoppingMall.git
import org.springframework.web.bind.annotation.RequestMapping;

<<<<<<< HEAD
import sinhanDS.first.project.product.VO.ProductQnAVO;
=======
import sinhanDS.first.project.product.vo.ProductVO;


>>>>>>> branch 'master' of https://github.com/kimcider/PetShoppingMall.git


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
	public String regist() {
		return "product/regist/regist_form";
	}	
	
	@PostMapping("/regist.do")
	public String regist(ProductVO vo) {
		System.out.println("여기옴");
		
		return "redirect:/";
	}
}



