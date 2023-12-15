package sinhanDS.first.project.user.order;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import sinhanDS.first.project.order.vo.OrderDetailOptionVO;
import sinhanDS.first.project.order.vo.OrderDetailVO;
import sinhanDS.first.project.order.vo.OrderMainVO;
import sinhanDS.first.project.product.vo.ProductOptionVO;
import sinhanDS.first.project.product.vo.ProductVO;

@Mapper
public interface OrderMapper {
	ProductVO getProduct(int cart_no);
	ProductOptionVO getOption(int option_no);
	int registOrderMain(OrderMainVO mvo);
	int registOrderDetail(OrderDetailVO dvo);
	int registOrderDetailOption(OrderDetailOptionVO ovo);
	
	List<OrderMainVO> getOrderListNotDeleted(int user_no); 
	List<OrderMainVO> getOrderDetailList();
}
