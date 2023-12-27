package sinhanDS.first.project.seller.statistics;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import sinhanDS.first.project.statistics.vo.StatisticsVO;

@Mapper
public interface SellerStatisticsMapper {

	//이번주의 주문건수, 매출, 실매출, 총수량
	StatisticsVO weekTotal(int no);
	//최근 일주일 간의 일별 주문, 취소, 환불 건수
	List<StatisticsVO> weekTotalscr(StatisticsVO vo);
	//최근 일주일 간의 일별 매출, 취소, 환불 금액
	List<StatisticsVO> weekTotalPricescr(StatisticsVO vo);
	//일단 주간을 만들고 시간 괜찮으면 일간, 월간 만들자...
	//주간 카테고리1별 매출(환불, 취소금액 미리 제외)
	
	//주간 카테고리1=0 카테고리2별 매출(환불, 취소금액 미리 제외)
	//주간 카테고리1=1 카테고리2별 매출(환불, 취소금액 미리 제외)
	//주간 카테고리1=2 카테고리2별 매출(환불, 취소금액 미리 제외)

	//주간 카테고리별 취소나 환불율(건당으로 계산)
	
	//주간 성별당 매출(환불, 취소금액 미리 제외)

	//주간 나이별 매출(환불, 취소금액 미리 제외)
}