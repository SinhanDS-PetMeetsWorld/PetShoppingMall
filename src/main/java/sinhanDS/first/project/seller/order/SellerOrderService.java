package sinhanDS.first.project.seller.order;

import java.util.List;
import java.util.Map;

import sinhanDS.first.project.delivery.vo.DeliveryVO;
import sinhanDS.first.project.order.vo.OrderDetailOptionVO;
import sinhanDS.first.project.order.vo.OrderDetailVO;
import sinhanDS.first.project.order.vo.OrderMainVO;

public interface SellerOrderService {
	List<OrderDetailVO> getOrderNoList(int no);
	List<OrderDetailVO> getOrderDetails(int no);
	List<OrderDetailVO> getOrderDetails2(Map map);
	
	List<List<OrderDetailVO>> getOrderDetailList(List<OrderDetailVO> vo);
	List<OrderMainVO> getOrderMainList(List<OrderDetailVO> vo);
	List<List<OrderDetailOptionVO>> getOrderDetailOptions(List<OrderDetailVO> vo);
	
	boolean regist_delivery(DeliveryVO vo);
	List<DeliveryVO> getDeliveryList(List<List<OrderDetailVO>> vo);
}
