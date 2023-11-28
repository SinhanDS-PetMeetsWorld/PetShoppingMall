package sinhanDS.first.project.login;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class UserController {

	@Autowired
	private UserService service;
	
	@GetMapping("/login/login.do")
	public String login() {
		
		System.out.println("들어오나?");
		return "login/login";
	}
	
	@PostMapping("/login/login.do")
	public String loginProcess(UserVO vo, HttpSession sess, Model model) {
		UserVO login = service.login(vo);
		System.out.println(login);
		if (login == null) { // 로그인 실패
			System.out.println("불쌍하네요~ 인생이...");
			model.addAttribute("msg", "아이디 비밀번호가 올바르지 않습니다.");
			model.addAttribute("cmd", "back");
			return "common/alert";
		} else { // 로그인 성공
			System.out.println("로그인 성공");
			sess.setAttribute("loginInfo", login);
			return "/login/index";
		}
	}
}
