package sinhanDS.first.project.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sinhanDS.first.project.product.vo.OptionVO;
import sinhanDS.first.project.product.vo.ProductCategoryVO;
import sinhanDS.first.project.product.vo.ProductQnAVO;
import sinhanDS.first.project.product.vo.ProductVO;
import sinhanDS.first.project.product.vo.ReviewVO;

@Service
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	private ProductMapper mapper;

	@Override
	public List<ProductQnAVO> QNA_list(ProductQnAVO vo) {
		
		List<ProductQnAVO> qna_list = mapper.QNA_list(vo);
		
		return qna_list;
	}

	@Override
	public List<ReviewVO> QNA_review(ReviewVO vo) {
		
		List<ReviewVO> qna_review = mapper.QNA_review(vo);
		return qna_review;
	}
	
	public int regist(ProductVO vo, ProductCategoryVO cvo, OptionVO ovo) {
		int result = mapper.regist(vo);
		for(int i = 0; i < cvo.getCategory1_list().length; i++) {
			ProductCategoryVO ncvo = new ProductCategoryVO();
			ncvo.setProduct_no(vo.getNo());
			ncvo.setCategory1(cvo.getCategory1_list()[i]);
			ncvo.setCategory2(cvo.getCategory2_list()[i]);
			mapper.regist_category(ncvo);
		}
		
		for(int i = 0; i < ovo.getTitle_list().length; i++) {
			OptionVO novo = new OptionVO();
			novo.setProduct_no(vo.getNo());
			novo.setTitle(ovo.getTitle_list()[i]);
			novo.setContent(ovo.getContent_list()[i]);
			novo.setPrice(ovo.getPrice_list()[i]);
			System.out.println("novo체크: " + novo);
			mapper.regist_option(novo);
		}
		cvo.setProduct_no(vo.getNo());
		
		return result; 
	};
}
