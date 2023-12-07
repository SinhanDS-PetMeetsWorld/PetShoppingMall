package sinhanDS.first.project.seller.product;

import java.util.Map;

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

import com.mysql.cj.log.Log;

import lombok.extern.log4j.Log4j;
import sinhanDS.first.project.product.vo.ProductCategoryVO;
import sinhanDS.first.project.product.vo.ProductOptionVO;
import sinhanDS.first.project.product.vo.ProductVO;
import sinhanDS.first.project.seller.vo.SellerVO;
import sinhanDS.first.project.util.file.FileNameVO;
import sinhanDS.first.project.util.file.FileController;

@Controller
@RequestMapping("/seller/product")
public class SellerProductController {
	@Autowired
	private SellerProductService service;
	

	
	@Value("${realPath.registed_img_path}")
	private String registed_img_path;
	
	@GetMapping("/regist.do")
	public String regist(Model model) {
		ProductCategoryVO vo = new ProductCategoryVO();
		model.addAttribute("vo", vo);
		return "seller/product/regist";
	}		
	@PostMapping("/regist.do")
	public String regist(@RequestParam MultipartFile filename, HttpServletRequest request, ProductVO vo, ProductCategoryVO cvo, ProductOptionVO ovo) {
		System.out.println("vo체크: " + vo);
		if(filename != null) {
			vo = service.upload_file(filename, vo);
		}
		service.regist(vo, cvo, ovo);
		
		return "redirect:/seller/index.do";
	}
	
	@GetMapping("/list.do")
	public String list(HttpSession sess, Model model) {
		SellerVO vo = (SellerVO)sess.getAttribute("sellerLoginInfo");
		
		Map map = service.getProductList(vo.getNo());
		model.addAttribute("map", map);
		model.addAttribute("registed_img_path", registed_img_path);
		return "seller/product/list";
	}
	
	@GetMapping("/edit.do")
	public String edit(Model model, ProductVO vo) {
		Map map = service.getProductDetail(vo.getNo());
		model.addAttribute("map", map);
		ProductCategoryVO category = new ProductCategoryVO();
		model.addAttribute("category", category);
		System.out.println("map체크: " + map);
		return "seller/product/edit";
	}
	
	
	@PostMapping("/edit.do")
	public String edit2(ProductVO vo, ProductCategoryVO cvo, ProductOptionVO ovo) {
		System.out.println("vo체크: " + vo);
		System.out.println("cvo체크: "  +cvo);
		System.out.println("ovo체크: " + ovo);
		service.edit(vo, cvo, ovo);
		return "redirect:/seller/index.do";
	}	
	
	@PostMapping("/remove.do")
	public String remove(ProductVO vo) {
		System.out.println("product image_url체크  :" + vo.getImage_url());
		service.remove(vo);
		return "redirect:/seller/index.do";
	}
}
