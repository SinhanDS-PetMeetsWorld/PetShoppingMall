package sinhanDS.first.project.user.order;

import java.util.List;

import sinhanDS.first.project.order.vo.OrderDetailOptionVO;
import sinhanDS.first.project.order.vo.OrderDetailVO;
import sinhanDS.first.project.order.vo.OrderMainVO;
import sinhanDS.first.project.product.vo.ProductOptionVO;
import sinhanDS.first.project.product.vo.ProductVO;

public interface OrderService {
	public List<ProductVO> getProductListByProductNoList(int[] product_list);
	public List<ProductVO> getProductListByCartNoList(int[] cno_list);
	public List<ProductOptionVO> getOptionList(int[] option_no_list);
	
	public OrderMainVO setOrderName(OrderMainVO mvo, String name, int length);
	
	public void registOrderMain(OrderMainVO mvo);
	public void registOrderDetail(List<OrderDetailVO> detail_list);
	public void registOrderDetailOption(List<ProductOptionVO> option_list, List<OrderDetailVO> detail_list, int[]cart_no, int[] option_cart_no);
	public List<OrderDetailVO> getOrderDetailList(OrderMainVO mvo, List<ProductVO> p_list, int[] quantity);
	
	
	public List<OrderMainVO> getOrderListNotDeleted(int user_no);
}
