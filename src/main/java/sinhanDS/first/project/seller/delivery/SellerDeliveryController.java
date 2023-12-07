package sinhanDS.first.project.seller.delivery;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/seller/delivery")
public class SellerDeliveryController {
	@Autowired
	private SellerDeliveryService service;
}
