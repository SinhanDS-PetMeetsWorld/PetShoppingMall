package sinhanDS.first.project.login;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper mapper;
	
	@Override
	public boolean dupEmail(String email) {
		return mapper.dupEmail(email) > 0 ? true : false;
	}

	@Override
	public boolean regist(UserVO vo) {
		return mapper.regist(vo) > 0 ? true : false;
	}

	@Override
	public UserVO login(UserVO vo) {
		return mapper.login(vo);
	}

	@Override
	public UserVO detail(UserVO vo) {
		return mapper.detail(vo.getNo());
	}

	@Override
	public int update(UserVO vo) {
		return mapper.update(vo);
	}

//	public int delete(UserVO vo) {
//		return 0;
//	}

}
