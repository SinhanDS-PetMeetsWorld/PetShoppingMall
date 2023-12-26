package sinhanDS.first.project.seller;

import java.util.Map;

import sinhanDS.first.project.product.vo.ProductCategoryVO;
import sinhanDS.first.project.product.vo.ProductOptionVO;
import sinhanDS.first.project.product.vo.ProductVO;
import sinhanDS.first.project.seller.vo.SellerVO;
import sinhanDS.first.project.user.vo.UserVO;

public interface SellerService {
	public SellerVO login(SellerVO vo);
	int seller_regist(SellerVO vo);
	boolean check_password(SellerVO vo);
	boolean dupId(String id);
	
	SellerVO detail(SellerVO vo);
	int edit(SellerVO vo);
	

	int withdrawal(int seller_no);
}
