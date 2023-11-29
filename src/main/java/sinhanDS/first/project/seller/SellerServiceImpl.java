package sinhanDS.first.project.seller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sinhanDS.first.project.seller.vo.SellerVO;

@Service
public class SellerServiceImpl implements SellerService {
	@Autowired
	SellerMapper mapper;
	
	@Override
	public SellerVO login(SellerVO vo) {
		return mapper.login(vo);
	}

}
