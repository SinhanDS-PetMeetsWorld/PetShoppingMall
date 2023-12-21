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
	public List<OrderDetailVO> getNeedConfirmationList(){
		return mapper.getNeedConfirmationList();
	}
	
	
	
	@Override
	public int getNumberOfUser(ProductSearchVO svo) {
		return mapper.getNumberOfUser(svo);
	}
	
	@Override
	public int getNumberOfSeller(ProductSearchVO svo) {
		return mapper.getNumberOfSeller(svo);
	}
	
	@Override
	public int getNumberOfProduct(ProductSearchVO svo) {
		return mapper.getNumberOfProduct(svo);
	}
	
	@Override
	public int getNumberOfOrderMain(ProductSearchVO svo) {
		return mapper.getNumberOfOrderMain(svo);
	}
	
	@Override
	public int getNumberOfOrderDetail(ProductSearchVO svo) {
		return mapper.getNumberOfOrderDetail(svo);
	}
	
	@Override
	public int getNumberOfCancleAndRefound(ProductSearchVO svo) {
		return mapper.getNumberOfCancleAndRefound(svo);
	}
	
	
	
	@Override
	public void confirmOrderDetail(int[] no) {
		for(int i = 0; i < no.length; i++) {
			mapper.confirmOrderDetail(no[i]);
		}
	}
}
