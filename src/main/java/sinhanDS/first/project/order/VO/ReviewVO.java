package sinhanDS.first.project.order.VO;

import java.sql.Date;

import lombok.Data;

@Data
public class ReviewVO {
	private int no;
	private int user_no;
	private int product_no;
	private int order_no;
	private int order_dno;
	private float rating;
	private String content;
	private String image_url;
	private Date write_date;
}
