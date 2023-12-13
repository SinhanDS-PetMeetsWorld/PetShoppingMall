package sinhanDS.first.project.order.vo;

import java.sql.Date;
import lombok.Data;

@Data
public class OrderMainVO {
	//주문 번호
	private int no;
	//구매자 번호
	private int user_no;
	//주문 일자
	private Date order_date;
	//결제 수단
	private int payment_type;
	//은행 번호
	private int payment_company;
	//결제 계좌, 카드번호
	private String payment_account;
	//우편 번호
	private String zipcode;
	//주소
	private String addr1;
	//상세 주소
	private String addr2;
	//삭제 여부
	private boolean delete;
	//총 가격
	private int total_price;
	//총 배송비
	private int total_delivery_fee;
	//주문명
	private String name;
}
