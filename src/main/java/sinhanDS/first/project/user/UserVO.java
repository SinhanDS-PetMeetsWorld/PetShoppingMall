package sinhanDS.first.project.user;

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
	int gender;
	Date birth_date;
	boolean advertisement;
	Date join_date;
}
