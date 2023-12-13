package sinhanDS.first.project.user.order;

import java.util.List;

import sinhanDS.first.project.order.vo.OrderDetailVO;
import sinhanDS.first.project.order.vo.OrderMainVO;
import sinhanDS.first.project.product.vo.ProductOptionVO;
import sinhanDS.first.project.product.vo.ProductVO;

public interface OrderService {
	public List<ProductVO> getProductList(int[] pno_list);
	public List<ProductOptionVO> getOptionList(int[] option_no_list);
	
	public int registOrderMain(OrderMainVO mvo);
	public String checkFirstProductName(OrderDetailVO dvo);
	public int checkProductNumber(OrderDetailVO dvo);
}
