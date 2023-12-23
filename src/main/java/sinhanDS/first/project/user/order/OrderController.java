package sinhanDS.first.project.user.order;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.slf4j.Slf4j;
import sinhanDS.first.project.order.vo.OrderDetailOptionVO;
import sinhanDS.first.project.order.vo.OrderDetailVO;
import sinhanDS.first.project.order.vo.OrderMainVO;
import sinhanDS.first.project.product.vo.ProductOptionVO;
import sinhanDS.first.project.product.vo.ProductSearchVO;
import sinhanDS.first.project.product.vo.ProductVO;
import sinhanDS.first.project.product.vo.ReviewVO;
import sinhanDS.first.project.seller.product.SellerProductService;
import sinhanDS.first.project.seller.vo.SellerVO;
import sinhanDS.first.project.user.UserService;
import sinhanDS.first.project.user.product.ProductService;
import sinhanDS.first.project.user.vo.CartOptionVO;
import sinhanDS.first.project.user.vo.CartVO;
import sinhanDS.first.project.user.vo.PaymentVO;
import sinhanDS.first.project.user.vo.UserVO;


@Controller
@RequestMapping("/user/order")
@Slf4j
public class OrderController {
	@Autowired
	private ProductService productService;
	@Autowired
	private OrderService orderService;
	@Autowired
	private UserService userService;
	@Autowired
	private SellerProductService sellerProductService;
	
