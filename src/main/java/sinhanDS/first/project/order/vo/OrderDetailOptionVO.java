package sinhanDS.first.project.order.vo;

import lombok.Data;

@Data
public class OrderDetailOptionVO {
	private int no;
	private int order_dno;
	private int product_no;
	private String option;
	private String content;
	private int price;
}
