package sinhanDS.first.project.seller.statistics;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import sinhanDS.first.project.seller.vo.SellerVO;
import sinhanDS.first.project.statistics.vo.StatisticsVO;

@Controller
@RequestMapping("/seller/statistics")
public class SellerStatisticsController {
	
	@Autowired
	SellerStatisticsServiceImpl service;
	
	@GetMapping("/statistics.do")
	public String statistics(HttpSession sess, Model model) {
		SellerVO seller = (SellerVO) sess.getAttribute("sellerLoginInfo");
		model.addAttribute("seller", seller);
		return "/seller/statistics/statistics";
	}
	
	@GetMapping("/QuantityRecentWeek.do")
	@ResponseBody
	public List<StatisticsVO> QuantityRecentWeek(StatisticsVO svo) {
		List<StatisticsVO> stList = service.weekTotalscr(svo);
		return stList;
	}
	
	@GetMapping("/PriceRecentWeek.do")
	@ResponseBody
	public List<StatisticsVO> PriceRecentWeek(StatisticsVO svo) {
		List<StatisticsVO> stList = service.weekTotalPricescr(svo);
		return stList;
	}
}
