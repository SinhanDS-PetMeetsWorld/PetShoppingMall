package sinhanDS.first.project.product.VO;

import lombok.Data;

@Data
public class ProductCategoryVO {
	private int no;
	private int product_no;
	private int category1;
	private int category2;
}

/*
 카테고리1 - 카테고리 2
 
 0 강아지 
 	0 사료
 	1 간식
 	2 영양제
 	3 배변용품
 	4 건강 관리용품
 	5 아동/산책용품
 	6 미용/목욕
 	7 식기/급수기
 	8 장난감/훈련
 	9 의류/패션
 	10 기타 잡화
 1 고양이
 	0 사료
 	1 간식
 	2 영양제
 	3 배변용품
 	4 건강/관리용품
 	5 캣타워/캣폴
 	6 미용/목욕
 	7 식기/급수기
 	8 장난감
 	9 의류/패션
 	10 기타 잡화
 2 기타
 	0 조류
 	1 어류
 	2 햄스터
 	3 토끼
 	4 고슴도치
 	5 기타 동물
 
 
 
 * */