package sinhanDS.first.project.user;

import sinhanDS.first.project.user.VO.UserVO;

public interface UserService {
	UserVO login(UserVO vo);
	UserVO detail(UserVO vo);
	int edit(UserVO vo);
}
