package sinhanDS.first.project.product;
import org.apache.ibatis.annotations.Mapper;

import sinhanDS.first.project.product.vo.ProductQnAVO;

@Mapper
public interface ProductMapper {

	// 볼 수 있는 거	
	ProductQnAVO view(ProductQnAVO vo); 

}
