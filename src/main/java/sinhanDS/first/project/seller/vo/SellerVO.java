package sinhanDS.first.project.seller.vo;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import lombok.Data;

@Data
public class SellerVO {
	private int no;
	private String id;
	private String password;
	private String name;
	private String email;
	private String phone;
	private String business_number;
	private String zipcode;
	private String addr1;
	private String addr2;
	private String phone0;
	private String phone1;
	private String phone2;
	private int bank;
	private String account;
	private String new_password;
	private boolean restricted;
	private Date withdrawal_date;
	
	private List<ArrayList<String>> company_list;
	public SellerVO(){
		company_list = new ArrayList<ArrayList<String>>();
		ArrayList<String> company0 = new ArrayList<>();
		company0.add("신한은행");
		company0.add("국민은행");
		company0.add("KEB하나은행");
		company0.add("SC제일은행");
		company0.add("우리은행");
		company0.add("외환은행");
		company0.add("한국시티은행");
		company0.add("경남은행");
		company0.add("광주은행");
		company0.add("대구은행");
		company0.add("부산은행");
		company0.add("전북은행");
		company0.add("제주은행");
		company0.add("기업은행");
		company0.add("농협은행");
		company0.add("수협은행");
		company0.add("한국산업은행");
		company0.add("한국수출입은행");
		company0.add("우체국예금");
		company_list.add(company0);
	}
}
