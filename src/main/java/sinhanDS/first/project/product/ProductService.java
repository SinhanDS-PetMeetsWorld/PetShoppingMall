package sinhanDS.first.project.product;

import java.util.List;

import sinhanDS.first.project.product.vo.ProductCategoryVO;
import sinhanDS.first.project.product.vo.ProductQnAVO;
import sinhanDS.first.project.product.vo.ProductVO;
import sinhanDS.first.project.product.vo.ReviewVO;

public interface ProductService {

	List<ProductQnAVO> QNA_list(ProductQnAVO vo);
	
	List<ReviewVO> QNA_review (ReviewVO vo);
	public int regist(ProductVO vo, ProductCategoryVO cvo);
}
