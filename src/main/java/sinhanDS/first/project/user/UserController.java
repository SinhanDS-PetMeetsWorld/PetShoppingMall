package sinhanDS.first.project.user;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import sinhanDS.first.project.user.VO.UserAddressVO;
import sinhanDS.first.project.user.VO.UserVO;


@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	private UserService service;
	
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
			System.out.println("로그인 성공");
			sess.setAttribute("loginInfo", login);
			return "redirect:/";
		}
	}
	
	@RequestMapping("/logout.do")
	public String logout(HttpSession sess) {
		sess.invalidate();
		return "redirect:/"; //지금은 로그인 페이지로 넘겨버렸는데 나중엔 메인페이지로 보내야할듯요?
	}
	
	@GetMapping("/edit.do")
	public String edit(HttpSession sess, Model model) {
		UserVO vo = (UserVO)sess.getAttribute("loginInfo");
		model.addAttribute("vo", service.detail(vo));
		return "user/edit/user_info";
	}
	
	@GetMapping("/join.do")
	public String join() {
		return "user/regist_cust";
	}
	
	@PostMapping("/regist.do")
	public String user_regist(UserVO vo, Model model) {
		System.out.println(vo.getNo()+" "+vo.getZipcode()+" "+vo.getAddr1()+" "+vo.getAddr2()+" "
				+vo.getName()+" "+vo.getPhone());
		boolean r = service.user_regist(vo) > 0 ? true : false; // service -> mapper -> sql
		
		UserAddressVO addrvo = new UserAddressVO();
		addrvo.setUser_no(vo.getNo());
		addrvo.setZipcode(vo.getZipcode());
		addrvo.setAddr1(vo.getAddr1());
		addrvo.setAddr2(vo.getAddr2());
		addrvo.setName(vo.getName());
		addrvo.setPhone(vo.getPhone());
		System.out.println(vo.getNo()+" "+vo.getZipcode()+" "+vo.getAddr1()+" "+vo.getAddr2()+" "
				+vo.getName()+" "+vo.getPhone());
		boolean addrr = service.initaddr_regist(addrvo);
		
		if (r && addrr) { // 정상적으로 DB에 insert 
			model.addAttribute("cmd", "move");
			model.addAttribute("msg", "회원가입되었습니다.");
			model.addAttribute("url", "/project/index.do");
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
	
	@PostMapping("/update.do")
	public String edit(UserVO vo, Model model) {
		System.out.println("전송 : " + vo);
		
		int r = service.edit(vo);
		String msg = "";
		String url = "edit.do";
		
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
	public String editaddr() {
		return "user/edit/user_addr";
	}
	
	@GetMapping("/add_addr.do")
	public String addaddr() {
		return "user/edit/user_add_addr";
	}
	
}
