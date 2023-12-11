package sinhanDS.first.project.user;

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

import sinhanDS.first.project.product.vo.ProductVO;
import sinhanDS.first.project.user.vo.CartVO;
import sinhanDS.first.project.user.vo.PaymentVO;
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
		System.out.println("vo체크: " + vo);
		UserVO login = service.login(vo);
		System.out.println("login: " + login);
		if (login == null) { // 로그인 실패
			model.addAttribute("msg", "아이디 비밀번호가 올바르지 않습니다.");
			model.addAttribute("cmd", "back");
			return "common/alert";
		} else { // 로그인 성공
			sess.removeAttribute("sellerLoginInfo");
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
		List<CartVO> cartvolist = service.exist_cart(vo);
		System.out.println("카트 받아와지나 : " + cartvolist);
		
		List<ProductVO> prov = service.search_cart_product(cartvolist);
		model.addAttribute("productvolist", service.search_cart_product(cartvolist));
		System.out.println("카트에대한 상품? : " + prov);
		
		
		return "user/cart/user_cart";
		
	}
	
	
}
