package sinhanDS.first.project.user.order;

import org.apache.ibatis.annotations.Mapper;

import sinhanDS.first.project.order.vo.OrderMainVO;
import sinhanDS.first.project.product.vo.ProductOptionVO;
import sinhanDS.first.project.product.vo.ProductVO;

@Mapper
public interface OrderMapper {
	ProductVO getProduct(int product_no);
	ProductOptionVO getOption(int option_no);
	int registOrderMain(OrderMainVO mvo);
}
