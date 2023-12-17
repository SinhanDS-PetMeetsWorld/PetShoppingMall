package sinhanDS.first.project.seller.product;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import sinhanDS.first.project.product.vo.ProductCategoryVO;
import sinhanDS.first.project.product.vo.ProductOptionVO;
import sinhanDS.first.project.product.vo.ProductQnAVO;
import sinhanDS.first.project.product.vo.ProductSearchVO;
import sinhanDS.first.project.product.vo.ProductVO;

public interface SellerProductService {
	
	public ProductVO upload_file(MultipartFile filename, ProductVO vo);
	public ProductVO regist_product(ProductVO vo);
	public void regist_category(ProductVO vo, ProductCategoryVO cvo);
	public void regist_option(ProductVO vo, ProductOptionVO ovo);
	
	public void editProduct(ProductVO vo);
	
	public void remove_file(ProductVO vo);
	public void removeCategory(int product_no);
	public void removeOption(int product_no);
	public void removeProduct(int product_no);
	
	public ProductVO getProduct(int product_no);
	public List<ProductVO> getProductList(int seller_no);
	public List<ProductVO> getProductList(ProductSearchVO svo);
	public List<ProductCategoryVO> getCategories(int product_no);
	public List<List<ProductCategoryVO>> getCategoryLists(List<ProductVO> productList);
	public List<ProductOptionVO> getOptions(int product_no);
	public List<List<ProductOptionVO>> getOptionLists(List<ProductVO> productList);
	
	public int getNumberOfPage(ProductSearchVO svo);
	
	// 2023 - 12 -12 (신정훈 작업)
	public List<ProductQnAVO> getQnAList(int seller_no);
	
	
	public int setQnAanswer(ProductQnAVO qnavo);
	

}
