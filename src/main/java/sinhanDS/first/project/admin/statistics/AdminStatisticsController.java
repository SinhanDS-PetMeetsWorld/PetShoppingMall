package sinhanDS.first.project.admin.statistics;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import sinhanDS.first.project.product.vo.ProductCategoryVO;
import sinhanDS.first.project.statistics.vo.StatisticsVO;

@Controller
@RequestMapping("/admin/statistics")
public class AdminStatisticsController {

	@Autowired
	AdminStatisticsServiceImpl service;
	
	@GetMapping("/statistics.do")
	public String statistics(HttpSession sess, Model model) {
		StatisticsVO vo = service.weekTotal();
		model.addAttribute("totalStatistics", vo);
		model.addAttribute("cvo", new ProductCategoryVO());
		return "/admin/page/statistics";
	}
	
	@GetMapping("/QuantityRecentWeek.do")
	@ResponseBody
	public List<StatisticsVO> QuantityRecentWeek() {
		List<StatisticsVO> stList = service.weekTotalscr();
		return stList;
	}
	
	@GetMapping("/PriceRecentWeek.do")
	@ResponseBody
	public List<StatisticsVO> PriceRecentWeek() {
		List<StatisticsVO> stList = service.weekTotalPricescr();
		return stList;
	}
	
	@GetMapping("/statistics_category1.do")
	@ResponseBody
	public List<StatisticsVO> statistics_category1() {
		List<StatisticsVO> stList = service.category1scr();
		return stList;
	}
	
	@GetMapping("/statistics_category2.do")
	@ResponseBody
	public List<StatisticsVO> statistics_category2(StatisticsVO svo) {
		List<StatisticsVO> stList = service.category2scr(svo);
		return stList;
	}
	
	@GetMapping("/statistics_genderchart.do")
	@ResponseBody
	public List<StatisticsVO> statistics_genderchart() {
		List<StatisticsVO> stList = service.genderscr();
		return stList;
	}
	
	@GetMapping("/statistics_agechart.do")
	@ResponseBody
	public List<StatisticsVO> statistics_agechart() {
		List<StatisticsVO> stList = service.agescr();
		return stList;
	}
	
	@GetMapping("/statistics_sellerchart.do")
	@ResponseBody
	public List<StatisticsVO> statistics_sellerchart() {
		List<StatisticsVO> stList = service.sellerscr();
		return stList;
	}
}
