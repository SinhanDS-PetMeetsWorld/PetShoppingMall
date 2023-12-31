package sinhanDS.first.project.user;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

//import static org.springframework.test.web.client.match.MockRestRequestMatchers.content;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;
import sinhanDS.first.project.order.vo.OrderDetailOptionVO;
import sinhanDS.first.project.order.vo.OrderDetailVO;
import sinhanDS.first.project.product.vo.ProductOptionVO;
import sinhanDS.first.project.product.vo.ProductSearchVO;
import sinhanDS.first.project.product.vo.ProductVO;
import sinhanDS.first.project.product.vo.ReviewVO;
import sinhanDS.first.project.user.vo.CartOptionVO;
import sinhanDS.first.project.user.vo.CartVO;
import sinhanDS.first.project.user.vo.PaymentVO;
import sinhanDS.first.project.user.vo.SaveBoxVO;
import sinhanDS.first.project.user.vo.UserAddressVO;
import sinhanDS.first.project.user.vo.UserVO;


@Controller
@RequestMapping("/user")
@Slf4j
public class UserController {
	@Autowired
	private UserService service;
	@Autowired
	private JavaMailSender javaMailSender;
	
	@GetMapping("/login.do")
	public String login() {
		return "user/login/login";
	}
	
	@PostMapping("/login.do")
	public String loginProcess(UserVO vo, HttpSession sess, Model model) {
		UserVO login = service.login(vo);
		
		if (login == null) { // 로그인 실패
			model.addAttribute("msg", "아이디 비밀번호가 올바르지 않습니다.");
			model.addAttribute("cmd", "back");
			return "common/alert";
		} else if (login.isRestricted() == true) { // 로그인 실패
			model.addAttribute("msg", "사용이 제한된 계정입니다. 사용하시려면 관리자에게 문의하십시오.");
			model.addAttribute("cmd", "back");
			return "common/alert";
		} else { // 로그인 성공
			sess.removeAttribute("sellerLoginInfo");
			sess.removeAttribute("adminLoginInfo");
			sess.setAttribute("userLoginInfo", login);
			return "redirect:/";
		}
	}
	
	@RequestMapping("/logout.do")
	public String logout(HttpSession sess) {
		sess.invalidate();
		return "redirect:/";
	}
	
	@GetMapping("/edit.do")
	public String edit(HttpSession sess, Model model) {
		UserVO vo = (UserVO)sess.getAttribute("userLoginInfo");
		model.addAttribute("vo", service.detail(vo));
		return "user/edit/user_info";
	}
	
	@GetMapping("/join.do")
	public String join() {
		return "user/login/join";
	}
	
	@PostMapping("/regist.do")
	public String user_regist(UserVO vo, Model model) {
		boolean r = service.user_regist(vo) > 0 ? true : false; // service -> mapper -> sql
		
		UserAddressVO addrvo = new UserAddressVO();
		addrvo.setUser_no(vo.getNo());
		addrvo.setZipcode(vo.getZipcode());
		addrvo.setAddr1(vo.getAddr1());
		addrvo.setAddr2(vo.getAddr2());
		addrvo.setName(vo.getName());
		addrvo.setPhone(vo.getPhone());
		boolean addrr = service.initaddr_regist(addrvo);
		
		if (r && addrr) { // 정상적으로 DB에 insert 
			model.addAttribute("cmd", "move");
			model.addAttribute("msg", "회원가입되었습니다.");
			model.addAttribute("url", "/user/login.do");
		} else { // 등록안됨
			model.addAttribute("cmd", "back");
			model.addAttribute("msg", "회원가입실패");
		}
		return "common/alert";
	}
	
	@ResponseBody
	@GetMapping("/idCheck.do")
	public String idCheck(@RequestParam String id) {
		boolean r = service.dupId(id);
		return String.valueOf(r);
	}
	
