package sinhanDS.first.project.statistics.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class StatisticsVO {
	private Date order_date;
	private int sale;
	private int cancle;
	private int refound;
}
