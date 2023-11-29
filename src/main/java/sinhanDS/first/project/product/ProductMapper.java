package sinhanDS.first.project.product;
import org.apache.ibatis.annotations.Mapper;

import sinhanDS.first.project.product.vo.ProductQnAVO;
import sinhanDS.first.project.product.vo.ProductVO;

@Mapper
public interface ProductMapper {

	// 볼 수 있는 거	
	ProductQnAVO view(ProductQnAVO vo); 
	int regist(ProductVO vo);
}
