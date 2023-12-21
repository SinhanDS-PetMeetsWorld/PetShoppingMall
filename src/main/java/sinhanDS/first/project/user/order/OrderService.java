package sinhanDS.first.project.user.order;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import sinhanDS.first.project.order.vo.OrderDetailOptionVO;
import sinhanDS.first.project.order.vo.OrderDetailVO;
import sinhanDS.first.project.order.vo.OrderMainVO;
import sinhanDS.first.project.product.vo.ProductOptionVO;
import sinhanDS.first.project.product.vo.ProductSearchVO;
import sinhanDS.first.project.product.vo.ProductVO;
import sinhanDS.first.project.product.vo.ReviewVO;
import sinhanDS.first.project.seller.vo.SellerVO;
import sinhanDS.first.project.user.vo.CartVO;

public interface OrderService {
	public ReviewVO upload_file(MultipartFile filename, ReviewVO vo);
	public List<ProductVO> getProductListByProductNoList(int[] product_list);
	public List<ProductVO> getProductListByCartNoList(int[] cno_list);
	public List<ProductOptionVO> getOptionList(int[] option_no_list);
	
	public OrderMainVO setOrderName(OrderMainVO mvo, String name, int length);
	
	public void registOrderMain(OrderMainVO mvo);
	public void registOrderDetail(List<OrderDetailVO> detail_list);
	public void registOrderDetailOption(List<ProductOptionVO> option_list, List<OrderDetailVO> detail_list, int[]cart_no, int[] option_cart_no);
	public List<OrderDetailVO> makeOrderDetailList(OrderMainVO mvo, List<ProductVO> p_list, int[] quantity, int[] cart_no, int[] option_cart_no, List<ProductOptionVO> option_list);
	
	public void registReview(ReviewVO vo);
	
	public List<OrderMainVO> getOrderListNotDeleted(ProductSearchVO svo);
	public List<OrderDetailVO> getOrderDetailList(OrderMainVO mvo);
	public List<List<OrderDetailOptionVO>> getOrderDetailOptionList(List<OrderDetailVO> list);
	public OrderDetailVO getFullOrderDetailVO(OrderDetailVO dvo);
	public List<String> getImageList(List<OrderDetailVO> dvo_list); 
	public List<Integer> getReviewStatus(List<OrderDetailVO> dvo_list);
	
	public int getNumberOfPage(ProductSearchVO svo);
	
	public void updateOrderMainToDeleted(OrderMainVO mvo);
	public void purchaseConfirm(OrderDetailVO vo);
	public void cancle(OrderDetailVO vo);
	public void refound(OrderDetailVO vo);
	public String getReason(OrderDetailVO vo);
	
	public SellerVO getSellerInfo(OrderDetailVO dvo);
	public ReviewVO getReview(int order_dno);
	public void updateProductRating(ReviewVO rvo);
	
	public int delete_buyed_cart(int[] cart_no);
	public int delete_buyed_option(int[] option_no);
	public int update_cart_quantity(CartVO vo);
	public int delete_cart_product(int no);
	public int delete_cart_option(int cart_no);
}
