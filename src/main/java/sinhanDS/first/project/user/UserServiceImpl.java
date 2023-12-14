package sinhanDS.first.project.user;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sinhanDS.first.project.product.vo.ProductOptionVO;
import sinhanDS.first.project.product.vo.ProductVO;
import sinhanDS.first.project.user.vo.CartOptionVO;
import sinhanDS.first.project.user.vo.CartVO;
import sinhanDS.first.project.user.vo.PaymentVO;
import sinhanDS.first.project.user.vo.UserAddressVO;
import sinhanDS.first.project.user.vo.UserVO;


@Service
public class UserServiceImpl implements UserService {

	@Autowired
	UserMapper mapper;
	
	@Override
	public UserVO login(UserVO vo) {
		return mapper.login(vo);
	}

	@Override
	public UserVO detail(UserVO vo) {
		return mapper.detail(vo.getNo());
	}
	
	
	@Override
	public int edit(UserVO vo) {
		
		
		System.out.println(vo);
		String phone0 = vo.getPhone0();
		String phone1 = vo.getPhone1();
		String phone2 = vo.getPhone2();
		String phone = phone0 + "-" + phone1 + "-" + phone2;
		vo.setPhone(phone);
		
//		Date birth_date = Date.valueOf(birth0 + "-" + birth1 + "-" + birth2);
		SimpleDateFormat sdf = new SimpleDateFormat(vo.getBirth0() + "-" + vo.getBirth1() + "-" + vo.getBirth2());
		String ss = sdf.format(new java.util.Date());
		Date birth_date = java.sql.Date.valueOf(ss);
		System.out.println(birth_date);
		vo.setBirth_date(birth_date);
		
		System.out.println(vo);

		if(vo.getPassword()=="") {
			return mapper.edit(vo);
		} else {
			if(check_password(vo)) {
				return mapper.edit(vo);
			}
			return 0;
		}
		
		
	}

	@Override
	public int user_regist(UserVO vo) {
		String phone0 = vo.getPhone0();
		String phone1 = vo.getPhone1();
		String phone2 = vo.getPhone2();
		String phone = phone0 + "-" + phone1 + "-" + phone2;
		vo.setPhone(phone);

		SimpleDateFormat sdf = new SimpleDateFormat(vo.getBirth0() + "-" + vo.getBirth1() + "-" + vo.getBirth2());
		String ss = sdf.format(new java.util.Date());
		Date birth_date = java.sql.Date.valueOf(ss);
		System.out.println(birth_date);
		vo.setBirth_date(birth_date);
		
		return mapper.user_regist(vo);
	}
	
	@Override
	public boolean initaddr_regist(UserAddressVO vo) {
		return mapper.initaddr_regist(vo) > 0 ? true : false;
	}
	
	@Override
	public boolean check_password(UserVO vo) {
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
	public List<UserAddressVO> exist_addr(UserVO vo) {
		List<UserAddressVO> list = mapper.exist_addr(vo.getNo());
		return list;
	}
	
	@Override
	public int insert_addr(UserAddressVO vo) {
		return mapper.insert_addr(vo);
	}
	
	@Override
	public int modify_addr(UserAddressVO vo) {
		return mapper.modify_addr(vo);
	}
	
	@Override
	public int delete_addr(int no) {
		return mapper.delete_addr(no);
	}
	
	@Override
	public List<PaymentVO> exist_payment(UserVO vo) {
		List<PaymentVO> list = mapper.exist_payment(vo.getNo());
		return list;
	}
	
	@Override
	public int insert_payment(PaymentVO vo) {
		return mapper.insert_payment(vo);
	}
	
	@Override
	public int modify_payment(PaymentVO vo) {
		return mapper.modify_payment(vo);
	}
	
	@Override
	public int delete_payment(int no) {
		return mapper.delete_payment(no);
	}
	
	@Override
	// 현재 로그인 중인 유저의 no를 받아와 카트VO의 user_no와 일치하는 컬럼을 리스트로 전부 가져옴
	public List<CartVO> exist_cart(UserVO vo){
		List<CartVO> list = mapper.exist_cart(vo.getNo());
		System.out.println("카트브이오" + list);
		return list;
	}
	
	@Override
	// 받아온 카트VO 리스트를 통해서 해당하는 상품의 정보를 순서대로 가져온다.
	public List<ProductVO> search_cart_product(List<CartVO> cartvo){
		List<ProductVO> list = new ArrayList<>();
		System.out.println("프덕0" + cartvo.get(0).getProduct_no());
		
		for(int i=0; i<cartvo.size();i++) {
			ProductVO product_vo = mapper.search_cart_product(cartvo.get(i).getProduct_no());
			list.add(product_vo);
		}
		System.out.println("프로덕트브이오 " + list);
		return list; 
	}
	
	@Override
	// 받아온 카트VO 리스트를 통해서 해당하는 카트 상품의 옵션들을 받아온다.
	public List<List<CartOptionVO>> cart_option_number(List<CartVO> cartvo) {
		List<List<CartOptionVO>> cart_op_vo = new ArrayList<>();
		
		for(int i=0; i<cartvo.size();i++) {
			cart_op_vo.add(mapper.cart_option_number(cartvo.get(i).getNo()));

		}
		System.out.println("카트옵션브이오 : " + cart_op_vo);
		return cart_op_vo;
	}
	
	@Override
	// 앞에서 순서대로 받아온 카드옵션VO의 리스트를 받아와서 순서대로 그 카트에 담긴 상품의 옵션을 추출해보자 
	public List<List<ProductOptionVO>> get_product_option(List<List<CartOptionVO>> cartoptvo){
		
		List<List<ProductOptionVO>> list = new ArrayList<>();
	
		for(int i=0; i<cartoptvo.size(); i++) {
				List<ProductOptionVO> list2 = new ArrayList<>(); 
			for(int j=0; j<cartoptvo.get(i).size(); j++) {
				list2.add(mapper.get_product_option(cartoptvo.get(i).get(j).getOption_no()));	
			}
				list.add(list2);
		}
		System.out.println("프로덕트옵션 : " + list);
		return list;
	}
	

}
