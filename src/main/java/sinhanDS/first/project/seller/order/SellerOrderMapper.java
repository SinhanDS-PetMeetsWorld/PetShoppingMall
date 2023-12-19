package sinhanDS.first.project.seller.order;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import sinhanDS.first.project.delivery.vo.DeliveryVO;
import sinhanDS.first.project.order.vo.OrderDetailOptionVO;
import sinhanDS.first.project.order.vo.OrderDetailVO;
import sinhanDS.first.project.order.vo.OrderMainVO;

@Mapper
public interface SellerOrderMapper {
	List<OrderDetailVO> getOrderNoList(int no);
	List<OrderDetailVO> getOrderDetails(int no);
	List<OrderDetailVO> getOrderDetails2(Map map);
	
	OrderMainVO getOrderMainList(int no);
	List<OrderDetailOptionVO> getOrderDetailOptionList(int no);
	
	int delivery_regist(DeliveryVO vo);
	int update_deliveryNo(OrderDetailVO vo);
}
