package sinhanDS.first.project.seller.order;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;
import sinhanDS.first.project.admin.vo.SettlementVO;
import sinhanDS.first.project.delivery.vo.DeliveryVO;
import sinhanDS.first.project.order.vo.OrderDetailVO;
import sinhanDS.first.project.order.vo.OrderMainVO;
import sinhanDS.first.project.product.vo.ProductSearchVO;
import sinhanDS.first.project.seller.vo.SellerVO;
import sinhanDS.first.project.user.vo.PaymentVO;


@Controller
@RequestMapping("/seller/order")
@Slf4j
public class SellerOrderController {
	@Autowired
	private SellerOrderService service;
	
	@GetMapping("/bd_orderlist.do")
	public String bd_orderlist(HttpSession sess, Model model) {
		SellerVO svo = (SellerVO)sess.getAttribute("sellerLoginInfo");
		model.addAttribute("svo", svo);
		
		List<OrderDetailVO> orderNoList = service.getOrderNoList_bd(svo.getNo());
		List<OrderMainVO> orderMainList = service.getOrderMainList(orderNoList);
		List<List<OrderDetailVO>> orderDetailList = service.getOrderDetailList_bd(orderNoList);
		
		model.addAttribute("orderDetailList", orderDetailList);
		model.addAttribute("orderMainList", orderMainList);
		
		return "seller/order/bdorderlist";
	}
	
	@PostMapping("/regist_deliver.do")
	public String regist_deliverNo(HttpSession sess, Model model, HttpServletRequest request, DeliveryVO dvo) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("order_no", request.getParameter("order_no"));
		map.put("seller_no", request.getParameter("seller_no"));
		dvo.setOrder_detail_list(service.getOrderDetails_bd(map));
		
