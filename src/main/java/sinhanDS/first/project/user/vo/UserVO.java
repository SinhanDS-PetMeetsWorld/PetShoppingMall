package sinhanDS.first.project.user.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class UserVO {
	private int no;
	private String id;
	private String password;
	private String name;
	private String email;
	private String phone;
	private int gender;			// 0이 남성, 1은 여성
	private Date birth_date;
	private boolean advertisement;	// 0은 false. 선택하지 않은 경우 false
	private Date join_date;
	private boolean restricted;
	
	private String new_password;
	private String phone0;
	private String phone1;
	private String phone2;
	
	private String birth0;
	private String birth1;
	private String birth2;
	
	private String zipcode;
	private String addr1;
	private String addr2;
}
