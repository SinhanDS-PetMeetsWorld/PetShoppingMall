package sinhanDS.first.project.product.vo;

import lombok.Data;

@Data
public class ProductOptionVO {
	//번호
	private int no;
	//상품 번호
	private int product_no;
	//옵션 제목
	private String title;
	//옵션 내용
	private String content;
	//가격
	private int price;
	
	
	
	private String[] title_list; //title = option명 
	private String[] content_list;
	private int[] price_list;
}
