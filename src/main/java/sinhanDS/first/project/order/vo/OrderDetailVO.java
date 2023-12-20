package sinhanDS.first.project.order.vo;

import java.sql.Date;
import java.util.List;

import lombok.Data;

@Data
public class OrderDetailVO {
	private int no;
	private int order_no;
	private int user_no;
	private int seller_no;
	private int product_no;
	private String product_name;
	private int product_price;
	private int charge;
	private int discount;
	private String company;
	private String brand;
	private int quantity;
	private int delivery_no;
	private Date order_date;
	private int delivery_status;
	private int cancle_status; //0 : 취소 x , 1: 구매자 취소, 2: 판매자 취소 
	private int refound_status;
	private String reason;
	private int settlement_no;
	private Date purchase_confirmation_date;
	
	
	int cart_no;
	private List<OrderDetailOptionVO> options;
}
