package sinhanDS.first.project.seller.order;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import sinhanDS.first.project.order.vo.OrderDetailOptionVO;
import sinhanDS.first.project.order.vo.OrderDetailVO;
import sinhanDS.first.project.order.vo.OrderMainVO;
import sinhanDS.first.project.seller.vo.SellerVO;


@Controller
@RequestMapping("/seller/order")
public class SellerOrderController {
	@Autowired
	private SellerOrderService service;
	
	@GetMapping("/orderlist.do")
	public String edit(HttpSession sess, Model model) {
		SellerVO svo = (SellerVO)sess.getAttribute("sellerLoginInfo");
		model.addAttribute("svo", svo);
		
		List<OrderDetailVO> orderNoList = service.getOrderNoList(svo.getNo());
		List<List<OrderDetailVO>> orderDetailList = service.getOrderDetailList(orderNoList);
		List<OrderMainVO> orderMainList = service.getOrderMainList(orderNoList);
//		List<List<List<OrderDetailOptionVO>>> optionList = service.getOrderDetailOptionsLists(orderDetailList);
		
		model.addAttribute("orderNoList", orderNoList);
		model.addAttribute("orderDetailList", orderDetailList);
		model.addAttribute("orderMainList", orderMainList);
		
		return "seller/order/orderlist";
	}

}
