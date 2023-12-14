package sinhanDS.first.project.product.vo;

import lombok.Data;

@Data
public class ProductSearchVO {
	private int category1;
	private int category2 = 9999;
	
	private String searchWord;
	private String searchType;
	
	private int minprice;
	private int maxprice;
	
	private String sorttype;
	private String totalSearchWord;
}
/* 상품 리스트, 검색 결과 띄워줄 때 조건 여러개 한 번에 넣으려고 만든 vo입니다
 * search type이나 검색어string 등등 자유롭게 추가해서 사용하셔도 됩니다
 *   */
