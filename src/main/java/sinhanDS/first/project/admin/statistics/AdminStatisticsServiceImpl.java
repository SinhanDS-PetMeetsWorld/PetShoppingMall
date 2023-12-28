package sinhanDS.first.project.admin.statistics;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sinhanDS.first.project.statistics.vo.StatisticsVO;

@Service
public class AdminStatisticsServiceImpl implements AdminStatisticsService {

	@Autowired
	AdminStatisticsMapper mapper;
	
	@Override
	public StatisticsVO weekTotal() {
		StatisticsVO svo = mapper.weekTotal();
		return svo;
	}

	@Override
	public List<StatisticsVO> weekTotalscr() {
		List<StatisticsVO> list = mapper.weekTotalscr();
		return list;
	}

	@Override
	public List<StatisticsVO> weekTotalPricescr() {
		List<StatisticsVO> list = mapper.weekTotalPricescr();
		return list;
	}

	@Override
	public List<StatisticsVO> category1scr() {
		List<StatisticsVO> list = mapper.category1scr();
		return list;
	}

	@Override
	public List<StatisticsVO> category2scr(StatisticsVO vo) {
		List<StatisticsVO> list = mapper.category2scr(vo);
		return list;
	}

	@Override
	public List<StatisticsVO> genderscr() {
		List<StatisticsVO> list = mapper.genderscr();
		return list;
	}

	@Override
	public List<StatisticsVO> agescr() {
		List<StatisticsVO> list = mapper.agescr();
		return list;
	}
	
	@Override
	public List<StatisticsVO> sellerscr() {
		List<StatisticsVO> list = mapper.sellerscr();
		return list;
	}
}
