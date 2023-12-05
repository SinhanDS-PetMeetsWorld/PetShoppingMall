package sinhanDS.first.project.product;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sinhanDS.first.project.product.vo.ProductOptionVO;
import sinhanDS.first.project.product.vo.ProductCategoryVO;
import sinhanDS.first.project.product.vo.ProductQnAVO;
import sinhanDS.first.project.product.vo.ProductVO;
import sinhanDS.first.project.product.vo.ReviewVO;

@Service
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	private ProductMapper mapper;

	@Override
	public List<ProductQnAVO> QNA_list(ProductQnAVO vo) {
		
		List<ProductQnAVO> qna_list = mapper.QNA_list(vo);
		
		return qna_list;
	}
	
	public int Seller_no(int vo) {
		
		int qna_search_seller = mapper.Seller_no(vo);
		
		return qna_search_seller;
	}
	
	
	@Override
	public int QNA_insert(ProductQnAVO qnavo , HttpServletRequest request) {
		
		int r = mapper.QNA_insert(qnavo);
		
		return r;	
		    
	}

	@Override
	public List<ReviewVO> Review_list(ReviewVO vo) {
		
		List<ReviewVO> review_list = mapper.Review_list(vo);
		return review_list;
	}

	




	

}
