package sinhanDS.first.project.user.order;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import sinhanDS.first.project.order.vo.OrderDetailVO;
import sinhanDS.first.project.order.vo.OrderMainVO;
import sinhanDS.first.project.product.vo.ProductOptionVO;
import sinhanDS.first.project.product.vo.ProductVO;
import sinhanDS.first.project.seller.product.SellerProductMapper;

@Service
@Slf4j
public class OrderServiceImpl implements OrderService {
	@Autowired
	OrderMapper mapper;
	@Autowired
	SellerProductMapper sellerProductMapper;
	
	public List<ProductVO> getProductListByProductNoList(int[] product_list){
		List<ProductVO> list = new ArrayList<>();
		for(int i = 0; i < product_list.length; i++) {
			log.debug("product_list[i] test: " + product_list[i]);
			list.add(sellerProductMapper.getProduct(product_list[i]));
		}
		return list;
	}
	
	public List<ProductVO> getProductListByCartNoList(int[] cno_list){
		System.out.println("cno_list.length체크: " + cno_list.length);
		List<ProductVO> list = new ArrayList<>();
		log.debug("cno_list.length체크: " + cno_list.length);
		for(int i = 0; i < cno_list.length; i++) {
			log.debug("cno_list[i] test: " + cno_list[i]);
			list.add(mapper.getProduct(cno_list[i]));
		}
		return list;
	}
	
	public List<ProductOptionVO> getOptionList(int[] option_no_list){
		List<ProductOptionVO> list = new ArrayList<>();
		for(int i = 0; i < option_no_list.length; i++) {
			list.add(mapper.getOption(option_no_list[i]));
		}
		return list;
	}
	
	public OrderMainVO setOrderName(OrderMainVO mvo, String name, int length) {
		mvo.setName(name + " 외 " + (length - 1) + "개 상품 주문"); 
		return mvo;
	}
	
	public void registOrderMain(OrderMainVO mvo) {
		mapper.registOrderMain(mvo);
	}
	public void registOrderDetail(List<OrderDetailVO> detail_list) {
		for(int i = 0; i < detail_list.size(); i++) {
			mapper.registOrderDetail(detail_list.get(i));
		}
	}
	
	
	
	public List<OrderDetailVO> getOrderDetailList(OrderMainVO mvo, List<ProductVO> p_list, int[] quantity){
		List<OrderDetailVO> detail_list = new ArrayList<>();
		for(int i = 0; i < p_list.size(); i++) {
			detail_list.add(fillOrderDetailVO(mvo, p_list.get(i), quantity[i]));
		}
		return detail_list;
	}
	
	public OrderDetailVO fillOrderDetailVO(OrderMainVO mvo, ProductVO pvo, int quantity) {
		OrderDetailVO vo = new OrderDetailVO();
		vo.setOrder_no(mvo.getNo());
		vo.setUser_no(mvo.getUser_no());
		vo.setProduct_no(pvo.getNo());
		vo.setProduct_name(pvo.getName());
		vo.setProduct_price(pvo.getPrice());
		/*TODO: 현재 수수요율이 책정되어있지 않아 그냥 0으로 해뒀습니다. 나중에 수정합시다 ㅎㅎ*/
		vo.setCharge(0);
		vo.setDiscount(pvo.getDiscount());
		vo.setCompany(pvo.getCompany());
		vo.setBrand(pvo.getBrand());
		vo.setQuantity(quantity);
		return vo;
	}
}
