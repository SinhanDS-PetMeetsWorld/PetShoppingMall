package sinhanDS.first.project.product;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import sinhanDS.first.project.product.vo.OptionVO;
import sinhanDS.first.project.product.vo.ProductCategoryVO;
import sinhanDS.first.project.product.vo.ProductQnAVO;
import sinhanDS.first.project.product.vo.ProductVO;
import sinhanDS.first.project.product.vo.ReviewVO;

@Mapper
public interface ProductMapper {
	// QNA 리스트	
	List<ProductQnAVO> QNA_list (ProductQnAVO vo);
	// 리뷰 리스트
	List<ReviewVO> Review_list (ReviewVO vo);
	
	
	// 볼 수 있는 거	
	ProductQnAVO view(ProductQnAVO vo); 
	
	// (제품번호를 이용한) 판매자 검색
	int Seller_no (int product_no);
	
	// QNA 등록	
	int QNA_insert(ProductQnAVO vo);
	
	int regist(ProductVO vo);
	int regist_category(ProductCategoryVO vo);
	int regist_option(OptionVO vo);
}