	@ResponseBody
	@PostMapping("/emailCheck.do")
	public String emailCheck(@RequestParam String email) {
		int checkNum = (int)(Math.random()*899999) + 100000;
        
		try {
	            MimeMessage message = javaMailSender.createMimeMessage();
	            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
	            
	            helper.setSubject("Pet Meets World의 이메일 인증 번호입니다.");
	            helper.setText(
	            		"이메일 인증 번호는 ["+checkNum+"] 입니다."+
	            		"이메일 인증 번호 입력 창에 입력하신 뒤, '이메일 인증하기' 버튼을 눌러주세요."
	            		);
	            helper.setFrom("meetsworldpet@gmail.com");
	            helper.setTo(email);
	            javaMailSender.send(message);
	    }catch(Exception e) {
	            e.printStackTrace();
	        }

        return Integer.toString(checkNum);
	}
	
	@PostMapping("/update.do")
	public String edit(UserVO vo, Model model) {
		
		int r = service.edit(vo);
		String msg = "";
		String url = "/user/edit.do";
		
		if (r > 0) {
			msg = "정상적으로 수정되었습니다.";
		} else {
			msg = "수정 오류";
		}
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		model.addAttribute("cmd","move");
		return "common/alert";
	}
	
	@GetMapping("/edit_addr.do")
	public String editaddr(HttpSession sess, Model model) {
		UserVO vo = (UserVO)sess.getAttribute("userLoginInfo");
		model.addAttribute("addressvo", service.exist_addr(vo));
		return "user/edit/user_addr";
	}
	
	@GetMapping("/add_addr_form.do")
	public String addaddr() {
		return "user/edit/user_add_addr_form";
	}
	
	@GetMapping("/modify_addr_form.do")
	public String modaddr(Model model, UserAddressVO vo) {
		model.addAttribute("vo", vo);
		return "user/edit/user_modify_addr_form";
	}
	
	@GetMapping("/insert_addr.do")
	public String insertaddr(HttpSession sess, Model model, UserAddressVO jspvo) {
		UserVO vo = (UserVO)sess.getAttribute("userLoginInfo");
			
		jspvo.setUser_no(vo.getNo());
		int r = service.insert_addr(jspvo);

		
		String msg = "";
		String url = "add_addr_form.do";
		
		if (r > 0) {
			msg = "정상적으로 추가되었습니다.";
		} else {
			msg = "주소추가 실패";
		}
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		model.addAttribute("cmd","finish");
		
		
		return "user/edit/alert";
	}
	
	@PostMapping("/modify_addr.do")
	public String modifyaddr(UserAddressVO jspvo, Model model, HttpSession sess) {
		UserVO vo = (UserVO)sess.getAttribute("userLoginInfo");
		
		jspvo.setUser_no(vo.getNo());
		
		String msg = "";
		String url = "add_addr_form.do";
		
		int r = service.modify_addr(jspvo);
		if (r > 0) {
			msg = "정상적으로 수정되었습니다.";
		} else {
			msg = "수정 오류";
		}
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		model.addAttribute("cmd","finish");
		return "user/edit/alert";
	}
	
	@GetMapping("/delete_addr.do")
	public String deleteaddr(Model model, UserAddressVO jspvo) {
		
		int r = service.delete_addr(jspvo.getNo());
		if(r < 1) {
			model.addAttribute("msg", "삭제되지 않았습니다.");
			model.addAttribute("cmd", "back");
		} else if(r == 1) {
			model.addAttribute("msg", "삭제 완료");
			model.addAttribute("cmd", "move");
			model.addAttribute("url", "/user/edit_addr.do");
		}

		return "common/alert";
	}
	
	@GetMapping("/edit_payment.do")
	public String editpayment(HttpSession sess, Model model) {
		UserVO vo = (UserVO)sess.getAttribute("userLoginInfo");
		model.addAttribute("paymentvo", service.exist_payment(vo));
		return "user/edit/user_payment";
	}
	
	
	
	
	
	@GetMapping("/add_payment_form.do")
	public String addpayment(Model model) {
		PaymentVO vo = new PaymentVO();
		model.addAttribute("vo", vo);
		return "user/edit/user_add_payment_form";
	}
	
	@GetMapping("/insert_payment.do")
	public String insertpayment(HttpSession sess, Model model, PaymentVO payvo) {
		UserVO vo = (UserVO)sess.getAttribute("userLoginInfo");
			
		payvo.setUser_no(vo.getNo());
		int r = service.insert_payment(payvo);

		
		String msg = "";
		String url = "add_payment_form.do";
		
		if (r > 0) {
			msg = "정상적으로 추가되었습니다.";
		} else {
			msg = "결제수단 추가 실패";
		}
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		model.addAttribute("cmd","finish");
		
		
		return "user/edit/alert";
	}
	
