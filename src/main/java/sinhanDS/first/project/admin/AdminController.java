package sinhanDS.first.project.admin;

import java.util.Arrays;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;
import sinhanDS.first.project.admin.vo.SettlementVO;
import sinhanDS.first.project.order.vo.OrderDetailOptionVO;
import sinhanDS.first.project.order.vo.OrderDetailVO;
import sinhanDS.first.project.order.vo.OrderMainVO;
import sinhanDS.first.project.product.vo.ProductSearchVO;
import sinhanDS.first.project.product.vo.ProductVO;
import sinhanDS.first.project.seller.vo.SellerVO;
import sinhanDS.first.project.user.order.OrderService;
import sinhanDS.first.project.user.vo.PaymentVO;
import sinhanDS.first.project.user.vo.UserVO;


@Controller
@RequestMapping("/admin")
@Slf4j
public class AdminController {
	@Autowired
	private AdminService service;
	
	
	@Autowired OrderService orderService;
	
	@GetMapping("")
	public String index() {
		return "/admin/login";
	}
	@GetMapping("/")
	public String index2() {
		return "/admin/login";
	}
	@GetMapping("/index.do")
	public String index3() {
		return "/admin/login";
	}
	
	@PostMapping("/login.do")
	public String login(@RequestParam String id, @RequestParam String pwd, HttpSession sess) {
		if("admin".equals(id) && "admin".equals(pwd)) {
			sess.setAttribute("adminLoginInfo", "adminLoginInfo");
			log.debug("loginSession: " + (String)sess.getAttribute("adminLoginInfo"));
			
			sess.removeAttribute("sellerLoginInfo");
			sess.removeAttribute("userLoginInfo");
			
			return "redirect:/admin/userList.do"; 
		}
		return "/admin/login";
	}
	
	@GetMapping("/logout.do")
	public String logout(HttpSession sess) {
		sess.removeAttribute("userLoginInfo");
		sess.removeAttribute("sellerLoginInfo");
		sess.removeAttribute("adminLoginInfo");
		return "redirect:/admin/";
	}
	@GetMapping("userList.do")
	public String userList(Model model, ProductSearchVO svo) {
		svo.setNumberOfProductInPage(svo.getNumberInPage_UserVO());
		log.debug("review_svo: " + svo);
		int count = service.getNumberOfUser(svo);
		int totalPage = count / svo.getNumberOfProductInPage();
		if(count % svo.getNumberOfProductInPage() > 0) totalPage++;
		Map<String, Object> map = new HashMap<>();
		map.put("count", count);
		map.put("totalPage", totalPage);
		
		int endPage = (int)(Math.ceil(svo.getPage()/(float)svo.getNumberOfPageInIndexList()) * svo.getNumberOfPageInIndexList());
		int startPage = endPage - (svo.getNumberOfPageInIndexList() - 1);
		if( endPage > totalPage) endPage = totalPage;
		boolean prev = startPage > 1;
		boolean next = endPage < totalPage;
		map.put("endPage", endPage);
		map.put("startPage", startPage);
		map.put("prev", prev);
		map.put("next", next);
        
		List<UserVO> userlist = service.getUserList(svo);
		log.debug("list: " + userlist);
		
		model.addAttribute("list", userlist);
        model.addAttribute("paging", map);
        model.addAttribute("svo", svo);
		return "/admin/page/userList";
	}
	
