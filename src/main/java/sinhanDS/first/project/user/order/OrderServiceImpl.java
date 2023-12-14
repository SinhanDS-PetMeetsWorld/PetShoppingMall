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
}
