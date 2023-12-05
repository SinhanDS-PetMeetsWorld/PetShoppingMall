package sinhanDS.first.project.seller;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sinhanDS.first.project.product.vo.OptionVO;
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

	public int regist(ProductVO vo, ProductCategoryVO cvo, OptionVO ovo) {
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
				OptionVO novo = new OptionVO();
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
		List<ProductVO> productList = mapper.productList(seller_no);
		List<List<ProductCategoryVO>> categoryList = new ArrayList<>();
		for(int i = 0; i < productList.size(); i++) {
			System.out.println("productNO: " + productList.get(i).getNo());
			List<ProductCategoryVO> categoryVO = mapper.categoryList(productList.get(i).getNo());
			categoryList.add(categoryVO);
			System.out.println(categoryVO);
		}
		
		
		System.out.println("productList체크: " + productList);
		map.put("productList", productList);
		map.put("categoryList", categoryList);
//		map.put("optionList", mapper);
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
