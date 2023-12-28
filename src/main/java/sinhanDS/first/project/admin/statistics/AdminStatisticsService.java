package sinhanDS.first.project.admin.statistics;

import java.util.List;

import sinhanDS.first.project.statistics.vo.StatisticsVO;

public interface AdminStatisticsService {

	StatisticsVO weekTotal();
	List<StatisticsVO> weekTotalscr();
	List<StatisticsVO> weekTotalPricescr();
	
	List<StatisticsVO> category1scr();
	List<StatisticsVO> category2scr(StatisticsVO vo);
	List<StatisticsVO> genderscr();
	List<StatisticsVO> agescr();
	List<StatisticsVO> sellerscr();
}
