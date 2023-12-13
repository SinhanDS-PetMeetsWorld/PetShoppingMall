package sinhanDS.first.project.user.order;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sinhanDS.first.project.order.vo.OrderDetailVO;
import sinhanDS.first.project.order.vo.OrderMainVO;
import sinhanDS.first.project.product.vo.ProductOptionVO;
import sinhanDS.first.project.product.vo.ProductVO;

@Service
public class OrderServiceImpl implements OrderService {
	@Autowired
	OrderMapper mapper;
	
	public List<ProductVO> getProductList(int[] pno_list){
		List<ProductVO> list = new ArrayList<>();
		for(int i = 0; i < pno_list.length; i++) {
			list.add(mapper.getProduct(pno_list[i]));
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
	
	public int registOrderMain(OrderMainVO mvo) {
		return mapper.registOrderMain(mvo);
	}
	
	public String checkFirstProductName(OrderDetailVO dvo) {
		return dvo.getOrder_detail_product_name_list()[0];
	}
	public int checkProductNumber(OrderDetailVO dvo) {
		return dvo.getOrder_detail_product_no_list().length;
	}
}
