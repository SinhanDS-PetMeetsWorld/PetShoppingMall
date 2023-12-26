package sinhanDS.first.project.seller;
import org.apache.ibatis.annotations.Mapper;

import sinhanDS.first.project.seller.vo.SellerVO;

@Mapper
public interface SellerMapper {
	SellerVO login(SellerVO vo);
	int seller_regist(SellerVO vo);
	int check_password(SellerVO vo);
	int dupId(String id);
	SellerVO detail(int no);
	int edit(SellerVO vo);
	
	int withdrawalProduct(int seller_no);
	int withdrawal(int seller_no);
	
	SellerVO findId(SellerVO vo);
	int findPwd(SellerVO vo);
}
