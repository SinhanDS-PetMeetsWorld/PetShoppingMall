package sinhanDS.first.project.user;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
		
		return mapper.edit(vo);
	}

	@Override
	public boolean user_regist(UserVO vo) {
		String phone0 = vo.getPhone0();
		String phone1 = vo.getPhone1();
		String phone2 = vo.getPhone2();
		String phone = phone0 + phone1 + phone2;
		vo.setPhone(phone);

		SimpleDateFormat sdf = new SimpleDateFormat(vo.getBirth0() + "-" + vo.getBirth1() + "-" + vo.getBirth2());
		String ss = sdf.format(new java.util.Date());
		Date birth_date = java.sql.Date.valueOf(ss);
		System.out.println(birth_date);
		vo.setBirth_date(birth_date);
		
		return mapper.user_regist(vo) > 0 ? true : false;
	}

}
