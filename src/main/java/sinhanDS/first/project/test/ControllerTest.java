package sinhanDS.first.project.test;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ControllerTest {
	@Autowired
	TestMapper mapper;
	
	@GetMapping("/please.do")
	public String plz(Model model) {
		model.addAttribute("model", mapper.test());
		return "test";
	}
}
