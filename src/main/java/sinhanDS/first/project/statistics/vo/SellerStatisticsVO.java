package sinhanDS.first.project.statistics.vo;

import lombok.Data;

@Data
public class SellerStatisticsVO {
	private int seller_no;
	private String order_date;
	private int sale;
	private int cancle;
	private int refound;
}
