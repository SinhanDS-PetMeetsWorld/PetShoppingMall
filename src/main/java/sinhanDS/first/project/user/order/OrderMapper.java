package sinhanDS.first.project.user.order;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import sinhanDS.first.project.order.vo.OrderDetailOptionVO;
import sinhanDS.first.project.order.vo.OrderDetailVO;
import sinhanDS.first.project.order.vo.OrderMainVO;
import sinhanDS.first.project.product.vo.ProductOptionVO;
import sinhanDS.first.project.product.vo.ProductSearchVO;
import sinhanDS.first.project.product.vo.ProductVO;

@Mapper
public interface OrderMapper {
	public ProductVO getProduct(int cart_no);
	public ProductOptionVO getOption(int option_no);
	public int registOrderMain(OrderMainVO mvo);
	public int registOrderDetail(OrderDetailVO dvo);
	public int registOrderDetailOption(OrderDetailOptionVO ovo);
	
	public List<OrderMainVO> getOrderListNotDeleted(ProductSearchVO svo); 
	public List<OrderDetailVO> getOrderDetailList(int order_no);
	public List<OrderDetailOptionVO> getOrderDetailOptionList(int order_detail_no);
	
	public int getNumberOfPage(ProductSearchVO svo);
	
	public void updateOrderMainToDeleted(int order_no);
	public void purchaseConfirm(OrderDetailVO vo);
}
