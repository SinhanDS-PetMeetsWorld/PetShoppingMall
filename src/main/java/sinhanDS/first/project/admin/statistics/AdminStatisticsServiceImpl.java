package sinhanDS.first.project.admin.statistics;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminStatisticsServiceImpl implements AdminStatisticsService {

	@Autowired
	AdminStatisticsMapper mapper;
}
