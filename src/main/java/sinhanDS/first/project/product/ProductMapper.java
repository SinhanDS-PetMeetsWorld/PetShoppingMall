package sinhanDS.first.project.product;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import sinhanDS.first.project.product.vo.ProductQnAVO;
import sinhanDS.first.project.product.vo.ReviewVO;

@Mapper
public interface ProductMapper {

	// QNA 리스트	
	List<ProductQnAVO> QNA_list (ProductQnAVO vo);
	
	// 리뷰 리스트
	List<ReviewVO> QNA_review (ReviewVO vo);
}
