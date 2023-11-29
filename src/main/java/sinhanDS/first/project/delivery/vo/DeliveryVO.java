package sinhanDS.first.project.delivery.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class DeliveryVO {
	private int no;
	//배송 예정일
	private Date due_date;
	//배송 시작일 
	private Date start_date;
	//배송 완료일
	private Date arrival_date;
	private String receiver_name;
	private String receiver_phone;
	private String receiver_zipcode;
	private String receiver_addr1;
	private String receiver_addr2;
	private String sender_name;
	private String sender_phone;
	private String sender_zipcode;
	private String sender_addr1;
	private String sender_addr2;
	//배송 상태
		//배송중 false
		//배송 완료 true
	private boolean status;
}
