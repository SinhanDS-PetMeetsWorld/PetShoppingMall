package sinhanDS.first.project.user_info_edit;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class UserController {
	@Autowired
	private UserService service;
	
//	@GetMapping("/user/user_info.do")
//	public String user_info(Model model, UserVO vo) {
//		model.addAttribute("user", service.user_info_list(vo));
//		return "user_info";
//	}
	
	@GetMapping("/user/edit.do")
	public String edit(HttpSession sess, Model model) {
		UserVO vo = (UserVO)sess.getAttribute("loginInfo");
		model.addAttribute("vo", service.user_info_detail(vo));
		return "user_info";
	}
	
	@GetMapping("/user/login.do")
	public String login() {
		return "login";
	}
	
	@PostMapping("/user/login.do")
	public String loginProcess(UserVO vo, HttpSession sess, Model model) {
		UserVO login = service.user_login(vo);
		sess.setAttribute("loginInfo", login);
		return "login";
	}
	
}
