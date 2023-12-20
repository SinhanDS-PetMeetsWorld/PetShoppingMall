package sinhanDS.first.project.admin;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sinhanDS.first.project.order.vo.OrderDetailVO;
import sinhanDS.first.project.order.vo.OrderMainVO;
import sinhanDS.first.project.product.vo.ProductSearchVO;
import sinhanDS.first.project.product.vo.ProductVO;
import sinhanDS.first.project.seller.vo.SellerVO;
import sinhanDS.first.project.user.vo.UserVO;

@Service
public class AdminServiceImpl implements AdminService {
	@Autowired
	AdminMapper mapper;
	
	@Override
	public List<UserVO> getUserList(ProductSearchVO svo){
		return mapper.getUserList(svo);
	}
	
	@Override
	public List<SellerVO> getSellerList(ProductSearchVO svo){
		return mapper.getSellerList(svo);
	}
	
	@Override
	public List<ProductVO> getProductList(ProductSearchVO svo){
		return mapper.getProductList(svo);
	}
	
	@Override
	public List<OrderMainVO> getOrderMainList(ProductSearchVO svo){
		return mapper.getOrderMainList(svo);
	}
	
	@Override
	public List<OrderDetailVO> getOrderDetailList(ProductSearchVO svo){
		return mapper.getOrderDetailList(svo);
	}
	
	@Override
	public List<OrderDetailVO> getCancleAndRefound(ProductSearchVO svo){
		return mapper.getCancleAndRefound(svo);
	}
	
	@Override
	public int getNumberOfUser() {
		return mapper.getNumberOfUser();
	}
	
	@Override
	public int getNumberOfSeller() {
		return mapper.getNumberOfSeller();
	}
	
	@Override
	public int getNumberOfProduct() {
		return mapper.getNumberOfProduct();
	}
	
	@Override
	public int getNumberOfOrderMain() {
		return mapper.getNumberOfOrderMain();
	}
	
	@Override
	public int getNumberOfOrderDetail() {
		return mapper.getNumberOfOrderDetail();
	}
	
	@Override
	public int getNumberOfCancleAndRefound() {
		return mapper.getNumberOfCancleAndRefound();
	}
}
