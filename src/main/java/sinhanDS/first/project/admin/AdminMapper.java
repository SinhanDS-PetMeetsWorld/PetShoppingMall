package sinhanDS.first.project.admin;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import sinhanDS.first.project.admin.vo.SettlementVO;
import sinhanDS.first.project.order.vo.OrderDetailVO;
import sinhanDS.first.project.order.vo.OrderMainVO;
import sinhanDS.first.project.product.vo.ProductSearchVO;
import sinhanDS.first.project.product.vo.ProductVO;
import sinhanDS.first.project.seller.vo.SellerVO;
import sinhanDS.first.project.user.vo.UserVO;

@Mapper
public interface AdminMapper {
	public List<UserVO> getUserList(ProductSearchVO svo);
	public List<SellerVO> getSellerList(ProductSearchVO svo);
	public List<ProductVO> getProductList(ProductSearchVO svo);
	public List<OrderMainVO> getOrderMainList(ProductSearchVO svo);
	public List<OrderDetailVO> getOrderDetailList(ProductSearchVO svo);
	public List<OrderDetailVO> getCancleAndRefound(ProductSearchVO svo);
	public List<OrderDetailVO> getNeedConfirmationList();
	
	public int getNumberOfUser(ProductSearchVO svo);
	public int getNumberOfSeller(ProductSearchVO svo);
	public int getNumberOfProduct(ProductSearchVO svo);
	public int getNumberOfOrderMain(ProductSearchVO svo);
	public int getNumberOfOrderDetail(ProductSearchVO svo);
	public int getNumberOfCancleAndRefound(ProductSearchVO svo);
	
	public void confirmOrderDetail(int no);
	
	//getSettlementReqList 이건 정산일 없는(정산 요청된) settlement 불러오면됨
	public List<SettlementVO> getSettlementReqList();
	//getSettlementComList 이건 정산일 있는(정산 완료된)애들 목록 불러옴
	public List<SettlementVO> getSettlementComList();
	//updateSettlementStatus 정산번호 받아와서 해당 정산의 정산일 NOW()로 업뎃
	public int updateSettlementDate(int no);
	//updateSettlementStatus 정산번호 받아와서 해당 정산번호 갖고있는 주문상세들 정산상태 2로 업뎃
	public int updateSettlementStatus(int no);
	
	
	public List<SellerVO> getWithdrawalSellerBeforeYear();
	public List<SellerVO> getWithdrawalSellerAfterYear();
	
	public void restoreSeller(int seller_no);
	public void restoreSellerProduct(int seller_no);
	public void removeSeller(int seller_no);
}
