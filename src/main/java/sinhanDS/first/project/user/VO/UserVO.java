package sinhanDS.first.project.user.VO;

import java.sql.Date;

import lombok.Data;

@Data
public class UserVO {
	int no;
	String id;
	String password;
	String name;
	String email;
	String phone;
	int gender;			// 0이 남성, 1은 여성
	Date birth_date;
	boolean advertisement;	// 0은 false. 선택하지 않은 경우 false
	Date join_date;
	
	String new_password;
	String phone0;
	String phone1;
	String phone2;
	
	String birth0;
	String birth1;
	String birth2;
	
}
