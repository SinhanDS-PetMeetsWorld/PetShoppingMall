package sinhanDS.first.project.product.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class ProductQnAVO {
	//번호
	private int no;
	//상품 번호
	private int product_no;
	//질문자 번호
	private int user_no;
	//답변자 번호
	private int seller_no;
	//질문 내용
	private String question_content;
	//질문 작성일
	private Date question_write_date;
	//답변 내용
	private String answer_content;
	//답변 작성일
	private Date answer_write_date;
	
	
	
	//상태
		//답변 대기 - 0
		//답변 완료 - 1
		//질문 삭제 - 2
	private int status;
	
	
}
