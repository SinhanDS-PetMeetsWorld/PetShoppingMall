package sinhanDS.first.project.user;

import org.apache.ibatis.annotations.Mapper;

import sinhanDS.first.project.user.VO.UserAddressVO;
import sinhanDS.first.project.user.VO.UserVO;

@Mapper
public interface UserMapper {
	int edit(UserVO vo);
	UserVO detail(int no);
	UserVO login(UserVO vo);
	int user_regist(UserVO vo);
	int check_password(UserVO vo);
	int initaddr_regist(UserAddressVO vo);
	int exist_addr(UserVO vo);
}
