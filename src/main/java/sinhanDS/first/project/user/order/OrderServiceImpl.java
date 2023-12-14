package sinhanDS.first.project.user.order;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import sinhanDS.first.project.order.vo.OrderDetailOptionVO;
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
	
	public List<ProductVO> getProductList(int[] cno_list){
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
	
	public OrderMainVO setOrderName(OrderMainVO mvo, OrderDetailVO dvo) {
		String first_product_name = checkFirstProductName(dvo);
		int product_number = checkProductNumber(dvo);
		mvo.setName(first_product_name + " 외 " + (product_number - 1) + "개 상품 주문");
		return mvo;
	}
	public int registOrderMain(OrderMainVO mvo) {
		return mapper.registOrderMain(mvo);
	}
	
	public List<OrderDetailVO> getOrderDetailList(OrderMainVO mvo, OrderDetailVO dvo){
		List<OrderDetailVO> list = fillOrderDetailVO(mvo, dvo);
		return list;
	}
	
	public List<OrderDetailVO> registOrderDetail(List<OrderDetailVO> list) {
		for(int i = 0; i < list.size(); i++) {
			mapper.registOrderDetail(list.get(i));
		}
		return list;
	}
	
	public List<OrderDetailVO> fillOrderDetailVO(OrderMainVO mvo, OrderDetailVO dvo) {
		List<OrderDetailVO> list = new ArrayList<>();
		
		int[] product_list = dvo.getOrder_detail_product_no_list();
		for(int i = 0; i < product_list.length; i++) {
			OrderDetailVO vo = new OrderDetailVO();
			
			vo.setOrder_no(mvo.getNo());
			vo.setUser_no(mvo.getUser_no());
			vo.setSeller_no(dvo.getOrder_detail_seller_no_list()[i]);
			vo.setProduct_no(dvo.getOrder_detail_product_no_list()[i]);
			vo.setProduct_name(dvo.getOrder_detail_product_name_list()[i]);
			vo.setProduct_price(0);
			//TODO: charge비율을 정하지 않아서 일단 0으로 해둠
			vo.setCharge(0);
			vo.setDiscount(dvo.getOrder_detail_product_discount_list()[i]);
			vo.setCompany(dvo.getOrder_detail_company_list()[i]);
			vo.setBrand(dvo.getOrder_detail_brand_list()[i]);
			vo.setQuantity(dvo.getOrder_detail_quantity_list()[i]);
			vo.setCart_no(dvo.getOrder_detail_cart_no_list()[i]);
			list.add(vo);
		}
		
		return list;
	}
	
	public void registOrderDetailOption(List<OrderDetailVO> order_detail_list, OrderDetailOptionVO ovo) {
		List<OrderDetailOptionVO> list = fillOrderDetailOptionVO(order_detail_list, ovo);
		for(int i = 0; i < list.size(); i++) {
			mapper.registOrderDetailOption(list.get(i));
		}
	}
	
	public List<OrderDetailOptionVO> fillOrderDetailOptionVO(List<OrderDetailVO> order_detail_list, OrderDetailOptionVO ovo) {
		List<OrderDetailOptionVO> list = new ArrayList<>();
		
		for(int i = 0; i < ovo.getOrder_detail_option_cart_no_list().length; i++) {
			OrderDetailOptionVO target = new OrderDetailOptionVO();
			int cart_no = ovo.getOrder_detail_option_cart_no_list()[i];
			for(int j = 0; j < order_detail_list.size(); j++) {
				if(cart_no == order_detail_list.get(j).getCart_no()) {
					OrderDetailVO dvo = order_detail_list.get(j);
					target.setOrder_dno(dvo.getNo());
					target.setProduct_no(dvo.getProduct_no());
					target.setTitle(ovo.getOrder_detail_option_title_list()[i]);
					target.setContent(ovo.getOrder_detail_option_content_list()[i]);
					target.setPrice(ovo.getOrder_detail_option_product_price_list()[i]);
					
					list.add(target);
					log.debug("odovo 생성테스트: " + target);
				}
			}
		}
		return list;
	}
	
	public String checkFirstProductName(OrderDetailVO dvo) {
		return dvo.getOrder_detail_product_name_list()[0];
	}
	public int checkProductNumber(OrderDetailVO dvo) {
		return dvo.getOrder_detail_product_no_list().length;
	}
}
