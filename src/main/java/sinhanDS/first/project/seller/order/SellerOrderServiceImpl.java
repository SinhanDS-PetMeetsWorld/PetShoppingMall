package sinhanDS.first.project.seller.order;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sinhanDS.first.project.admin.vo.SettlementVO;
import sinhanDS.first.project.delivery.vo.DeliveryVO;
import sinhanDS.first.project.order.vo.OrderDetailOptionVO;
import sinhanDS.first.project.order.vo.OrderDetailVO;
import sinhanDS.first.project.order.vo.OrderMainVO;

@Service
public class SellerOrderServiceImpl implements SellerOrderService {
	@Autowired
	SellerOrderMapper mapper;
	
	@Override
	public List<OrderDetailVO> getOrderNoList_bd(int seller_no) {
		return mapper.getOrderNoList_bd(seller_no);
	}
	
	@Override
	public List<OrderDetailVO> getOrderNoList_od(int no) {
		return mapper.getOrderNoList_od(no);
	}

	@Override
	public List<OrderDetailVO> getOrderNoList_ad(int no) {
		return mapper.getOrderNoList_ad(no);
	}
	
	@Override
	public List<OrderDetailVO> getOrderNoList_rf(int no) {
		return mapper.getOrderNoList_rf(no);
	}
	
	@Override
	public List<OrderDetailVO> getOrderNoList_rfend(int no) {
		return mapper.getOrderNoList_rfend(no);
	}
	
	@Override
	public List<OrderDetailVO> getOrderDetails(int no) {
		return mapper.getOrderDetails(no);
	}
	
	@Override
	public List<OrderDetailVO> getOrderDetails_bd(Map map) {
		return mapper.getOrderDetails_bd(map);
	}
	
	@Override
	public List<OrderDetailVO> getOrderDetails_od(Map map) {
		return mapper.getOrderDetails_od(map);
	}

	@Override
	public List<OrderDetailVO> getOrderDetails_ad(Map map) {
		return mapper.getOrderDetails_ad(map);
	}
	
	@Override
	public List<OrderDetailVO> getOrderDetails_rf(Map map) {
		return mapper.getOrderDetails_rf(map);
	}
	
	@Override
	public List<OrderDetailVO> getOrderDetails_rfend(Map map) {
		return mapper.getOrderDetails_rfend(map);
	}
	
	@Override
	public List<List<OrderDetailVO>> getOrderDetailList_bd(List<OrderDetailVO> orderNoList) {
		List<List<OrderDetailVO>> orderDetailList = new ArrayList<>();
		Map<String, String> map = new HashMap<String, String>();
		for(int i=0; i<orderNoList.size(); i++) {
			map.put("seller_no", String.valueOf(orderNoList.get(0).getSeller_no()));
			map.put("order_no", String.valueOf(orderNoList.get(i).getOrder_no()));
			List<OrderDetailVO> orderDetailvo = mapper.getOrderDetails_bd(map);
			for(int j=0; j<orderDetailvo.size(); j++) {
				orderDetailvo.get(j).setOptions(mapper.getOrderDetailOptionList(orderDetailvo.get(j).getNo()));
			}
			orderDetailList.add(orderDetailvo);
		}
		return orderDetailList;
	}
	
	@Override
	public List<List<OrderDetailVO>> getOrderDetailList_od(List<OrderDetailVO> orderNoList) {
		List<List<OrderDetailVO>> orderDetailList = new ArrayList<>();
		Map<String, String> map = new HashMap<String, String>();
		for(int i=0; i<orderNoList.size(); i++) {
			map.put("seller_no", String.valueOf(orderNoList.get(0).getSeller_no()));
			map.put("order_no", String.valueOf(orderNoList.get(i).getOrder_no()));
			List<OrderDetailVO> orderDetailvo = mapper.getOrderDetails_od(map);
			for(int j=0; j<orderDetailvo.size(); j++) {
				orderDetailvo.get(j).setOptions(mapper.getOrderDetailOptionList(orderDetailvo.get(j).getNo()));
			}
			orderDetailList.add(orderDetailvo);
		}
		return orderDetailList;
	}
	
	@Override
	public List<List<OrderDetailVO>> getOrderDetailList_ad(List<OrderDetailVO> orderNoList) {
		List<List<OrderDetailVO>> orderDetailList = new ArrayList<>();
		Map<String, String> map = new HashMap<String, String>();
		for(int i=0; i<orderNoList.size(); i++) {
			map.put("seller_no", String.valueOf(orderNoList.get(0).getSeller_no()));
			map.put("order_no", String.valueOf(orderNoList.get(i).getOrder_no()));
			List<OrderDetailVO> orderDetailvo = mapper.getOrderDetails_ad(map);
			for(int j=0; j<orderDetailvo.size(); j++) {
				orderDetailvo.get(j).setOptions(mapper.getOrderDetailOptionList(orderDetailvo.get(j).getNo()));
			}
			orderDetailList.add(orderDetailvo);
		}
		return orderDetailList;
	}
	
