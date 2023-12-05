package sinhanDS.first.project.seller;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sinhanDS.first.project.product.vo.ProductOptionVO;
import sinhanDS.first.project.product.vo.ProductCategoryVO;
import sinhanDS.first.project.product.vo.ProductVO;
import sinhanDS.first.project.seller.vo.SellerVO;

@Service
public class SellerServiceImpl implements SellerService {
	@Autowired
	SellerMapper mapper;
	
	@Override
	public SellerVO login(SellerVO vo) {
		return mapper.login(vo);
	}

	public int regist(ProductVO vo, ProductCategoryVO cvo, ProductOptionVO ovo) {
		int result = mapper.regist(vo);
		for(int i = 0; i < cvo.getCategory1_list().length; i++) {
			ProductCategoryVO ncvo = new ProductCategoryVO();
			ncvo.setProduct_no(vo.getNo());
			ncvo.setCategory1(cvo.getCategory1_list()[i]);
			ncvo.setCategory2(cvo.getCategory2_list()[i]);
			mapper.regist_category(ncvo);
		}
		
		if(ovo.getTitle_list() != null) {
			for(int i = 0; i < ovo.getTitle_list().length; i++) {
				ProductOptionVO novo = new ProductOptionVO();
				novo.setProduct_no(vo.getNo());
				novo.setTitle(ovo.getTitle_list()[i]);
				novo.setContent(ovo.getContent_list()[i]);
				novo.setPrice(ovo.getPrice_list()[i]);
				System.out.println("novo체크: " + novo);
				mapper.regist_option(novo);
			}
		}
		return result; 
	}
	public Map getProductList(int seller_no){
		Map map = new HashMap<>();
		List<ProductVO> productList = mapper.getProductList(seller_no);
		List<List<ProductCategoryVO>> categoryList = new ArrayList<>();
		List<List<ProductOptionVO>> optionList = new ArrayList<>();
		for(int i = 0; i < productList.size(); i++) {
			System.out.println("productNO: " + productList.get(i).getNo());
			List<ProductCategoryVO> categoryVO = mapper.getCategoriesList(productList.get(i).getNo());
			categoryList.add(categoryVO);
			System.out.println(categoryVO);
		}
		
		for(int i = 0; i < productList.size(); i++) {
			System.out.println("productNO: " + productList.get(i).getNo());
			List<ProductOptionVO> optionVO = mapper.getOptionsList(productList.get(i).getNo());
			optionList.add(optionVO);
			System.out.println(optionVO);
		}
		
		System.out.println("productList체크: " + productList);
		map.put("productList", productList);
		map.put("categoryList", categoryList);
		map.put("optionList", optionList);
		return map;
	}
	
	public ProductVO getProduct(int product_no) {
		ProductVO vo = mapper.getProduct(product_no);
		return vo;
	}
	
	public Map getProductDetail(int product_no) {
		Map map = new HashMap();
		List<ProductCategoryVO> categoryList = new ArrayList<>();
		List<ProductOptionVO> optionList = new ArrayList<>();
		categoryList = mapper.getCategoriesList(product_no);
		optionList = mapper.getOptionsList(product_no);
		
		map.put("pvo", mapper.getProduct(product_no));
		map.put("categoryList", categoryList);
		map.put("optionList", optionList);
		
		return map;
	}
	
	@Override
	public int seller_regist(SellerVO vo) {
		String phone0 = vo.getPhone0();
		String phone1 = vo.getPhone1();
		String phone2 = vo.getPhone2();
		String phone = phone0 + "-" + phone1 + "-" + phone2;
		vo.setPhone(phone);
		
		return mapper.seller_regist(vo);
	}
	
	@Override
	public boolean check_password(SellerVO vo) {
		int user = mapper.check_password(vo);
		if(user == 1) {
			return true;
		}
		else {
			return false;
		}	
	}

	@Override
	public boolean dupId(String id) {
		return mapper.dupId(id) > 0 ? true : false;
	}
}