	@GetMapping("sellerList.do")
	public String sellerList(Model model, ProductSearchVO svo) {
		svo.setNumberOfProductInPage(svo.getNumberInPage_UserVO());
		int count = service.getNumberOfSeller(svo);
		int totalPage = count / svo.getNumberOfProductInPage();
		if(count % svo.getNumberOfProductInPage() > 0) totalPage++;
		Map<String, Object> map = new HashMap<>();
		map.put("count", count);
		map.put("totalPage", totalPage);
		
		int endPage = (int)(Math.ceil(svo.getPage()/(float)svo.getNumberOfPageInIndexList()) * svo.getNumberOfPageInIndexList());
		int startPage = endPage - (svo.getNumberOfPageInIndexList() - 1);
		if( endPage > totalPage) endPage = totalPage;
		boolean prev = startPage > 1;
		boolean next = endPage < totalPage;
		map.put("endPage", endPage);
		map.put("startPage", startPage);
		map.put("prev", prev);
		map.put("next", next);
        
		List<SellerVO> sellerlist = service.getSellerList(svo);
		log.debug("list: " + sellerlist);
		
		model.addAttribute("list", sellerlist);
        model.addAttribute("paging", map);
        model.addAttribute("svo", svo);
		return "/admin/page/sellerList";
	}
	
	
	@GetMapping("productList.do")
	public String productList(Model model, ProductSearchVO svo) {
		svo.setNumberOfProductInPage(svo.getNumberInPage_UserVO());
		int count = service.getNumberOfProduct(svo);
		log.debug("count: " + count);
		int totalPage = count / svo.getNumberOfProductInPage();
		if(count % svo.getNumberOfProductInPage() > 0) totalPage++;
		Map<String, Object> map = new HashMap<>();
		map.put("count", count);
		map.put("totalPage", totalPage);
		
		int endPage = (int)(Math.ceil(svo.getPage()/(float)svo.getNumberOfPageInIndexList()) * svo.getNumberOfPageInIndexList());
		int startPage = endPage - (svo.getNumberOfPageInIndexList() - 1);
		if( endPage > totalPage) endPage = totalPage;
		boolean prev = startPage > 1;
		boolean next = endPage < totalPage;
		map.put("endPage", endPage);
		map.put("startPage", startPage);
		map.put("prev", prev);
		map.put("next", next);
        
		List<ProductVO> vo_list = service.getProductList(svo);
		log.debug("list: " + vo_list);
		
		model.addAttribute("list", vo_list);
        model.addAttribute("paging", map);
        model.addAttribute("svo", svo);
		return "/admin/page/productList";
	}
	@GetMapping("orderMainList.do")
	public String orderMainList(Model model, ProductSearchVO svo) {
		svo.setNumberOfProductInPage(svo.getNumberInPage_UserVO());
		
		//개수 구하기
		int count = service.getNumberOfOrderMain(svo);
		int totalPage = count / svo.getNumberOfProductInPage();
		if(count % svo.getNumberOfProductInPage() > 0) totalPage++;
		Map<String, Object> map = new HashMap<>();
		map.put("count", count);
		map.put("totalPage", totalPage);
		
		int endPage = (int)(Math.ceil(svo.getPage()/(float)svo.getNumberOfPageInIndexList()) * svo.getNumberOfPageInIndexList());
		int startPage = endPage - (svo.getNumberOfPageInIndexList() - 1);
		if( endPage > totalPage) endPage = totalPage;
		boolean prev = startPage > 1;
		boolean next = endPage < totalPage;
		map.put("endPage", endPage);
		map.put("startPage", startPage);
		map.put("prev", prev);
		map.put("next", next);
		
		//리스트 구하기 
		List<OrderMainVO> vo_list = service.getOrderMainList(svo);
		log.debug("list: " + vo_list);
		
		model.addAttribute("list", vo_list);
		model.addAttribute("paging", map);
		model.addAttribute("svo", svo);
		model.addAttribute("paymentVO", new PaymentVO());
		return "/admin/page/orderMainList";
	}
	
	@GetMapping("orderDetailList.do")
	public String orderDetailList(Model model, ProductSearchVO svo) {
		svo.setNumberOfProductInPage(svo.getNumberInPage_UserVO());
		//개수 구하기
		int count = service.getNumberOfOrderDetail(svo);
		int totalPage = count / svo.getNumberOfProductInPage();
		if(count % svo.getNumberOfProductInPage() > 0) totalPage++;
		Map<String, Object> map = new HashMap<>();
		map.put("count", count);
		map.put("totalPage", totalPage);
		
		int endPage = (int)(Math.ceil(svo.getPage()/(float)svo.getNumberOfPageInIndexList()) * svo.getNumberOfPageInIndexList());
		int startPage = endPage - (svo.getNumberOfPageInIndexList() - 1);
		if( endPage > totalPage) endPage = totalPage;
		boolean prev = startPage > 1;
		boolean next = endPage < totalPage;
		map.put("endPage", endPage);
		map.put("startPage", startPage);
		map.put("prev", prev);
		map.put("next", next);
		
		//리스트 구하기 
		List<OrderDetailVO> vo_list = service.getOrderDetailList(svo);
		log.debug("list: " + vo_list);
		
		List<List<OrderDetailOptionVO>> ovo_list = orderService.getOrderDetailOptionList(vo_list);
		
		model.addAttribute("list", vo_list);
		model.addAttribute("ovo_list", ovo_list);
		model.addAttribute("paging", map);
		model.addAttribute("svo", svo);
		return "/admin/page/orderDetailList";
	}
	
