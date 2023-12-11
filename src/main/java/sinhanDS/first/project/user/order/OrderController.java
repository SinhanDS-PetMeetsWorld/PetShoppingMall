package sinhanDS.first.project.user.order;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import sinhanDS.first.project.user.UserService;
import sinhanDS.first.project.user.vo.CartOptionVO;
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
		CartVO cvo = new CartVO();
//		cvo.setNo_list(new int[] {2, 3, 4});
//		cvo.setProduct_no_list(new int[] {504, 505, 506});
//		cvo.setQuantity_list(new int[] {1, 2, 3});
		cvo.setUser_no(22);
		
		CartOptionVO ovo = new CartOptionVO();
		ovo.setCart_no_list(new int[] {2, 2, 2, 3});
		ovo.setOption_no_list(new int[] {116, 119, 121, 122});
		
		UserVO uvo = new UserVO();
		uvo.setNo(22);
		
		
		
		
		
		List<UserAddressVO> userAddressList = userService.exist_addr(uvo);
		List<PaymentVO> userPaymentList = userService.exist_payment(uvo);
		
		
		
		model.addAttribute("userAddressList", userAddressList);
		model.addAttribute("userPaymentList", userPaymentList);
		
		
		
		return "user/order/pay";
	}
}
