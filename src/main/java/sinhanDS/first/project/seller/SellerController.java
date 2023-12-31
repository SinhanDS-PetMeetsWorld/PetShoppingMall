package sinhanDS.first.project.seller;

import javax.mail.internet.MimeMessage;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
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

import sinhanDS.first.project.seller.vo.SellerVO;
import sinhanDS.first.project.user.vo.PaymentVO;

@Controller
@RequestMapping("/seller")
public class SellerController {
	@Autowired
	private JavaMailSender javaMailSender;
	//123123
	@Autowired
	private SellerService service;
	
	@Autowired ServletContext servletContext;
	
	@GetMapping("/index.do")
	public String index() {
		return "redirect:/seller/order/settlement.do";
	}
	@GetMapping("/login.do")
	public String login() {
		return "/seller/login/login";
	}
	
	@PostMapping("/login.do")
	public String loginProcess(SellerVO vo, HttpSession sess, Model model) {
		SellerVO login = service.login(vo);
		if (login == null) { // 로그인 실패
			model.addAttribute("msg", "아이디 비밀번호가 올바르지 않습니다.");
			model.addAttribute("cmd", "back");
			return "common/alert";
		} else if (login.isRestricted() == true) { // 로그인 실패
			model.addAttribute("msg", "사용이 제한된 계정입니다. 관리자에게 문의하세요.");
			model.addAttribute("cmd", "back");
			return "common/alert";
		}  else if (login.getWithdrawal_date() != null) { // 로그인 실패
			model.addAttribute("msg", "회원 탈퇴된 계정입니다. 관리자에게 문의하세요.");
			model.addAttribute("cmd", "back");
			return "common/alert";
		} else { // 로그인 성공
			sess.removeAttribute("userLoginInfo");
			sess.removeAttribute("adminLoginInfo");
			sess.setAttribute("sellerLoginInfo", login);
			return "redirect:/seller/order/settlement.do";
		}
	}
	
	@GetMapping("/logout.do")
	public String logout(HttpSession sess) {
		sess.invalidate();
		return "redirect:/seller/login.do";
	}
	
	
	
	
	@GetMapping("/join.do")
	public String selregist(Model model) {
		PaymentVO vo = new PaymentVO();
		model.addAttribute("vo", vo);
		return "seller/login/join";
	}
	
	@PostMapping("/regist.do")
	public String user_regist(SellerVO vo, Model model) {
		boolean r = service.seller_regist(vo) > 0 ? true : false; // service -> mapper -> sql
		
		if (r) { // 정상적으로 DB에 insert 
			model.addAttribute("cmd", "move");
			model.addAttribute("msg", "회원가입되었습니다.");
			model.addAttribute("url", "/seller/login.do");
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
	
	@GetMapping("/edit.do")
	public String edit(HttpSession sess, Model model) {
		SellerVO vo = (SellerVO)sess.getAttribute("sellerLoginInfo");
		model.addAttribute("vo", service.detail(vo));
		return "seller/edit/seller_info";
	}
	
	@PostMapping("/update.do")
	public String edit(SellerVO vo, Model model) {
		
		int r = service.edit(vo);
		String msg = "";
		String url = "/seller/edit.do";
		
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
	
	@GetMapping("/withdrawal.do")
	public String withdrawal(Model model, HttpSession sess) {
		SellerVO vo = (SellerVO)sess.getAttribute("sellerLoginInfo");
		String msg = "";
		String url = "/seller/afterwithdrawal.do";
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
	
	@GetMapping("/findIdPage.do")
	public String findIdPage() {
		return "seller/login/findId";
	}
	
	@GetMapping("/findPwdPage.do")
	public String findPwdPage() {
		return "seller/login/findPwd";
	}
	
	@PostMapping("/findId.do")
	public String findId(SellerVO vo, Model model) {
		SellerVO foundID = service.findId(vo);
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
				model.addAttribute("url", "/seller/login.do");
			}catch(Exception e) {
	            e.printStackTrace();
	        }
		} else {
            model.addAttribute("cmd", "back");
			model.addAttribute("msg", "문제가 발생했습니다. 입력하신 성함과 이메일 주소가 올바른지 다시 확인하시고,"
					+ " 동일한 문제가 반복해서 발생 시 페이지 하단에 기입된 연락처로 관리자에게 문의해주세요.");
			model.addAttribute("url", "/seller/findIdPage.do");
		}
		return "common/alert";
	}
	
	@PostMapping("/findPwd.do")
	public String findPwd(SellerVO vo, Model model) {
		
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
				model.addAttribute("url", "/seller/login.do");
			}catch(Exception e) {
	            e.printStackTrace();
	        }
		} else {
            model.addAttribute("cmd", "back");
			model.addAttribute("msg", "문제가 발생했습니다. 입력하신 성함과 id, 이메일 주소가 올바른지 다시 확인하시고,"
					+ " 동일한 문제가 반복해서 발생 시 페이지 하단에 기입된 연락처로 관리자에게 문의해주세요.");
			model.addAttribute("url", "/seller/findPwdPage.do");
		}
		return "common/alert";
	}
}
