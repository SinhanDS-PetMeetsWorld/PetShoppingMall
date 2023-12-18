package sinhanDS.first.project.user.product;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.tomcat.util.descriptor.web.LoginConfig;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sinhanDS.first.project.product.vo.ProductOptionVO;
import sinhanDS.first.project.product.vo.ProductCategoryVO;
import sinhanDS.first.project.product.vo.ProductQnAVO;
import sinhanDS.first.project.product.vo.ProductSearchVO;
import sinhanDS.first.project.product.vo.ProductVO;
import sinhanDS.first.project.product.vo.ReviewVO;
import sinhanDS.first.project.user.vo.CartOptionVO;
import sinhanDS.first.project.user.vo.CartVO;
import sinhanDS.first.project.user.vo.SaveBoxVO;
import sinhanDS.first.project.user.vo.UserVO;

@Service
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	private ProductMapper mapper;

	@Override
	public List<ProductQnAVO> QNA_list(ProductQnAVO vo) {
		
		List<ProductQnAVO> qna_list = mapper.QNA_list(vo);
		
		return qna_list;
	}
	
	public int Seller_no(int vo) {
		
		int qna_search_seller = mapper.Seller_no(vo);
		
		return qna_search_seller;
	}
	

	@Override
	public List<ProductVO> Product_more(ProductVO vo) {
		
		List<ProductVO> product_more = mapper.Product_more(vo);
		
		return product_more;
	}
	
	@Override
	public List<ProductCategoryVO> Product_more_category(ProductCategoryVO vo) {
		
		List<ProductCategoryVO> product_more_category = mapper.Product_more_category(vo);
		
		return product_more_category;
	}
	
	
	@Override
	public List<ProductOptionVO> Product_more_option(ProductOptionVO vo) {
		List<ProductOptionVO> product_more_option = mapper.Product_more_option(vo);		
		return product_more_option;
	}

	
	@Override
	public int QNA_insert(ProductQnAVO qnavo , HttpServletRequest request) {
		int r = mapper.QNA_insert(qnavo);
		
		return r;	
		    
	}

	@Override
	public List<ReviewVO> Review_list(ReviewVO vo) {
		
		List<ReviewVO> review_list = mapper.Review_list(vo);
		return review_list;
	}

	@Override
	public List<ProductVO> product_list(ProductSearchVO vo) {
		List<ProductVO> product_list = mapper.product_list(vo);
		return product_list;
	}

	@Override
	public List<ProductVO> total_product_search(ProductSearchVO vo) {
		List<ProductVO> search_product_list = mapper.total_product_search(vo);
		return search_product_list;
	}

	@Override
	public int total_product_searchcount(ProductSearchVO vo) {
		int searchcount = mapper.total_product_searchcount(vo);
		return searchcount;
	}

	@Override
	public int cart_insert(CartVO vo) {
		int cart_no = mapper.cart_insert(vo);
		return cart_no;
	}

	@Override
	public boolean cart_option_insert(CartOptionVO vo) {
		return mapper.cart_option_insert(vo) > 0 ? true : false;
	}
	
	
	@Override
	public int zzim_insert(SaveBoxVO vo) {
		int zzim_no = mapper.zzim_insert(vo);
		return zzim_no;
	}

	@Override
	public int zzim_cancel(SaveBoxVO vo) {
		int zzim_cancelNo = mapper.zzim_cancel(vo);
		return zzim_cancelNo;
	}


	@Override
	public List<SaveBoxVO> zzim_list(SaveBoxVO vo) {
		List<SaveBoxVO> zzim_list = mapper.zzim_list(vo);
		return zzim_list;
	}







}