	@GetMapping("cancleAndRefoundList.do")
	public String cancleAndRefoundList(Model model, ProductSearchVO svo) {
		svo.setNumberOfProductInPage(svo.getNumberInPage_UserVO());
		//개수 구하기
		int count = service.getNumberOfCancleAndRefound(svo);
		int totalPage = count / svo.getNumberOfProductInPage();
		if(count % svo.getNumberOfProductInPage() > 0) totalPage++;
		Map<String, Object> map = new HashMap<>();
		map.put("count", count);
		map.put("totalPage", totalPage);
		
		int endPage = (int)(Math.ceil(svo.getPage()/(float)svo.getNumberOfPageInIndexList()) * svo.getNumberOfPageInIndexList());
		int startPage = endPage - (svo.getNumberOfPageInIndexList() - 1);
		if( endPage > totalPage) endPage = totalPage;
		boolean prev = startPage > 1;
		boolean next = endPage < totalPage;
		map.put("endPage", endPage);
		map.put("startPage", startPage);
		map.put("prev", prev);
		map.put("next", next);
		
		//리스트 구하기 
		List<OrderDetailVO> vo_list = service.getCancleAndRefound(svo);
		log.debug("list: " + vo_list);
		
		List<List<OrderDetailOptionVO>> ovo_list = orderService.getOrderDetailOptionList(vo_list);
		
		model.addAttribute("list", vo_list);
		model.addAttribute("ovo_list", ovo_list);
		model.addAttribute("paging", map);
		model.addAttribute("svo", svo);
		return "/admin/page/cancleAndRefoundList";
	}
	
	@GetMapping("needConfirmationList.do")
	public String needConfirmationList(Model model) {
		//리스트 구하기 
		List<OrderDetailVO> vo_list = service.getNeedConfirmationList();
		log.debug("list: " + vo_list);

		//개수 구하기
		int count = vo_list.size();
		
		model.addAttribute("list", vo_list);
		model.addAttribute("count", count);
		return "/admin/page/needConfirmationList";
	}
	
	@PostMapping("confirmOrderDetail.do")
	public String confirmOrderDetail(@RequestParam int[] no) {
		log.debug("no: " + Arrays.toString(no));
		service.confirmOrderDetail(no);
		return "redirect:/admin/needConfirmationList.do";
	}
	
	@GetMapping("getSettlementReqList.do")
	public String getSettlementReqList(Model model) {
		List<SettlementVO> settlementReqList = service.getSettlementReqList();
		for(int i = 0; i < settlementReqList.size(); i++) {
			log.debug("bank_info " + i + " : " + settlementReqList.get(i).getBank());
		}
		model.addAttribute("settlementReqList", settlementReqList);
		model.addAttribute("paymentVO", new PaymentVO());
		return "/admin/page/settlementReqList";
	}
	
	@GetMapping("getSettlementComList.do")
	public String getSettlementComList(Model model) {
		List<SettlementVO> settlementComList = service.getSettlementComList();
		model.addAttribute("settlementComList", settlementComList);
		model.addAttribute("paymentVO", new PaymentVO());
		return "/admin/page/settlementComList";
	}
	
	@ResponseBody
	@GetMapping("updateSettlement.do")
	public String updateSettlement(Model model, HttpServletRequest request) {
		boolean res = false;
		if(request.getParameter("settlement_no") != null || ("").equals(request.getParameter("settlement_no"))) {
			int settlement_no = Integer.parseInt(request.getParameter("settlement_no"));
			res = service.updateSettlement(settlement_no);
		}
		return String.valueOf(res);
	}
	
	@ResponseBody
	@GetMapping("updateAllSettlement.do")
	public String updateAllSettlement(Model model, HttpServletRequest request, 
			@RequestParam(value="settlement_no",required=true) List<Integer> settlement_list) {
		boolean res = service.updateAllSettlement(settlement_list);
		return String.valueOf(res);
	}
	
	@GetMapping("/getWithdrawaledSellerList.do")
	public String getWithdrawaledSellerList(Model model) {
		
		List<SellerVO> beforeYear = service.getWithdrawalSellerBeforeYear();
		List<SellerVO> afterYear = service.getWithdrawalSellerAfterYear();
		log.debug("beforeYear: " + beforeYear);
		log.debug("afterYear: " + afterYear);
		model.addAttribute("beforeYear", beforeYear);
		model.addAttribute("afterYear", afterYear);
		return "/admin/page/withdrawalSellerList";
	}
	
	@GetMapping("/removeSeller.do")
	public String removeSeller(SellerVO svo) {
		service.removeSeller(svo.getNo());
		return "redirect:/admin/getWithdrawaledSellerList.do";
	}
	@GetMapping("/restoreSeller.do")
	public String restoreSeller(SellerVO svo) {
		service.restoreSeller(svo.getNo());
		return "redirect:/admin/getWithdrawaledSellerList.do";
	}
}
