package sinhanDS.first.project.user.order;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;
import sinhanDS.first.project.order.vo.OrderDetailVO;
import sinhanDS.first.project.order.vo.OrderMainVO;
import sinhanDS.first.project.product.vo.ProductOptionVO;
import sinhanDS.first.project.product.vo.ProductVO;
import sinhanDS.first.project.user.UserService;
import sinhanDS.first.project.user.vo.CartVO;
import sinhanDS.first.project.user.vo.PaymentVO;
import sinhanDS.first.project.user.vo.UserAddressVO;
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
		CartVO cvo = new CartVO(); //결제 완료 후에 장바구니 삭제를 위해 필요
		cvo.setCart_no_list(new int[] {2, 3, 4});
		
		
		ProductVO pvo = new ProductVO();
		pvo.setNo_list(new int[] {504, 505, 506});
		pvo.setQuantity_list(new int[] {1, 2, 3});
		UserVO uvo = new UserVO();
		uvo.setNo(22);
		
		ProductOptionVO ovo = new ProductOptionVO();
		ovo.setNo_list(new int[] {116, 119, 121, 122});
		
		OrderMainVO orderVO = new OrderMainVO();
		orderVO.setTotal_price(90580);
		orderVO.setTotal_delivery_fee(2500);
		/* 리스트 들어오기 전 임시 끝*/
		
		
		
		List<UserAddressVO> userAddressList = userService.exist_addr(uvo);
		List<PaymentVO> userPaymentList = userService.exist_payment(uvo);
		int[] cno_list = cvo.getCart_no_list();
		int[] pvo_list = pvo.getNo_list();
		List<ProductVO> product_list = orderService.getProductList(pvo_list);
		int[] quantity_list = pvo.getQuantity_list();
		int[] option_no_list = ovo.getNo_list();
		List<ProductOptionVO> option_list = orderService.getOptionList(option_no_list);
		
		model.addAttribute("userno", uvo.getNo());
		model.addAttribute("userAddressList", userAddressList);
		model.addAttribute("userPaymentList", userPaymentList);
		model.addAttribute("orderVO", orderVO);
		/*cart no는 결제가 끝나고 지울 것이기 때문에 no만 넘어가도 된다.*/
		model.addAttribute("cno_list", cno_list);
		model.addAttribute("product_list", product_list);
		model.addAttribute("quantity_list", quantity_list);
		model.addAttribute("option_list", option_list);
		
		return "user/order/pay";
	}
	
	@PostMapping("pay_process.do")
	public String pay_process(Model model, OrderMainVO mvo, OrderDetailVO dvo, CartVO cvo) {
		log.debug("mvo체크: " + mvo);
		log.debug("dvo체크: " + dvo);
		log.debug("cvo체크: " + cvo);
		
		String first_product_name = orderService.checkFirstProductName(dvo);
		int product_number = orderService.checkProductNumber(dvo);
		mvo.setName(first_product_name + " 외 " + (product_number - 1) + "개 상품 주문");
		int result = orderService.registOrderMain(mvo);
		
		log.debug("바뀐 mvo 체크: " + mvo.getNo());
		
		/*
		 * order detail, order detail option 추가하면 된다. 
		 * */
		
		return "user/order/success";
	}
}
