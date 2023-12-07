package sinhanDS.first.project.product;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import sinhanDS.first.project.product.vo.ProductOptionVO;
import sinhanDS.first.project.product.vo.ProductCategoryVO;
import sinhanDS.first.project.product.vo.ProductQnAVO;
import sinhanDS.first.project.product.vo.ProductVO;
import sinhanDS.first.project.product.vo.ReviewVO;

public interface ProductService {

	// 상세 페이지 Q&A 리스트
	List<ProductQnAVO> QNA_list(ProductQnAVO vo);
	
	// Q&A 등록 페이지 판매자 번호 가져오기
	int Seller_no(int product_no);
		
	// 상세 페이지 상품 정보
	List <ProductVO> Product_more(ProductVO vo);
	
	// 상세 페이지 상품 카테고리
	List <ProductCategoryVO> Product_more_category(ProductCategoryVO pcvo);
	
	List <ProductOptionVO> Product_more_option(ProductOptionVO povo);
	
	public int QNA_insert(ProductQnAVO qnavo , HttpServletRequest request);
	
	List<ReviewVO> Review_list (ReviewVO vo);
	List<ProductVO> product_list();
}
