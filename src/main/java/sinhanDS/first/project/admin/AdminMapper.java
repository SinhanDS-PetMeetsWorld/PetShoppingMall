package sinhanDS.first.project.admin;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import sinhanDS.first.project.order.vo.OrderDetailVO;
import sinhanDS.first.project.order.vo.OrderMainVO;
import sinhanDS.first.project.product.vo.ProductSearchVO;
import sinhanDS.first.project.product.vo.ProductVO;
import sinhanDS.first.project.seller.vo.SellerVO;
import sinhanDS.first.project.user.vo.UserVO;

@Mapper
public interface AdminMapper {
	public List<UserVO> getUserList(ProductSearchVO svo);
	public List<SellerVO> getSellerList(ProductSearchVO svo);
	public List<ProductVO> getProductList(ProductSearchVO svo);
	public List<OrderMainVO> getOrderMainList(ProductSearchVO svo);
	public List<OrderDetailVO> getOrderDetailList(ProductSearchVO svo);
	public List<OrderDetailVO> getCancleAndRefound(ProductSearchVO svo);
	
	public int getNumberOfUser();
	public int getNumberOfSeller();
	public int getNumberOfProduct();
	public int getNumberOfOrderMain();
	public int getNumberOfOrderDetail();
	public int getNumberOfCancleAndRefound();
}
