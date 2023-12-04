package sinhanDS.first.project.seller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import sinhanDS.first.project.product.vo.OptionVO;
import sinhanDS.first.project.product.vo.ProductCategoryVO;
import sinhanDS.first.project.product.vo.ProductVO;
import sinhanDS.first.project.seller.vo.SellerVO;


@Controller
@RequestMapping("/seller")
public class SellerController {
	@Autowired
	private SellerService service;
	
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
		return "seller/regist/regist_form";
	}	
	
	@PostMapping("/product/regist.do")
	public String regist(ProductVO vo, ProductCategoryVO cvo, OptionVO ovo) {
		System.out.println("vo체크: " + vo);
		System.out.println("cvo체크: "  +cvo);
		System.out.println("ovo체크: " + ovo);
		service.regist(vo, cvo, ovo);
		
		return "redirect:/seller/index.do";
	}
}
