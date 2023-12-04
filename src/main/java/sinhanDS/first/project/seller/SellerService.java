package sinhanDS.first.project.seller;

import sinhanDS.first.project.product.vo.OptionVO;
import sinhanDS.first.project.product.vo.ProductCategoryVO;
import sinhanDS.first.project.product.vo.ProductVO;
import sinhanDS.first.project.seller.vo.SellerVO;

public interface SellerService {
	public SellerVO login(SellerVO vo);
	
	public int regist(ProductVO vo, ProductCategoryVO cvo, OptionVO ovo);

}
