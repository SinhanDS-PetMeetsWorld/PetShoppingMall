package sinhanDS.first.project.admin;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sinhanDS.first.project.product.vo.ProductSearchVO;
import sinhanDS.first.project.seller.vo.SellerVO;
import sinhanDS.first.project.user.vo.UserVO;

@Service
public class AdminServiceImpl implements AdminService {
	@Autowired
	AdminMapper mapper;
	
	@Override
	public List<UserVO> getUserList(ProductSearchVO svo){
		return mapper.getUserList(svo);
	}
	
	@Override
	public List<SellerVO> getSellerList(ProductSearchVO svo){
		return mapper.getSellerList(svo);
	}
	
	@Override
	public int getNumberOfUser() {
		return mapper.getNumberOfUser();
	}
	@Override
	public int getNumberOfSeller() {
		return mapper.getNumberOfSeller();
	}
}
