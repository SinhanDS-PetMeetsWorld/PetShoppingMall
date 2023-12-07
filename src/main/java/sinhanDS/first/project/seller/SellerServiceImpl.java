package sinhanDS.first.project.seller;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sinhanDS.first.project.product.vo.ProductCategoryVO;
import sinhanDS.first.project.product.vo.ProductOptionVO;
import sinhanDS.first.project.product.vo.ProductVO;
import sinhanDS.first.project.seller.vo.SellerVO;
import sinhanDS.first.project.user.vo.UserVO;

@Service
public class SellerServiceImpl implements SellerService {
	@Autowired
	SellerMapper mapper;
	
	@Override
	public SellerVO login(SellerVO vo) {
		return mapper.login(vo);
	}

	
	
	@Override
	public int seller_regist(SellerVO vo) {
		String phone0 = vo.getPhone0();
		String phone1 = vo.getPhone1();
		String phone2 = vo.getPhone2();
		String phone = phone0 + "-" + phone1 + "-" + phone2;
		vo.setPhone(phone);
		
		return mapper.seller_regist(vo);
	}
	
	@Override
	public boolean check_password(SellerVO vo) {
		int user = mapper.check_password(vo);
		if(user == 1) {
			return true;
		}
		else {
			return false;
		}	
	}

	@Override
	public boolean dupId(String id) {
		return mapper.dupId(id) > 0 ? true : false;
	}
	
	@Override
	public SellerVO detail(SellerVO vo) {
		return mapper.detail(vo.getNo());
	}
	
	@Override
	public int edit(SellerVO vo) {
		
		System.out.println(vo);
		String phone0 = vo.getPhone0();
		String phone1 = vo.getPhone1();
		String phone2 = vo.getPhone2();
		String phone = phone0 + "-" + phone1 + "-" + phone2;
		vo.setPhone(phone);
		
		System.out.println("vo 뭐냐 : " +  vo);
		
		if(vo.getPassword()=="") {
			return mapper.edit(vo);
		} else {
			if(check_password(vo)) {
				return mapper.edit(vo);
			}
			return 0;
		}
		
	}
}
