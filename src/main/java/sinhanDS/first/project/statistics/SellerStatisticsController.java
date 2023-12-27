package sinhanDS.first.project.statistics;

import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import sinhanDS.first.project.statistics.vo.StatisticsVO;

public class SellerStatisticsController {
	@GetMapping("/statistics.do")
	public String statistics() {
		return "/seller/statistics/statistics";
	}
	
	@GetMapping("/statisticsDate.do")
	@ResponseBody
	public List<StatisticsVO> statisticsDate() {
		List<StatisticsVO> stList = null;
		return stList;
	}
}
