package sinhanDS.first.project.product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sinhanDS.first.project.product.vo.ProductVO;

@Service
public class ProductServiceImpl implements ProductService {
	@Autowired
	private ProductMapper mapper;
	
	public int regist(ProductVO vo) {
		return mapper.regist(vo); 
	};
}
