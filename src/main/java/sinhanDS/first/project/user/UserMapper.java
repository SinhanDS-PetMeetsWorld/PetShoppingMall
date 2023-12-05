package sinhanDS.first.project.user;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import sinhanDS.first.project.user.VO.UserAddressVO;
import sinhanDS.first.project.user.VO.UserPaymentVO;
import sinhanDS.first.project.user.VO.UserVO;

@Mapper
public interface UserMapper {
	int edit(UserVO vo);
	UserVO detail(int no);
	UserVO login(UserVO vo);
	int user_regist(UserVO vo);
	int check_password(UserVO vo);
	int initaddr_regist(UserAddressVO vo);
	int dupId(String id);
	List<UserAddressVO> exist_addr(int user_no);
	int insert_addr(UserAddressVO vo);
	int modify_addr(UserAddressVO vo);
	int delete_addr(int no);
	List<UserPaymentVO> exist_payment(int user_no);
}
