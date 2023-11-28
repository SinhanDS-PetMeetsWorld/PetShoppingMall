package sinhanDS.first.project.user;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserMapper {
	int edit(UserVO vo);
	UserVO detail(int no);
	UserVO login(UserVO vo);
}
