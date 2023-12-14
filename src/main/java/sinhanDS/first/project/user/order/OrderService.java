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
	
}
