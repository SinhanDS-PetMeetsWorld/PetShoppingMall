package sinhanDS.first.project.user.order;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
public class OrderController {
	@Autowired
	private OrderService orderService;
	@Autowired
	private UserService userService;
	
	/* TODO: 리스트가 들어온 후에는 갯수가 얼마나 길어질지 모르니 POSTMAPPING으로 바꿔야한다*/
	@GetMapping("pay.do")
	public String pay(Model model) {
		/* 리스트 들어오기 전 임시 */
		
		CartVO cvo = new CartVO(); //결제 완료 후에 장바구니 삭제를 위해 필요
		cvo.setNo_list(new int[] {2, 3, 4});
		
		
		ProductVO pvo = new ProductVO();
		pvo.setNo_list(new int[] {504, 505, 506});
		pvo.setQuantity_list(new int[] {1, 2, 3});
		UserVO uvo = new UserVO();
		uvo.setNo(22);
		
		ProductOptionVO ovo = new ProductOptionVO();
		ovo.setNo_list(new int[] {116, 119, 121, 122});
		
		OrderMainVO orderVO = new OrderMainVO();
		orderVO.setTotal_price(90580);
		/* 리스트 들어오기 전 임시 끝*/
		
		
		List<UserAddressVO> userAddressList = userService.exist_addr(uvo);
		List<PaymentVO> userPaymentList = userService.exist_payment(uvo);
		
		
		model.addAttribute("userAddressList", userAddressList);
		model.addAttribute("userPaymentList", userPaymentList);
		
		/*
		 * 각각 OrderDetailOptionVO에 넣고
		 * OrderDetailVO에 넣고
		 * 
		 * 총 해서 OrderMainVo에 넣고 하면 될듯
		 * 
		 * OrderDetailVO는 아직 없으니 새로 만들어야함. 
		 * */
		
		return "user/order/pay";
	}
}
