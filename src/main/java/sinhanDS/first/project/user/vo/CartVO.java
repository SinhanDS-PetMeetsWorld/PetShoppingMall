package sinhanDS.first.project.user.vo;

import lombok.Data;

@Data
public class CartVO {
	private int no;
	private int user_no;
	private int product_no;
	
	
	private int quantity;
	
	private int[] no_list;
	private int[] product_no_list;
	private int[] quantity_list;
}
