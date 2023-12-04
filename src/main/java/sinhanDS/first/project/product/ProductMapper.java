package sinhanDS.first.project.product;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import sinhanDS.first.project.product.vo.OptionVO;
import sinhanDS.first.project.product.vo.ProductCategoryVO;
import sinhanDS.first.project.product.vo.ProductQnAVO;
import sinhanDS.first.project.product.vo.ProductVO;
import sinhanDS.first.project.product.vo.ReviewVO;

@Mapper
public interface ProductMapper {
	// QNA 리스트	
	List<ProductQnAVO> QNA_list (ProductQnAVO vo);
	// 리뷰 리스트
	List<ReviewVO> Review_list (ReviewVO vo);
	// 볼 수 있는 거	
	ProductQnAVO view(ProductQnAVO vo); 
	
	
	int QNA_insert(ProductQnAVO vo);
	

}
