package sinhanDS.first.project.user_info_edit;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserMapper {
	int user_info_edit(UserVO vo);
	UserVO user_info_detail(int no);
	UserVO user_login(UserVO vo);
}
