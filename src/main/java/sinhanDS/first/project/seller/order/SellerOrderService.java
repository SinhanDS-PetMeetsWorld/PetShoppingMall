package sinhanDS.first.project.seller.order;

import java.util.List;
import java.util.Map;

import sinhanDS.first.project.admin.vo.SettlementVO;
import sinhanDS.first.project.delivery.vo.DeliveryVO;
import sinhanDS.first.project.order.vo.OrderDetailOptionVO;
import sinhanDS.first.project.order.vo.OrderDetailVO;
import sinhanDS.first.project.order.vo.OrderMainVO;

public interface SellerOrderService {
	List<OrderDetailVO> getOrderNoList_bd(int no);
	List<OrderDetailVO> getOrderNoList_od(int no);
	List<OrderDetailVO> getOrderNoList_ad(int no);
	List<OrderDetailVO> getOrderNoList_rf(int no);
	List<OrderDetailVO> getOrderNoList_rfend(int no);
	
	List<OrderDetailVO> getOrderDetails(int no);
	List<OrderDetailVO> getOrderDetails_bd(Map map);
	List<OrderDetailVO> getOrderDetails_od(Map map);
	List<OrderDetailVO> getOrderDetails_ad(Map map);
	List<OrderDetailVO> getOrderDetails_rf(Map map);
	List<OrderDetailVO> getOrderDetails_rfend(Map map);
	
	List<List<OrderDetailVO>> getOrderDetailList_bd(List<OrderDetailVO> vo);
	List<List<OrderDetailVO>> getOrderDetailList_od(List<OrderDetailVO> vo);
	List<List<OrderDetailVO>> getOrderDetailList_ad(List<OrderDetailVO> vo);
	List<List<OrderDetailVO>> getOrderDetailList_rf(List<OrderDetailVO> vo);
	List<List<OrderDetailVO>> getOrderDetailList_rfend(List<OrderDetailVO> vo);
	
	List<OrderMainVO> getOrderMainList(List<OrderDetailVO> vo);
//	List<List<OrderDetailOptionVO>> getOrderDetailOptions(List<OrderDetailVO> vo);
	
	boolean regist_delivery(DeliveryVO vo);
	List<DeliveryVO> getDeliveryList(List<List<OrderDetailVO>> vo);
	
	boolean cancleOrder_seller(int no);
	
	int settlement_list_count(int no);
	int settlement_price(int no);
	int unsettlement_price(int no);
	
	List<OrderDetailVO> settlement_search_list(Map map);
	int settlement_search_price(Map map);
	
	boolean settlement_get(SettlementVO stvo);
	
	boolean refoundAccept_seller(int no);
}
