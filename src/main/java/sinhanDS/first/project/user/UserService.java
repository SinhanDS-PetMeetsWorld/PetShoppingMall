package sinhanDS.first.project.user;

import java.util.List;

import sinhanDS.first.project.user.VO.UserAddressVO;
import sinhanDS.first.project.user.VO.PaymentVO;
import sinhanDS.first.project.user.VO.UserVO;

public interface UserService {
	UserVO login(UserVO vo);
	UserVO detail(UserVO vo);
	int edit(UserVO vo);
	int user_regist(UserVO vo);
	boolean check_password(UserVO vo);
	boolean initaddr_regist(UserAddressVO vo);
	boolean dupId(String id);
	List<UserAddressVO> exist_addr(UserVO vo);
	int insert_addr(UserAddressVO vo);
	int modify_addr(UserAddressVO vo);
	int delete_addr(int no);
	List<PaymentVO> exist_payment(UserVO vo);
}
