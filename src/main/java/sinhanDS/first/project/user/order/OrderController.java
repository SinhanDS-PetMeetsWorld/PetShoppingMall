package sinhanDS.first.project.user.order;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.extern.slf4j.Slf4j;
import sinhanDS.first.project.order.vo.OrderDetailOptionVO;
import sinhanDS.first.project.order.vo.OrderDetailVO;
import sinhanDS.first.project.order.vo.OrderMainVO;
import sinhanDS.first.project.product.vo.ProductOptionVO;
import sinhanDS.first.project.product.vo.ProductVO;
import sinhanDS.first.project.user.UserService;
import sinhanDS.first.project.user.vo.CartVO;
import sinhanDS.first.project.user.vo.UserVO;


@Controller
@RequestMapping("/user/order")
@Slf4j
public class OrderController {
	@Autowired
	private OrderService orderService;
	@Autowired
	private UserService userService;
	
	/* TODO: 리스트가 들어온 후에는 갯수가 얼마나 길어질지 모르니 POSTMAPPING으로 바꿔야한다*/
	@GetMapping("pay.do")
	public String pay(Model model) {
		/* 리스트 들어오기 전 임시 */
		/* 리스트로 들어오면 얘들은 테스트로 넘겨주세용 ㅎㅎ */
		CartVO cvo = new CartVO();
		cvo.setCart_no_list(new int[] {2, 3, 4});
		cvo.setQuantity_list(new int[] {1, 2, 3});
		
		UserVO uvo = new UserVO();
		uvo.setNo(22);
		
		ProductOptionVO ovo = new ProductOptionVO();
		ovo.setNo_list(new int[] {116, 119, 121, 122});
		
		OrderMainVO orderVO = new OrderMainVO();
		orderVO.setTotal_price(90580);
		orderVO.setTotal_delivery_fee(2500);
		/* 리스트 들어오기 전 임시 끝*/
		
		model.addAttribute("userno", uvo.getNo());
		model.addAttribute("userAddressList", userService.exist_addr(uvo));
		model.addAttribute("userPaymentList", userService.exist_payment(uvo));
		model.addAttribute("orderVO", orderVO);
		/*cart no는 결제가 끝나고 지울 것이기 때문에 cart_no만 넘어가도 된다.*/
		model.addAttribute("cno_list", cvo.getCart_no_list());
		
		List<ProductVO> product_list = orderService.getProductList(cvo.getCart_no_list());
		model.addAttribute("product_list", product_list);
		model.addAttribute("quantity_list", cvo.getQuantity_list());
		
		List<ProductOptionVO> option_list = orderService.getOptionList(ovo.getNo_list());
		model.addAttribute("option_list", option_list);
		
		return "user/order/pay";
	}
	
	@PostMapping("buy.do")
	public String pay_process(@RequestParam(value="order_detail_product_name_list") String[] name, Model model, OrderMainVO mvo, OrderDetailVO dvo, OrderDetailOptionVO ovo, CartVO cvo) {
		System.out.println("name체크: " + Arrays.toString(name) + "ㅇㅇ");
		mvo = orderService.setOrderName(mvo, dvo);
		orderService.registOrderMain(mvo);
		List<OrderDetailVO> order_detail_list = orderService.getOrderDetailList(mvo, dvo);
		orderService.registOrderDetail(order_detail_list);
		
		orderService.registOrderDetailOption(order_detail_list, ovo);
		return "user/order/success";
	}
}