	@PostMapping("buy_now.do")
	public String buy_now(HttpSession sess, Model model, HttpServletRequest request, 
			@RequestParam(value="option_no",required=false) List<String> optionno_list,
			CartVO cartvo, CartOptionVO cartoptionvo , @RequestParam(value="choose_number") int quantity) {
		log.debug("optionno_list: " + optionno_list);
		log.debug("cartvo: " + cartvo);
		log.debug("optionno_list: " + optionno_list);
		log.debug("quantity: " + quantity);
		
		int price = orderService.setPrice(cartvo.getProduct_no(), optionno_list, quantity);
		log.debug("price: " + price);
		
		UserVO uvo = (UserVO)sess.getAttribute("userLoginInfo");
		log.debug("user_no: " + uvo.getNo());
		
		int temp_cart_no = orderService.cart_insert(cartvo).getNo();
		if(optionno_list != null) {
			cartoptionvo.setCart_no(cartvo.getNo());

			if(temp_cart_no>0) {
				for(int i=0; i<optionno_list.size(); i++){
					cartoptionvo.setOption_no(Integer.parseInt(optionno_list.get(i)));
					productService.cart_option_insert(cartoptionvo);
				}
			}
		}
		
		ProductOptionVO ovo = new ProductOptionVO();
		if(optionno_list != null) {
			int[] option_no = new int[optionno_list.size()];
			int[] option_cart_no = new int[optionno_list.size()];
			if(optionno_list.size() != 0) {
				for(int i = 0; i < option_no.length; i++) {
					option_no[i] = Integer.valueOf(optionno_list.get(i));
					option_cart_no[i] = temp_cart_no;
				}
			}
			ovo.setNo_list(option_no);
			log.debug("option_no: " + Arrays.toString(option_no));
			model.addAttribute("option_cart_no", option_cart_no);
			model.addAttribute("option_no", option_no);
			log.debug("option_cart_no: " + Arrays.toString(option_cart_no));
			log.debug("option_no: " + Arrays.toString(option_no));
		}
		
		int[] cart_no = new int[] {temp_cart_no};
		int[] quantity_list = new int[] {quantity};
		int delivery_price = 2500;
		int total_price = price;
		
		CartVO cvo = new CartVO();
		cvo.setCart_no_list(cart_no);
		log.debug("cvo: " + cvo);
		cvo.setQuantity_list(quantity_list);
		log.debug("quantity: " + Arrays.toString(quantity_list) );
		
		uvo.setNo(uvo.getNo());
		
		
		OrderMainVO orderVO = new OrderMainVO();
		orderVO.setTotal_price(total_price);
		orderVO.setTotal_delivery_fee(delivery_price);
		/* 리스트 들어오기 전 임시 끝*/
		
		model.addAttribute("userno", uvo.getNo());
		model.addAttribute("userAddressList", userService.exist_addr(uvo));
		model.addAttribute("userPaymentList", userService.exist_payment(uvo));
		model.addAttribute("orderVO", orderVO);
		
		
		/*cart no는 결제가 끝나고 지울 것이기 때문에 cart_no만 넘어가도 된다.*/
		model.addAttribute("cno_list", cvo.getCart_no_list());
		
		log.debug("cart_no: " + cart_no);
		List<ProductVO> product_list = orderService.getProductListByCartNoList(cart_no);
		model.addAttribute("product_list", product_list);
		log.debug("product_list: " + product_list);
		model.addAttribute("quantity_list", cvo.getQuantity_list());
		
		List<ProductOptionVO> option_list = orderService.getOptionList(ovo.getNo_list());
		model.addAttribute("option_list", option_list);
		log.debug("option_list: " + option_list);
		
		model.addAttribute("cart_no", cart_no);
		log.debug("cart_no: " + Arrays.toString(cart_no));
		
		model.addAttribute("paymentVO", new PaymentVO());
		return "user/order/pay";
	}
	/* TODO: 리스트가 들어온 후에는 갯수가 얼마나 길어질지 모르니 POSTMAPPING으로 바꿔야한다*/
	@PostMapping("pay.do")
	public String pay(Model model, @RequestParam int[] cart_no, 
					@RequestParam int[] quantity_list ,@RequestParam int delivery_price, 
					@RequestParam int total_price, @RequestParam int[] cart_user_no, 
					@RequestParam(required=false) int[] option_no, @RequestParam(required=false) int[]option_cart_no) {
		log.debug("실행은 되나? ");
		log.debug("cart_no2: " + cart_no);
		log.debug("delfee: " + delivery_price);
		log.debug("cart_no2: " + Arrays.toString(cart_no));
		
		CartVO cvo = new CartVO();
		cvo.setCart_no_list(cart_no);
		log.debug("cvo: " + cvo);
		cvo.setQuantity_list(quantity_list);
		log.debug("quantity: " + Arrays.toString(quantity_list) );
		
		UserVO uvo = new UserVO();
		uvo.setNo(cart_user_no[0]);
		
		ProductOptionVO ovo = new ProductOptionVO();
		ovo.setNo_list(option_no);
		log.debug("option_no: " + Arrays.toString(option_no));
		
		OrderMainVO orderVO = new OrderMainVO();
		orderVO.setTotal_price(total_price);
		orderVO.setTotal_delivery_fee(delivery_price);
		/* 리스트 들어오기 전 임시 끝*/
		
		model.addAttribute("userno", uvo.getNo());
		model.addAttribute("userAddressList", userService.exist_addr(uvo));
		model.addAttribute("userPaymentList", userService.exist_payment(uvo));
		model.addAttribute("orderVO", orderVO);
		
		
		/*cart no는 결제가 끝나고 지울 것이기 때문에 cart_no만 넘어가도 된다.*/
		model.addAttribute("cno_list", cvo.getCart_no_list());
		
		log.debug("cno_list: " + Arrays.toString(cvo.getCart_no_list()) );
		
		List<ProductVO> product_list = orderService.getProductListByCartNoList(cvo.getCart_no_list());
		model.addAttribute("product_list", product_list);
		log.debug("product_list: " + product_list);
		model.addAttribute("quantity_list", cvo.getQuantity_list());
		
		List<ProductOptionVO> option_list = orderService.getOptionList(ovo.getNo_list());
		model.addAttribute("option_list", option_list);
		log.debug("option_list: " + option_list);
		
		model.addAttribute("cart_no", cart_no);
		model.addAttribute("option_cart_no", option_cart_no);
		model.addAttribute("option_no", option_no);
		log.debug("cart_no: " + Arrays.toString(cart_no));
		log.debug("option_cart_no: " + Arrays.toString(option_cart_no));
		log.debug("option_no: " + Arrays.toString(option_no));
		
		model.addAttribute("paymentVO", new PaymentVO());
		return "user/order/pay";
	}
	
