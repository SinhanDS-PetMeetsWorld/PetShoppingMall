package sinhanDS.first.project.order.vo;

import lombok.Data;

@Data
public class OrderDetailOptionVO {
	private int no;
	private int order_dno;
	private int product_no;
	private String title;
	private String content;
	private int price;
	
	
	

	private int[] order_detail_option_product_no_list;
	private String[] order_detail_option_title_list;
	private String[] order_detail_option_content_list;
	private int[] order_detail_option_product_price_list;
	private int[] order_detail_option_cart_no_list;
}
