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
import sinhanDS.first.project.user.VO.PaymentVO;
import sinhanDS.first.project.util.FileNameVO;
import sinhanDS.first.project.util.Uploader;


@Controller
@RequestMapping("/seller")
public class SellerController {
	@Autowired
	private SellerService service;
	@Autowired
	private JavaMailSender javaMailSender;
	@Value("${realPath.registed_img_path}")
	private String registed_img_path;
	
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
//		System.out.println("vo체크: " + vo);
		SellerVO login = service.login(vo);
		System.out.println("login체크: " + login);
		if (login == null) { // 로그인 실패
			model.addAttribute("msg", "아이디 비밀번호가 올바르지 않습니다.");
			model.addAttribute("cmd", "back");
			return "common/alert";
		} else { // 로그인 성공
			sess.removeAttribute("loginInfo");
			sess.setAttribute("sellerLoginInfo", login);
			return "redirect:/seller/index.do";
		}
	}
	
	@GetMapping("/logout.do")
	public String logout(HttpSession sess) {
		sess.invalidate();
		return "redirect:/";
	}
	
	@GetMapping("/product/regist.do")
	public String regist(Model model) {
		ProductCategoryVO vo = new ProductCategoryVO();
		model.addAttribute("vo", vo);
		return "seller/product/regist";
	}		
	@PostMapping("/product/regist.do")
	public String regist(@RequestParam MultipartFile filename, HttpServletRequest request, ProductVO vo, ProductCategoryVO cvo, ProductOptionVO ovo) {
		Uploader uploader = new Uploader();
		FileNameVO fvo = new FileNameVO(registed_img_path);
		fvo = uploader.upload(fvo, filename);
		
		vo.setImage_url(fvo.getSaved_filename());
		
		System.out.println("vo체크: " + vo);
		System.out.println("cvo체크: "  +cvo);
		System.out.println("ovo체크: " + ovo);
		service.regist(vo, cvo, ovo);
		
		return "redirect:/seller/index.do";
	}
	
	@GetMapping("/product/list.do")
	public String product_list(HttpSession sess, Model model) {
		SellerVO vo = (SellerVO)sess.getAttribute("sellerLoginInfo");
		
		Map map = service.getProductList(vo.getNo());
		model.addAttribute("map", map);
		model.addAttribute("registed_img_path", registed_img_path);
		return "seller/product/list";
	}
	
	@GetMapping("/product/edit.do")
	public String product_edit(Model model, ProductVO vo) {
		Map map = service.getProductDetail(vo.getNo());
		model.addAttribute("map", map);
		ProductCategoryVO category = new ProductCategoryVO();
		model.addAttribute("category", category);
		System.out.println("map체크: " + map);
		return "seller/product/edit";
	}
	
	
	@PostMapping("/product/edit.do")
	public String product_edit2(ProductVO vo, ProductCategoryVO cvo, ProductOptionVO ovo) {
		System.out.println("vo체크: " + vo);
		System.out.println("cvo체크: "  +cvo);
		System.out.println("ovo체크: " + ovo);
		service.edit_product(vo, cvo, ovo);
		return "redirect:/seller/index.do";
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
}