		boolean r = service.regist_delivery(dvo);
		if (r) { 
			model.addAttribute("cmd", "move");
			model.addAttribute("url", "/seller/order/bd_orderlist.do");
			model.addAttribute("msg", "배송이 시작되었습니다.");
		} else {
			model.addAttribute("cmd", "back");
			model.addAttribute("url", "/seller/order/bd_orderlist.do");
			model.addAttribute("msg", "배송 신청 실패");
		}
		return "common/alert";
	}
	
	@GetMapping("/od_orderlist.do")
	public String od_orderlist(HttpSession sess, Model model) {
		SellerVO svo = (SellerVO)sess.getAttribute("sellerLoginInfo");
		model.addAttribute("svo", svo);
		
		List<OrderDetailVO> orderNoList = service.getOrderNoList_od(svo.getNo());
		List<List<OrderDetailVO>> orderDetailList = service.getOrderDetailList_od(orderNoList);
		List<DeliveryVO> deliveryList = service.getDeliveryList(orderDetailList);
		List<OrderMainVO> orderMainList = service.getOrderMainList(orderNoList);
		
		model.addAttribute("orderDetailList", orderDetailList);
		model.addAttribute("orderMainList", orderMainList);
		model.addAttribute("deliveryList", deliveryList);
		
		return "seller/order/odorderlist";
	}
	
	@GetMapping("/ad_orderlist.do")
	public String ad_orderlist(HttpSession sess, Model model) {
		SellerVO svo = (SellerVO)sess.getAttribute("sellerLoginInfo");
		model.addAttribute("svo", svo);
		
		List<OrderDetailVO> orderNoList = service.getOrderNoList_ad(svo.getNo());
		List<List<OrderDetailVO>> orderDetailList = service.getOrderDetailList_ad(orderNoList);
		List<DeliveryVO> deliveryList = service.getDeliveryList(orderDetailList);
		List<OrderMainVO> orderMainList = service.getOrderMainList(orderNoList);
		
		model.addAttribute("orderDetailList", orderDetailList);
		model.addAttribute("orderMainList", orderMainList);
		model.addAttribute("deliveryList", deliveryList);
		
		return "seller/order/adorderlist";
	}
	
	@GetMapping("/refundlist.do")
	public String refundlist(HttpSession sess, Model model) {
		SellerVO svo = (SellerVO)sess.getAttribute("sellerLoginInfo");
		model.addAttribute("svo", svo);
		
		List<OrderDetailVO> orderNoList = service.getOrderNoList_rf(svo.getNo());
		List<List<OrderDetailVO>> orderDetailList = service.getOrderDetailList_rf(orderNoList);
		List<DeliveryVO> deliveryList = service.getDeliveryList(orderDetailList);
		List<OrderMainVO> orderMainList = service.getOrderMainList(orderNoList);
		
		model.addAttribute("orderDetailList", orderDetailList);
		model.addAttribute("orderMainList", orderMainList);
		model.addAttribute("deliveryList", deliveryList);
		
		return "seller/order/refundlist";
	}
	
	@ResponseBody
	@GetMapping("/order_cancle.do")
	public String order_cancle(HttpSession sess, Model model, HttpServletRequest request) {
		SellerVO svo = (SellerVO)sess.getAttribute("sellerLoginInfo");
		model.addAttribute("svo", svo);
		
		boolean res = service.cancleOrder_seller(Integer.parseInt(request.getParameter("order_detail_no")));
		
		return String.valueOf(res);
	}
	
	@GetMapping("/settlement.do")
	public String settlement(HttpSession sess, Model model) {
		SellerVO svo = (SellerVO)sess.getAttribute("sellerLoginInfo");
		model.addAttribute("svo", svo);
		
		PaymentVO pvo = new PaymentVO();
		String bank_name = pvo.getCompany_list().get(1).get(svo.getBank());
		sess.setAttribute("bank_name", bank_name);
		
		int settlement_list_count = service.settlement_list_count(svo.getNo());
		int settlement_price = service.settlement_price(svo.getNo());
		int unsettlement_price = service.unsettlement_price(svo.getNo());
		int total_charge = (int)(settlement_price * 0.03);
		
		model.addAttribute("settlement_list_count", settlement_list_count);
		model.addAttribute("settlement_price", settlement_price);
		model.addAttribute("unsettlement_price", unsettlement_price);
		model.addAttribute("total_charge", total_charge);
		
		return "seller/order/settlement";
	}
	
	@GetMapping("/settlement_search.do")
	public String settlement_search(HttpSession sess, Model model, HttpServletRequest request) {
		SellerVO svo = (SellerVO)sess.getAttribute("sellerLoginInfo");
		model.addAttribute("svo", svo);
		Map<String, String> map = new HashMap<String, String>();

		map.put("startDate", request.getParameter("startDate"));
		map.put("endDate", request.getParameter("endDate"));
		map.put("settlementType", request.getParameter("settlementType"));
		map.put("seller_no", String.valueOf(svo.getNo()));

		List<OrderDetailVO> settlement_search_list = service.settlement_search_list(map);
		int settlement_search_price = service.settlement_search_price(map);
		
		model.addAttribute("settlement_list_count", request.getParameter("settlement_list_count"));
		model.addAttribute("settlement_price", request.getParameter("settlement_price"));
		model.addAttribute("unsettlement_price", request.getParameter("unsettlement_price"));
		model.addAttribute("total_charge", request.getParameter("total_charge"));
		
		model.addAttribute("settlement_search_list", settlement_search_list);
		model.addAttribute("settlement_search_price", settlement_search_price);
		model.addAttribute("charge_search_price", (int)(settlement_search_price * 0.03));
		model.addAttribute("startDate", request.getParameter("startDate"));
		model.addAttribute("endDate", request.getParameter("endDate"));
		model.addAttribute("settlementType", request.getParameter("settlementType"));
		
		return "seller/order/settlement";
	}
	
	@PostMapping("/settlement_get.do")
	public String settlement_get(HttpSession sess, Model model, HttpServletRequest request, SettlementVO stvo) {
		SellerVO svo = (SellerVO)sess.getAttribute("sellerLoginInfo");
		model.addAttribute("svo", svo);
		
		boolean r = service.settlement_get(stvo);
		if (r) { 
			model.addAttribute("cmd", "move");
			model.addAttribute("url", "/seller/order/settlement.do");
			model.addAttribute("msg", "정산 완료되었습니다.");
		} else {
			model.addAttribute("cmd", "back");
			model.addAttribute("url", "/seller/order/settlement.do");
			model.addAttribute("msg", "정산 실패");
		}
		return "common/alert";
	}
	
	@ResponseBody
	@GetMapping("/refund_accept.do")
	public String refund_accept(HttpSession sess, Model model, HttpServletRequest request) {
		SellerVO svo = (SellerVO)sess.getAttribute("sellerLoginInfo");
		model.addAttribute("svo", svo);
		
		boolean res = service.refoundAccept_seller(Integer.parseInt(request.getParameter("order_detail_no")));
		
		return String.valueOf(res);
	}
	
	@GetMapping("/refundendlist.do")
	public String refundendlist(HttpSession sess, Model model, ProductSearchVO svo) {
		SellerVO sellerVO = (SellerVO)sess.getAttribute("sellerLoginInfo");
		model.addAttribute("svo", sellerVO);
		svo.setSeller_no(sellerVO.getNo());
		
		svo.setNumberOfProductInPage(svo.getNumberinPage_refoundEndList());
		int count = service.getNumberOfRefoundEndListPage(svo);
		int totalPage = count / svo.getNumberOfProductInPage();
        if (count % svo.getNumberOfProductInPage() > 0) totalPage++;
		
        Map<String, Object> map = new HashMap<>();
        map.put("count", count);
        map.put("totalPage", totalPage);
        
        int endPage = (int)(Math.ceil(svo.getPage()/(float)svo.getNumberOfPageInIndexList())*svo.getNumberOfPageInIndexList());
        log.debug("endPage: " + endPage);
        int startPage = endPage - (svo.getNumberOfPageInIndexList() - 1);
        if(endPage > totalPage) endPage = totalPage;
        boolean prev = startPage > 1;
        boolean next = endPage < totalPage;
        map.put("endPage", endPage);
        map.put("startPage", startPage);
        map.put("prev", prev);
        map.put("next", next);
        
        model.addAttribute("paging", map);
        
        
        
		List<OrderDetailVO> orderNoList = service.getOrderNoList_rfendBySearchVO(svo);
		log.debug("orderNoList: " + orderNoList);
		List<List<OrderDetailVO>> orderDetailList = service.getOrderDetailList_rfend(orderNoList);
		log.debug("orderDetailList: " + orderDetailList);
		List<DeliveryVO> deliveryList = service.getDeliveryList(orderDetailList);
		log.debug("deliveryList: " + deliveryList);
		List<OrderMainVO> orderMainList = service.getOrderMainList(orderNoList);
		
		model.addAttribute("orderDetailList", orderDetailList);
		model.addAttribute("orderMainList", orderMainList);
		model.addAttribute("deliveryList", deliveryList);
		
		return "seller/order/refundendlist";
	}

}
