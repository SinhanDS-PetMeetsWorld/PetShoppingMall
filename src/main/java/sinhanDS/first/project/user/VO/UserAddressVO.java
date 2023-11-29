package sinhanDS.first.project.user.VO;

import lombok.Data;

@Data
public class UserAddressVO {
	int no;
	int user_no;
	String zipcode;
	String addr1;
	String addr2;
	String name;
	String phone;
	String comment;
}
