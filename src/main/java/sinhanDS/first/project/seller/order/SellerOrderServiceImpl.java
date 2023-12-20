package sinhanDS.first.project.seller.order;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sinhanDS.first.project.delivery.vo.DeliveryVO;
import sinhanDS.first.project.order.vo.OrderDetailOptionVO;
import sinhanDS.first.project.order.vo.OrderDetailVO;
import sinhanDS.first.project.order.vo.OrderMainVO;

@Service
public class SellerOrderServiceImpl implements SellerOrderService {
	@Autowired
	SellerOrderMapper mapper;
	
	@Override
	public List<OrderDetailVO> getOrderNoList(int seller_no) {
		return mapper.getOrderNoList(seller_no);
	}
	
	@Override
	public List<OrderDetailVO> getOrderDetails(int no) {
		return mapper.getOrderDetails(no);
	}
	
	@Override
	public List<OrderDetailVO> getOrderDetails2(Map map) {
		return mapper.getOrderDetails2(map);
	}
	
	@Override
	public List<List<OrderDetailVO>> getOrderDetailList(List<OrderDetailVO> orderNoList) {
		List<List<OrderDetailVO>> orderDetailList = new ArrayList<>();
		for(int i=0; i<orderNoList.size(); i++) {
			List<OrderDetailVO> orderDetailvo = mapper.getOrderDetails(orderNoList.get(i).getOrder_no());
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

	@Override
	public List<List<OrderDetailOptionVO>> getOrderDetailOptions(List<OrderDetailVO> orderDetailList) {
		List<List<OrderDetailOptionVO>> optionList = new ArrayList<>();
		for(int i=0; i<orderDetailList.size(); i++) {
			List<OrderDetailOptionVO> orderOptionvo = mapper.getOrderDetailOptionList(orderDetailList.get(i).getNo());
			optionList.add(orderOptionvo);
		}
		return optionList;
	}

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

	

}
