package sinhanDS.first.project.user;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sinhanDS.first.project.user.VO.PaymentVO;
import sinhanDS.first.project.user.VO.UserAddressVO;
import sinhanDS.first.project.user.VO.UserVO;


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

		if(check_password(vo)) {
			return mapper.edit(vo);
		}
		return 0;
		
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

}
