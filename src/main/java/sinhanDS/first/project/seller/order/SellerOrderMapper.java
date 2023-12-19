package sinhanDS.first.project.seller.order;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import sinhanDS.first.project.order.vo.OrderDetailOptionVO;
import sinhanDS.first.project.order.vo.OrderDetailVO;
import sinhanDS.first.project.order.vo.OrderMainVO;

@Mapper
public interface SellerOrderMapper {
	List<OrderDetailVO> getOrderNoList(int no);
	List<OrderDetailVO> getOrderDetails(int no);
	
	OrderMainVO getOrderMainList(int no);
	List<OrderDetailOptionVO> getOrderDetailOptionList(int no);
}
