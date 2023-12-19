package sinhanDS.first.project.seller.order;

import java.util.List;

import sinhanDS.first.project.order.vo.OrderDetailOptionVO;
import sinhanDS.first.project.order.vo.OrderDetailVO;
import sinhanDS.first.project.order.vo.OrderMainVO;

public interface SellerOrderService {
	List<OrderDetailVO> getOrderNoList(int no);
	List<List<OrderDetailVO>> getOrderDetailList(List<OrderDetailVO> vo);
	List<OrderDetailVO> getOrderDetails(int no);
	List<OrderMainVO> getOrderMainList(List<OrderDetailVO> vo);
	List<List<OrderDetailOptionVO>> getOrderDetailOptions(List<OrderDetailVO> vo);
	List<List<List<OrderDetailOptionVO>>> getOrderDetailOptionsLists(List<List<OrderDetailVO>> orderDetailList);
}
