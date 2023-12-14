package sinhanDS.first.project.order.vo;

import java.sql.Date;

import lombok.Data;
import sinhanDS.first.project.product.vo.ProductVO;

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
	private boolean cancle_status;
	private boolean refound_status;
	private String reason;
	private int settlement_no;
	private Date purchase_confirmation_date;
	
	
	
	int cart_no;
	private int[] order_detail_seller_no_list;
	private int[] order_detail_product_no_list;
	private String[] order_detail_product_name_list;
	private int[] order_detail_product_price_list;
	private int[] order_detail_charge_list;
	private int[] order_detail_product_discount_list;
	private String[] order_detail_company_list;
	private String[] order_detail_brand_list;
	private int[] order_detail_quantity_list;
	private int[] order_detail_cart_no_list;
}
