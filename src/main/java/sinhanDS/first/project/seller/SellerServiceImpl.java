package sinhanDS.first.project.seller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sinhanDS.first.project.product.vo.OptionVO;
import sinhanDS.first.project.product.vo.ProductCategoryVO;
import sinhanDS.first.project.product.vo.ProductVO;
import sinhanDS.first.project.seller.vo.SellerVO;

@Service
public class SellerServiceImpl implements SellerService {
	@Autowired
	SellerMapper mapper;
	
	@Override
	public SellerVO login(SellerVO vo) {
		return mapper.login(vo);
	}

	public int regist(ProductVO vo, ProductCategoryVO cvo, OptionVO ovo) {
		int result = mapper.regist(vo);
		for(int i = 0; i < cvo.getCategory1_list().length; i++) {
			ProductCategoryVO ncvo = new ProductCategoryVO();
			ncvo.setProduct_no(vo.getNo());
			ncvo.setCategory1(cvo.getCategory1_list()[i]);
			ncvo.setCategory2(cvo.getCategory2_list()[i]);
			mapper.regist_category(ncvo);
		}
		
		if(ovo.getTitle_list() != null) {
			for(int i = 0; i < ovo.getTitle_list().length; i++) {
				OptionVO novo = new OptionVO();
				novo.setProduct_no(vo.getNo());
				novo.setTitle(ovo.getTitle_list()[i]);
				novo.setContent(ovo.getContent_list()[i]);
				novo.setPrice(ovo.getPrice_list()[i]);
				System.out.println("novo체크: " + novo);
				mapper.regist_option(novo);
			}
		}
		return result; 
	}
}
