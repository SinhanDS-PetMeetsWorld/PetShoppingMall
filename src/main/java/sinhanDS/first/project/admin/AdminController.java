package sinhanDS.first.project.admin;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.extern.slf4j.Slf4j;


@Controller
@RequestMapping("/admin")
@Slf4j
public class AdminController {
	@Autowired
	private AdminService service;
	
	@GetMapping("")
	public String index() {
		return "/admin/login";
	}
	@GetMapping("/")
	public String index2() {
		return "/admin/login";
	}
	@GetMapping("/index.do")
	public String index3() {
		return "/admin/login";
	}
	
	@PostMapping("/login.do")
	public String login(@RequestParam String id, @RequestParam String pwd, HttpSession sess) {
		if("admin".equals(id) && "admin".equals(pwd)) {
			sess.setAttribute("adminLoginInfo", "adminLoginInfo");
			log.debug("loginSession: " + (String)sess.getAttribute("adminLoginInfo"));
			
			sess.removeAttribute("sellerLoginInfo");
			sess.removeAttribute("userLoginInfo");
			
			return "redirect:/admin/userList.do"; 
		}
		return "/admin/login";
	}
	
	@GetMapping("/logout.do")
	public String logout(HttpSession sess) {
		sess.invalidate();
		return "redirect:/admin/";
	}
	@GetMapping("userList.do")
	public String userList() {
		return "/admin/user/list";
	}
}