	@Override
	public List<List<OrderDetailVO>> getOrderDetailList_rf(List<OrderDetailVO> orderNoList) {
		List<List<OrderDetailVO>> orderDetailList = new ArrayList<>();
		Map<String, String> map = new HashMap<String, String>();
		for(int i=0; i<orderNoList.size(); i++) {
			map.put("seller_no", String.valueOf(orderNoList.get(0).getSeller_no()));
			map.put("order_no", String.valueOf(orderNoList.get(i).getOrder_no()));
			List<OrderDetailVO> orderDetailvo = mapper.getOrderDetails_rf(map);
			for(int j=0; j<orderDetailvo.size(); j++) {
				orderDetailvo.get(j).setOptions(mapper.getOrderDetailOptionList(orderDetailvo.get(j).getNo()));
			}
			orderDetailList.add(orderDetailvo);
		}
		return orderDetailList;
	}
	
	@Override
	public List<List<OrderDetailVO>> getOrderDetailList_rfend(List<OrderDetailVO> orderNoList) {
		List<List<OrderDetailVO>> orderDetailList = new ArrayList<>();
		Map<String, String> map = new HashMap<String, String>();
		for(int i=0; i<orderNoList.size(); i++) {
			map.put("seller_no", String.valueOf(orderNoList.get(0).getSeller_no()));
			map.put("order_no", String.valueOf(orderNoList.get(i).getOrder_no()));
			List<OrderDetailVO> orderDetailvo = mapper.getOrderDetails_rfend(map);
			for(int j=0; j<orderDetailvo.size(); j++) {
				orderDetailvo.get(j).setOptions(mapper.getOrderDetailOptionList(orderDetailvo.get(j).getNo()));
			}
			orderDetailList.add(orderDetailvo);
		}
		return orderDetailList;
	}
	
	@Override
	public List<OrderMainVO> getOrderMainList(List<OrderDetailVO> orderNoList) {
		List<OrderMainVO> orderMainList = new ArrayList<>();
		for(int i=0; i<orderNoList.size(); i++) {
			OrderMainVO mainvo = mapper.getOrderMainList(orderNoList.get(i).getOrder_no());
			orderMainList.add(mainvo);
		}
		return orderMainList;
	}

//	@Override
//	public List<List<OrderDetailOptionVO>> getOrderDetailOptions(List<OrderDetailVO> orderDetailList) {
//		List<List<OrderDetailOptionVO>> optionList = new ArrayList<>();
//		for(int i=0; i<orderDetailList.size(); i++) {
//			List<OrderDetailOptionVO> orderOptionvo = mapper.getOrderDetailOptionList(orderDetailList.get(i).getNo());
//			optionList.add(orderOptionvo);
//		}
//		return optionList;
//	}

	@Override
	public boolean regist_delivery(DeliveryVO dvo) {
		int r = mapper.delivery_regist(dvo);
		int delivery_no = dvo.getNo();
		if(r > 0) {
			for(int i=0; i<dvo.getOrder_detail_list().size(); i++) {
				dvo.getOrder_detail_list().get(i).setDelivery_no(delivery_no);
				int success = mapper.update_deliveryNo(dvo.getOrder_detail_list().get(i));
				if(success <= 0) return false;
			}
		}
		return true;
	}

	@Override
	public List<DeliveryVO> getDeliveryList(List<List<OrderDetailVO>> orderDetailList) {
		List<DeliveryVO> deliveryList = new ArrayList<>();
			for(int i=0; i<orderDetailList.size(); i++) {
				DeliveryVO dvo = mapper.getDeliveryVO(orderDetailList.get(i).get(0).getDelivery_no());
				deliveryList.add(dvo);
		}
		return deliveryList;
	}

	@Override
	public boolean cancleOrder_seller(int no) {
		int r = mapper.cancleOrder_seller(no);
		if(r>0) return true;
		else return false;
	}

	@Override
	public int settlement_list_count(int no) {
		Integer counts = mapper.settlement_list_count(no);
		if(counts != null) {
			return (int)counts;
		}
		return 0;
	}

	@Override
	public int settlement_price(int no) {
		Integer price = mapper.settlement_price(no);
		if(price != null) {
			return (int)price;
		}
		return 0;
	}

	@Override
	public int unsettlement_price(int no) {
		Integer price = mapper.unsettlement_price(no);
		if(price != null) {
			return (int)price;
		}
		return 0;
	}
	
	@Override
	public List<OrderDetailVO> settlement_search_list(Map map) {
		List<OrderDetailVO> list = mapper.settlement_search_list(map);
		return list;
	}

	@Override
	public int settlement_search_price(Map map) {
		Integer price = mapper.settlement_search_price(map);
		if(price != null) {
			return (int)price;
		}
		return 0;
	}

	@Override
	public boolean settlement_get(SettlementVO stvo) {
		int r = mapper.settlement_regist(stvo);
		int settlement_no = stvo.getNo();
		
		Map<String, Integer> map = new HashMap<>();
		map.put("settlement_no", settlement_no);
		int suc= 0;
		
		List<OrderDetailVO> list = mapper.settlement_list(stvo.getSeller_no());
		if(r > 0) {
			for(int i=0; i<list.size(); i++) {
				map.put("no", list.get(i).getNo());
				suc = mapper.settlementNo_update(map);
				if(suc <= 0) return false;
			}
		}
		return suc>0 ? true : false;
	}
	
	@Override
	public boolean refoundAccept_seller(int no) {
		int r = mapper.refoundAccept_seller(no);
		if(r>0) return true;
		else return false;
	}

}
