package sinhanDS.first.project.seller;

import java.net.URL;

//import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;

import java.util.Map;

import javax.mail.internet.MimeMessage;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import sinhanDS.first.project.product.vo.ProductCategoryVO;
import sinhanDS.first.project.product.vo.ProductOptionVO;
import sinhanDS.first.project.product.vo.ProductVO;
import sinhanDS.first.project.seller.vo.SellerVO;
import sinhanDS.first.project.user.vo.PaymentVO;
import sinhanDS.first.project.user.vo.UserVO;
import sinhanDS.first.project.util.file.FileNameVO;
import sinhanDS.first.project.util.file.FileController;


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
		return "seller/index";
	}
	@GetMapping("/login.do")
	public String login() {
		return "seller/login/login";
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
		} else { // 로그인 성공
			sess.removeAttribute("userLoginInfo");
			sess.removeAttribute("adminLoginInfo");
			sess.setAttribute("sellerLoginInfo", login);
			return "redirect:/seller/index.do";
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
	
	@GetMapping("/edit.do")
	public String edit(HttpSession sess, Model model) {
		SellerVO vo = (SellerVO)sess.getAttribute("sellerLoginInfo");
		model.addAttribute("vo", service.detail(vo));
		return "seller/edit/seller_info";
	}
	
	@PostMapping("/update.do")
	public String edit(SellerVO vo, Model model) {
		System.out.println("전송 : " + vo);
		
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
	
	
}
