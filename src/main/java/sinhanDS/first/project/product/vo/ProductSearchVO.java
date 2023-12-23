package sinhanDS.first.project.product.vo;

import lombok.Data;

@Data
public class ProductSearchVO {
	private int order_no;
	private int user_no;
	private int seller_no;
	private int product_no;
	
	private String name;
	private String company;
	private String brand;
	
	private int category1;
	private int category2 = 9999;
	
	private int page = 1;
	/* 한 페이지에 보여줄 상품의 개수 */
	private int numberOfProductInPage = 5;
	private int numberOfPageInIndexList = 5;
	
	private int startIdx;
	private String searchWord;
	private String searchType;
	
	private int minprice = 0;
	private int maxprice = 999999999;
	
	private String sorttype;
	private String totalSearchWord;
	
	public int getStartIdx() {
		return (page-1) * numberOfProductInPage;
	}
	
	
	/* 한 페이지당 표기할 수 있는 품목의 갯수를 설정할 수 있습니다. */
	private int numberInPage_search = 15;
	private int numberInPage_review = 4; //주문 상세의 리뷰 노출 개수 
	private int numberInPage_qna = 5;
	private int numberInPage_zzim = 10;
	private int numberInPage_reviewList = 10; //사용자 정보의 리뷰 노출 개수 
	
	/* 관리자 페이지에서 애들 볼 떄 */
	private int numberInPage_UserVO = 30;
}
/* 상품 리스트, 검색 결과 띄워줄 때 조건 여러개 한 번에 넣으려고 만든 vo입니다
 * search type이나 검색어string 등등 자유롭게 추가해서 사용하셔도 됩니다
 *   */