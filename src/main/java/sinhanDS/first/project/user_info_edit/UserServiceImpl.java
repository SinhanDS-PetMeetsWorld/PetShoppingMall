package sinhanDS.first.project.user_info_edit;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper mapper;
	
	@Override
	public int user_info_edit(UserVO vo) {
		return mapper.user_info_edit(vo);
	}
	
	@Override
	public UserVO user_info_detail(UserVO vo) {
		return mapper.user_info_detail(vo.getNo());
	}

	@Override
	public UserVO user_login(UserVO vo) {
		return mapper.user_login(vo);
	}
	
}
