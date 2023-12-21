package sinhanDS.first.project.user.order;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.slf4j.Slf4j;
import sinhanDS.first.project.order.vo.OrderDetailOptionVO;
import sinhanDS.first.project.order.vo.OrderDetailVO;
import sinhanDS.first.project.order.vo.OrderMainVO;
import sinhanDS.first.project.product.vo.ProductOptionVO;
import sinhanDS.first.project.product.vo.ProductSearchVO;
import sinhanDS.first.project.product.vo.ProductVO;
import sinhanDS.first.project.product.vo.ReviewVO;
import sinhanDS.first.project.seller.product.SellerProductMapper;
import sinhanDS.first.project.seller.vo.SellerVO;
import sinhanDS.first.project.user.vo.CartVO;
import sinhanDS.first.project.util.file.FileController;
import sinhanDS.first.project.util.file.FileNameVO;

@Service
@Slf4j
public class OrderServiceImpl implements OrderService {
	@Autowired
	OrderMapper mapper;
	@Autowired
	SellerProductMapper sellerProductMapper;
	@Autowired
	private FileController fileController;
	@Value("${realPath.review_img_path}")
	private String review_img_path;
	
	
	public ReviewVO upload_file(MultipartFile filename, ReviewVO vo) {
		FileNameVO fvo = fileController.upload(filename, review_img_path);

		try {
			vo.setImage_url(fvo.getSaved_filename());
		}catch(NullPointerException e) {
			e.printStackTrace();
		}
		
		return vo;
	}
	
	public List<ProductVO> getProductListByProductNoList(int[] product_list){
		List<ProductVO> list = new ArrayList<>();
		for(int i = 0; i < product_list.length; i++) {
			log.debug("product_list[i] test: " + product_list[i]);
			list.add(sellerProductMapper.getProduct(product_list[i]));
		}
		return list;
	}
	
	public List<ProductVO> getProductListByCartNoList(int[] cno_list){
		System.out.println("cno_list.length체크: " + cno_list.length);
		List<ProductVO> list = new ArrayList<>();
		log.debug("cno_list.length체크: " + cno_list.length);
		for(int i = 0; i < cno_list.length; i++) {
			log.debug("cno_list[i] test: " + cno_list[i]);
			list.add(mapper.getProduct(cno_list[i]));
		}
		return list;
	}
	
	public List<ProductOptionVO> getOptionList(int[] option_no_list){
		List<ProductOptionVO> list = new ArrayList<>();
		if(option_no_list == null || option_no_list.length == 0) return list;
		
		for(int i = 0; i < option_no_list.length; i++) {
			list.add(mapper.getOption(option_no_list[i]));
		}
		return list;
	}
	
	public OrderMainVO setOrderName(OrderMainVO mvo, String name, int length) {
		mvo.setName(name + " 외 " + (length - 1) + "개 상품 주문"); 
		return mvo;
	}
	
	public void registOrderMain(OrderMainVO mvo) {
		mapper.registOrderMain(mvo);
	}
	public void registOrderDetail(List<OrderDetailVO> detail_list) {
		for(int i = 0; i < detail_list.size(); i++) {
			mapper.registOrderDetail(detail_list.get(i));
		}
	}
	public void registOrderDetailOption(List<ProductOptionVO> option_list, List<OrderDetailVO> detail_list, int[] cart_no, int[] option_cart_no) {
		if(option_list.size() == 0) return;
		for(int i = 0; i < option_cart_no.length; i++) {
			for(int j = 0; j < cart_no.length; j++) {
				if(option_cart_no[i] == cart_no[j]) {
					OrderDetailOptionVO vo = fillOrderDetailOptionVO(option_list.get(i), detail_list.get(j), detail_list.get(j).getNo());
					mapper.registOrderDetailOption(vo);
				}
			}
		}
	}
	
	
	
	public List<OrderDetailVO> makeOrderDetailList(OrderMainVO mvo, List<ProductVO> p_list, int[] quantity, int[] cart_no, int[] option_cart_no, List<ProductOptionVO> option_list){
		List<OrderDetailVO> detail_list = new ArrayList<>();
		for(int i = 0; i < p_list.size(); i++) {
			detail_list.add(fillOrderDetailVO(mvo, p_list.get(i), quantity[i], cart_no[i], option_cart_no, option_list));
		}
		return detail_list;
	}
	
	public OrderDetailVO fillOrderDetailVO(OrderMainVO mvo, ProductVO pvo, int quantity, int cart_no, int[] option_cart_no, List<ProductOptionVO> option_list) {
		OrderDetailVO vo = new OrderDetailVO();
		vo.setOrder_no(mvo.getNo());
		vo.setUser_no(mvo.getUser_no());
		vo.setSeller_no(pvo.getSeller_no());
		vo.setProduct_no(pvo.getNo());
		vo.setProduct_name(pvo.getName());
		vo.setProduct_price(pvo.getPrice());
		/*TODO: 현재 수수요율이 책정되어있지 않아 그냥 0으로 해뒀습니다. 나중에 수정합시다 ㅎㅎ*/
		vo.setCharge(0);
		vo.setDiscount(pvo.getDiscount());
		vo.setCompany(pvo.getCompany());
		vo.setBrand(pvo.getBrand());
		vo.setQuantity(quantity);
		
		for(int i = 0; i < option_cart_no.length; i++) {
			if(cart_no == option_cart_no[i]) {
				vo.setProduct_price(vo.getProduct_price() + option_list.get(i).getPrice());
			}
		}
		
		return vo;
	}
	
