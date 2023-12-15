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
		
		List<ProductVO> product_list = orderService.getProductListByCartNoList(cvo.getCart_no_list());
		model.addAttribute("product_list", product_list);
		model.addAttribute("quantity_list", cvo.getQuantity_list());
		
		List<ProductOptionVO> option_list = orderService.getOptionList(ovo.getNo_list());
		model.addAttribute("option_list", option_list);
		
		return "user/order/pay";
	}
	
	@PostMapping("buy.do")
	public String pay_process(Model model, 
			@RequestParam int[] product_no, 
			@RequestParam int[] cart_no,
			@RequestParam int[] option_no,
			@RequestParam int[] option_cart_no,
			@RequestParam int[] quantity, OrderMainVO mvo) {
		log.debug("product_no: " + Arrays.toString(product_no));
		log.debug("cart_no: " + Arrays.toString(cart_no));
		log.debug("option_no 체크: " + Arrays.toString(option_no));
		log.debug("option_cart_no 체크: " + Arrays.toString(option_cart_no));
		log.debug("quantity 체크: " + Arrays.toString(quantity));
		/*TODO: 나중에 인터셉터 달면 uvo를 인터셉터에서 가져온 걸로 바꿔주기 */
		UserVO uvo = new UserVO();
		uvo.setNo(22);
		mvo.setUser_no(uvo.getNo());
		
		List<ProductVO> p_list = orderService.getProductListByProductNoList(product_no);
		
		mvo = orderService.setOrderName(mvo, p_list.get(0).getName(), p_list.size());
		orderService.registOrderMain(mvo);
		
		List<OrderDetailVO> detail_list = orderService.getOrderDetailList(mvo, p_list, quantity);
		orderService.registOrderDetail(detail_list);
		log.debug("detail_list: " + detail_list);
		
		List<ProductOptionVO> option_list = orderService.getOptionList(option_no);
		log.debug("option_list체크: " + option_list);
		orderService.registOrderDetailOption(option_list, detail_list, cart_no, option_cart_no);
		/*주문 상세 옵션 넣어주면됨 */
		return "user/order/success";
	}
}