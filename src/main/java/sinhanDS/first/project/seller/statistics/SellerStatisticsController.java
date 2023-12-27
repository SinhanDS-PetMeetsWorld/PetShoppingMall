package sinhanDS.first.project.seller.statistics;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import sinhanDS.first.project.statistics.vo.SellerStatisticsVO;

@Controller
@RequestMapping("/seller/statistics")
public class SellerStatisticsController {
	
	@GetMapping("/statistics.do")
	public String statistics() {
		return "/seller/statistics/statistics";
	}
	
	@GetMapping("/statisticsDate.do")
	@ResponseBody
	public List<SellerStatisticsVO> statisticsDate() {
		List<SellerStatisticsVO> stList = null;
		return stList;
	}
}
