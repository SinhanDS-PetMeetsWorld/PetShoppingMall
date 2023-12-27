package sinhanDS.first.project.seller.statistics;

import java.util.List;

import sinhanDS.first.project.statistics.vo.SellerStatisticsVO;

public interface SellerStatisticsService {

	List<SellerStatisticsVO> weekTotalscr(SellerStatisticsVO vo);
	List<SellerStatisticsVO> weekTotalPricescr(SellerStatisticsVO vo);
}
