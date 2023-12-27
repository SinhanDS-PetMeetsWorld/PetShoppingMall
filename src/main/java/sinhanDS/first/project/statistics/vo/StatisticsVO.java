package sinhanDS.first.project.statistics.vo;

import lombok.Data;

@Data
public class StatisticsVO {
	private int seller_no;
	private int sale;
	private int cancle;
	private int refound;
	
	private int orders;
	private int quantity;
	private int realsales;
	
	private String order_date;
	private int category1;
	private int category2;
	private int gender;
	private int age;
}
