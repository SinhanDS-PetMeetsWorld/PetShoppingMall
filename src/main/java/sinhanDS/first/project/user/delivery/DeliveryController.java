package sinhanDS.first.project.user.delivery;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/user/delivery")
public class DeliveryController {
	@Autowired
	private DeliveryService service;
}