	@PostMapping("/modify_payment.do")
	public String modifypayment(PaymentVO payvo, Model model, HttpSession sess) {
		UserVO vo = (UserVO)sess.getAttribute("userLoginInfo");
		
		payvo.setUser_no(vo.getNo());
		
		String msg = "";
		String url = "add_payment_form.do";
		
		int r = service.modify_payment(payvo);
		if (r > 0) {
			msg = "정상적으로 수정되었습니다.";
		} else {
			msg = "수정 오류";
		}
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		model.addAttribute("cmd","finish");
		return "user/edit/alert";
	}
	
	@GetMapping("/modify_payment_form.do")
	public String modpayment(Model model, PaymentVO vo) {
		model.addAttribute("vo", vo);
		return "user/edit/user_modify_payment_form";
	}
	
	
	
	
	
	
	@GetMapping("/delete_payment.do")
	public String deletepayment(Model model, PaymentVO payvo) {
		
		int r = service.delete_payment(payvo.getNo());
		if(r < 1) {
			model.addAttribute("msg", "삭제되지 않았습니다.");
			model.addAttribute("cmd", "back");
		} else if(r == 1) {
			model.addAttribute("msg", "삭제 완료");
			model.addAttribute("cmd", "move");
			model.addAttribute("url", "/user/edit_payment.do");
		}

		return "common/alert";
	}
	
	@GetMapping("/list_user_cart.do")
	public String list_cart(Model model, HttpSession sess) {
		UserVO vo = (UserVO)sess.getAttribute("userLoginInfo");
		
		
		//현재 세션에 로그인된 유저의 모든 장바구니를 모델에 담음
		List<CartVO> cartvolist = service.exist_cart(vo);
		model.addAttribute("cartvolist", cartvolist);
		
		List<List<CartOptionVO>> cartop = service.cart_option_number(cartvolist);
		model.addAttribute("cartoptionvolist", cartop);
		
		List<List<ProductOptionVO>> provopt = service.get_product_option(cartop);
		model.addAttribute("optionlist", service.get_product_option(cartop));
		
		List<ProductVO> prov = service.search_cart_product(cartvolist);
		model.addAttribute("productvolist", service.search_cart_product(cartvolist));
		
		
		return "user/cart/user_cart";
		
	}
	
	// (신정훈) 찜 리스트 구현 12 - 18
	@GetMapping("/list_user_zzim.do")
	public String list_zzim(Model model , HttpSession sess , UserVO uvo , ProductVO prvo , SaveBoxVO savo, ProductSearchVO svo){
		UserVO login = (UserVO)sess.getAttribute("userLoginInfo");
		int user_no = login.getNo();
		svo.setUser_no(user_no);
		svo.setNumberOfProductInPage(svo.getNumberInPage_zzim());
		
		int count = service.getNumberOfZZIMPage(svo);
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
        
        
        
		List<SaveBoxVO> zzim_list = service.zzim_list(svo);
		List<ProductVO> product_list = service.getProductListWithProductSearchVO(zzim_list, svo);
		
		List<List<String>> save_list2 = new ArrayList<List<String>>();	
		
		if (zzim_list.size() != 0) {
			
			// 테이블 매핑
			for (int i = 0; i < zzim_list.size(); i++ ) {
			List<String> save_list = new ArrayList<String>();
			
				save_list.add(String.valueOf(product_list.get(i).getImage_url())); // 상품 이미지 0
				save_list.add(String.valueOf(product_list.get(i).getName())); // 상품 명 1
				save_list.add(String.valueOf(product_list.get(i).getDescription())); // 상품 설명 2
				save_list.add(String.valueOf(product_list.get(i).getPrice())); // 상품 가격 3
				save_list.add(String.valueOf(product_list.get(i).getNo())); // 싱품 번호 4
				
				save_list.add(String.valueOf(login.getNo())); // 유저 번호 6 
				
				save_list2.add(save_list);
				
				}
		}
			
		model.addAttribute("save_list2" , save_list2);
		
		return "user/zzim/zzim_box";
	}
	
