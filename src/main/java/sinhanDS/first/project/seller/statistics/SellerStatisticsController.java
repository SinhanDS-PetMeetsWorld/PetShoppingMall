package sinhanDS.first.project.seller.statistics;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import sinhanDS.first.project.product.vo.ProductCategoryVO;
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
		StatisticsVO vo = service.weekTotal(seller.getNo());
		
		model.addAttribute("seller", seller);
		model.addAttribute("totalStatistics", vo);
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
	
	@GetMapping("/statistics_category.do")
	public String statisticsCategory(HttpSession sess, Model model) {
		SellerVO seller = (SellerVO) sess.getAttribute("sellerLoginInfo");
		model.addAttribute("seller", seller);
		model.addAttribute("cvo", new ProductCategoryVO());
		return "/seller/statistics/statistics_category";
	}
	
	@GetMapping("/statistics_category1.do")
	@ResponseBody
	public List<StatisticsVO> statistics_category1(StatisticsVO svo) {
		List<StatisticsVO> stList = service.category1scr(svo);
		return stList;
	}
	
	@GetMapping("/statistics_category2.do")
	@ResponseBody
	public List<StatisticsVO> statistics_category2(StatisticsVO svo) {
		System.out.println("확인 "+svo.getCategory1());
		List<StatisticsVO> stList = service.category2scr(svo);
		return stList;
	}
	
	@GetMapping("/statistics_gender.do")
	public String statisticsGender(HttpSession sess, Model model) {
		SellerVO seller = (SellerVO) sess.getAttribute("sellerLoginInfo");
		model.addAttribute("seller", seller);
		return "/seller/statistics/statistics_gender";
	}
	
	@GetMapping("/statistics_age.do")
	public String statisticsAge(HttpSession sess, Model model) {
		SellerVO seller = (SellerVO) sess.getAttribute("sellerLoginInfo");
		model.addAttribute("seller", seller);
		return "/seller/statistics/statistics_age";
	}
	
}
