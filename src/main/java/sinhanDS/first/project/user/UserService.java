package sinhanDS.first.project.user;

public interface UserService {
	UserVO login(UserVO vo);
	UserVO detail(UserVO vo);
	UserVO edit(UserVO vo);
}
