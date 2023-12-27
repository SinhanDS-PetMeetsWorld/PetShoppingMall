package sinhanDS.first.project.user.vo;

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
	private String valid_date;
	private String cvc;
	
	private List<String> type_list;
	private List<String> account_list;
	private List<ArrayList<String>> company_list;
	public PaymentVO(){
		type_list = new ArrayList<>();
		type_list.add("카드");
		type_list.add("계좌");
		type_list.add("이니시스");
		
		account_list = new ArrayList<>();
		account_list.add("카드 번호");
		account_list.add("계좌 번호");
		
		company_list = new ArrayList<ArrayList<String>>();
		ArrayList<String> company0 = new ArrayList<>();
		company0.add("신한카드");
		company0.add("하나카드");
		company0.add("우리카드");
		company0.add("농협카드");
		company0.add("현대카드");
		company0.add("삼성카드");
		
		company_list.add(company0);
		
		ArrayList<String> company1 = new ArrayList<>();
		company1.add("신한은행");
		company1.add("국민은행");
		company1.add("KEB하나은행");
		company1.add("SC제일은행");
		company1.add("우리은행");
		company1.add("외환은행");
		company1.add("한국시티은행");
		company1.add("경남은행");
		company1.add("광주은행");
		company1.add("대구은행");
		company1.add("부산은행");
		company1.add("전북은행");
		company1.add("제주은행");
		company1.add("기업은행");
		company1.add("농협은행");
		company1.add("수협은행");
		company1.add("한국산업은행");
		company1.add("한국수출입은행");
		company1.add("우체국예금");
		company_list.add(company1);
		
		ArrayList<String> company2 = new ArrayList<>();
		company2.add("무슨카드");
		company2.add("땡땡카드");
		company_list.add(company1);
		
	}
	
	/*
	 type0 카드사, company1에 들어가는 리스트는 은행명
	 type1이 카드사면 리스트로 카드사 목록 넣어주면 됨
	 */
}
