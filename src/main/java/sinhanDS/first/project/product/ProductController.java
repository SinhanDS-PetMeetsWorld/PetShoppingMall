package sinhanDS.first.project.product;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import sinhanDS.first.project.product.VO.ProductQnAVO;


@Controller
@RequestMapping("/product")
public class ProductController {
	@Autowired
	private ProductService service;
	

	// 신정훈(11 / 29) QNA 페이지 구현	
	public String view(Model model, ProductQnAVO vo) {
		
		
		return null;
		
	}
	
}



