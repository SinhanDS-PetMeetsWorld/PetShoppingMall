package sinhanDS.first.project.product;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import sinhanDS.first.project.product.vo.OptionVO;
import sinhanDS.first.project.product.vo.ProductCategoryVO;
import sinhanDS.first.project.product.vo.ProductQnAVO;
import sinhanDS.first.project.product.vo.ProductVO;
import sinhanDS.first.project.product.vo.ReviewVO;

public interface ProductService {

	List<ProductQnAVO> QNA_list(ProductQnAVO vo);
	
	int Seller_no(int product_no);
	
	
	public int QNA_insert(ProductQnAVO qnavo , HttpServletRequest request);
	
	List<ReviewVO> Review_list (ReviewVO vo);
	

}
