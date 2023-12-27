package sinhanDS.first.project.seller.statistics;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sinhanDS.first.project.statistics.vo.SellerStatisticsVO;

@Service
public class SellerStatisticsServiceImpl implements SellerStatisticsService {

	@Autowired
	SellerStatisticsMapper mapper;

	@Override
	public List<SellerStatisticsVO> weekTotalscr(SellerStatisticsVO vo) {
		List<SellerStatisticsVO> list = mapper.weekTotalscr(vo);
		return list;
	}

	@Override
	public List<SellerStatisticsVO> weekTotalPricescr(SellerStatisticsVO vo) {
		List<SellerStatisticsVO> list = mapper.weekTotalPricescr(vo);
		return list;
	}
}
