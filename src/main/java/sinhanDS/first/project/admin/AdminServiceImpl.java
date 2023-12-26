package sinhanDS.first.project.admin;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sinhanDS.first.project.admin.vo.SettlementVO;
import sinhanDS.first.project.order.vo.OrderDetailVO;
import sinhanDS.first.project.order.vo.OrderMainVO;
import sinhanDS.first.project.product.vo.ProductSearchVO;
import sinhanDS.first.project.product.vo.ProductVO;
import sinhanDS.first.project.seller.product.SellerProductMapper;
import sinhanDS.first.project.seller.vo.SellerVO;
import sinhanDS.first.project.user.vo.UserVO;
import sinhanDS.first.project.util.file.FileController;

@Service
public class AdminServiceImpl implements AdminService {
	@Autowired
	AdminMapper mapper;
	@Autowired
	private SellerProductMapper sellerProductMapper;
	@Autowired
	private FileController fileController;
	
	@Override
	public List<UserVO> getUserList(ProductSearchVO svo){
		return mapper.getUserList(svo);
	}
	
	@Override
	public List<SellerVO> getSellerList(ProductSearchVO svo){
		return mapper.getSellerList(svo);
	}
	
	@Override
	public List<ProductVO> getProductList(ProductSearchVO svo){
		return mapper.getProductList(svo);
	}
	
	@Override
	public List<OrderMainVO> getOrderMainList(ProductSearchVO svo){
		return mapper.getOrderMainList(svo);
	}
	
	@Override
	public List<OrderDetailVO> getOrderDetailList(ProductSearchVO svo){
		return mapper.getOrderDetailList(svo);
	}
	
	@Override
	public List<OrderDetailVO> getCancleAndRefound(ProductSearchVO svo){
		return mapper.getCancleAndRefound(svo);
	}
	
	@Override
	public List<OrderDetailVO> getNeedConfirmationList(){
		return mapper.getNeedConfirmationList();
	}
	
	
	
	@Override
	public int getNumberOfUser(ProductSearchVO svo) {
		return mapper.getNumberOfUser(svo);
	}
	
	@Override
	public int getNumberOfSeller(ProductSearchVO svo) {
		return mapper.getNumberOfSeller(svo);
	}
	
	@Override
	public int getNumberOfProduct(ProductSearchVO svo) {
		return mapper.getNumberOfProduct(svo);
	}
	
	@Override
	public int getNumberOfOrderMain(ProductSearchVO svo) {
		return mapper.getNumberOfOrderMain(svo);
	}
	
	@Override
	public int getNumberOfOrderDetail(ProductSearchVO svo) {
		return mapper.getNumberOfOrderDetail(svo);
	}
	
	@Override
	public int getNumberOfCancleAndRefound(ProductSearchVO svo) {
		return mapper.getNumberOfCancleAndRefound(svo);
	}
	
	
	
	@Override
	public void confirmOrderDetail(int[] no) {
		for(int i = 0; i < no.length; i++) {
			mapper.confirmOrderDetail(no[i]);
		}
	}

	
	@Override
	public List<SettlementVO> getSettlementReqList() {
		return mapper.getSettlementReqList();
	}

	@Override
	public List<SettlementVO> getSettlementComList() {
		return mapper.getSettlementComList();
	}

	@Override
	public boolean updateSettlement(int no) {
		int date_suc = mapper.updateSettlementDate(no);
		int status_suc = mapper.updateSettlementStatus(no);
		if(date_suc > 0 && status_suc > 0) {	return true;	}
		return false;
	}

	@Override
	public boolean updateAllSettlement(List<Integer> list) {
		if(list.size() > 0) {
			for(int i=0; i<list.size(); i++) {
				boolean suc = updateSettlement(list.get(i).intValue());
				if(suc == false) return false;
			}
		}
		return true;
	}
	
	@Override
	public List<SellerVO> getWithdrawalSellerBeforeYear(){
		return mapper.getWithdrawalSellerBeforeYear();
	}
	
	@Override
	public List<SellerVO> getWithdrawalSellerAfterYear(){
		return mapper.getWithdrawalSellerAfterYear();
	}
	
	
	@Override
	public void removeSeller(int seller_no) {
		List<ProductVO> pvoList = sellerProductMapper.getProductList(seller_no);
		for(int i = 0; i < pvoList.size(); i++) {
			ProductVO vo = pvoList.get(i);
			if(!("".equals(vo.getImage_url()) || "h".equals(vo.getImage_url().substring(0, 1)))) {
				fileController.remove(vo);
			}
			sellerProductMapper.remove(vo.getNo());
		}
		
		mapper.removeSeller(seller_no);
	}
	
	@Override
	public void restoreSeller(int seller_no) {
		mapper.restoreSeller(seller_no);
		mapper.restoreSellerProduct(seller_no);
	}
}
