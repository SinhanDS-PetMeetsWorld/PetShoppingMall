package sinhanDS.first.project.admin;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import sinhanDS.first.project.product.vo.ProductSearchVO;
import sinhanDS.first.project.seller.vo.SellerVO;
import sinhanDS.first.project.user.vo.UserVO;

@Mapper
public interface AdminMapper {
	public List<UserVO> getUserList(ProductSearchVO svo);
	public List<SellerVO> getSellerList(ProductSearchVO svo);
	public int getNumberOfUser();
	public int getNumberOfSeller();
}
