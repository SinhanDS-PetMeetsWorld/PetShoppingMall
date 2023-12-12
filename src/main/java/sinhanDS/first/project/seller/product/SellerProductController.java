package sinhanDS.first.project.seller.product;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.slf4j.Slf4j;
import sinhanDS.first.project.product.vo.ProductCategoryVO;
import sinhanDS.first.project.product.vo.ProductOptionVO;
import sinhanDS.first.project.product.vo.ProductQnAVO;
import sinhanDS.first.project.product.vo.ProductVO;
import sinhanDS.first.project.seller.vo.SellerVO;
import sinhanDS.first.project.user.product.ProductService;

@Controller
@RequestMapping("/seller/product")
@Slf4j
public class SellerProductController {
	@Autowired
	private SellerProductService service;
	

	
	@Value("${realPath.registed_img_path}")
	private String registed_img_path;
	
	
	@GetMapping("/regist.do")
	public String regist(Model model) {
		ProductCategoryVO vo = new ProductCategoryVO();
		model.addAttribute("category", vo);
		return "seller/product/regist";
	}		
	
	@PostMapping("/regist.do")
	public String regist(@RequestParam MultipartFile filename, HttpServletRequest request, ProductVO vo, ProductCategoryVO cvo, ProductOptionVO ovo) {
		if(filename != null) {
			vo = service.upload_file(filename, vo);
		}
		vo = service.regist_product(vo);
		service.regist_category(vo, cvo);
		service.regist_option(vo, ovo);
		
		return "redirect:/seller/index.do";
	}
	
	@PostMapping("/regist_forTest.do")
	public String regist_forTest(HttpServletRequest request, ProductVO vo, ProductCategoryVO cvo, ProductOptionVO ovo) {
		vo = service.regist_product(vo);
		service.regist_category(vo, cvo);
		service.regist_option(vo, ovo);
		
		return "redirect:/seller/index.do";
	}
	
	
	
	@GetMapping("/list.do")
	public String list(HttpSession sess, Model model) {
		SellerVO seller = (SellerVO)sess.getAttribute("sellerLoginInfo");
		
		List<ProductVO> productList = service.getProductList(seller.getNo());
		List<List<ProductCategoryVO>> categoryList = service.getCategoryLists(productList);
		List<List<ProductOptionVO>> optionList = service.getOptionLists(productList);
		model.addAttribute("productList", productList);
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("optionList", optionList);
		model.addAttribute("registed_img_path", registed_img_path);
		
		return "seller/product/list";
	}
	
	
	
	@GetMapping("/edit.do")
	public String edit(Model model, ProductVO vo) {
		ProductVO pvo = service.getProduct(vo.getNo());
		List<ProductCategoryVO> categoryList = service.getCategories(vo.getNo());
		List<ProductOptionVO> optionList = service.getOptions(vo.getNo());
		model.addAttribute("category", new ProductCategoryVO());
		model.addAttribute("pvo", pvo);
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("optionList", optionList);
		model.addAttribute("registed_img_path", registed_img_path);
		return "seller/product/edit";
	}
	
	@PostMapping("/edit.do")
	public String edit2(@RequestParam MultipartFile filename, ProductVO vo, ProductCategoryVO cvo, ProductOptionVO ovo) {
		service.remove_file(vo);
		service.upload_file(filename, vo);
		
		service.editProduct(vo);
		service.removeCategory(vo.getNo());
		service.removeOption(vo.getNo());
		service.regist_category(vo, cvo);
		service.regist_option(vo, ovo);
		return "redirect:/seller/index.do";
	}	
	
	@PostMapping("/remove.do")
	public String remove(ProductVO vo) {
		System.out.println("product image_url체크  :" + vo.getImage_url());
		service.remove_file(vo);
		service.removeCategory(vo.getNo());
		service.removeOption(vo.getNo());
		service.removeProduct(vo.getNo());
		return "redirect:/seller/index.do";
	}
	
	
	
	// 신정훈 qna 답변 페이지 구현 (2023 - 12 - 12)
	@GetMapping("/qnalist.do")
	public String QnA_list(Model model , HttpServletRequest request, ProductVO pvo , ProductQnAVO qnavo) {
		
		String seller_no = request.getParameter("seller_no");
		System.out.println("값 들어가냐?" + seller_no);
		List<ProductQnAVO> qna_list = service.getQnAList(Integer.valueOf(seller_no));
		
		List<ProductVO> product_list =service.getProductList(Integer.valueOf(seller_no));
		
		
		model.addAttribute("qna_list",qna_list);
		model.addAttribute("product_list",product_list);
		
		
			
		return "seller/product/qnaanswer";
		
	}
	
	@PostMapping("/qnaanswer.do")
	public String QnA_answer(Model model , HttpServletRequest request , ProductQnAVO qnavo ) {
		
		int r =	service.setQnAanswer(qnavo);
		System.out.println("값이 들어가나??? " + r);
		
	
		return "seller/product/qnaanswer";
		
	}
	
	
}
