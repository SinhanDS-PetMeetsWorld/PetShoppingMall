package sinhanDS.first.project.user.vo;

import lombok.Data;

@Data
public class CartOptionVO {
	private int no;
	private int cart_no;
	private int option_no;
	
	private int[] cart_no_list;
	private int[] option_no_list;
}
