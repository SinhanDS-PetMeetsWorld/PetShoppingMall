package sinhanDS.first.project.user;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import sinhanDS.first.project.order.vo.OrderDetailOptionVO;
import sinhanDS.first.project.order.vo.OrderDetailVO;
import sinhanDS.first.project.product.vo.ProductOptionVO;
import sinhanDS.first.project.product.vo.ProductSearchVO;
import sinhanDS.first.project.product.vo.ProductVO;
import sinhanDS.first.project.product.vo.ReviewVO;
import sinhanDS.first.project.user.vo.CartOptionVO;
import sinhanDS.first.project.user.vo.CartVO;
import sinhanDS.first.project.user.vo.PaymentVO;
import sinhanDS.first.project.user.vo.SaveBoxVO;
import sinhanDS.first.project.user.vo.UserAddressVO;
import sinhanDS.first.project.user.vo.UserVO;

@Mapper
public interface UserMapper {
	int edit(UserVO vo);
	UserVO detail(int no);
	UserVO login(UserVO vo);
	int user_regist(UserVO vo);
	int check_password(UserVO vo);
	int initaddr_regist(UserAddressVO vo);
	int dupId(String id);
	List<UserAddressVO> exist_addr(int user_no);
	int insert_addr(UserAddressVO vo);
	int modify_addr(UserAddressVO vo);
	int delete_addr(int no);
	List<PaymentVO> exist_payment(int user_no);
	int insert_payment(PaymentVO vo);
	int modify_payment(PaymentVO vo);
	int delete_payment(int no);
	
	List<CartVO> exist_cart(int no);
	ProductVO search_cart_product(int product_no);
	List<CartOptionVO> cart_option_number(int no);
	ProductOptionVO get_product_option(int no);
	List<SaveBoxVO> zzim_list(int user_no);
	List<UserVO> user_list(int user_no);
	List<ProductVO> product_list(int product_no);
	ProductVO getProductListWithProductSearchVO(ProductSearchVO svo);
	
	List<ReviewVO> review_list(int user_no);
	List<OrderDetailVO> order_detail(OrderDetailVO odvo);
	List<OrderDetailOptionVO> order_detail_option (OrderDetailOptionVO odovo);
	
	List<OrderDetailVO> possible_write_review(int user_no);
	String product_image_list(OrderDetailVO review_list);
	
	UserVO findId(UserVO vo);
	int findPwd(UserVO vo);
}
