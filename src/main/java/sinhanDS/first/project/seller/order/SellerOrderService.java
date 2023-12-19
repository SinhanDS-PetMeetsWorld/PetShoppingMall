package sinhanDS.first.project.seller.order;

import java.util.List;
import java.util.Map;

import sinhanDS.first.project.delivery.vo.DeliveryVO;
import sinhanDS.first.project.order.vo.OrderDetailOptionVO;
import sinhanDS.first.project.order.vo.OrderDetailVO;
import sinhanDS.first.project.order.vo.OrderMainVO;

public interface SellerOrderService {
	List<OrderDetailVO> getOrderNoList(int no);
	List<List<OrderDetailVO>> getOrderDetailList(List<OrderDetailVO> vo);
	List<OrderDetailVO> getOrderDetails(int no);
	public List<OrderDetailVO> getOrderDetails2(Map map);
	List<OrderMainVO> getOrderMainList(List<OrderDetailVO> vo);
	List<List<OrderDetailOptionVO>> getOrderDetailOptions(List<OrderDetailVO> vo);
	public boolean regist_delivery(DeliveryVO vo);
}
