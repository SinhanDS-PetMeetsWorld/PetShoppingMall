package sinhanDS.first.project.seller.product;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import sinhanDS.first.project.product.vo.ProductCategoryVO;
import sinhanDS.first.project.product.vo.ProductOptionVO;
import sinhanDS.first.project.product.vo.ProductVO;

public interface SellerProductService {
	public int regist(ProductVO vo, ProductCategoryVO cvo, ProductOptionVO ovo);
	public ProductVO upload_file(MultipartFile filename, ProductVO vo);
	public Map getProductList(int seller_no);
	public ProductVO getProduct(int product_no);
	public Map getProductDetail(int product_no);
	
	public boolean edit(ProductVO vo, ProductCategoryVO cvo, ProductOptionVO ovo);
	
	public void remove(ProductVO vo);
}
