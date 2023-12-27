package sinhanDS.first.project.seller.statistics;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SellerStatisticsServiceImpl implements SellerStatisticsService {

	@Autowired
	SellerStatisticsMapper mapper;
}
