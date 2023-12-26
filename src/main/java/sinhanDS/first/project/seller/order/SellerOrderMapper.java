package sinhanDS.first.project.seller.order;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import sinhanDS.first.project.admin.vo.SettlementVO;
import sinhanDS.first.project.delivery.vo.DeliveryVO;
import sinhanDS.first.project.order.vo.OrderDetailOptionVO;
import sinhanDS.first.project.order.vo.OrderDetailVO;
import sinhanDS.first.project.order.vo.OrderMainVO;
import sinhanDS.first.project.product.vo.ProductSearchVO;

@Mapper
public interface SellerOrderMapper {
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
	
	OrderMainVO getOrderMainList(int no);
	List<OrderDetailOptionVO> getOrderDetailOptionList(int no);
	
	int delivery_regist(DeliveryVO vo);
	int update_deliveryNo(OrderDetailVO vo);
	
	DeliveryVO getDeliveryVO(int no);
	
	int cancleOrder_seller(int no);
	
	List<OrderDetailVO> settlement_list(int no);
	Integer settlement_list_count(int no);
	Integer settlement_price(int no);
	Integer unsettlement_price(int no);
	
	List<OrderDetailVO> settlement_search_list(Map map);
	Integer settlement_search_price(Map map);
	
	int settlement_regist(SettlementVO stvo);
	int settlementNo_update(Map map);
	
	int refoundAccept_seller(int no);
	int getNumberOfRefoundEndListPage(ProductSearchVO svo);
	List<OrderDetailVO> getOrderNoList_rfendBySearchVO(ProductSearchVO svo);
}
