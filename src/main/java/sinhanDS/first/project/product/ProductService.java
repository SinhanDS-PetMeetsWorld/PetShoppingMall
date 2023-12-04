package sinhanDS.first.project.product;

import java.util.List;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;


import sinhanDS.first.project.product.vo.OptionVO;
import sinhanDS.first.project.product.vo.ProductCategoryVO;
import sinhanDS.first.project.product.vo.ProductQnAVO;
import sinhanDS.first.project.product.vo.ProductVO;
import sinhanDS.first.project.product.vo.ReviewVO;
import sinhanDS.first.project.user.VO.UserVO;

public interface ProductService {

	List<ProductQnAVO> QNA_list(ProductQnAVO vo);
	

	public int QNA_insert(ProductQnAVO qnavo , HttpServletRequest request);
	
	List<ReviewVO> Review_list (ReviewVO vo);
	
	public int regist(ProductVO vo);

	
	public int regist(ProductVO vo, ProductCategoryVO cvo, OptionVO ovo);

}
