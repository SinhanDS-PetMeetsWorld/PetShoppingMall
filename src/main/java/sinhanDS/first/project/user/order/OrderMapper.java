package sinhanDS.first.project.user.order;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import sinhanDS.first.project.order.vo.OrderDetailOptionVO;
import sinhanDS.first.project.order.vo.OrderDetailVO;
import sinhanDS.first.project.order.vo.OrderMainVO;
import sinhanDS.first.project.product.vo.ProductOptionVO;
import sinhanDS.first.project.product.vo.ProductSearchVO;
import sinhanDS.first.project.product.vo.ProductVO;
import sinhanDS.first.project.product.vo.ReviewVO;
import sinhanDS.first.project.seller.vo.SellerVO;

@Mapper
public interface OrderMapper {
	public ProductVO getProduct(int cart_no);
	public ProductOptionVO getOption(int option_no);
	public int registOrderMain(OrderMainVO mvo);
	public int registOrderDetail(OrderDetailVO dvo);
	public int registOrderDetailOption(OrderDetailOptionVO ovo);
	public void registReview(ReviewVO vo);
	
	public List<OrderMainVO> getOrderListNotDeleted(ProductSearchVO svo); 
	public List<OrderDetailVO> getOrderDetailList(int order_no);
	public List<OrderDetailOptionVO> getOrderDetailOptionList(int order_detail_no);
	public OrderDetailVO getOrderDetailVO(int order_no);
	
	public String getImageUrl(int product_no);
	public int getReviewStatus(int dno);
	
	public int getNumberOfPage(ProductSearchVO svo);
	
	public void updateOrderMainToDeleted(int order_no);
	public void purchaseConfirm(OrderDetailVO vo);
	public void cancle(OrderDetailVO vo);
	public void refound(OrderDetailVO vo);
	public String getReason(OrderDetailVO vo);
	
	public SellerVO getSellerInfo(int no);
	public ReviewVO getReview(int order_dno);
	public void updateProductRating(ProductVO pvo);
	
	public int delete_buyed_cart(int no);
}
