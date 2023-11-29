package sinhanDS.first.project.delivery.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class DeliveryDetailVO {
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
	private boolean cancle_status;
	private boolean refound_status;
	private String reason;
	private int settlement_no;
	private Date purchase_confirmation_date;
}