	public OrderDetailOptionVO fillOrderDetailOptionVO(ProductOptionVO ovo, OrderDetailVO detail_list, int orderDetail_no) {
		OrderDetailOptionVO vo = new OrderDetailOptionVO();
		vo.setOrder_dno(detail_list.getNo());
		vo.setProduct_no(detail_list.getProduct_no());
		vo.setTitle(ovo.getTitle());
		vo.setContent(ovo.getContent());
		vo.setPrice(ovo.getPrice());
		
		return vo;
	}
	
	public void registReview(ReviewVO vo) {
		mapper.registReview(vo);
	}
	
	public List<OrderMainVO> getOrderListNotDeleted(ProductSearchVO svo){
		return	mapper.getOrderListNotDeleted(svo);
	}
	
	public List<OrderDetailVO> getOrderDetailList(OrderMainVO mvo){
		return mapper.getOrderDetailList(mvo.getNo());
	}
	public List<List<OrderDetailOptionVO>> getOrderDetailOptionList(List<OrderDetailVO> list){
		List<List<OrderDetailOptionVO>> result_list = new ArrayList<>();
		for(int i = 0; i < list.size(); i++) {
			log.debug("dvo: " + list.get(i));
			log.debug("order_dno: " + list.get(i).getNo());
			List<OrderDetailOptionVO> temp = mapper.getOrderDetailOptionList(list.get(i).getNo());
			log.debug("temp: " + temp);
			result_list.add(temp);
		}
		return result_list;
	}
	public OrderDetailVO getFullOrderDetailVO(OrderDetailVO dvo) {
		return mapper.getOrderDetailVO(dvo.getNo());
	}
	public List<String> getImageList(List<OrderDetailVO> dvo_list){
		List<String> list = new ArrayList<>();
		
		for(int i = 0; i < dvo_list.size(); i++) {
			list.add(mapper.getImageUrl(dvo_list.get(i).getProduct_no()));
		}
		
		return list;
	}
	public List<Integer> getReviewStatus(List<OrderDetailVO> dvo_list){
		List<Integer> list = new ArrayList<>();
		
		for(int i = 0; i < dvo_list.size(); i++) {
			list.add(mapper.getReviewStatus(dvo_list.get(i).getNo()));
		}
		
		return list;
	}
	
	public int getNumberOfPage(ProductSearchVO svo) {
		return mapper.getNumberOfPage(svo);
	}
	
	public void updateOrderMainToDeleted(OrderMainVO mvo) {
		mapper.updateOrderMainToDeleted(mvo.getNo());
	}
	public java.sql.Date createDate(String date) {
		if("sysdate".equals(date)) {
			return new java.sql.Date(System.currentTimeMillis());
		}
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		try {
			java.util.Date parseDate = format.parse(date);
			java.sql.Date sqlDate = new java.sql.Date(parseDate.getTime());
			return sqlDate;
		}catch(Exception e) {e.printStackTrace();}
		return null;
	}
	
	/* 날짜를 지정해 주려면 "2022-08-09" 이런식으로 date를주면됨*/
	public void purchaseConfirm(OrderDetailVO vo, String date) {
		vo.setPurchase_confirmation_date(createDate(date));
		mapper.purchaseConfirm(vo);
	}
	public void purchaseConfirm(OrderDetailVO vo) {
		String date = "sysdate";
		vo.setPurchase_confirmation_date(createDate(date));
		mapper.purchaseConfirm(vo);
	}
	public void cancle(OrderDetailVO vo) {
		mapper.cancle(vo);
	}
	public void refound(OrderDetailVO vo) {
		mapper.refound(vo);
	}
	
	public String getReason(OrderDetailVO vo) {
		return mapper.getReason(vo);
	}
	
	
	public SellerVO getSellerInfo(OrderDetailVO dvo) {
		log.debug("dvo.getSeller_no(): " + dvo.getSeller_no());
		log.debug("getSellerInfo체크: " + mapper.getSellerInfo(dvo.getSeller_no()));
		return mapper.getSellerInfo(dvo.getSeller_no());
	}
	
	public ReviewVO getReview(int order_dno) {
		return mapper.getReview(order_dno);
	}
	
	public void updateProductRating(ReviewVO rvo) {
		ProductVO pvo = sellerProductMapper.getProduct(rvo.getProduct_no());
		float total = pvo.getRating() * pvo.getReview_cnt();
		total += rvo.getRating();
		pvo.setReview_cnt(pvo.getReview_cnt() + 1);
		pvo.setRating((total/pvo.getReview_cnt()));
		mapper.updateProductRating(pvo);
	}
	
	public int delete_buyed_cart(int[] cart_no) {
		
		for(int i=0; i<cart_no.length; i++) {
			int r = 0;
			r = mapper.delete_buyed_cart(cart_no[i]);
			if(r != 1) {
				return 0;	// 실패하면 바로 리턴
			}
		}
		return 1;	// 전부 삭제 성공
	}
	public int delete_buyed_option(int[] option_no) {
		
		for(int i=0; i<option_no.length; i++) {
			int r = 0;
			r = mapper.delete_buyed_option(option_no[i]);
			if(r != 1) {
				return 0;	// 실패하면 바로 리턴
			}
		}
		return 1;	// 전부 삭제 성공
	}
	public int update_cart_quantity(CartVO vo) {
		return mapper.update_cart_quantity(vo);
	}
	
	
	public int delete_cart_product(int no) {
		return mapper.delete_cart_product(no);
		
	}
	public int delete_cart_option(int cart_no) {
		int r = mapper.delete_cart_option(cart_no);
		if(r != 1) {
			return 0;
		}	
		return 1;
		
	}
	
	
}
