package sinhanDS.first.project.seller.product;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import sinhanDS.first.project.product.vo.ProductCategoryVO;
import sinhanDS.first.project.product.vo.ProductOptionVO;
import sinhanDS.first.project.product.vo.ProductVO;

public interface SellerProductService {
	
	public ProductVO upload_file(MultipartFile filename, ProductVO vo);
	public ProductVO regist_product(ProductVO vo);
	public void regist_category(ProductVO vo, ProductCategoryVO cvo);
	public void regist_option(ProductVO vo, ProductOptionVO ovo);
	
	public ProductVO getProduct(int product_no);
	public List<ProductVO> getProductList(int seller_no);
	public List<ProductCategoryVO> getCategories(int product_no);
	public List<List<ProductCategoryVO>> getCategoryLists(List<ProductVO> productList);
	public List<ProductOptionVO> getOptions(int product_no);
	public List<List<ProductOptionVO>> getOptionLists(List<ProductVO> productList);
	
	public boolean edit(ProductVO vo, ProductCategoryVO cvo, ProductOptionVO ovo);
	
	public void remove_file(ProductVO vo);
	public void removeCategory(int product_no);
	public void removeOption(int product_no);
	public void removeProduct(int product_no);
}
