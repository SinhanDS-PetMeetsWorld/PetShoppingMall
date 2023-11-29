package sinhanDS.first.project.user;

import org.apache.ibatis.annotations.Mapper;

import sinhanDS.first.project.user.VO.UserVO;

@Mapper
public interface UserMapper {
	int edit(UserVO vo);
	UserVO detail(int no);
	UserVO login(UserVO vo);
	
}