	@PostMapping("buy.do")
	public String pay_process(HttpServletRequest request, Model model, 
			@RequestParam int user_no,
			@RequestParam int[] product_no, 
			@RequestParam int[] cart_no,
			@RequestParam(required=false) int[] option_no,
			@RequestParam(required=false) int[] option_cart_no,
			@RequestParam int[] quantity, OrderMainVO mvo) {
		
		log.debug("buy.do시작");
		log.debug("user_no: " + user_no);
		log.debug("product_no: " + Arrays.toString(product_no));
		log.debug("cart_no: " + Arrays.toString(cart_no));
		log.debug("option_no: " + Arrays.toString(option_no));
		log.debug("option_cart_no: " + Arrays.toString(option_cart_no));
		log.debug("quantity: " + Arrays.toString(quantity));
		log.debug("mvo: " + mvo);
		/*TODO: 나중에 인터셉터 달면 uvo를 인터셉터에서 가져온 걸로 바꿔주기 */
		UserVO uvo = new UserVO();
		uvo.setNo(user_no);
		mvo.setUser_no(uvo.getNo());
		mvo.setUser_name(userService.detail(uvo).getName());
		mvo.setUser_phone(userService.detail(uvo).getPhone());
		log.debug(null);
		
		List<ProductVO> productList = orderService.getProductListByProductNoList(product_no);
		mvo = orderService.setOrderName(mvo, productList.get(0).getName(), productList.size());
		orderService.registOrderMain(mvo);
		
		List<ProductOptionVO> option_list = orderService.getOptionList(option_no);
		List<OrderDetailVO> detailList = orderService.makeOrderDetailList(mvo, productList, quantity, cart_no, option_cart_no, option_list);
		orderService.registOrderDetail(detailList);
		orderService.registOrderDetailOption(option_list, detailList, cart_no, option_cart_no);

		
		log.debug("cart_no: " + Arrays.toString(cart_no));
		log.debug("option_cart_no: " + Arrays.toString(option_cart_no));
		log.debug("productList: " + productList);
		log.debug("optionList체크: " + option_list);
		log.debug("detailList: " + detailList);
		
		int k = orderService.delete_buyed_option(option_no);
		if(k==1) {
			System.out.println("카트옵션 삭제됨");
		} else {
			System.out.println("옵션삭제안됨");
		}
		
		int r = orderService.delete_buyed_cart(cart_no);
		
		if(r==1) {
			System.out.println("카트상품 삭제됨");
		} else {
			alert("카트상품 삭제안됨");
		}
		return "redirect:/user/order/success.do";
	}
	private void alert(String string) {}

	@GetMapping("success.do")
	public String payementSuccess() {
		return "user/order/success";
	}
	@GetMapping("list.do")
	public String list(Model model, HttpSession sess, ProductSearchVO svo) {
		UserVO vo = (UserVO)sess.getAttribute("userLoginInfo");
		svo.setUser_no(vo.getNo());
		
		int count = orderService.getNumberOfPage(svo);
		log.debug("count: " + count);
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
        

		List<OrderMainVO> orderList = orderService.getOrderListNotDeleted(svo);
		log.debug("orderList: " + orderList);
		model.addAttribute("orderList", orderList);
		return "user/order/orderMainList";
	}
	
	@GetMapping("removeThisOrder.do")
	public String removeThisOrder(OrderMainVO mvo) {
		log.debug("mvo:체크: " + mvo);
		orderService.updateOrderMainToDeleted(mvo);
		return "redirect:/user/order/list.do";
	}
	
	@GetMapping("purchaseConfirmByOrderMainNo.do")
	public String purchaseConfirmByOrderMainNo(OrderMainVO mvo) {
		List<OrderDetailVO> detailList = orderService.getOrderDetailList(mvo);
		for(OrderDetailVO vo : detailList) {
			orderService.purchaseConfirm(vo);
		}
		/* TODO 마지막으로 해야할게 일괄구매를 하면 일괄구매 확정을 또 못누르게한느거 */
		return "redirect:/user/order/orderMainList.do";
	}
	
	@GetMapping("seeOrderDetail.do")
	public String seeOrderDetail(Model model, OrderMainVO mvo) {
		log.debug("mvo: " + mvo);
		List<OrderDetailVO> dvo_list = orderService.getOrderDetailList(mvo);
		log.debug("dvo_list: " + dvo_list);
		List<List<OrderDetailOptionVO>> ovo_list = orderService.getOrderDetailOptionList(dvo_list);
		log.debug("ovo_list: " + ovo_list);
		List<String> img_list = orderService.getImageList(dvo_list);
		log.debug("img_list: " + img_list);
		List<Integer> review_list = orderService.getReviewStatus(dvo_list);
		log.debug("review_list: ", review_list);
		model.addAttribute("dvo_list", dvo_list);
		model.addAttribute("ovo_list", ovo_list);
		model.addAttribute("img_list", img_list);
		model.addAttribute("review_list", review_list);
		
		return "/user/order/detail";
	}
	
