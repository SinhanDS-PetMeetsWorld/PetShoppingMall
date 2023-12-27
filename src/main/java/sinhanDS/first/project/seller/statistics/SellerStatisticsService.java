package sinhanDS.first.project.seller.statistics;

import java.util.List;

import sinhanDS.first.project.statistics.vo.StatisticsVO;

public interface SellerStatisticsService {

	List<StatisticsVO> weekTotalscr(StatisticsVO vo);
	List<StatisticsVO> weekTotalPricescr(StatisticsVO vo);
}
