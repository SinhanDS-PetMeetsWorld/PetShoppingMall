package sinhanDS.first.project.admin.statistics;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import sinhanDS.first.project.statistics.vo.StatisticsVO;

@Mapper
public interface AdminStatisticsMapper {
	//이번주의 주문건수, 매출, 실매출, 총수량
	StatisticsVO weekTotal();
	//최근 일주일 간의 일별 주문, 취소, 환불 건수
	List<StatisticsVO> weekTotalscr();
	//최근 일주일 간의 일별 매출, 취소, 환불 금액
	List<StatisticsVO> weekTotalPricescr();

	//주간 카테고리1별 매출, 환불, 취소
	List<StatisticsVO> category1scr();
	//주간 카테고리1 정해졌을 때 카테고리2별 매출, 환불, 취소
	List<StatisticsVO> category2scr(StatisticsVO vo);
	//주간 성별당 매출, 환불, 취소
	List<StatisticsVO> genderscr();
	//주간 나이별 매출, 환불, 취소
	List<StatisticsVO> agescr();
	//주간 판매자별 매출, 환불, 취소
	List<StatisticsVO> sellerscr();
}