	@GetMapping("purchase_confirm.do")
	public String purchaseConfirm(OrderDetailVO dvo) {
		log.debug("구매확정 dvo:" + dvo);
		orderService.purchaseConfirm(dvo);
		return "redirect:/user/order/seeOrderDetail.do?no="+dvo.getOrder_no();
	}
	
	@GetMapping("request_cancle.do")
	public String request_cancle(OrderDetailVO dvo) {
		return "/user/order/cancle_format";
	}
	@PostMapping("request_cancle.do")
	public String do_request_cancle(OrderDetailVO dvo, HttpServletResponse response) {
		orderService.cancle(dvo);
		return "common/reloadParent";
	}
	
	@GetMapping("request_refound.do")
	public String request_refound(Model model, OrderDetailVO dvo) {
		//판매자 주소
		SellerVO svo = orderService.getSellerInfo(dvo);
		log.debug("svo체크: " + svo);
		model.addAttribute("svo", svo);
		return "/user/order/refound_format";
	}
	@PostMapping("request_refound.do")
	public String do_request_refound(OrderDetailVO dvo, HttpServletResponse response) {
		orderService.refound(dvo);
		return "common/reloadParent";
	}
	
	@GetMapping("refound_info.do")
	public String request_info(Model model, OrderDetailVO dvo) {
		log.debug("dvo :" + dvo);
		String reason = orderService.getReason(dvo);
		
		SellerVO svo = orderService.getSellerInfo(dvo);
		model.addAttribute("reason", reason);
		model.addAttribute("svo", svo);
		return "/user/order/refound_info";
	}
	
	@GetMapping("write_review.do")
	public String write_review(Model model, HttpServletRequest request, OrderDetailVO dvo) {
		log.debug("dvo: " + dvo);
		dvo = orderService.getFullOrderDetailVO(dvo);
		
		
		System.out.println("이게 뭐지?? " + dvo);
		
		model.addAttribute("dvo", dvo);
		return "/user/order/write_review";
	}
	
	@PostMapping("write_review.do")
	public String do_write_review(HttpServletRequest request, @RequestParam MultipartFile filename, ReviewVO rvo, OrderDetailVO dvo) {
		log.debug(filename.getName());
		if (filename != null) {
			rvo = orderService.upload_file(filename, rvo);
		}
		UserVO uvo = (UserVO)request.getSession().getAttribute("userLoginInfo");
		rvo.setUser_no(uvo.getNo());
		orderService.updateProductRating(rvo);
		orderService.registReview(rvo);
		return "common/reloadParent";
	}
	
	@GetMapping("read_review.do")
	public String read_review(Model model, OrderDetailVO dvo) {
		ReviewVO rvo = orderService.getReview(dvo.getNo());
		model.addAttribute("rvo", rvo);
		log.debug("출력 rvo: " + rvo);
		return "/user/order/read_review";
	}
	
	@GetMapping("modify_quantity.do")
	public String modify_quantity(Model model, @RequestParam int cart_no_table, @RequestParam int quantity) {
		
		System.out.println("수량수정 카트" + cart_no_table);
		System.out.println("수량수정 양" + quantity);
		
		CartVO vo = new CartVO();
		vo.setNo(cart_no_table);
		vo.setQuantity(quantity);
		
		int r = orderService.update_cart_quantity(vo);
		
		if (r == 1) {
			System.out.println("수정완");
		} else {
			System.out.println("수정안댐");
		}
		
		
		return "/user/cart/user_cart";
	}
	
	@GetMapping("delete_cart.do")
	public String delete_cart(Model model, int no/* 카트 no 넘겨받고, 옵션no 리스트 넘겨받음*/){
		orderService.delete_cart_option(no);
		orderService.delete_cart_product(no);
		
		return "redirect:/user/list_user_cart.do";
	}
}