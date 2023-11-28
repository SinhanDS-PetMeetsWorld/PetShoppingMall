package sinhanDS.first.project.user;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	private UserService service;
	
	@GetMapping("/login.do")
	public String login() {
		return "login/login";
	}
	
	@PostMapping("/login.do")
	public String loginProcess(UserVO vo, HttpSession sess, Model model) {
		UserVO login = service.login(vo);
		System.out.println(login);
		if (login == null) { // 로그인 실패
			model.addAttribute("msg", "아이디 비밀번호가 올바르지 않습니다.");
			model.addAttribute("cmd", "back");
			return "common/alert";
		} else { // 로그인 성공
			System.out.println("로그인 성공");
			sess.setAttribute("loginInfo", login);
			return "/index";
		}
	}
	
	@GetMapping("/edit.do")
	public String edit(HttpSession sess, Model model) {
		UserVO vo = (UserVO)sess.getAttribute("loginInfo");
		model.addAttribute("vo", service.detail(vo));
		return "user_info";
	}
	
	@PostMapping("/edit.do")
	public String edit2(HttpSession sess, UserVO vo) {
		UserVO login = service.edit(vo);
		sess.setAttribute("loginInfo", login);
		return "user_info";
	}
	
	@GetMapping("/하.do")
	public String edit3(HttpSession sess, UserVO vo) {
		UserVO login = service.edit(vo);
		sess.setAttribute("loginInfo", login);
		return "user_info";
	}
	
	@GetMapping("ㅎㅎ 살려주세요")
	public String help_me() {
		System.out.println("히히히");
		return "yahoo";
	}
}
