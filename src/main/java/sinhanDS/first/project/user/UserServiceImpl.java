package sinhanDS.first.project.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


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
	public UserVO edit(UserVO vo) {
		int result = mapper.edit(vo);
		if(result == 0) {
			//수정안됨
		}
		return mapper.detail(vo.getNo());
	}

}
