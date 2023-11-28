package sinhanDS.first.project.user;

public interface UserService {
	UserVO login(UserVO vo);
	UserVO detail(UserVO vo);
	int edit(UserVO vo);
}