	// (신정훈) 작성한 리뷰 리스트 구현 12 - 19
	@GetMapping("/list_user_review.do")
	public String possible_write_review(Model model, HttpSession sess, ProductSearchVO svo , UserVO uvo , ReviewVO revo , ProductOptionVO povo , OrderDetailVO odvo , OrderDetailOptionVO odovo){
		UserVO login = (UserVO)sess.getAttribute("userLoginInfo");
		int user_no = login.getNo();
		svo.setUser_no(user_no);
		svo.setNumberOfProductInPage(svo.getNumberInPage_reviewList());
		log.debug("sorttype: " + svo.getSorttype());
		int count = service.getNumberOfReviewPage(svo);
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
		 
		List<ReviewVO> review_list = service.review_list(svo);
		
	    List<OrderDetailVO> order_detail = service.order_detail(odvo);

		List<List<String>> review_list2 = new ArrayList<List<String>>();	
		
		if (review_list.size() != 0) {
			
			// 테이블 매핑
			for (int i = 0; i < review_list.size(); i++ ) {
			List<String> review_list1 = new ArrayList<String>();
			
				review_list1.add(String.valueOf(review_list.get(i).getImage_url())); // 이미지 0
			
				// 상품 이름 매핑
				for (int k = 0; k < order_detail.size(); k++) {
					if (review_list.get(i).getOrder_dno() == order_detail.get(k).getNo()) { // order_detail의 주문 상세 번호와 매핑
						
						review_list1.add(String.valueOf(order_detail.get(k).getNo())); // 주문 상세 번호 1 dno
						review_list1.add(String.valueOf(order_detail.get(k).getProduct_name())); // 상품 명 2
						review_list1.add(String.valueOf(order_detail.get(k).getProduct_price())); // 상품 가격 3 
					}
				}	
				
				review_list1.add(String.valueOf(review_list.get(i).getContent())); // 내용 4
				review_list1.add(String.valueOf(review_list.get(i).getProduct_no())); // 제품 번호 5				
				review_list1.add(String.valueOf(review_list.get(i).getWrite_date())); // 작성일 6
				review_list1.add(String.valueOf(review_list.get(i).getRating())); // 평점 7
				review_list1.add(String.valueOf(review_list.get(i).getProduct_no())); // 상품 번호 8
				
				review_list2.add(review_list1);
				
			}
			model.addAttribute("review_list2" , review_list2);
		}
		return "user/review/review_list";
	}

		// (신정훈) 리뷰 등록 가능 리스트 구현 12 - 19
	@GetMapping("/possible_write_review.do")
	public String list_review(Model model , HttpSession sess, ProductSearchVO svo , UserVO uvo , ReviewVO revo , ProductOptionVO povo , OrderDetailVO odvo , OrderDetailOptionVO odovo){
		UserVO login = (UserVO)sess.getAttribute("userLoginInfo");
		int user_no = login.getNo();
		svo.setUser_no(user_no);
		svo.setNumberOfProductInPage(svo.getNumberInPage_reviewList());
		log.debug("sorttype: " + svo.getSorttype());
		int count = service.getNumberOfWritableReviewPage(svo);
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
			
			
		List<OrderDetailVO> possible_write_review = service.possible_write_review(svo);
	    
		List<String> product_image_list = service.product_image_list(possible_write_review);
		
		
		List<List<String>> possible_write_review2 = new ArrayList<List<String>>();	
		
		
		if (possible_write_review.size() != 0) {
			
			for (int i = 0; i < possible_write_review.size(); i++ ) {
			List<String> possible_write_review1 = new ArrayList<String>();
				
				possible_write_review1.add(String.valueOf(product_image_list.get(i))); // 상품 이미지 0 
				possible_write_review1.add(String.valueOf(possible_write_review.get(i).getNo())); // 주문번호 1
				possible_write_review1.add(String.valueOf(possible_write_review.get(i).getProduct_name())); // 상품명 2
				possible_write_review1.add(String.valueOf(possible_write_review.get(i).getProduct_price())); // 상품 가격 3 
				possible_write_review1.add(String.valueOf(possible_write_review.get(i).getPurchase_confirmation_date())); // 구매 확정 일자 4
				possible_write_review1.add(String.valueOf(possible_write_review.get(i).getProduct_no())); // 상품 번호 5 
				possible_write_review2.add(possible_write_review1);
				
			}
			model.addAttribute("possible_write_review2" , possible_write_review2);	
		}
		return "user/review/possible_write_review";
	}
	
