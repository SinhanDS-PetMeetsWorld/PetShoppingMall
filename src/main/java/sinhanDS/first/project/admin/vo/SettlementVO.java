package sinhanDS.first.project.admin.vo;

import java.util.Date;

import lombok.Data;

@Data
public class SettlementVO {
	
	private int no;
	private int seller_no;
	private Date request_date;
	private Date settlement_date;
	private int total_sales;
	private int total_charge;
	private int total_settlement;
	private String account;
}
