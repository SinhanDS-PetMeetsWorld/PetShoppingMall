package sinhanDS.first.project.product.vo;

import lombok.Data;

@Data
public class ProductSearchVO {
	private int seller_no;
	
	private int category1;
	private int category2 = 9999;
	
	private int page = 1;
	/* 한 페이지에 보여줄 상품의 개수 */
	private int numberOfProductInPage = 5;
	private int startIdx;
	private String searchWord;
	private String searchType;
	
	private int minprice;
	private int maxprice;
	
	private String sorttype;
	private String totalSearchWord;
	
	public int getStartIdx() {
		return (page-1) * numberOfProductInPage;
	}
}
/* 상품 리스트, 검색 결과 띄워줄 때 조건 여러개 한 번에 넣으려고 만든 vo입니다
 * search type이나 검색어string 등등 자유롭게 추가해서 사용하셔도 됩니다
 *   */