	@GetMapping("/findIdPage.do")
	public String findIdPage() {
		return "user/login/findId";
	}
	
	@GetMapping("/findPwdPage.do")
	public String findPwdPage() {
		return "user/login/findPwd";
	}
	
	@PostMapping("/findId.do")
	public String findId(UserVO vo, Model model) {
		UserVO foundID = service.findId(vo);
		if(foundID != null) {
			try {
	            MimeMessage message = javaMailSender.createMimeMessage();
	            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
	            
	            helper.setSubject("Pet Meets World 고객님의 ID 전달드립니다.");
	            helper.setText("회원님의 ID는 [ "+foundID.getId()+" ] 입니다. 해당 ID로 로그인을 진행해주세요.");
	            helper.setFrom("meetsworldpet@gmail.com");
	            helper.setTo(vo.getEmail());
	            javaMailSender.send(message);
	            
	            model.addAttribute("cmd", "move");
				model.addAttribute("msg", "이메일로 ID를 전송했습니다. 로그인을 진행해주세요.");
				model.addAttribute("url", "/user/login.do");
			}catch(Exception e) {
	            e.printStackTrace();
	        }
		} else {
            model.addAttribute("cmd", "back");
			model.addAttribute("msg", "문제가 발생했습니다. 입력하신 성함과 이메일 주소가 올바른지 다시 확인하시고,"
					+ " 동일한 문제가 반복해서 발생 시 페이지 하단에 기입된 연락처로 관리자에게 문의해주세요.");
			model.addAttribute("url", "/user/findIdPage.do");
		}
		return "common/alert";
	}
	
	@PostMapping("/findPwd.do")
	public String findPwd(UserVO vo, Model model) {
		
		int checkNum = (int)(Math.random()*899999) + 100000;
		vo.setPassword(String.valueOf(checkNum));
		
		int temp = service.findPwd(vo);
		
		if(temp > 0) {
			try {
	            MimeMessage message = javaMailSender.createMimeMessage();
	            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
	            
	            helper.setSubject("Pet Meets World 고객님의 임시 비밀번호 전달드립니다.");
	            helper.setText("회원님의 임시 비밀번호는 [ "+checkNum+" ] 입니다. 해당 비밀번호로 로그인을 진행해주세요./n"
	            		+"로그인 후 개인정보 보호를 위해 새로운 비밀번호로 변경을 권장합니다.");
	            helper.setFrom("meetsworldpet@gmail.com");
	            helper.setTo(vo.getEmail());
	            javaMailSender.send(message);
	            
	            model.addAttribute("cmd", "move");
				model.addAttribute("msg", "이메일로 임시 비밀번호를 전송했습니다. 로그인을 진행해주세요.");
				model.addAttribute("url", "/user/login.do");
			}catch(Exception e) {
	            e.printStackTrace();
	        }
		} else {
            model.addAttribute("cmd", "back");
			model.addAttribute("msg", "문제가 발생했습니다. 입력하신 성함과 id, 이메일 주소가 올바른지 다시 확인하시고,"
					+ " 동일한 문제가 반복해서 발생 시 페이지 하단에 기입된 연락처로 관리자에게 문의해주세요.");
			model.addAttribute("url", "/user/findPwdPage.do");
		}
		return "common/alert";
	}
	
	@GetMapping("/withdrawal.do")
	public String withdrawal(Model model, HttpSession sess) {
		UserVO vo = (UserVO)sess.getAttribute("userLoginInfo");
		String msg = "";
		String url = "/user/afterwithdrawal.do";
		int r = service.withdrawal(vo.getNo());
		if (r > 0) {
			msg = "계정이 삭제되었습니다.";
			model.addAttribute("cmd","move");
		} else {
			msg = "계정 삭제 실패";
			model.addAttribute("cmd","back");
		}
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		return "common/alert";
	}
	@GetMapping("afterwithdrawal.do")
	public String afterwithdrawal(HttpSession sess) {
		sess.invalidate();
		return "redirect:/";
	}
}