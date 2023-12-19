package sinhanDS.first.project.user.product;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import sinhanDS.first.project.product.vo.ProductCategoryVO;
import sinhanDS.first.project.product.vo.ProductOptionVO;
import sinhanDS.first.project.product.vo.ProductQnAVO;
import sinhanDS.first.project.product.vo.ProductSearchVO;
import sinhanDS.first.project.product.vo.ProductVO;
import sinhanDS.first.project.product.vo.ReviewVO;
import sinhanDS.first.project.user.vo.CartOptionVO;
import sinhanDS.first.project.user.vo.CartVO;
import sinhanDS.first.project.user.vo.SaveBoxVO;
import sinhanDS.first.project.user.vo.UserVO;

@Mapper
public interface ProductMapper {
	// QNA 리스트	
	List<ProductQnAVO> QNA_list (ProductQnAVO vo);
	// 리뷰 리스트
	List<ReviewVO> Review_list (ReviewVO vo);
	
	List<ProductVO> Product_more (ProductVO vo);
	
	List<ProductCategoryVO> Product_more_category(ProductCategoryVO vo); 
	
	List<ProductOptionVO> Product_more_option(ProductOptionVO vo); 
	
	// (제품번호를 이용한) 판매자 검색
	int Seller_no (int product_no);
	
	// QNA 등록	
	int QNA_insert(ProductQnAVO vo);
	
	// 물건 리스트
	List<ProductVO> product_list(ProductSearchVO vo);
	
	//전체 검색 물건 리스트(상위 6개)
	List<ProductVO> total_product_search(ProductSearchVO vo);
	//전체 검색 결과 개수
	int total_product_searchcount(ProductSearchVO vo);
	//장바구니에 물건 추가
	int cart_insert(CartVO vo);
	//장바구니 물건 추가 시 옵션 저장
	int cart_option_insert(CartOptionVO vo);
	
	
	//(신정훈) 12 - 16 작업 내용 : 찜 기능 구현
	int zzim_insert(SaveBoxVO vo);
	
	int zzim_cancel(SaveBoxVO vo);
	
	List<SaveBoxVO> zzim_check(SaveBoxVO vo);
	

}
