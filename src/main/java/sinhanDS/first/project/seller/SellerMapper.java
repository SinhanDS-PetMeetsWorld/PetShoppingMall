package sinhanDS.first.project.seller;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import sinhanDS.first.project.product.vo.ProductOptionVO;
import sinhanDS.first.project.product.vo.ProductCategoryVO;
import sinhanDS.first.project.product.vo.ProductVO;
import sinhanDS.first.project.seller.vo.SellerVO;

@Mapper
public interface SellerMapper {
	SellerVO login(SellerVO vo);
	
	int regist(ProductVO vo);
	int regist_category(ProductCategoryVO vo);
	int regist_option(ProductOptionVO vo);
	
	List<ProductVO> getProductList(int no);
	ProductVO getProduct(int no);
	List<ProductCategoryVO> getCategoriesList(int no);
	List<ProductOptionVO> getOptionsList(int no);
	
	int seller_regist(SellerVO vo);
	int check_password(SellerVO vo);
	int dupId(String id);
}
