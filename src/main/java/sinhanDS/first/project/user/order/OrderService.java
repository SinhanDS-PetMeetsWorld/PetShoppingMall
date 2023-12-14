package sinhanDS.first.project.user.order;

import java.util.List;

import sinhanDS.first.project.order.vo.OrderDetailOptionVO;
import sinhanDS.first.project.order.vo.OrderDetailVO;
import sinhanDS.first.project.order.vo.OrderMainVO;
import sinhanDS.first.project.product.vo.ProductOptionVO;
import sinhanDS.first.project.product.vo.ProductVO;

public interface OrderService {
	
	
	
	public List<ProductVO> getProductList(int[] cno_list);
	public List<ProductOptionVO> getOptionList(int[] option_no_list);
	
	public OrderMainVO setOrderName(OrderMainVO mvo, OrderDetailVO dvo);
	public int registOrderMain(OrderMainVO mvo);
	public List<OrderDetailVO> getOrderDetailList(OrderMainVO mvo, OrderDetailVO dvo);
	public List<OrderDetailVO> registOrderDetail(List<OrderDetailVO> list);
	public void registOrderDetailOption(List<OrderDetailVO> order_detail_list, OrderDetailOptionVO ovo);
	
	public String checkFirstProductName(OrderDetailVO dvo);
	public int checkProductNumber(OrderDetailVO dvo);
	
	
}
