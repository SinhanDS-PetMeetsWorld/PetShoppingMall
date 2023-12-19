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

import lombok.extern.slf4j.Slf4j;
import sinhanDS.first.project.product.vo.ProductCategoryVO;
import sinhanDS.first.project.product.vo.ProductOptionVO;
import sinhanDS.first.project.product.vo.ProductQnAVO;
import sinhanDS.first.project.product.vo.ProductSearchVO;
import sinhanDS.first.project.product.vo.ProductVO;
import sinhanDS.first.project.util.file.FileController;
import sinhanDS.first.project.util.file.FileNameVO;
@Service
@Slf4j
public class SellerProductServiceImpl implements SellerProductService {
	@Autowired
	private SellerProductMapper mapper;
	@Autowired
	private FileController fileController;
	
	@Value("${realPath.registed_img_path}")
	private String registed_img_path;
	
	
	public ProductVO upload_file(MultipartFile filename, ProductVO vo) {
		FileNameVO fvo = fileController.upload(filename, registed_img_path);

		try {
			vo.setImage_url(fvo.getSaved_filename());
		}catch(NullPointerException e) {
			e.printStackTrace();
		}
		
		return vo;
	}
	
	public ProductVO regist_product(ProductVO vo) {
		if(mapper.regist_product(vo) > 0) return vo;
		else return null;
	}
	
	public void regist_category(ProductVO vo, ProductCategoryVO cvo) {
		for(int i = 0; i < cvo.getCategory1_list().length; i++) {
			ProductCategoryVO ncvo = new ProductCategoryVO();
			ncvo.setProduct_no(vo.getNo());
			ncvo.setCategory1(cvo.getCategory1_list()[i]);
			ncvo.setCategory2(cvo.getCategory2_list()[i]);
			mapper.regist_category(ncvo);
		}
	}
	
	public void regist_option(ProductVO vo, ProductOptionVO ovo) {
		if(ovo.getTitle_list() != null) {
			for(int i = 0; i < ovo.getTitle_list().length; i++) {
				ProductOptionVO novo = new ProductOptionVO();
				novo.setProduct_no(vo.getNo());
				novo.setTitle(ovo.getTitle_list()[i]);
				novo.setContent(ovo.getContent_list()[i]);
				novo.setPrice(ovo.getPrice_list()[i]);
				mapper.regist_option(novo);
			}
		}
	}

	
	public void editProduct(ProductVO vo) {
		mapper.edit(vo);
	}
	
	
	public void remove_file(ProductVO vo) {
		if(!("".equals(vo.getImage_url()) || "h".equals(vo.getImage_url().substring(0, 1)))) {
			fileController.remove(vo);
		}
	}
	
	public void removeCategory(int product_no) {
		mapper.remove_category(product_no);
	}
	
	public void removeOption(int product_no) {
		mapper.remove_option(product_no);
	}
	
	public void removeProduct(int product_no) {
		mapper.remove(product_no);
	}

	
	
	public ProductVO getProduct(int product_no) {
		ProductVO vo = mapper.getProduct(product_no);
		return vo;
	}
	
	public List<ProductVO> getProductList(int seller_no){
		return mapper.getProductList(seller_no);
	}
	public List<ProductVO> getProductList(ProductSearchVO svo){
		return mapper.getProductListBySearchVO(svo);
	}
	
	public List<List<ProductCategoryVO>> getCategoryLists(List<ProductVO> productList){
		List<List<ProductCategoryVO>> categoryList = new ArrayList<>();
		for(int i = 0; i < productList.size(); i++) {
			System.out.println("productNO: " + productList.get(i).getNo());
			List<ProductCategoryVO> categoryVO = mapper.getCategoriesList(productList.get(i).getNo());
			categoryList.add(categoryVO);
			System.out.println(categoryVO);
		}
		return categoryList;
	}
	
	public List<ProductCategoryVO> getCategories(int product_no){
		return mapper.getCategoriesList(product_no);
	}
	
	public List<List<ProductOptionVO>> getOptionLists(List<ProductVO> productList){
		List<List<ProductOptionVO>> optionList = new ArrayList<>();
		for(int i = 0; i < productList.size(); i++) {
			System.out.println("productNO: " + productList.get(i).getNo());
			List<ProductOptionVO> optionVO = mapper.getOptionsList(productList.get(i).getNo());
			optionList.add(optionVO);
			System.out.println(optionVO);
		}
		return optionList;
	}
	
	public List<ProductOptionVO> getOptions(int product_no){
		return mapper.getOptionsList(product_no);
	}

	public int getNumberOfPage(ProductSearchVO svo) {
		return mapper.getNumberOfPage(svo);
	}
	
	// 신정훈 작업 내용 (2023 - 12 - 12 )
	public List<ProductQnAVO> getQnAList(int seller_no) {
		return mapper.getQnAList(seller_no);
	}


	@Override
	public int setQnAanswer(ProductQnAVO qnavo) {
		int r =  mapper.setQnAanswer(qnavo);
		
		return r;
		
	}


	
}
