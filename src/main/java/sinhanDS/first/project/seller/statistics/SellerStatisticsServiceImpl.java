package sinhanDS.first.project.seller.statistics;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sinhanDS.first.project.statistics.vo.StatisticsVO;

@Service
public class SellerStatisticsServiceImpl implements SellerStatisticsService {

	@Autowired
	SellerStatisticsMapper mapper;
	
	@Override
	public StatisticsVO weekTotal(int no) {
		StatisticsVO svo = mapper.weekTotal(no);
		return svo;
	}

	@Override
	public List<StatisticsVO> weekTotalscr(StatisticsVO vo) {
		List<StatisticsVO> list = mapper.weekTotalscr(vo);
		return list;
	}

	@Override
	public List<StatisticsVO> weekTotalPricescr(StatisticsVO vo) {
		List<StatisticsVO> list = mapper.weekTotalPricescr(vo);
		return list;
	}

	@Override
	public List<StatisticsVO> category1scr(StatisticsVO vo) {
		List<StatisticsVO> list = mapper.category1scr(vo);
		return list;
	}

	@Override
	public List<StatisticsVO> category2scr(StatisticsVO vo) {
		List<StatisticsVO> list = mapper.category2scr(vo);
		return list;
	}

	@Override
	public List<StatisticsVO> genderscr(StatisticsVO vo) {
		List<StatisticsVO> list = mapper.genderscr(vo);
		return list;
	}

	@Override
	public List<StatisticsVO> agescr(StatisticsVO vo) {
		List<StatisticsVO> list = mapper.agescr(vo);
		return list;
	}
}
