package sinhanDS.first.project.user.VO;

import java.util.ArrayList;
import java.util.List;

import lombok.Data;

@Data
public class PaymentVO {
	private int no;
	private int user_no;
	private int seller_no;
	private String name;
	private int type;
	private String company;
	private String account;
	
	private List<ArrayList<String>> company_list;
	public PaymentVO(){
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
