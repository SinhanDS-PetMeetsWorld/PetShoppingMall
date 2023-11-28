package sinhanDS.first.project.product.VO;

import lombok.Data;

@Data
public class OptionVO {
	//번호
	private int no;
	//상품 번호
	private int product_no;
	//옵션 제목
	private String option;
	//옵션 내용
	private String content;
	//가격
	private int price;
}
