package sinhanDS.first.project.statistics;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class StatisticsServiceImpl implements StatisticsService {
	@Autowired
	StatisticsMapper mapper;

}
