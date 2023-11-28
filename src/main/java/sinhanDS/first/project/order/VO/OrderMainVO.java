package sinhanDS.first.project.order.VO;

import java.sql.Date;

public class OrderMainVO {
	//주문 번호
	private int no;
	//구매자 번호
	private int user_no;
	//주문 일자
	private Date order_date;
	//은행 번호
	private int finance_company_no;
	//결제 수단
	private int payment_type;
	//결제 내용
	private String payment_content;
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
