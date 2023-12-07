package sinhanDS.first.project.seller.product;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import sinhanDS.first.project.product.vo.ProductCategoryVO;
import sinhanDS.first.project.product.vo.ProductOptionVO;
import sinhanDS.first.project.product.vo.ProductVO;
import sinhanDS.first.project.util.file.FileController;
import sinhanDS.first.project.util.file.FileNameVO;
@Service
public class SellerProductServiceImpl implements SellerProductService {
	@Autowired
	private SellerProductMapper mapper;
	@Autowired
	private FileController fileController;
	
	@Value("${realPath.registed_img_path}")
	private String registed_img_path;
	
	public int regist(ProductVO vo, ProductCategoryVO cvo, ProductOptionVO ovo) {
		int result = mapper.regist_product(vo);
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
	
	public ProductVO upload_file(MultipartFile filename, ProductVO vo) {
		FileNameVO fvo = fileController.upload(filename, registed_img_path);

		try {
			vo.setImage_url(fvo.getSaved_filename());
		}catch(NullPointerException e) {
			System.out.println("상품 이미지 없음 체크");
		}
		
		return vo;
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
	
	public boolean edit(ProductVO vo, ProductCategoryVO cvo, ProductOptionVO ovo) {
		System.out.println("수정작업시작");
		System.out.println("vo체크: " + vo);
		int result = mapper.edit(vo);
		System.out.println("result체크: " +  result);
		if(result == 0) return false;
		
		mapper.remove_category(vo.getNo());
		mapper.remove_option(vo.getNo());
		System.out.println("옵션/카테고리제거체크 " );
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
		
		return true;
	}
	
	public void remove(ProductVO vo) {
		System.out.println("삭제 체크: " + vo.getNo());
		System.out.println("삭제 체크: " + vo.getImage_url());
		
		if(!("".equals(vo.getImage_url()) || "h".equals(vo.getImage_url().substring(0, 1)))) {
			fileController.remove(vo);
		}
		mapper.remove_category(vo.getNo());
		mapper.remove_option(vo.getNo());
		mapper.remove(vo.getNo());
	}

}
