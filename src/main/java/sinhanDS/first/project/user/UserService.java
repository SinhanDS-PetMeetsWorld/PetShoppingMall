package sinhanDS.first.project.user;

import sinhanDS.first.project.user.VO.UserAddressVO;
import sinhanDS.first.project.user.VO.UserVO;

public interface UserService {
	UserVO login(UserVO vo);
	UserVO detail(UserVO vo);
	int edit(UserVO vo);
	int user_regist(UserVO vo);
	boolean check_password(UserVO vo);
	boolean initaddr_regist(UserAddressVO vo);
	
}
