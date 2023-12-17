package sinhanDS.first.project.seller.product;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import sinhanDS.first.project.product.vo.ProductCategoryVO;
import sinhanDS.first.project.product.vo.ProductOptionVO;
import sinhanDS.first.project.product.vo.ProductQnAVO;
import sinhanDS.first.project.product.vo.ProductSearchVO;
import sinhanDS.first.project.product.vo.ProductVO;

@Mapper
public interface SellerProductMapper {
	int regist_product(ProductVO vo);
	int regist_category(ProductCategoryVO vo);
	int regist_option(ProductOptionVO vo);

	int edit(ProductVO vo);
	
	int remove_category(int no);
	int remove_option(int no);
	int remove(int no);
	
	List<ProductVO> getProductList(int no);
	List<ProductVO> getProductListBySearchVO(ProductSearchVO svo);
	
	ProductVO getProduct(int no);
	List<ProductCategoryVO> getCategoriesList(int no);
	List<ProductOptionVO> getOptionsList(int no);
	
	int getNumberOfPage(ProductSearchVO svo);
	
	// 신정훈 (2023 / 12 / 12)
	List<ProductQnAVO> getQnAList(int no);
	
	int setQnAanswer(ProductQnAVO qnavo);
	
}