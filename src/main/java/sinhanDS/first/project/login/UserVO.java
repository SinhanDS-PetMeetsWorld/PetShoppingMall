package sinhanDS.first.project.login;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class UserVO {
	private int no;
	private String id;
	private String email;
	private String password;
	private String name;
	private int gender;
	private String birthday;
	private String hp;
	private Timestamp registdate;
	private String zipcode;
	private String addr1;
	private String addr2;
	
}
