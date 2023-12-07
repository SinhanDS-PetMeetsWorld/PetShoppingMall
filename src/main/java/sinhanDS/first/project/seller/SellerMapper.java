package sinhanDS.first.project.seller;
import org.apache.ibatis.annotations.Mapper;

import sinhanDS.first.project.seller.vo.SellerVO;

@Mapper
public interface SellerMapper {
	SellerVO login(SellerVO vo);
	
	int seller_regist(SellerVO vo);
	int check_password(SellerVO vo);
	int dupId(String id);
}
