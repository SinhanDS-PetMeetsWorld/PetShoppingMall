package sinhanDS.first.project.user;

import java.util.ArrayList;
import java.util.List;

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

import sinhanDS.first.project.order.vo.OrderDetailOptionVO;
import sinhanDS.first.project.order.vo.OrderDetailVO;
import sinhanDS.first.project.product.vo.ProductOptionVO;
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
		System.out.println(checkNum);
        
		try {
	            MimeMessage message = javaMailSender.createMimeMessage();
	            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
	            
	            helper.setSubject("Pet Meets World의 이메일 인증 번호입니다.");
	            helper.setText(
	            		"이메일 인증 번호는 ["+checkNum+"] 입니다."+
	            		"회원가입 화면으로 돌아가 이메일 인증 번호 입력 창에 입력하신 뒤, '이메일 인증하기' 버튼을 눌러주세요."
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
		System.out.println("전송 : " + vo);
		
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
		System.out.println(jspvo);		// 현재 로그인한 유저의 no가 들어간 주소VO객체
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
		System.out.println(model);
		return "user/edit/user_add_payment_form";
	}
	
	@GetMapping("/insert_payment.do")
	public String insertpayment(HttpSession sess, Model model, PaymentVO payvo) {
		UserVO vo = (UserVO)sess.getAttribute("userLoginInfo");
			
		payvo.setUser_no(vo.getNo());
		System.out.println(payvo);		// 현재 로그인한 유저의 no가 들어간 PaymentVO객체
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
		System.out.println("페이페이 : " + payvo);
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
		System.out.println("카트VO 리스트" + cartvolist);
		
		List<List<CartOptionVO>> cartop = service.cart_option_number(cartvolist);
		model.addAttribute("cartoptionvolist", cartop);
		System.out.println("카트옵션VO 리스트 : " + cartop);
		
		List<List<ProductOptionVO>> provopt = service.get_product_option(cartop);
		model.addAttribute("optionlist", service.get_product_option(cartop));
		System.out.println("프로덕트옵션VO 리스트: " + provopt);
		
		List<ProductVO> prov = service.search_cart_product(cartvolist);
		model.addAttribute("productvolist", service.search_cart_product(cartvolist));
		System.out.println("상품VO 리스트 : " + prov);
		
		
		return "user/cart/user_cart";
		
	}
	
	// (신정훈) 찜 리스트 구현 12 - 18
	@GetMapping("/list_user_zzim.do")
	public String list_zzim(Model model , HttpSession sess , UserVO uvo , ProductVO prvo , SaveBoxVO savo){
		
		UserVO login = (UserVO)sess.getAttribute("userLoginInfo");
		int user_no = login.getNo();
		
		List<SaveBoxVO> zzim_list = service.zzim_list(user_no);
		List<UserVO> user_list = service.user_list(user_no);
		List<ProductVO> product_list = service.product_list(savo.getProduct_no());
		
		List<List<String>> save_list2 = new ArrayList<List<String>>();	
		
		if (zzim_list.size() != 0) {
			
			// 테이블 매핑
			for (int i = 0; i < zzim_list.size(); i++ ) {
			List<String> save_list = new ArrayList<String>();
			
				// 상품 정보 구하기
				for (int k = 0; k < product_list.size(); k++) {
					if (zzim_list.get(i).getProduct_no() == product_list.get(k).getNo()) {
						save_list.add(String.valueOf(product_list.get(k).getImage_url())); // 상품 이미지 1
						save_list.add(String.valueOf(product_list.get(k).getName())); // 상품 명 2
						save_list.add(String.valueOf(product_list.get(k).getDescription())); // 상품 설명 3
						save_list.add(String.valueOf(product_list.get(k).getPrice())); // 상품 가격 4
						save_list.add(String.valueOf(product_list.get(k).getNo())); // 싱품 번호 5
					}
				}
				// 유저 번호 구하기
				for(int j = 0; j < user_list.size(); j++) {
					if(zzim_list.get(i).getUser_no() == user_list.get(j).getNo()) {
						save_list.add(String.valueOf(user_list.get(j).getNo())); // 유저 번호 6 
					}
				}
				
				save_list2.add(save_list);
				System.out.println("세이블 2" + save_list2);
				
				}
		}
			
		model.addAttribute("save_list2" , save_list2);
		
		return "user/zzim/zzim_box";
	}
	
	// (신정훈) 작성 가능 리뷰 리스트 구현 12 - 19
	@GetMapping("/list_user_review.do")
	public String possible_write_review(Model model , HttpSession sess , UserVO uvo , ReviewVO revo , ProductOptionVO povo , OrderDetailVO odvo , OrderDetailOptionVO odovo){
			
		UserVO login = (UserVO)sess.getAttribute("userLoginInfo");
		int user_no = login.getNo();
		 
		List<ReviewVO> review_list = service.review_list(user_no);
		System.out.println("리뷰 리스트 " +  review_list);	
		
	    List<OrderDetailVO> order_detail = service.order_detail(odvo);
	    System.out.println("오더 디테일" + order_detail);

		List<List<String>> review_list2 = new ArrayList<List<String>>();	
		
		if (review_list.size() != 0) {
			
			// 테이블 매핑
			for (int i = 0; i < review_list.size(); i++ ) {
			List<String> review_list1 = new ArrayList<String>();
			
			
				review_list1.add(String.valueOf(review_list.get(i).getImage_url())); // 이미지 0
			
			
				// 상품 이름 매핑
				for (int k = 0; k < order_detail.size(); k++) {
					if ( review_list.get(i).getProduct_no() == order_detail.get(k).getProduct_no() &&
						 review_list.get(i).getOrder_no() == order_detail.get(k).getOrder_no()){
						review_list1.add(String.valueOf(order_detail.get(k).getProduct_name())); // 상품 명 1
						review_list1.add(String.valueOf(order_detail.get(k).getProduct_price())); // 상품 가격 2 
					}
				}
				
				
				review_list1.add(String.valueOf(review_list.get(i).getContent())); // 내용 3 
				review_list1.add(String.valueOf(review_list.get(i).getProduct_no())); // 제품 번호 4					
				review_list1.add(String.valueOf(review_list.get(i).getWrite_date())); // 작성일 5
				review_list1.add(String.valueOf(review_list.get(i).getRating())); // 평점 6
				
				review_list2.add(review_list1);
				}
				
				System.out.println("오늘 폼 미쳤다 2" + review_list2);
		
		}
		model.addAttribute("review_list2" , review_list2);	
		return "user/review/review_list";
}

		// (신정훈) 리뷰 리스트 구현 12 - 19
	@GetMapping("/possible_write_review.do")
	public String list_review(Model model , HttpSession sess , UserVO uvo , ReviewVO revo , ProductOptionVO povo , OrderDetailVO odvo , OrderDetailOptionVO odovo){
			
			UserVO login = (UserVO)sess.getAttribute("userLoginInfo");
			int user_no = login.getNo();
			
			List<OrderDetailVO> possible_write_review = service.possible_write_review(user_no);
		    System.out.println("오더 디테일" + possible_write_review); 
			
		    List<ReviewVO> review_list = service.review_list(user_no);
			System.out.println("리뷰 리스트 " +  review_list);	
			
			List<ProductVO> product_list = service.product_list(user_no);
			
			
			
			List<List<String>> possible_write_review2 = new ArrayList<List<String>>();	
			
			
			if (possible_write_review.size() != 0) {
				
				// 테이블 매핑 : 정수 형으로 나온다 
				for (int i = 0; i < possible_write_review.size(); i++ ) {
				List<String> possible_write_review1 = new ArrayList<String>();
					
					for(int k = 0; k < product_list.size(); k++) {
						if (possible_write_review.get(i).getProduct_no() == product_list.get(k).getNo() ) {
							possible_write_review1.add(String.valueOf(product_list.get(i).getImage_url())); // 상품 이미지 0 
						}
					}
					
					for(int j = 0; j < review_list.size(); j++ ) {
						if(possible_write_review.get(i).getOrder_no() != review_list.get(j).getOrder_no()) {
							possible_write_review1.add(String.valueOf(possible_write_review.get(i).getProduct_name())); // 상품명 1
							possible_write_review1.add(String.valueOf(possible_write_review.get(i).getProduct_price())); // 상품 가격 2 
							possible_write_review1.add(String.valueOf(possible_write_review.get(i).getPurchase_confirmation_date())); // 구매 확정 일자 3
							possible_write_review1.add(String.valueOf(possible_write_review.get(i).getProduct_no())); // 상품 번호 4 
						}
				
					}
					possible_write_review2.add(possible_write_review1);
					
				}
				System.out.println("오늘 폼 미쳤다 3" + possible_write_review2);
			}model.addAttribute("possible_write_review2" , possible_write_review2);	
			
			return "user/review/possible_write_review";
		}
	
}